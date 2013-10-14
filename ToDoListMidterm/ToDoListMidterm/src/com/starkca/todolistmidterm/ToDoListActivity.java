package com.starkca.todolistmidterm;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;

public class ToDoListActivity extends Activity implements EditTextFrag.OnItemEnteredListener{
	
	private String tag = this.getClass().toString();
	
    @Override
    protected void onCreate(Bundle savedInstanceState) {
    	Log.i(tag, "onCreate");
        super.onCreate(savedInstanceState);
        setContentView(R.layout.to_do_activity);
    }

    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()) {
            case R.id.show_list:
                ListViewFrag fragment = (ListViewFrag) getFragmentManager().findFragmentById(R.id.listFragment);
                if(fragment != null && fragment.isInLayout()) {

                } else {
                	Intent intent = new Intent(getApplicationContext(), ListActivity.class);
                	startActivity(intent);
                }
                return true;
         }
        return false;
    }
    
    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
    	Log.i(tag, "onCreateOptionsMenu");
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.to_do_list, menu);
        
        return true;
    }


	@Override
	public void onItemEntered(String task) {
		Log.i(tag, "onItemEntered");
		ListViewFrag fragment = (ListViewFrag) getFragmentManager().findFragmentById(R.id.listFragment);
		if(fragment != null && fragment.isInLayout()) {
			Log.i(tag, "-> Updating Fragment");
			fragment.updateTask(task);
		} else {
			Log.i(tag, "-> Loading Fragment");
			Intent intent = new Intent(getApplicationContext(), ListActivity.class);
			intent.putExtra(ListActivity.EXTRA_ITEM, task);
			startActivity(intent);
		}	
	}
}
