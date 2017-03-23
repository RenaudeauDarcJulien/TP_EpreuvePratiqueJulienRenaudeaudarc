package com.example.jr.appandroidprojet;

import android.app.Activity;
import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

public class HomeActivity  extends Activity {

    String nom, prenom, motdepasse,id, Err;
    TextView nomTV, prenomTV, emailTV, err;
    Button bt_projet;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_home);

        bt_projet = (Button)findViewById(R.id.button_projet);
        nomTV = (TextView) findViewById(R.id.home_name);
        emailTV = (TextView) findViewById(R.id.home_email);
        prenomTV = (TextView) findViewById(R.id.home_prenom);
        err = (TextView) findViewById(R.id.err);

        nom = getIntent().getStringExtra("nom");
        prenom = getIntent().getStringExtra("prenom");
        motdepasse = getIntent().getStringExtra("motdepasse");
        id = getIntent().getStringExtra("id");
        Err = getIntent().getStringExtra("err");

        nomTV.setText("Nom : "+nom);
        prenomTV.setText("Prenom : "+prenom);
        emailTV.setText("Mot de passe "+motdepasse);
        err.setText(Err);

    }
    public void goToMyAnotherActivity (View view) {
        Intent i = new Intent(this, ProjetActivity.class);
        startActivity(i);
    }

}