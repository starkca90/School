package com.starkca.todolistintent;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.ArrayList;

import com.starkca.todolistintent.R;

import android.app.Fragment;
import android.content.Context;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ListView;

public class ListViewFrag extends Fragment {
	
	ArrayList<ToDoItem> todoItems;
	ArrayAdapter<ToDoItem> aa;
	private String FileName ="todoItems";
	
	private String tag = this.getClass().toString();
	
	@Override
	public void onCreate(Bundle savedInstanceState) {
		Log.i(tag, "onCreate");
		super.onCreate(savedInstanceState);
		try {
			FileInputStream fis = getActivity().openFileInput(FileName);
			ObjectInputStream ois = new ObjectInputStream(fis);
			todoItems = (ArrayList<ToDoItem>) ois.readObject();
			ois.close();
			Log.i(tag, "Loaded todoItems " + String.valueOf(todoItems.size()));
		} catch (FileNotFoundException e) {
			Log.i(tag, "File Not Found");
			todoItems = new ArrayList<ToDoItem>();
		} catch (Exception e) {
			Log.e(tag, e.getMessage());
		}
	}

	@Override
	public View onCreateView(LayoutInflater inflater, ViewGroup container,
			Bundle savedINstanceState) {
		Log.i(tag, "onCreateView");
		View view = inflater.inflate(R.layout.fragment_listview, container,
				false);
		
		ListView myListView = (ListView) view.findViewById(R.id.myListView);

		aa = new ArrayAdapter<ToDoItem>(this.getActivity(),
				android.R.layout.simple_list_item_1, todoItems);

		myListView.setAdapter(aa);
		
		if(todoItems.size() != 0)
			aa.notifyDataSetChanged();

		return view;
	}

	@Override
	public void onPause() {
		Log.i(tag, "onPause");
		super.onPause();
		
		try {
			FileOutputStream fos = getActivity().openFileOutput(FileName, Context.MODE_PRIVATE);
			ObjectOutputStream oos = new ObjectOutputStream(fos);
			oos.writeObject(todoItems);
			Log.i(tag, "Saved todoItems " + String.valueOf(todoItems.size()));
			oos.close();
		} catch (Exception e) {
			Log.e(tag, e.getMessage());
		}
		
	}

	public void updateText(ToDoItem item) {
		Log.i(tag, "Updating text: " + item + " Size: " + String.valueOf(todoItems.size()));
		todoItems.add(0, item);
		aa.notifyDataSetChanged();
	}
}
