package com.starkca.todolistfragment;

import java.util.ArrayList;

import android.app.Fragment;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ListView;

public class ListViewFrag extends Fragment {
	
	ArrayList<String> todoItems;
	ArrayAdapter<String> aa;

	@Override
	public View onCreateView(LayoutInflater inflater, ViewGroup container,
			Bundle savedINstanceState) {
		View view = inflater.inflate(R.layout.fragment_listview, container,
				false);

		ListView myListView = (ListView) view.findViewById(R.id.myListView);

		todoItems = new ArrayList<String>();
		aa = new ArrayAdapter<String>(this.getActivity(),
				android.R.layout.simple_list_item_1, todoItems);

		myListView.setAdapter(aa);

		return view;
	}

	public void updateText(String item) {
		todoItems.add(0, item);
		aa.notifyDataSetChanged();
	}
}
