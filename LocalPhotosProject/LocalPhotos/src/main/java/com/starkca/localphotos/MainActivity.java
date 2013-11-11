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
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

public class MainActivity extends Activity implements SimpleGestureListener {

    private String tag = this.getClass().toString();
    private SimpleGestureFilter detector;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        detector = new SimpleGestureFilter(this, this);

        new downloadTextTask().execute("apple", "cat");
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

    private String pictureList(String word) {
        InputStream in;
        String strDefinition = "";
        try {
            in = openHttpConnection(
                    "http://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=7250416d2b7ab0029b7b200f82cd7f79&tags=milwaukee+wi&safe_search=1&extras=url_m&per_page=4");
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
            // Retrieve the <Photos> element
            NodeList photoElements = doc.getElementsByTagName("photo");


//            NodeList photoElements = doc.getElementsByTagName("photos");
//            for(int i = 0; i < photoElements.getLength(); i++) {
//                Node itemNode = photoElements.item(i);
//                if(itemNode.getNodeType() == Node.ELEMENT_NODE) {
//                    // Conver the
//                }
//            }

//            // Retrieve all the <Definition> elements
//            NodeList definitionElements = doc.getElementsByTagName("Definition");
//
//            // Iterate through each <Definition> elements
//            for(int i = 0; i < definitionElements.getLength(); i++) {
//                Node itemNode = definitionElements.item(i);
//                if(itemNode.getNodeType() == Node.ELEMENT_NODE) {
//                    // Convert the Definition node into an Element
//                    Element definitionElement = (Element) itemNode;
//
//                    // Get all the <WordDefinition> elements under
//                    // the <Definition> element
//                    NodeList wordDefinitionElements = definitionElement
//                            .getElementsByTagName("WordDefinition");
//
//                    strDefinition = "";
//                    // Iterate through each <WrodDefinition> elements
//                    for(int j = 0; j < wordDefinitionElements.getLength(); j++) {
//                        // Convert <WordDefinition node into an Element
//                        Element wordDefinitionElement = (Element)
//                                wordDefinitionElements.item(j);
//
//                        // Get all the child nodes under the
//                        // <WordDefinition> element
//                        NodeList textNodes = wordDefinitionElement.getChildNodes();
//
//                        strDefinition +=  textNodes.item(0)
//                                .getNodeValue() + ".\n";
//                    }
//                }
//            }
        } catch(IOException e1) {
            Log.d(tag, e1.getLocalizedMessage());
        }
        // Return the definitions of the word
        return strDefinition;
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

    private class downloadTextTask extends AsyncTask<String, Void, String> {
        protected String doInBackground(String... words) {
            return pictureList(words[0]);
        }

        protected void onPostExecute(String result) {
            Toast.makeText(getBaseContext(), result, Toast.LENGTH_LONG).show();
        }
    }


}
