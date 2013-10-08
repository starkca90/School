package com.starkca.todolistintent;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;

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
	
    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()) {
            case R.id.map:
            	ToDoDetailFrag.showMap()
                return true;
         }
        return false;
    }
	
    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
    	Log.i(tag, "onCreateOptionsMenu");
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.detail, menu);
        
        return true;
    }
}
