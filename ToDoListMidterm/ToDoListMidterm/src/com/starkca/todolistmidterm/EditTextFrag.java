package com.starkca.todolistmidterm;

import java.util.List;

import android.app.Activity;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.AutoCompleteTextView;
import android.view.KeyEvent;

public class EditTextFrag extends Fragment {

	private OnItemEnteredListener listener;
	AutoCompleteTextView myEditText;
	private TasksDataSource datasource;
	List<String> allToDoItems;
	ArrayAdapter<String> aa;
	
	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		
		datasource = new TasksDataSource(getActivity());
		datasource.open();
		
		allToDoItems = datasource.getAllToDoItems();
	}
	
	@Override
	public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
		View view = inflater.inflate(R.layout.fragment_edittext, container, false);
		
		aa = new ArrayAdapter<String>(getActivity(), 
				android.R.layout.simple_dropdown_item_1line, allToDoItems);
		
		myEditText = (AutoCompleteTextView) view.findViewById(R.id.myEditText);
		myEditText.setAdapter(aa);
		
		myEditText.setOnKeyListener(new View.OnKeyListener() {
			
			@Override
			public boolean onKey(View v, int keyCode, KeyEvent event) {
				if(event.getAction() == KeyEvent.ACTION_DOWN) {
					if((keyCode == KeyEvent.KEYCODE_DPAD_CENTER) ||
							(keyCode == KeyEvent.KEYCODE_ENTER)) {
						updateList();
						return true;
					}
				}
				return false;
			}
		});
		
		return view;
	}
	
	public interface OnItemEnteredListener {
		public void onItemEntered(String task);
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
		String enteredTask = myEditText.getText().toString();
		myEditText.setText(getString(R.string.addItemHint));
		aa.add(enteredTask);
		listener.onItemEntered(enteredTask);

	}
}
