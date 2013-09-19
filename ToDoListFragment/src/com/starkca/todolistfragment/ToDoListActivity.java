package com.starkca.todolistfragment;

import android.os.Bundle;
import android.app.Activity;
import android.view.Menu;

public class ToDoListActivity extends Activity implements EditTextFrag.OnItemEnteredListener{

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.to_do_activity);
    }


    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.to_do_list, menu);
        return true;
    }


	@Override
	public void onItemEntered(String item) {
		ListViewFrag fragment = (ListViewFrag) getFragmentManager().findFragmentById(R.id.listFragment);
		if(fragment != null && fragment.isInLayout()) {
			fragment.updateText(item);
		}
		
	}
    
}
