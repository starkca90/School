package com.starkca.todolistmidterm;

import android.app.Activity;
import android.os.Bundle;
import android.util.Log;

public class ToDoDetailActivity extends Activity {
	
	private String tag = this.getClass().toString();
	public static final String EXTRA_ITEM = "task";

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		Log.i(tag, "onCreate");
		super.onCreate(savedInstanceState);
		
		setContentView(R.layout.activity_detail);
		
		Bundle extras = getIntent().getExtras();
		if(extras != null) {
			ToDoItem item = (ToDoItem) extras.getSerializable(EXTRA_ITEM);
			Log.i(tag, "-> Getting Extras: " + item);
			ToDoDetailFrag fragment = (ToDoDetailFrag) getFragmentManager().findFragmentById(R.id.detailFragment);
			if(fragment != null && fragment.isInLayout()) {
				fragment.showDetails(item);
			} 
		}
	}
}
