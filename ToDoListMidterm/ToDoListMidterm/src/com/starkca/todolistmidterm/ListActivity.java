package com.starkca.todolistmidterm;

import android.content.res.Configuration;
import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import android.util.Log;

public class ListActivity extends FragmentActivity {
	private String tag = this.getClass().toString();
	public static final String EXTRA_ITEM = "item";

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		Log.i(tag, "onCreate");
		super.onCreate(savedInstanceState);
		
		if(getResources().getConfiguration().orientation == Configuration.ORIENTATION_LANDSCAPE) {
			Log.i(tag, "-> In Landscape");
			finish();
			return;
		}
		
		setContentView(R.layout.activity_list);
		
		Bundle extras = getIntent().getExtras();
		if(extras != null) {
			String task = extras.getString(EXTRA_ITEM);
			Log.i(tag, "-> Getting Extras: " + task);
			ListViewFrag fragment = (ListViewFrag) getSupportFragmentManager().findFragmentById(R.id.listFragment);
			if(fragment != null && fragment.isInLayout()) {
				fragment.updateTask(task);
			}
		}
	}
}
