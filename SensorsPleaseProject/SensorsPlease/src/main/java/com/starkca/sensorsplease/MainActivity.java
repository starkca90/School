package com.starkca.sensorsplease;

import android.app.Activity;
import android.content.Context;
import android.hardware.Sensor;
import android.hardware.SensorManager;
import android.os.Bundle;
import android.util.Log;
import android.widget.Toast;

import java.util.List;

public class MainActivity extends Activity {

    private SensorManager mSensorManager;
    private boolean stepCounterFound = false;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        mSensorManager = (SensorManager) getSystemService(Context.SENSOR_SERVICE);
        List<Sensor> deviceSensors =
                mSensorManager.getSensorList(Sensor.TYPE_ALL);
        StringBuffer sb = new StringBuffer();
        for(Sensor sensor : deviceSensors) {
            sb.append(sensor.getName() + "\n");
            if(sensor.getType() == Sensor.TYPE_PROXIMITY)
                stepCounterFound = true;
        }
        Toast.makeText(this, sb.toString(), Toast.LENGTH_LONG).show();
        Log.i("Sensors", sb.toString());
        if(stepCounterFound)
            Log.i("Proximity", "Found");
        else
            Log.i("Proximity", "Not Found");
    }
}
