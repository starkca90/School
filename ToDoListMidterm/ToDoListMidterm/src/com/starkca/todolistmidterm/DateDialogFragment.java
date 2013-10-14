package com.starkca.todolistmidterm;

import java.util.Calendar;

import android.app.DatePickerDialog;
import android.app.Dialog;
import android.app.DialogFragment;
import android.os.Bundle;
import android.widget.DatePicker;

public class DateDialogFragment extends DialogFragment {

	static Calendar sDate;
	static DateDialogFragmentListener sListener;

	public static DateDialogFragment newInstance(int titleResource, Calendar date) {
		DateDialogFragment dialog = new DateDialogFragment();

		sDate = date;

		Bundle args = new Bundle();
		args.putInt("title", titleResource);
		dialog.setArguments(args);
		return dialog;
	}

	@Override
	public Dialog onCreateDialog(Bundle savedInstanceState) {
		return new DatePickerDialog(getActivity(), dateSetListener,
				sDate.get(Calendar.YEAR), sDate.get(Calendar.MONTH),
				sDate.get(Calendar.DAY_OF_MONTH));
	}

	public void setDateDialogFragmentListener(
			DateDialogFragmentListener listener) {
		sListener = listener;
	}

	private DatePickerDialog.OnDateSetListener dateSetListener = new DatePickerDialog.OnDateSetListener() {

		@Override
		public void onDateSet(DatePicker view, int year, int monthOfYear,
				int dayOfMonth) {
			sDate.set(year, monthOfYear, dayOfMonth, sDate.get(Calendar.HOUR_OF_DAY), sDate.get(Calendar.MINUTE));

			// Call back to the DateDialogFragment listener
			sListener.dateDialogFragmentDateSet(sDate);

		}
	};

	public interface DateDialogFragmentListener {
		public void dateDialogFragmentDateSet(Calendar date);
	}
}
