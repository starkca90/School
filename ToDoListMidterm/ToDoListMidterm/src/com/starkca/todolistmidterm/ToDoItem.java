package com.starkca.todolistmidterm;

import java.io.Serializable;

public class ToDoItem implements Serializable{
	
	private static final long serialVersionUID = 1L;

	private long id;
	private String task;
	private long date;
	private Boolean notify;
	private String location;
	private State state;
	private Priority priority;
	
	public enum State {
		NOTSTARTED, STARTED, COMPLETE, DELETE
	}
	
	public enum Priority {
		LOW, MEDIUM, HIGH
	}
	
	public long getId() {
		return id;
	}
	
	public void setId(long id) {
		this.id = id;
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
	
	public long getDate() {
		return date;
	}
	
	public void setDate(long date) {
		this.date = date;
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
	
	public State getState() {
		return state;
	}
	
	public void setState(State state) {
		this.state = state;
	}
	
	public Priority getPriority() {
		return priority;
	}
	
	public void setPriority(Priority priority) {
		this.priority = priority;
	}
}
