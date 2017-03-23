package com.example.jr.appandroidprojet;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.os.AsyncTask;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

public class MainActivity extends Activity {

    EditText nom, motdepasse;
    String Nom, Motdepasse;
    Context ctx=this;
    String NOM=null, MOTDEPASSE=null, PRENOM=null, ID=null;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        nom = (EditText) findViewById(R.id.main_name);
        motdepasse = (EditText) findViewById(R.id.main_password);
    }

    public void main_register(View v){
        startActivity(new Intent(this,RegisterActivity.class));
    }

    public void main_login(View v){
        Nom = nom.getText().toString();
        Motdepasse = motdepasse.getText().toString();
        BackGround b = new BackGround();
        b.execute(Nom, Motdepasse);
    }

    class BackGround extends AsyncTask<String, String, String> {

        @Override
        protected String doInBackground(String... params) {
            String nom = params[0];
            String motdepasse = params[1];
            String data="";
            int tmp;

            try {
                URL url = new URL("http://10.0.2.2/androidapp/login.php?identifiant="+nom+"&motdepasse="+motdepasse+"");
               // String urlParams = "identifiant="+nom+"&motdepasse="+motdepasse;

                HttpURLConnection httpURLConnection = (HttpURLConnection) url.openConnection();
                httpURLConnection.setDoOutput(true);
                httpURLConnection.setRequestMethod("GET");
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
            String err=null;
            try {
                JSONObject root = new JSONObject(s);
                JSONObject user_data = root.getJSONObject("user_data");
                NOM = user_data.getString("nom");
                MOTDEPASSE = user_data.getString("motdepasse");
                PRENOM = user_data.getString("prenom");
                ID = user_data.getString("id_utilisateur");

            } catch (JSONException e) {
                e.printStackTrace();
                err = "Exception: "+e.getMessage();
            }

            Intent i = new Intent(ctx, HomeActivity.class);
            i.putExtra("nom", NOM);
            i.putExtra("motdepasse", MOTDEPASSE);
            i.putExtra("prenom", PRENOM);
            i.putExtra("id", ID);
            i.putExtra("err", err);
            startActivity(i);

        }
    }
}