package com.starkca.todolistintent;

import java.util.Calendar;

import android.app.Activity;
import android.app.Fragment;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.EditText;
import android.view.KeyEvent;

public class EditTextFrag extends Fragment {

	private OnItemEnteredListener listener;
    private final String defaultAddress = "1600 Amphitheatre Pkwy, Mountain View, CA";
	EditText myEditText;
	
	@Override
	public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
		View view = inflater.inflate(R.layout.fragment_edittext, container, false);
		
		myEditText = (EditText) view.findViewById(R.id.myEditText);
		
		myEditText.setOnKeyListener(new View.OnKeyListener() {
			
			@Override
			public boolean onKey(View v, int keyCode, KeyEvent event) {
				if(event.getAction() == KeyEvent.ACTION_DOWN) {
					if((keyCode == KeyEvent.KEYCODE_DPAD_CENTER) ||
							(keyCode == KeyEvent.KEYCODE_ENTER)) {
						updateList();
					}
				}
				return false;
			}
		});
		
		return view;
	}
	
	public interface OnItemEnteredListener {
		public void onItemEntered(ToDoItem item);
	}
	
	@Override
	public void onAttach(Activity activity) {
		super.onAttach(activity);
		if(activity instanceof OnItemEnteredListener) {
			listener = (OnItemEnteredListener) activity;
		} else {
			throw new ClassCastException(activity.toString()
					+ " must implement EditTextFrag.OnItemEnteredListener");
		}
	}
	
	// May also be triggered from Activity
	public void updateList() {
		Calendar cal = Calendar.getInstance();
		ToDoItem newItem = new ToDoItem(myEditText.getText().toString(), cal, false, defaultAddress);
		myEditText.setText("");
		listener.onItemEntered(newItem);
	}
}
