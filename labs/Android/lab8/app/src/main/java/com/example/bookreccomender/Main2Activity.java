package com.example.bookreccomender;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;

import com.google.android.material.floatingactionbutton.FloatingActionButton;
import com.google.android.material.snackbar.Snackbar;

import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;

import android.util.Log;
import android.view.View;
import android.widget.TextView;

public class Main2Activity extends AppCompatActivity {
    private String BookName;
    private String BookAuthor;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main2);
        Toolbar toolbar = findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);

        FloatingActionButton fab = findViewById(R.id.fab);
        fab.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                LoadWebsite(view);
            }
        });
        Intent intent = getIntent();
        BookName = intent.getStringExtra("BookName");
        BookAuthor = intent.getStringExtra("BookAuthor");

        Log.i("Book name", BookName);
        Log.i("Author Name", BookAuthor);

        TextView messageBook = findViewById(R.id.SuggestedBook);
        messageBook.setText("Try reading "+BookName);
    }

    private void LoadWebsite(View view){
        Intent intent = new Intent(Intent.ACTION_VIEW);
        intent.setData(Uri.parse(BookAuthor));
        startActivity(intent);
    }


}
