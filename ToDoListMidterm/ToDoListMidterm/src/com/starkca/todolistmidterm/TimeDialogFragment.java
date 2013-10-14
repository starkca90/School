package com.starkca.todolistmidterm;

import java.util.Calendar;

import android.app.Dialog;
import android.app.DialogFragment;
import android.app.TimePickerDialog;
import android.os.Bundle;
import android.text.format.DateFormat;
import android.widget.TimePicker;

public class TimeDialogFragment extends DialogFragment {

	static Calendar sTime;
	static TimeDialogFragmentListener sListener;

	public static TimeDialogFragment newInstance(int titleResource, Calendar time) {
		TimeDialogFragment dialog = new TimeDialogFragment();
		
		sTime = time;

		Bundle args = new Bundle();
		args.putInt("title", titleResource);
		dialog.setArguments(args);
		return dialog;
	}

	@Override
	public Dialog onCreateDialog(Bundle savedInstanceState) {
		return new TimePickerDialog(getActivity(), timeSetListener,
				sTime.get(Calendar.HOUR_OF_DAY), sTime.get(Calendar.MINUTE), 
					DateFormat.is24HourFormat(getActivity()));
	}

	public void setTimeDialogFragmentListener(
			TimeDialogFragmentListener listener) {
		sListener = listener;
	}

	private TimePickerDialog.OnTimeSetListener timeSetListener = new TimePickerDialog.OnTimeSetListener() {

		@Override
		public void onTimeSet(TimePicker view, int hourOfDay, int minute) {
			sTime.set(sTime.get(Calendar.YEAR), sTime.get(Calendar.MONTH), sTime.get(Calendar.DAY_OF_MONTH), hourOfDay, minute);
			
			// Call back to the TimeDialogFragment listener
			sListener.timeDialogFragmentTimeSet(sTime);
		}
	};

	public interface TimeDialogFragmentListener {
		public void timeDialogFragmentTimeSet(Calendar date);
	}
}
