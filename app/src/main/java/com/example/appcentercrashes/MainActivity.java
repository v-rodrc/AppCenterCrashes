package com.example.appcentercrashes;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;

import com.microsoft.appcenter.AppCenter;
import com.microsoft.appcenter.analytics.Analytics;
import com.microsoft.appcenter.crashes.Crashes;
import com.microsoft.appcenter.distribute.Distribute;

import java.util.EmptyStackException;


public class MainActivity extends AppCompatActivity {

    Button btn;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        AppCenter.setLogLevel(Log.VERBOSE);

        AppCenter.start(getApplication(), "04ef84bc-42e9-4860-b7c1-9ee34ff5b943",
                Analytics.class, Crashes.class, Distribute.class);


        btn = (Button) findViewById(R.id.button);

        btn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {


                Crashes.isEnabled();

                Crashes.setEnabled(true);

                //Crashes.generateTestCrash();

                throw new EmptyStackException();
            }
        });
    }
}
