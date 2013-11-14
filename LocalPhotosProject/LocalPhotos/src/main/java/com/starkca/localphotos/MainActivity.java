package com.starkca.localphotos;

import android.app.Activity;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.location.Address;
import android.location.Criteria;
import android.location.Geocoder;
import android.location.Location;
import android.location.LocationListener;
import android.location.LocationManager;
import android.os.AsyncTask;
import android.os.Bundle;
import android.util.Log;
import android.view.MotionEvent;
import android.widget.ImageView;
import android.widget.Toast;

import com.starkca.localphotos.SimpleGestureFilter.SimpleGestureListener;

import org.w3c.dom.Document;
import org.w3c.dom.NodeList;

import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

public class MainActivity extends Activity implements SimpleGestureListener {

    private final LocationListener locationListener = new LocationListener() {
        @Override
        public void onLocationChanged(Location location) {
            updateWithNewLocation(location);
        }

        @Override
        public void onStatusChanged(String s, int i, Bundle bundle) {
        }

        @Override
        public void onProviderEnabled(String s) {
        }

        @Override
        public void onProviderDisabled(String s) {
        }
    };
    Criteria criteria;
    private String tag = this.getClass().toString();
    private SimpleGestureFilter detector;
    private ArrayList<ImageData> imageURLs = new ArrayList<ImageData>();
    private ArrayList<Bitmap> downloadedImages = new ArrayList<Bitmap>();
    private int urlIndex = 0;
    private int imageIndex = 1;
    private ImageView image;
    private boolean downloading = false;
    private LocationManager locationManager;
    private String previousSearch = "";

    private void updateWithNewLocation(Location location) {
        String searchTerm;

        if (location != null) {
            double latitude = location.getLatitude();
            double longitude = location.getLongitude();
            Geocoder gc = new Geocoder(this, Locale.getDefault());
            if (!Geocoder.isPresent())
                Log.e(tag, "Geocoder not present");
            else {
                try {
                    List<Address> addresses = gc.getFromLocation(latitude, longitude, 1);
                    if (addresses.size() > 0) {
                        Address address = addresses.get(0);
                        // Get the city and append wi, sorry to the other 49 states :(
                        searchTerm = address.getLocality() + "+wi";
                        if (searchTerm != null) {
                            searchTerm = searchTerm.toLowerCase().replace(' ', '+');
                            if (!previousSearch.equals(searchTerm)) {
                                previousSearch = searchTerm;
                                new downloadTextTask().execute(previousSearch, "1");
                            }
                        }
                    }
                } catch (IOException e) {
                    Log.d(tag, "IO Exception ", e);
                }
            }

        }
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        detector = new SimpleGestureFilter(this, this);
        image = (ImageView) findViewById(R.id.image);

        // Obtain reference to LocationManager
        String svcName = Context.LOCATION_SERVICE;
        locationManager = (LocationManager) getSystemService(svcName);

        // Set location criteria
        criteria = new Criteria();
        criteria.setAccuracy(Criteria.ACCURACY_FINE);
        criteria.setPowerRequirement(Criteria.POWER_LOW);
        criteria.setAltitudeRequired(false);
        criteria.setBearingRequired(false);
        criteria.setSpeedRequired(false);
        criteria.setCostAllowed(true);

        // Obtain reference to location provider
        String provider = locationManager.getBestProvider(criteria, true);
        Location l = locationManager.getLastKnownLocation(provider);
        updateWithNewLocation(l);
    }

    @Override
    public boolean dispatchTouchEvent(MotionEvent me) {
        detector.onTouchEvent(me);
        return super.dispatchTouchEvent(me);
    }

    private InputStream openHttpConnection(String urlString) throws IOException {
        InputStream in = null;
        int response;

        URL url = new URL(urlString);
        URLConnection conn = url.openConnection();

        if (!(conn instanceof HttpURLConnection))
            throw new IOException("Not an HTTP connection");

        try {
            HttpURLConnection httpConn = (HttpURLConnection) conn;
            httpConn.setAllowUserInteraction(false);
            httpConn.setInstanceFollowRedirects(true);
            httpConn.setRequestMethod("GET");
            httpConn.connect();
            response = httpConn.getResponseCode();
            if (response == HttpURLConnection.HTTP_OK)
                in = httpConn.getInputStream();
        } catch (Exception ex) {
            Log.e(tag, ex.getLocalizedMessage());
            throw new IOException("Error Connecting");
        }

        return in;
    }

    private Bitmap DownloadImage(String URL) {
        Bitmap bitmap = null;
        InputStream in;
        try {
            in = openHttpConnection(URL);
            bitmap = BitmapFactory.decodeStream(in);
            in.close();
        } catch (IOException e) {
            Log.e(tag, e.getLocalizedMessage());
        }
        return bitmap;
    }

    private int pictureList(String search, String page) {
        Log.i(tag, "Searching " + search);
        InputStream in;
        try {
            // Get IMAGE_URL_COUNT pictures of city, state using flickr photo search
            in = openHttpConnection(
                    "http://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=7250416d2b7ab0029b7b200f82cd7f79&tags=" + search + "&safe_search=1&extras=url_m&page=" + page);
            Document doc = null;
            DocumentBuilderFactory dbf =
                    DocumentBuilderFactory.newInstance();
            DocumentBuilder db;
            try {
                db = dbf.newDocumentBuilder();
                doc = db.parse(in);

            } catch (ParserConfigurationException e) {
                e.printStackTrace();
            } catch (Exception e) {
                e.printStackTrace();
            }
            if (doc != null) {
                doc.getDocumentElement().normalize();
                // Retrieve the <Photo> elements
                NodeList photoElements = doc.getElementsByTagName("photo");
                for (int i = 0; i < photoElements.getLength(); i++) {
                    if(photoElements.item(i).getAttributes().getLength() == 12) {
                        // Get the title and URL of each of the photos
                        String title = photoElements.item(i).getAttributes().item(5).getNodeValue();
                        String url = photoElements.item(i).getAttributes().item(9).getNodeValue();
                        // Create a new ImageData with the photo title and url
                        ImageData image = new ImageData(title, url);
                        // Add the ImageData to the URL array
                        imageURLs.add(image);
                    }
                }
            }
        } catch (IOException e1) {
            Log.d(tag, e1.getLocalizedMessage());
        }
        // Return the number of pictures available
        return imageURLs.size();
    }

    @Override
    public void onSwipe(int direction) {
        if ((downloadedImages.size() == 3) || !downloading) {
            switch (direction) {
                case SimpleGestureFilter.SWIPE_RIGHT:
                    // Display picture 0
                    image.setImageBitmap(downloadedImages.get(0));
                    // Move all pictures over
                    for (int i = 1; i >= 0; i--)
                        downloadedImages.set(i + 1, downloadedImages.get(i));
                    // Download the next picture
                    urlIndex = ((urlIndex - 1) < 0) ? (imageURLs.size() - (Math.abs(urlIndex - 1)) % imageURLs.size()) % imageURLs.size() : ((urlIndex - 1) % imageURLs.size());
                    int urlToDownload = ((urlIndex - 1) < 0) ? (imageURLs.size() - (Math.abs(urlIndex - 1)) % imageURLs.size()) % imageURLs.size() : ((urlIndex - 1) % imageURLs.size());
                    imageIndex = 0;
                    new downloadImageTask().execute(imageURLs.get(urlToDownload).getURL());
                    downloading = true;
                    break;
                case SimpleGestureFilter.SWIPE_LEFT:
                    // Display picture 2
                    image.setImageBitmap(downloadedImages.get(2));
                    // Move all pictures over
                    for (int i = 1; i < 3; i++)
                        downloadedImages.set(i - 1, downloadedImages.get(i));
                    // Download the next picture
                    urlIndex = (urlIndex + 1) % imageURLs.size();
                    imageIndex = 2;
                    new downloadImageTask().execute(imageURLs.get((urlIndex + 1) % imageURLs.size()).getURL());
                    downloading = true;
                    break;
            }
        } else
            Toast.makeText(this, "Images still downloading, please try again soon", Toast.LENGTH_LONG).show();
    }

    @Override
    public void onDoubleTap() {
        // TODO: Not sure what to do...
    }

    private class ImageData {
        private String title;
        private String url;

        public ImageData(String title, String url) {
            this.title = title;
            this.url = url;
        }

        public String getURL() {
            return url;
        }

        public String getTitle() {
            return title;
        }
    }

    private class downloadImageTask extends AsyncTask<String, Bitmap, Long> {
        //Takes in a list of image URLs in String type
        protected Long doInBackground(String... urls) {
            long imageCount = 0;
            for (int i = 0; i < urls.length; i++) {
                // Download the image
                Bitmap imageDownloaded = DownloadImage(urls[i]);
                if (imageDownloaded != null) {
                    // Increment the image count
                    imageCount++;
                    // return the image downloaded
                    publishProgress(imageDownloaded);
                }
            }
            return imageCount;
        }

        // Store the image downloaded
        protected void onProgressUpdate(Bitmap... bitmap) {
            if (downloadedImages.size() < 3) {
                downloadedImages.add(bitmap[0]);
                if (downloadedImages.size() == 2)
                    image.setImageBitmap(downloadedImages.get(1));
            } else {
                downloadedImages.set(imageIndex, bitmap[0]);
            }
            imageIndex = 1;
            downloading = false;
        }

        // When all the images have been downloaded
        protected void onPostExecute(Long imagesDownloaded) {

        }
    }

    private class downloadTextTask extends AsyncTask<String, Void, Integer> {
        protected Integer doInBackground(String... local) {
            return pictureList(local[0], local[1]);
        }

        protected void onPostExecute(Integer result) {
            // To create a buffer of sorts, start by loading picture [last picture], 0 and 1
            new downloadImageTask().execute(imageURLs.get(imageURLs.size()-1).getURL(), imageURLs.get(0).getURL(), imageURLs.get(1).getURL());
            downloading = true;
            urlIndex = 0;
        }
    }


}
