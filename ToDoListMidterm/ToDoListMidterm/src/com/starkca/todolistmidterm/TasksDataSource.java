package com.starkca.todolistmidterm;

import java.util.ArrayList;
import java.util.List;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.SQLException;
import android.database.sqlite.SQLiteDatabase;

public class TasksDataSource {

	// Database fields
	private SQLiteDatabase database;
	private MySQLiteHelper dbHelper;
	private String[] allColumns = { MySQLiteHelper.COLUMN_ID,
			MySQLiteHelper.COLUMN_TASK, MySQLiteHelper.COLUMN_DATE,
			MySQLiteHelper.COLUMN_NOTIFY, MySQLiteHelper.COLUMN_LOC };
	
	public TasksDataSource(Context context) {
		dbHelper = new MySQLiteHelper(context);
	}
	
	public void open() throws SQLException {
		database = dbHelper.getWritableDatabase();
	}
	
	public void close() {
		dbHelper.close();
	}
	
	public ToDoItem createToDoItem(String task) {
		ContentValues values = new ContentValues();
		values.put(MySQLiteHelper.COLUMN_TASK, task);
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
		database.delete(MySQLiteHelper.TABLE_TASKS, MySQLiteHelper.COLUMN_ID + " = " + id, null);
	}
	
	public List<ToDoItem> getAllToDoItems() {
		List<ToDoItem> items = new ArrayList<ToDoItem>();
		
		Cursor cursor = database.query(MySQLiteHelper.TABLE_TASKS, 
				allColumns, null, null, null, null, null);
		
		cursor.moveToFirst();
		while(!cursor.isAfterLast()) {
			ToDoItem item = cursorToItem(cursor);
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
		
		return item;
	}

	public void updateToDoItem(ToDoItem item) {
		ContentValues values = new ContentValues();
		long id = item.getId();
		System.out.println("Item updated with id: " + id);
		
		values.put(MySQLiteHelper.COLUMN_TASK, item.getTask());
		values.put(MySQLiteHelper.COLUMN_DATE, item.getDate());
		values.put(MySQLiteHelper.COLUMN_NOTIFY, item.getNotify() ? 1 : 0);
		values.put(MySQLiteHelper.COLUMN_LOC, item.getLocation());
		
		database.update(MySQLiteHelper.TABLE_TASKS, values, MySQLiteHelper.COLUMN_ID + " = " + id, null);
		database.delete(MySQLiteHelper.TABLE_TASKS, MySQLiteHelper.COLUMN_ID + " = " + id, null);
		
	}
}
