package com.starkca.todolistfragment;

import android.app.Activity;
import android.content.res.Configuration;
import android.os.Bundle;

public class ListActivity extends Activity {
	public static final String EXTRA_ITEM = "item";

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		
		if(getResources().getConfiguration().orientation == Configuration.ORIENTATION_LANDSCAPE) {
			finish();
			return;
		}
		
		setContentView(R.layout.activity_list);
		
		Bundle extras = getIntent().getExtras();
		if(extras != null) {
			String item = extras.getString(EXTRA_ITEM);
			ListViewFrag fragment = (ListViewFrag) getFragmentManager().findFragmentById(R.id.listFragment);
			if(fragment != null && fragment.isInLayout()) {
				fragment.updateText(item);
			}
		}
	}
}
