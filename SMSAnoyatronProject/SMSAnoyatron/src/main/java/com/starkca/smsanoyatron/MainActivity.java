package com.starkca.smsanoyatron;

import android.os.Bundle;
import android.app.Activity;
import android.telephony.SmsManager;
import android.view.Menu;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

public class MainActivity extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        Button butSend = (Button) findViewById(R.id.butSend);
        butSend.setOnClickListener(new View.OnClickListener() {

            @Override
            public void onClick(View view) {
                EditText text = (EditText) findViewById(R.id.editText);
                EditText number = (EditText) findViewById(R.id.editNumber);
                sendSMS(number.getText().toString(), text.getText().toString());
            }
        });
    }


    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.main, menu);
        return true;
    }

    public void sendSMS(String number, String text) {
        SmsManager sms = SmsManager.getDefault();
        sms.sendTextMessage(number, null, text, null, null);
    }
    
}
