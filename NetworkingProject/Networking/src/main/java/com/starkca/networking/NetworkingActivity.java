package com.starkca.networking;

import android.app.Activity;
import android.os.Bundle;

import java.io.IOException;
import java.io.InputStream;

import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import android.util.Log;

import android.widget.ImageView;
import android.widget.Toast;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.AsyncTask;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class NetworkingActivity extends Activity {

    private String tag = this.getClass().toString();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_networking);

        new downloadImageTask().execute("http://jayurbain.com/images/mel-fetch-mke.jpg", "http://wallpines.com/wp-content/uploads/2013/09/small-cute-kitty_wallpapers_24216_1920x1200.jpg");

        // Access a Web Service using GET
        new downloadTextTask().execute("apple", "cat");
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
            Log.d(tag, ex.getLocalizedMessage());
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
        } catch(IOException e1) {
            Log.d(tag, e1.getLocalizedMessage());
        }
        return bitmap;
    }

    private String downloadText(String URL) {
        int BUFFER_SIZE = 2000;
        InputStream in;
        try {
            in = openHttpConnection(URL);
        } catch(IOException e) {
            Log.d(tag, e.getLocalizedMessage());
            return "";
        }

        InputStreamReader isr = new InputStreamReader(in);
        int charRead;
        String str = "";
        char[] inputBuffer = new char[BUFFER_SIZE];
        try {
            while((charRead = isr.read(inputBuffer)) > 0) {
                // Convert the chars to a string
                String readString = String
                        .copyValueOf(inputBuffer, 0, charRead);
                str += readString;
                inputBuffer = new char[BUFFER_SIZE];
            }
            in.close();
        } catch(IOException e) {
            Log.d(tag, e.getLocalizedMessage());
            return "";
        }
        return str;
    }

    private String wordDefinition(String word) {
        InputStream in;
        String strDefinition = "";
        try {
            in = openHttpConnection(
                    "http://services.aonaware.com/DictService/DictService.asmx/Define?word="+	word);
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

            // Retrieve all the <Definition> elements
            NodeList definitionElements = doc.getElementsByTagName("Definition");

            // Iterate through each <Definition> elements
            for(int i = 0; i < definitionElements.getLength(); i++) {
                Node itemNode = definitionElements.item(i);
                if(itemNode.getNodeType() == Node.ELEMENT_NODE) {
                    // Convert the Definition node into an Element
                    Element definitionElement = (Element) itemNode;

                    // Get all the <WordDefinition> elements under
                    // the <Definition> element
                    NodeList wordDefinitionElements = definitionElement
                            .getElementsByTagName("WordDefinition");

                    strDefinition = "";
                    // Iterate through each <WrodDefinition> elements
                    for(int j = 0; j < wordDefinitionElements.getLength(); j++) {
                        // Convert <WordDefinition node into an Element
                        Element wordDefinitionElement = (Element)
                                wordDefinitionElements.item(j);

                        // Get all the child nodes under the
                        // <WordDefinition> element
                        NodeList textNodes = wordDefinitionElement.getChildNodes();

                        strDefinition +=  textNodes.item(0)
                                .getNodeValue() + ".\n";
                    }
                }
            }
        } catch(IOException e1) {
            Log.d(tag, e1.getLocalizedMessage());
        }
        // Return the definitions of the word
        return strDefinition;
    }

    private class downloadImageTask extends AsyncTask<String, Bitmap, Long> {
        // Takes in a list of image URLs in String type
        protected Long doInBackground(String... urls) {
            long imagesCount = 0;
            for(int i = 0; i < urls.length; i++) {
                // Download the image
                Bitmap imageDownloaded = DownloadImage(urls[i]);
                if(imageDownloaded != null) {
                    // Increment the image count
                    imagesCount++;
                    try {
                        // Insert a delay of 3 seconds
                        Thread.sleep(3000);
                    } catch(InterruptedException e) {
                        e.printStackTrace();
                    }
                    // return the image downloaded
                    publishProgress(imageDownloaded);
                }
            }
            // return the total images downloaded count
            return imagesCount;
        }

        // Display the image downloaded
        protected void onProgressUpdate(Bitmap... bitmap) {
            ImageView img = (ImageView) findViewById(R.id.img);
            img.setImageBitmap(bitmap[0]);
        }

        // When all the images have been downloaded
        protected void onPostExecute(Long imagesDownloaded) {
            Toast.makeText(getBaseContext(), "Total " + imagesDownloaded + " images downloaded",
                    Toast.LENGTH_LONG).show();
        }
    }

    private class downloadTextTask extends AsyncTask<String, Void, String> {
        protected String doInBackground(String... words) {
            return wordDefinition(words[0]);
        }

        protected void onPostExecute(String result) {
            Toast.makeText(getBaseContext(), result, Toast.LENGTH_LONG).show();
        }
    }

}
