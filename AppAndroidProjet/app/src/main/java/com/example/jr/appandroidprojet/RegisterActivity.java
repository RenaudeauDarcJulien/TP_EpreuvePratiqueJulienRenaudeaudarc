package com.example.jr.appandroidprojet;

import android.app.Activity;
import android.content.Context;
import android.os.AsyncTask;
import android.os.Bundle;
import android.view.View;
import android.widget.EditText;
import android.widget.Toast;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

public class RegisterActivity extends Activity {

    EditText nom, motdepasse, email, identifiant, prenom;
    String Nom, Motdepasse, Email, Identifiant, Prenom;
    Context ctx=this;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_register);
        identifiant = (EditText) findViewById(R.id.register_identifiant);
        motdepasse = (EditText) findViewById(R.id.register_motdepasse);
        email = (EditText) findViewById(R.id.register_email);
        nom =(EditText)findViewById(R.id.register_nom);
        prenom = (EditText)findViewById(R.id.register_prenom);
    }

    public void register_register(View v){
        Nom = nom.getText().toString();
        Motdepasse = motdepasse.getText().toString();
        Email = email.getText().toString();
        Identifiant = identifiant.getText().toString();
        Prenom = prenom.getText().toString();
        BackGround b = new BackGround();
        b.execute(Nom,Identifiant, Motdepasse, Email, Prenom);
    }

    class BackGround extends AsyncTask<String, String, String> {

        @Override
        protected String doInBackground(String... params) {
            String identifiant = params[1];
            String motdepasse = params[2];
            String email = params[3];
            String nom = params[0];
            String prenom = params[4];

            String data="";
            int tmp;

            try {
                URL url = new URL("http://10.0.2.2/androidapp/register.php?nom="+nom+"&prenom="+prenom+"&email="+email+"&identifiant="+identifiant+"&motdepasse="+motdepasse+"");
                //String urlParams = "nom="+nom+"&prenom="+prenom+"&email="+email+"&identifiant="+identifant+"&motdepasse="+motdepasse;

                HttpURLConnection httpURLConnection = (HttpURLConnection) url.openConnection();
                httpURLConnection.setDoOutput(true);
                OutputStream os = httpURLConnection.getOutputStream();
                //os.write(urlParams.getBytes());
                os.flush();
                os.close();
                InputStream is = httpURLConnection.getInputStream();
                while((tmp=is.read())!=-1){
                    data+= (char)tmp;
                }
                is.close();
                httpURLConnection.disconnect();

                return data;

            } catch (MalformedURLException e) {
                e.printStackTrace();
                return "Exception: "+e.getMessage();
            } catch (IOException e) {
                e.printStackTrace();
                return "Exception: "+e.getMessage();
            }
        }

        @Override
        protected void onPostExecute(String s) {
            if(s.equals("")){
                s="Data saved successfully.";
            }
            Toast.makeText(ctx, s, Toast.LENGTH_LONG).show();
        }
    }

}