package com.starkca.todolistintent;

import java.io.Serializable;
import java.util.Calendar;

public class ToDoItem implements Serializable {
	
	private static final long serialVersionUID = 1L;

	private String task;
	private Calendar cal;
	private Boolean notify;
	private String location;
	
	public ToDoItem(String task, Calendar cal, Boolean notify, String location){
		this.task = task;
		this.cal = cal;
		this.notify = notify;
		this.location = location;
	}
	
	@Override
	public String toString() {
		return this.task;
	}
	
	public String getTask(){
		return task;
	}
	
	public void setTask(String task) {
		this.task = task;
	}
	
	public Calendar getCal() {
		return cal;
	}
	
	public void setCal(Calendar cal) {
		this.cal = cal;
	}
	
	public Boolean getNotify() {
		return notify;
	}
	
	public void setNotify(Boolean notify) {
		this.notify = notify;
	}
	
	public String getLocation() {
		return location;
	}
	
	public void setLocation(String location) {
		this.location = location;
	}
}
