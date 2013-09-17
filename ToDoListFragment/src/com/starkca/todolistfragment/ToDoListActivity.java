package com.starkca.todolistfragment;

import android.app.Activity;
import android.os.Bundle;
import android.view.Menu;
import android.util.Log;

public class ToDoListActivity extends Activity {

	String tag = this.getClass().getSimpleName();
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_to_do_list);
		Log.i(tag, "onCreate");
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.to_do_list, menu);
		Log.i(tag, "onCreateOptionsMenu");
		return true;
	}

}
