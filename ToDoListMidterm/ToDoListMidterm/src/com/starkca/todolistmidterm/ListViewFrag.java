package com.starkca.todolistmidterm;

import java.util.List;

import com.starkca.todolistmidterm.ToDoDetailFrag.ToDoDetailFragListener;

import android.app.Fragment;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.AdapterView.OnItemLongClickListener;
import android.widget.ArrayAdapter;
import android.widget.ListView;

public class ListViewFrag extends Fragment {
	
	List<ToDoItem> todoItems;
	ArrayAdapter<ToDoItem> aa;
	private TasksDataSource datasource;
	
	private String tag = this.getClass().toString();
	
	@Override
	public void onCreate(Bundle savedInstanceState) {
		Log.i(tag, "onCreate");
		super.onCreate(savedInstanceState);
		
		datasource = new TasksDataSource(getActivity());
		datasource.open();
		
		todoItems = datasource.getAllToDoItems();		
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
        // Remove item if long pressed
		myListView.setOnItemLongClickListener(new OnItemLongClickListener() {

			@Override
			public boolean onItemLongClick(AdapterView<?> parent, View view,
					int position, long id) {
				ToDoItem item = todoItems.get(position);
				datasource.deleteToDoItem(item);
				aa.remove(item);
				return true;
			}
			
		});
        // Display item details when pressed
		myListView.setOnItemClickListener(new OnItemClickListener() {

			@Override
			public void onItemClick(AdapterView<?> parent, View view, 
					int position, long id) {
				ToDoItem item = (ToDoItem) parent.getItemAtPosition(position);
				
				// Launch new Activity to display details of item
				Intent i = new Intent(getActivity(), ToDoDetailActivity.class);
				ToDoDetailFrag tddf = ToDoDetailFrag.newInstance(position, item);
				
				tddf.setToDoDetailFragListener(new ToDoDetailFragListener() {

					@Override
					public void ToDoDetailFragItemUpdate(int index,
							ToDoItem item) {
						todoItems.set(index, item);
						datasource.updateToDoItem(item);
						aa.notifyDataSetChanged();					
					}
				});
				i.putExtra(ToDoDetailActivity.EXTRA_ITEM, item);
				startActivity(i);				
			}	
		});
		
		if(todoItems.size() != 0)
			aa.notifyDataSetChanged();

		return view;
	}

	@Override
	public void onPause() {
		Log.i(tag, "onPause");
		datasource.close();
		super.onPause();
	}
	
	@Override
	public void onResume() {
		datasource.open();
		super.onResume();
	}

	public void updateTask(String task) {
		ToDoItem item = datasource.createToDoItem(task, getActivity());
		aa.add(item);
	}
}
