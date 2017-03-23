package com.example.jr.appandroidprojet;

import android.app.Activity;
import android.os.Bundle;
import android.widget.ListView;

/**
 * Created by JR on 23/03/2017.
 */

public class ProjetActivity extends Activity {


    String nom, budget, date_fin,id, Err;
    ListView lv;
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_projet);

        lv =(ListView) findViewById(R.id.listViewProject);

    }
}
