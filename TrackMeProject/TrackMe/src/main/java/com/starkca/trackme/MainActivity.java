package com.starkca.trackme;

import android.app.Activity;
import android.content.Context;
import android.location.Address;
import android.location.Criteria;
import android.location.Geocoder;
import android.location.Location;
import android.location.LocationListener;
import android.location.LocationManager;
import android.os.Bundle;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.TextView;
import android.widget.Toast;

import com.google.android.gms.maps.CameraUpdate;
import com.google.android.gms.maps.CameraUpdateFactory;
import com.google.android.gms.maps.GoogleMap;
import com.google.android.gms.maps.GoogleMap.OnMapClickListener;
import com.google.android.gms.maps.MapFragment;
import com.google.android.gms.maps.model.CameraPosition;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.gms.maps.model.MarkerOptions;

import java.io.IOException;
import java.util.List;
import java.util.Locale;

public class MainActivity extends Activity {

    private static GoogleMap mMap;
    private final String tag = this.getClass().toString();
    LocationManager locationManager;
    Criteria criteria;

    private final LocationListener locationListener = new LocationListener() {
        @Override
        public void onLocationChanged(Location location) {
            updateWithNewLocation(location);
        }

        @Override
        public void onStatusChanged(String provider, int status, Bundle extras) {}

        @Override
        public void onProviderEnabled(String provider) {}

        @Override
        public void onProviderDisabled(String provider) {}
    };

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        mMap = ((MapFragment) getFragmentManager().findFragmentById(R.id.map)).getMap();

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

        mMap.setOnMapClickListener(new OnMapClickListener() {

            @Override
            public void onMapClick(LatLng arg0) {
                Log.i(tag, arg0.toString());
                CameraUpdate cUpdate = CameraUpdateFactory.newLatLng(arg0);
                mMap.moveCamera(cUpdate);
            }

        });
    }

    @Override
    protected void onResume() {
        super.onResume();
        String provider = locationManager.getBestProvider(criteria, true);
        locationManager.requestLocationUpdates(provider, 2000, 10, locationListener);
    }

    @Override
    public void onDestroy() {
        super.onDestroy();
        locationManager.removeUpdates(locationListener);
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()) {
            case R.id.action_normal:
                mMap.setMapType(GoogleMap.MAP_TYPE_NORMAL);
                Toast.makeText(this, "Switching to Normal", Toast.LENGTH_SHORT).show();
                return true;
            case R.id.action_satellite:
                mMap.setMapType(GoogleMap.MAP_TYPE_SATELLITE);
                Toast.makeText(this, "Switching to Satellite", Toast.LENGTH_SHORT).show();
                return true;
            case R.id.action_terrain:
                mMap.setMapType(GoogleMap.MAP_TYPE_TERRAIN);
                Toast.makeText(this, "Switching to Terrain", Toast.LENGTH_SHORT).show();
                return true;
        }
        return false;
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.main, menu);
        return true;
    }

    private void updateWithNewLocation(Location location) {
        TextView myLocationText = (TextView) findViewById(R.id.myLocationText);
        String latLongString = "No location found";
        String addressString = "No address found";

        if (location != null) {
            double latitude = location.getLatitude();
            double longitude = location.getLongitude();
            latLongString = "Lat: " + latitude + "\nLong: " + longitude;

            Geocoder gc = new Geocoder(this, Locale.getDefault());

            if (!Geocoder.isPresent())
                addressString = "No Geocoder available";
            else {
                try {
                    List<Address> addresses = gc.getFromLocation(latitude,
                            longitude, 1);
                    StringBuilder sb = new StringBuilder();
                    if (addresses.size() > 0) {
                        Address address = addresses.get(0);

                        for (int i = 0; i < address.getMaxAddressLineIndex(); i++) {
                            sb.append(address.getAddressLine(i)).append("\n");
//                            sb.append(address.getLocality()).append("\n");
//                            sb.append(address.getPostalCode()).append("\n");
//                            sb.append(address.getCountryName());
                        }
                        addressString = sb.toString();
                    }
                } catch (IOException e) {
                    Log.d(tag, "IO Exception", e);
                }
            }

            LatLng latlng = new LatLng(location.getLatitude(), location.getLongitude());
            CameraPosition cameraPosition = new CameraPosition(latlng, mMap.getMaxZoomLevel() - 2, 0, 0);
            CameraUpdate cUpdate = CameraUpdateFactory.newCameraPosition(cameraPosition);
            mMap.moveCamera(cUpdate);
            mMap.addMarker(new MarkerOptions().position(latlng).title("You Are Here"));
        }
        myLocationText.setText("Your Current Position is:\n" + latLongString
                + "\n\n" + addressString);
    }
}
