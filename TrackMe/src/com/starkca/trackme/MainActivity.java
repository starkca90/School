package com.starkca.trackme;

import java.io.IOException;
import java.util.List;
import java.util.Locale;

import android.location.Address;
import android.location.Criteria;
import android.location.Geocoder;
import android.location.Location;
import android.location.LocationManager;
import android.os.Bundle;
import android.app.Activity;
import android.content.Context;
import android.util.Log;
import android.view.Menu;
import android.widget.TextView;

public class MainActivity extends Activity {

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);

		// Obtain reference to LocationManager
		LocationManager locationManager;
		String svcName = Context.LOCATION_SERVICE;
		locationManager = (LocationManager) getSystemService(svcName);

		// Set location criteria
		Criteria criteria = new Criteria();
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

		// add automated location updates later
		// locationManager.requestLocationUpdates(provider, 2000, 10,
		// locationListener);
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
				addressString = "No geocoder available";
			else {
				try {
					List<Address> addresses = gc.getFromLocation(latitude,
							longitude, 1);
					StringBuilder sb = new StringBuilder();
					if (addresses.size() > 0) {
						Address address = addresses.get(0);

						for (int i = 0; i < address.getMaxAddressLineIndex(); i++) {
							sb.append(address.getAddressLine(i)).append("\n");
//							sb.append(address.getLocality()).append("\n");
//							sb.append(address.getPostalCode()).append("\n");
//							sb.append(address.getCountryName());
						}
						addressString = sb.toString();
					}
				} catch (IOException e) {
					Log.d("TRACK ME", "IO Exception", e);
				}
			}
		}
		myLocationText.setText("You Current Position is:\n" + latLongString
				+ "\n\n" + addressString);
	}

}
