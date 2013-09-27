package com.starkca.todolistintent;

import com.starkca.todolistintent.R;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.Menu;

public class ToDoListActivity extends Activity implements EditTextFrag.OnItemEnteredListener{
	
	private String tag = this.getClass().toString();
	
    @Override
    protected void onCreate(Bundle savedInstanceState) {
    	Log.i(tag, "onCreate");
        super.onCreate(savedInstanceState);
        setContentView(R.layout.fragment_itemdetail);
//        setContentView(R.layout.to_do_activity);
    }


    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
    	Log.i(tag, "onCreateOptionsMenu");
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.to_do_list, menu);
        return true;
    }


	@Override
	public void onItemEntered(ToDoItem item) {
		Log.i(tag, "onItemEntered");
		ListViewFrag fragment = (ListViewFrag) getFragmentManager().findFragmentById(R.id.listFragment);
		if(fragment != null && fragment.isInLayout()) {
			Log.i(tag, "-> Updating Fragment");
			fragment.updateText(item);
		} else {
			Log.i(tag, "-> Loading Fragment");
			Intent intent = new Intent(getApplicationContext(), ListActivity.class);
			intent.putExtra(ListActivity.EXTRA_ITEM, item);
			startActivity(intent);
		}	
	}
}
