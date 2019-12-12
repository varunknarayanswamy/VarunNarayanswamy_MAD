package com.example.zoomquiz;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.TextView;

public class FinishActivity extends AppCompatActivity {
    private TextView finalScoreView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_finish);
        finalScoreView = findViewById(R.id.finalscore);
        if (savedInstanceState != null)
        {
            String score = savedInstanceState.getString("finalScore");
            finalScoreView.setText(score);
        }
        else {
            Intent intent = getIntent();
            int finalScore = intent.getIntExtra("finalscore", 0);
            String scorenum = Integer.toString(finalScore);
            String score = "You got " + scorenum + " out of 24";
            finalScoreView.setText(score);
        }
    }

    public void restartClicked(View view){
        Intent intent = new Intent(this, MainActivity.class);
        startActivity(intent);
    }


    @Override
    protected void onSaveInstanceState(@NonNull Bundle outState) {
        super.onSaveInstanceState(outState);
        outState.putString("finalScore",finalScoreView.getText().toString());
    }
}
