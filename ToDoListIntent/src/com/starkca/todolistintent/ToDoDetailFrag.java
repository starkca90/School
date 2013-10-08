package com.starkca.todolistintent;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Locale;

import com.starkca.todolistintent.DateDialogFragment.DateDialogFragmentListener;
import com.starkca.todolistintent.TimeDialogFragment.TimeDialogFragmentListener;

import android.app.Fragment;
import android.app.Notification;
import android.app.PendingIntent;
import android.app.NotificationManager;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.text.Editable;
import android.text.TextWatcher;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.ToggleButton;

public class ToDoDetailFrag extends Fragment {

	private String tag = this.getClass().toString();
	private View view;
	private static final SimpleDateFormat DATE_FORMAT = new SimpleDateFormat(
			"EEEEEEE, MMMMMMMMM dd, yyyy", Locale.US);
	private static final SimpleDateFormat TIME_FORMAT = new SimpleDateFormat(
			"h:mm a", Locale.US);

	static int sIndex;
	static ToDoItem sItem;
	static ToDoDetailFragListener sListener;

	@Override
	public View onCreateView(LayoutInflater inflater, ViewGroup container,
			Bundle savedInstanceState) {
		Log.i(tag, "onCreateView");
		super.onCreateView(inflater, container, savedInstanceState);
		view = inflater.inflate(R.layout.fragment_itemdetail, container, false);

		return view;
	}

	public static ToDoDetailFrag newInstance(int index, ToDoItem item) {
		ToDoDetailFrag frag = new ToDoDetailFrag();

		sIndex = index;
		sItem = item;

		return frag;
	}

	public void setToDoDetailFragListener(ToDoDetailFragListener listener) {
		sListener = listener;
	}

	public interface ToDoDetailFragListener {
		public void ToDoDetailFragItemUpdate(int index, ToDoItem item);
	}

	public void showDetails(ToDoItem item) {
		Log.i(tag, "showDetails");

		sItem = item;

		final EditText task = (EditText) view.findViewById(R.id.detailtask);
		task.setText(item.getTask());
		task.addTextChangedListener(new TextWatcher() {

			@Override
			public void afterTextChanged(Editable s) {
				sItem.setTask(task.getText().toString());
				sListener.ToDoDetailFragItemUpdate(sIndex, sItem);
			}

			@Override
			public void beforeTextChanged(CharSequence arg0, int arg1,
					int arg2, int arg3) {
			}

			@Override
			public void onTextChanged(CharSequence arg0, int arg1, int arg2,
					int arg3) {
			}

		});

		final EditText location = (EditText) view
				.findViewById(R.id.detaillocation);
		location.setText(item.getLocation());
		location.addTextChangedListener(new TextWatcher() {

			@Override
			public void afterTextChanged(Editable s) {
				sItem.setLocation(location.getText().toString());
				sListener.ToDoDetailFragItemUpdate(sIndex, sItem);
			}

			@Override
			public void beforeTextChanged(CharSequence arg0, int arg1,
					int arg2, int arg3) {
			}

			@Override
			public void onTextChanged(CharSequence arg0, int arg1, int arg2,
					int arg3) {
			}
		});

		final TextView dateText = (TextView) view.findViewById(R.id.detaildate);
		String shortDateStr = DATE_FORMAT.format(item.getCal().getTime());
		dateText.setText(shortDateStr);
		dateText.setOnClickListener(new OnClickListener() {

			@Override
			public void onClick(View v) {
				DateDialogFragment ddf = DateDialogFragment.newInstance(
						R.string.set_date, sItem.getCal());

				ddf.setDateDialogFragmentListener(new DateDialogFragmentListener() {

					@Override
					public void dateDialogFragmentDateSet(Calendar date) {
						String shortDateStr = DATE_FORMAT.format(date.getTime());
						dateText.setText(shortDateStr);

						sItem.setCal(date);

						sListener.ToDoDetailFragItemUpdate(sIndex, sItem);
					}
				});
				ddf.show(getFragmentManager(), "date picker dialog fragment");
			}
		});

		final TextView timeText = (TextView) view.findViewById(R.id.detailtime);
		String shortTimeStr = TIME_FORMAT.format(item.getCal().getTime());
		timeText.setText(shortTimeStr);
		timeText.setOnClickListener(new OnClickListener() {

			@Override
			public void onClick(View v) {
				TimeDialogFragment tdf = TimeDialogFragment.newInstance(
						R.string.set_time, sItem.getCal());

				tdf.setTimeDialogFragmentListener(new TimeDialogFragmentListener() {

					@Override
					public void timeDialogFragmentTimeSet(Calendar date) {
						String shorTimeStr = TIME_FORMAT.format(date.getTime());
						timeText.setText(shorTimeStr);

						sItem.setCal(date);
						sListener.ToDoDetailFragItemUpdate(sIndex, sItem);
					}
				});
				tdf.show(getFragmentManager(), "date picker dialog fragment");
			}
		});

		final ToggleButton button = (ToggleButton) view
				.findViewById(R.id.bReminder);
		button.setChecked(item.getNotify());
		button.setOnClickListener(new OnClickListener() {

			@Override
			public void onClick(View v) {
				sItem.setNotify(button.isChecked());
				sListener.ToDoDetailFragItemUpdate(sIndex, sItem);

				if (sItem.getNotify()) {
					Log.i(tag, "Enable Notification");
					sendNotification(sItem.toString(), sItem.toString()
							+ " is due");

				} else {
					Log.i(tag, "Disable Notification");
					// TODO Remove notification
				}
			}

		});

	}
	
	public void showMap() {
		mapIt(sItem.getLocation());
	}
	
	private void mapIt(String location) {
		String uri = "geo:0,0?q=" + location;
		Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse(uri));
		getActivity().startActivity(intent);
	}

	private void sendNotification(String title, String body) {

		NotificationManager nm = (NotificationManager) getActivity()
				.getSystemService(getActivity().NOTIFICATION_SERVICE);
		Intent intent = new Intent(getActivity(), ToDoListActivity.class);
		PendingIntent pi = PendingIntent.getActivity(getActivity(), 0, intent,
				0);
		Notification n = new Notification(R.drawable.ic_launcher, body,
				System.currentTimeMillis());
		n.setLatestEventInfo(getActivity(), title, body, pi);
		n.defaults = Notification.DEFAULT_ALL;
		n.flags |= (Notification.FLAG_AUTO_CANCEL | Notification.FLAG_SHOW_LIGHTS);
		nm.notify(139868, n);
	}
}
