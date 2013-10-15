package com.starkca.todolistmidterm;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import com.starkca.todolistmidterm.ToDoItem.State;
import com.starkca.todolistmidterm.ToDoItem.Priority;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.SQLException;
import android.database.sqlite.SQLiteDatabase;
import android.util.Log;

public class TasksDataSource {

	// Database fields
	private SQLiteDatabase database;
	private MySQLiteHelper dbHelper;
	private String[] allColumns = { MySQLiteHelper.COLUMN_ID,
			MySQLiteHelper.COLUMN_TASK, MySQLiteHelper.COLUMN_DATE,
			MySQLiteHelper.COLUMN_NOTIFY, MySQLiteHelper.COLUMN_LOC,
			MySQLiteHelper.COLUMN_STATE, MySQLiteHelper.COLUMN_PRIOR };
	
	public TasksDataSource(Context context) {
		dbHelper = new MySQLiteHelper(context);
	}
	
	public void open() throws SQLException {
		database = dbHelper.getWritableDatabase();
	}
	
	public void close() {
		dbHelper.close();
	}
	
	public ToDoItem createToDoItem(String task, Context context) {
		ContentValues values = new ContentValues();
		
		values.put(MySQLiteHelper.COLUMN_TASK, task);
		values.put(MySQLiteHelper.COLUMN_DATE, Calendar.getInstance().getTimeInMillis());
		values.put(MySQLiteHelper.COLUMN_LOC, context.getString(R.string.address));
		values.put(MySQLiteHelper.COLUMN_NOTIFY, 0);
		values.put(MySQLiteHelper.COLUMN_STATE, State.NOTSTARTED.ordinal());
		values.put(MySQLiteHelper.COLUMN_PRIOR, Priority.LOW.ordinal());
		
		long insertId = database.insert(MySQLiteHelper.TABLE_TASKS, null, values);
		Cursor cursor = database.query(MySQLiteHelper.TABLE_TASKS, 
					allColumns, MySQLiteHelper.COLUMN_ID + " = " + insertId, null, null, null, null);
		cursor.moveToFirst();
		ToDoItem newToDoItem = cursorToItem(cursor);
		cursor.close();
		return newToDoItem;
	}
	
	public void deleteToDoItem(ToDoItem item) {
		long id = item.getId();
		System.out.println("Item deleted with id: " + id);
		
		ContentValues values = new ContentValues();
		values.put(MySQLiteHelper.COLUMN_ID, id);
		values.put(MySQLiteHelper.COLUMN_TASK, item.getTask());
		values.put(MySQLiteHelper.COLUMN_DATE, item.getDate());
		values.put(MySQLiteHelper.COLUMN_NOTIFY, item.getNotify() ? 1 : 0);
		values.put(MySQLiteHelper.COLUMN_LOC, item.getLocation());
		values.put(MySQLiteHelper.COLUMN_STATE, State.DELETE.ordinal());
		values.put(MySQLiteHelper.COLUMN_PRIOR, item.getPriority().ordinal());
		
		database = dbHelper.getWritableDatabase();
		if (database.isOpen())
			database.update(MySQLiteHelper.TABLE_TASKS, values, MySQLiteHelper.COLUMN_ID + "=" + id, null);
		else
			Log.i("TasksDataSource", "I found out why this is broken!!!");
	}
	
	public List<String> getAllToDoItems() {
		List<String> items = new ArrayList<String>();
		
		Cursor cursor = database.query(MySQLiteHelper.TABLE_TASKS,
				allColumns, null, null, null, null, null);
		
		cursor.moveToFirst();
		while(!cursor.isAfterLast()) {
			ToDoItem item = cursorToItem(cursor);
			items.add(item.toString());
			cursor.moveToNext();
		}
		// make sure to close the cursor
		cursor.close();
		return items;
	}
	
	public List<ToDoItem> getAllActiveToDoItems() {
		List<ToDoItem> items = new ArrayList<ToDoItem>();
		
		Cursor cursor = database.query(MySQLiteHelper.TABLE_TASKS, 
				allColumns, null, null, null, null, null);
		
		cursor.moveToFirst();
		while(!cursor.isAfterLast()) {
			ToDoItem item = cursorToItem(cursor);
			if (item.getState() != State.DELETE)
				items.add(item);
			cursor.moveToNext();
		}
		// make sure to close the cursor
		cursor.close();
		return items;
	}
	
	private ToDoItem cursorToItem(Cursor cursor) {
		ToDoItem item = new ToDoItem();
		
		item.setId(cursor.getLong(0));
		
		item.setTask(cursor.getString(1));
		
		item.setDate(cursor.getLong(2));
		
		if(cursor.getInt(3) == 0) 
			item.setNotify(false);
		else
			item.setNotify(true);
		
		item.setLocation(cursor.getString(4));
		
		item.setState(State.values()[cursor.getInt(5)]);
		
		item.setPriority(Priority.values()[cursor.getInt(6)]);
		
		return item;
	}

	public void updateToDoItem(ToDoItem item) {
		ContentValues values = new ContentValues();
		long id = item.getId();
		
		values.put(MySQLiteHelper.COLUMN_ID, id);
		values.put(MySQLiteHelper.COLUMN_TASK, item.getTask());
		values.put(MySQLiteHelper.COLUMN_DATE, item.getDate());
		values.put(MySQLiteHelper.COLUMN_NOTIFY, item.getNotify() ? 1 : 0);
		values.put(MySQLiteHelper.COLUMN_LOC, item.getLocation());
		values.put(MySQLiteHelper.COLUMN_STATE, item.getState().ordinal());
		values.put(MySQLiteHelper.COLUMN_PRIOR, item.getPriority().ordinal());
		database = dbHelper.getWritableDatabase();
		if (database.isOpen())
			database.update(MySQLiteHelper.TABLE_TASKS, values, MySQLiteHelper.COLUMN_ID + "=" + id, null);
		else
			Log.i("TasksDataSource", "I found out why this is broken!!!");
		
	}
}
