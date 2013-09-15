package com.starkca.todolistfragment;

import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

public class ToDoLIstFragment extends Fragment {
	View view;
	
    @Override
	public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedINstanceState) {
    	View view;
    	view = inflater.inflate(R.layout.activity_to_do_list, container, false);
		return view;
    }

}
