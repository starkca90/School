package com.starkca.googlemapsv2;

import com.google.android.gms.maps.CameraUpdate;
import com.google.android.gms.maps.CameraUpdateFactory;
import com.google.android.gms.maps.GoogleMap;
import com.google.android.gms.maps.GoogleMap.OnMapClickListener;
import com.google.android.gms.maps.MapFragment;
import com.google.android.gms.maps.model.LatLng;

import android.os.Bundle;
import android.app.Activity;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.Toast;

public class MainActivity extends Activity {

	private static GoogleMap mMap;
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
		mMap = ((MapFragment) getFragmentManager().findFragmentById(R.id.map)).getMap();
		mMap.setOnMapClickListener(new OnMapClickListener() {

			@Override
			public void onMapClick(LatLng arg0) {
				Log.i("Something", arg0.toString());
				CameraUpdate cUpdate = CameraUpdateFactory.newLatLng(arg0);
				mMap.moveCamera(cUpdate);
			}
			
		});
		
	}

	@Override
	public boolean onOptionsItemSelected(MenuItem item) {
		switch(item.getItemId()) {
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
		case R.id.action_settings:
			Toast.makeText(this, "Nothing to show", Toast.LENGTH_SHORT).show();
		}
		return false;
	}
	
	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.main, menu);
		return true;
	}

}
