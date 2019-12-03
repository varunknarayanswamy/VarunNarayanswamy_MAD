package com.example.newappwhodis;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.Spinner;

public class MainActivity extends AppCompatActivity {
    private Button button;
    private Spinner spinner;
    private DumbClass dumb = new DumbClass();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        spinner=findViewById(R.id.spinner);
        button=findViewById(R.id.button);
        View.OnClickListener onclick = new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                findDumb(v);
            }
        };
        button.setOnClickListener(onclick);
    }

    private void findDumb(View view){
        Integer crowd = spinner.getSelectedItemPosition();
        dumb.setDumbName(crowd);
        dumb.setDumbURL(crowd);
        String suggestDumbShop = dumb.getDumbName();
        String suggestDumbUrl = dumb.getDumbURL();
        Log.i("shop Suggested", suggestDumbShop);
        Log.i("shop url", suggestDumbUrl);

        Intent intent = new Intent(this,DumbActivity.class);
        intent.putExtra("DumbName", suggestDumbShop);
        intent.putExtra("DumbUrl", suggestDumbUrl);
        startActivity(intent);

    }

}
