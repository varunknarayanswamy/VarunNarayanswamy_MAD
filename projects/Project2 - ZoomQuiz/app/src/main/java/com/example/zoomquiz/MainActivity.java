package com.example.zoomquiz;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import android.content.Context;
import android.content.Intent;
import android.media.Image;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import java.io.Console;

public class MainActivity extends AppCompatActivity {
    private int currentScore = 0;
    private int possibleScore = 3;
    private ZoomItem[] zoomArray = new ZoomItem[8];
    private  String[] answers = {"eagle","elephant","cheetah","fox","frog","horse","peacock","shark"};
    private String[] zoomedIn = {"eagle","elephant","cheetah","fox","frog","horse","peacock","shark"};
    private int currentIndex = 0;
    private int currentImage = 1;
    private ImageView Image;
    private Button Zoombutton;
    private Button GuessButton;
    private EditText response;
    private TextView currentPoints;
    private TextView possiblePoints;
    private String randomize = "randomize";



    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        Image = findViewById(R.id.zoomImage);
        Zoombutton = findViewById(R.id.ZoomButton);
        response = findViewById(R.id.Response);
        currentPoints = findViewById(R.id.currentPointsVal);
        possiblePoints = findViewById(R.id.PossiblePoints);
        if (savedInstanceState != null)
        {
            currentImage = savedInstanceState.getInt("imageIndex");
            currentIndex = savedInstanceState.getInt("currentIndex");
            currentScore = savedInstanceState.getInt("currentScore");
            possibleScore = savedInstanceState.getInt("possibleScore");
            currentPoints.setText(savedInstanceState.getString("currentScoreText"));
            possiblePoints.setText(savedInstanceState.getString("possibleScoreText"));
            initialize(false);

        }
        else {
            initialize(true);
        }


    }
    public void initialize(boolean New){
        int size = answers.length;
        for (int i=0; i<size; i++){
            String mainImage = zoomedIn[i];
            String imageName = zoomedIn[i]+"2";
            String imageName2 = zoomedIn[i]+"3";
            Log.i("mainImage", mainImage);
            Log.i("2ndImage", imageName);
            Log.i("3rdImage", imageName2);
            int image1Resource = getResources().getIdentifier(mainImage,"drawable",getPackageName()); //https://stackoverflow.com/questions/4427608/android-getting-resource-id-from-string macarsas
            int image2Resource = getResources().getIdentifier(imageName,"drawable",getPackageName());
            int image3Resource = getResources().getIdentifier(imageName2,"drawable",getPackageName());
            ZoomItem zoomItem = new ZoomItem(image1Resource,image2Resource,image3Resource, image1Resource,answers[i]);
            zoomArray[i] = zoomItem;
        }
        if (New == true) {
            Image.setImageResource(zoomArray[0].getMainImage());
        }
        else {
            switch (currentImage){
                case 1:
                    Log.i("currentImage", "initialize: ");
                    Image.setImageResource(zoomArray[currentIndex].getMainImage());
                    break;
                case 2:
                    Log.i("image2", "initialize: ");
                    Image.setImageResource(zoomArray[currentIndex].getZoomedOutImage());
                    zoomArray[currentIndex].setCurrentID(zoomArray[currentIndex].getZoomedOutImage());
                    break;
                case 3:
                    Log.i("image3", "initialize: ");
                    Image.setImageResource(zoomArray[currentIndex].getZoomedOutImage2());
                    zoomArray[currentIndex].setCurrentID(zoomArray[currentIndex].getZoomedOutImage2());
                    break;
            }
        }

    }

    public void ZoomClicked(View view){
        int newImage = zoomArray[currentIndex].ZoomImage();
        currentImage = currentImage+1;
        Image.setImageResource(newImage);
        possibleScore = possibleScore - 1;
        if (possibleScore == 1){
            Zoombutton.setEnabled(false);
        }
        String mainText = possiblePoints.getText().toString();
        mainText = mainText.substring(0,mainText.length()-1);
        mainText = mainText + Integer.toString(possibleScore);
        possiblePoints.setText(mainText);

    }

    public void GuessClicked(View view){
        String currentAnswer = zoomArray[currentIndex].getAnswer();
        String currentVal = response.getText().toString();
        if (currentVal.equals("")) {
            Context context = getApplicationContext();
            CharSequence text = "Please add an answer first";
            int duration = Toast.LENGTH_SHORT;

            Toast toast = Toast.makeText(context, text, duration);
            toast.show();
        }
        else{
            if (currentVal.equals(currentAnswer)) {
                currentScore = currentScore + possibleScore;
                if (currentIndex == zoomArray.length - 1) {
                    Log.i("hmm", Integer.toString(currentScore));
                    Intent intent = new Intent(this, FinishActivity.class);
                    intent.putExtra("finalscore", currentScore);
                    startActivity(intent);
                } else {
                    currentIndex = currentIndex + 1;
                    int newImage = zoomArray[currentIndex].getMainImage();
                    Image.setImageResource(newImage);

                    String totalPoints = Integer.toString(currentScore);
                    currentPoints.setText(totalPoints);

                    possibleScore = 3;
                    String mainText = possiblePoints.getText().toString();
                    mainText = mainText.substring(0, mainText.length() - 1);
                    mainText = mainText + "3";
                    possiblePoints.setText(mainText);

                    Zoombutton.setEnabled(true);
                    currentImage = 1;
                }
            } else {
                if (possibleScore == 1) {
                    if (currentIndex == zoomArray.length - 1) {
                        Intent intent = new Intent(this, FinishActivity.class);
                        intent.putExtra("final score", currentScore);
                        startActivity(intent);
                    } else {
                        currentIndex = currentIndex + 1;
                        int newImage = zoomArray[currentIndex].ZoomImage();
                        Image.setImageResource(newImage);
                        possibleScore = 3;
                        String mainText = possiblePoints.getText().toString();
                        mainText = mainText.substring(0, mainText.length() - 1);
                        mainText = mainText + "3";
                        possiblePoints.setText(mainText);
                        Zoombutton.setEnabled(true);
                        currentImage = 1;
                    }
                } else {
                    possibleScore = possibleScore - 1;
                    if (possibleScore == 1) {
                        Zoombutton.setEnabled(false);
                    }
                    String mainText = possiblePoints.getText().toString();
                    mainText = mainText.substring(0, mainText.length() - 1);
                    mainText = mainText + Integer.toString(possibleScore);
                    possiblePoints.setText(mainText);
                }
            }
            response.setText("");
        }
    }

    @Override
    protected void onSaveInstanceState(@NonNull Bundle outState) {
        super.onSaveInstanceState(outState);
        outState.putInt("currentIndex", currentIndex);
        outState.putInt("currentScore",currentScore);
        outState.putInt("possibleScore",possibleScore);
        outState.putInt("imageIndex",currentImage);
        String currentScoreText = currentPoints.getText().toString();
        String possibleScoreText = possiblePoints.getText().toString();
        outState.putString("currentScoreText",currentScoreText);
        outState.putString("possibleScoreText",possibleScoreText);
    }
}
