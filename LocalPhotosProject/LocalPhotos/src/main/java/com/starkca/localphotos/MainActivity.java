package com.starkca.localphotos;

import com.starkca.localphotos.SimpleGestureFilter.SimpleGestureListener;

import android.app.Activity;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.AsyncTask;
import android.os.Bundle;
import android.util.Log;
import android.view.MotionEvent;
import android.widget.Toast;

import org.w3c.dom.Document;
import org.w3c.dom.NodeList;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

public class MainActivity extends Activity implements SimpleGestureListener {

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

    private String tag = this.getClass().toString();
    private SimpleGestureFilter detector;
    private ArrayList<ImageData> imageURLs = new ArrayList<ImageData>();
    private ArrayList<Bitmap> downloadedImages = new ArrayList<Bitmap>();
    private int bitmapIndex = 0;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        detector = new SimpleGestureFilter(this, this);

        new downloadTextTask().execute("milwaukee", "wi", "1");
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

        if(!(conn instanceof HttpURLConnection))
            throw new IOException("Not an HTTP connection");

        try{
            HttpURLConnection httpConn = (HttpURLConnection) conn;
            httpConn.setAllowUserInteraction(false);
            httpConn.setInstanceFollowRedirects(true);
            httpConn.setRequestMethod("GET");
            httpConn.connect();
            response = httpConn.getResponseCode();
            if(response == HttpURLConnection.HTTP_OK)
                in = httpConn.getInputStream();
        } catch(Exception ex) {
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
        } catch(IOException e) {
            Log.e(tag, e.getLocalizedMessage());
        }
        return bitmap;
    }

    private String downloadText(String URL) {
        int BUFFER_SIZE = 2000;
        InputStream in;
        try {
            in = openHttpConnection(URL);
        } catch(IOException e) {
            Log.e(tag, e.getLocalizedMessage());
            return "";
        }

        InputStreamReader isr = new InputStreamReader(in);
        int charRead;
        String str = "";
        char[] inputBuffer = new char[BUFFER_SIZE];
        try {
            while((charRead = isr.read(inputBuffer)) > 0) {
                // Convert the chars to a string
                String readString = String.copyValueOf(inputBuffer, 0, charRead);
                str += readString;
                inputBuffer = new char[BUFFER_SIZE];
            }
            in.close();
        } catch (IOException e) {
            Log.e(tag, e.getLocalizedMessage());
            return "";
        }
        return str;
    }

    private int pictureList(String city, String state, String page) {
        InputStream in;
        String strDefinition = "";
        try {
            // Get IMAGE_URL_COUNT pictures of city, state using flickr photo search
            in = openHttpConnection(
                    "http://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=7250416d2b7ab0029b7b200f82cd7f79&tags=" + city + "+" + state + "&safe_search=1&extras=url_m&page=" + page);
            Document doc = null;
            DocumentBuilderFactory dbf =
                    DocumentBuilderFactory.newInstance();
            DocumentBuilder db;
            try {
                db = dbf.newDocumentBuilder();
                doc = db.parse(in);

            } catch(ParserConfigurationException e) {
                e.printStackTrace();
            } catch(Exception e) {
                e.printStackTrace();
            }
            doc.getDocumentElement().normalize();
            // Retrieve the <Photo> elements
            NodeList photoElements = doc.getElementsByTagName("photo");
            for(int i = 0; i < photoElements.getLength(); i++) {
                // Get the title and URL of each of the photos
                String title = photoElements.item(i).getAttributes().item(5).getNodeValue();
                String url = photoElements.item(i).getAttributes().item(9).getNodeValue();
                // Create a new ImageData with the photo title and url
                ImageData image = new ImageData(title, url);
                // Add the ImageData to the URL array
                imageURLs.add(image);
            }
        } catch(IOException e1) {
            Log.d(tag, e1.getLocalizedMessage());
        }
        // Return the definitions of the word
        return imageURLs.size();
    }

    @Override
    public void onSwipe(int direction) {
        switch(direction) {
            case SimpleGestureFilter.SWIPE_RIGHT :
                Toast.makeText(this, "SWIPE RIGHT", Toast.LENGTH_SHORT).show();
                // TODO: Something
                break;
            case SimpleGestureFilter.SWIPE_LEFT :
                Toast.makeText(this, "SWIPE LEFT", Toast.LENGTH_SHORT).show();
                // TODO: Something
                break;
        }
    }

    @Override
    public void onDoubleTap() {
        // TODO: Not sure what to do...
    }

    private class downloadTextTask extends AsyncTask<String, Void, Integer> {
        protected Integer doInBackground(String... local) {
            return pictureList(local[0], local[1], local[2]);
        }

        protected void onPostExecute(Integer result) {
            Toast.makeText(getBaseContext(), "Found " + String.valueOf(result) + " photos", Toast.LENGTH_LONG).show();
        }
    }


}
