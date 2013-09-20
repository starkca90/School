package com.starkca.todolistfragment;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.ArrayList;

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
	
	ArrayList<String> todoItems;
	ArrayAdapter<String> aa;
	private String FileName="ListItems";
	
	private String tag = "ListFrag";
	
	@Override
	public void onCreate(Bundle savedInstanceState) {
		Log.i(tag, "onCreate");
		super.onCreate(savedInstanceState);
		
		try {
			FileInputStream fis = getActivity().openFileInput(FileName);
			ObjectInputStream ois = new ObjectInputStream(fis);
			todoItems = (ArrayList<String>) ois.readObject();
			ois.close();
			Log.i(tag, "Loaded todoItems " + String.valueOf(todoItems.size()));
		} catch (FileNotFoundException e) {
			Log.i(tag, "File Not Found");
			todoItems = new ArrayList<String>();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public View onCreateView(LayoutInflater inflater, ViewGroup container,
			Bundle savedINstanceState) {
		View view = inflater.inflate(R.layout.fragment_listview, container,
				false);
		
		ListView myListView = (ListView) view.findViewById(R.id.myListView);

		aa = new ArrayAdapter<String>(this.getActivity(),
				android.R.layout.simple_list_item_1, todoItems);

		myListView.setAdapter(aa);
		
		if(todoItems.size() != 0)
			aa.notifyDataSetChanged();

		return view;
	}
	
	@Override
	public void onPause() {
		super.onPause();
		
		try {
			FileOutputStream fos = getActivity().openFileOutput(FileName, Context.MODE_PRIVATE);
			ObjectOutputStream oos = new ObjectOutputStream(fos);
			oos.writeObject(todoItems);
			Log.i(tag, "Saved todoItems " + String.valueOf(todoItems.size()));
			oos.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	public void updateText(String item) {
		todoItems.add(0, item);
		aa.notifyDataSetChanged();
	}
}
