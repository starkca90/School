package com.starkca.todolistintent;

import java.io.Serializable;

public class ToDoItem implements Serializable {
	
	private static final long serialVersionUID = 1L;

	public class Date {
		public Integer year;
		public Integer month;
		public Integer day;
	}
	
	public class Time {
		public Integer hour;
		public Integer minute;
	}

	private String task;
	private Date date;
	private Time time;
	
	public ToDoItem() {
		super();
	}
	
	public ToDoItem(String task, Date date, Time time){
		super();
		this.task = task;
		this.date = date;
		this.time = time;
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
	
	public Date getDate(){
		return date;
	}
	
	public void setDate(Date date) {
		this.date = date;
	}
	
	public Time getTime() {
		return time;
	}
	
	public void setTime(Time time) {
		this.time = time;
	}
}
