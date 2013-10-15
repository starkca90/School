package com.starkca.todolistmidterm;

import java.util.Comparator;
import java.util.List;

import com.starkca.todolistmidterm.ToDoDetailFrag.ToDoDetailFragListener;

import android.content.Intent;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
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
	
	private static Comparator<ToDoItem> ToDoItemChronoComparator = new Comparator<ToDoItem>() {
		public int compare(ToDoItem item1, ToDoItem item2) {
			Long date1 = item1.getDate();
			Long date2 = item2.getDate();
			
			return date1.compareTo(date2);
		}
	};
	
	private static Comparator<ToDoItem> ToDoItemPriorComparator = new Comparator<ToDoItem>() {
		public int compare(ToDoItem item1, ToDoItem item2) {
			Integer prior1 = item1.getPriority().ordinal();
			Integer prior2 = item2.getPriority().ordinal();
			
			return prior2.compareTo(prior1);
		}
	};
	
	private static Comparator<ToDoItem> ToDoItemStateComparator = new Comparator<ToDoItem>() {
		public int compare(ToDoItem item1, ToDoItem item2) {
			Integer state1 = item1.getState().ordinal();
			Integer state2 = item2.getState().ordinal();
			
			return state1.compareTo(state2);
		}
	};
	
	@Override
	public void onCreate(Bundle savedInstanceState) {
		Log.i(tag, "onCreate");
		super.onCreate(savedInstanceState);
		
		datasource = new TasksDataSource(getActivity());
		datasource.open();
		
		todoItems = datasource.getAllActiveToDoItems();	
		
		setHasOptionsMenu(true);
	}
	
    @Override
    public void onCreateOptionsMenu(Menu menu, MenuInflater inflater) {
        super.onCreateOptionsMenu(menu, inflater);
        Log.i(tag, "onCreateOptionsMenu");
        // Inflate the menu; this adds items to the action bar if it is present.
        inflater.inflate(R.menu.list, menu);
    }

    public boolean onOptionsItemSelected (MenuItem item) {
        switch(item.getItemId()) {
            case R.id.sortChrono:
            	aa.sort(ToDoItemChronoComparator);
                return true;
            case R.id.sortPrior:
            	aa.sort(ToDoItemPriorComparator);
            	return true;
            case R.id.sortState:
            	aa.sort(ToDoItemStateComparator);
            	return true;
        }
        return false;
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
