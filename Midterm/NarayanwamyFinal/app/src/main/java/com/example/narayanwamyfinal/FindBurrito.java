package com.example.narayanwamyfinal;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;

import com.google.android.material.floatingactionbutton.FloatingActionButton;
import com.google.android.material.snackbar.Snackbar;

import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;

import android.view.View;
import android.widget.TextView;

public class FindBurrito extends AppCompatActivity {
    private String Location;
    private String Url;
    private TextView locationView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_find_burrito);
        Toolbar toolbar = findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);

        FloatingActionButton fab = findViewById(R.id.fab);
        fab.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                LoadWebsite(view);
            }
        });
        locationView = findViewById(R.id.loc);
        Intent intent = getIntent();
        Location = intent.getStringExtra("storeName");
        Url = intent.getStringExtra("storeUrl");
        Location = "A good place for you would be " + Location;
        locationView.setText(Location);
    }

    private void LoadWebsite(View view){
        Intent intent = new Intent(Intent.ACTION_VIEW);
        intent.setData(Uri.parse(Url));
        startActivity(intent);
    }

}
