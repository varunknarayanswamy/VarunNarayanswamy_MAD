package com.example.soscary;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }

    public void scream(View view) {
        //edit text
        EditText name = findViewById(R.id.editText);
        String nameVal = name.getText().toString();
        //text value
        TextView scaredText = findViewById(R.id.message);
        scaredText.setText("Riddikulus! This is your worst fear " + nameVal + ". Cast the Spell!");

        //imageview
      ImageView elsa = findViewById(R.id.imageView2);
        elsa.setImageResource(R.drawable.elsa);
    }
}
