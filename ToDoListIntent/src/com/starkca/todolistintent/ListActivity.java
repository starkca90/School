package com.starkca.todolistintent;

import android.app.Activity;
import android.content.res.Configuration;
import android.os.Bundle;
import android.util.Log;

public class ListActivity extends Activity {
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
			ToDoItem item = (ToDoItem) extras.getSerializable(EXTRA_ITEM);
			Log.i(tag, "-> Getting Extras: " + item);
			ListViewFrag fragment = (ListViewFrag) getFragmentManager().findFragmentById(R.id.listFragment);
			if(fragment != null && fragment.isInLayout()) {
				fragment.updateTask(item);
			}
		}
	}
}
