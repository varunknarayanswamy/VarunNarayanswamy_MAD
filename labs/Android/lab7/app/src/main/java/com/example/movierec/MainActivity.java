package com.example.movierec;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Context;
import android.os.Bundle;
import android.view.View;
import android.widget.CheckBox;
import android.widget.ImageView;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.Toast;
import android.widget.ToggleButton;

public class MainActivity extends AppCompatActivity {
    private TextView MovieName;
    private ToggleButton toggle;
    private Spinner genre;
    private RadioGroup rating;
    private CheckBox CheckBox;
    private TextView MovieChoice;
    private ImageView MoviePic;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        MovieName = findViewById(R.id.textView);
        toggle = findViewById(R.id.toggleButton);
        CheckBox = findViewById(R.id.checkBox);
        genre = findViewById(R.id.spinner);
        rating = findViewById(R.id.radioGroup);
        MovieChoice = findViewById(R.id.textView2);
        MoviePic = findViewById(R.id.imageView);



    }
    public  void RemoveRatings(View view){
        boolean movie = toggle.isChecked();
        if (movie != true)
        {
            for(int i = 0; i < rating.getChildCount(); i++){
                ((RadioButton)rating.getChildAt(i)).setEnabled(false);
            }
        }
        else {
            for(int i = 0; i < rating.getChildCount(); i++){
                ((RadioButton)rating.getChildAt(i)).setEnabled(true);
            }
        }
    }


    public void FindMovie(View view) {
        boolean movie = toggle.isChecked();
        String genreType = String.valueOf(genre.getSelectedItem());
        boolean picture = CheckBox.isChecked();

        if (movie == true){
            int ratingLevel = rating.getCheckedRadioButtonId();
            if (ratingLevel==-1){
                Context context = getApplicationContext();
                CharSequence text = "Please select a rating";
                int duration = Toast.LENGTH_SHORT;

                Toast toast = Toast.makeText(context, text, duration);
                toast.show();
            }
            else{
                switch (genreType) {
                    case "Comedy":
                        if (ratingLevel == R.id.radioButton){
                            MoviePic.setImageResource(R.drawable.comedymoviepg);
                            MovieChoice.setText("Nacho Libre");
                            break;
                        }
                        else if (ratingLevel == R.id.radioButton2){
                            MoviePic.setImageResource(R.drawable.comedymoviepg13);
                            MovieChoice.setText("AnchorMan");
                            break;
                        }
                        else{
                            MoviePic.setImageResource(R.drawable.comedymovier);
                            MovieChoice.setText("21 Jump Street");
                        }
                        break;
                    case "Action":
                        if (ratingLevel == R.id.radioButton){
                            MoviePic.setImageResource(R.drawable.actionmoviepg);
                            MovieChoice.setText("Spiderman");
                        }
                        else if (ratingLevel == R.id.radioButton2){
                            MoviePic.setImageResource(R.drawable.actionmoviepg13);
                            MovieChoice.setText("Avengers");
                        }
                        else {
                            MoviePic.setImageResource(R.drawable.actionmovier);
                            MovieChoice.setText("Deadpool");
                        }
                        break;
                    case "Horror":
                        if (ratingLevel == R.id.radioButton){
                            MoviePic.setImageResource(R.drawable.horrormoviepg);
                            MovieChoice.setText("Goosebumps");
                        }
                        else if (ratingLevel == R.id.radioButton2){
                            MoviePic.setImageResource(R.drawable.horrormoviepg13);
                            MovieChoice.setText("Insidious");
                        }
                        else {
                            MoviePic.setImageResource(R.drawable.horrormovier);
                            MovieChoice.setText("Get Out");
                        }
                        break;
                    default:
                        MoviePic.setImageResource(R.drawable.actionmoviepg);
                        MovieChoice.setText("Spiderman");

                }
            }
        }
        else{
            switch (genreType) {
                case "Comedy":
                    MoviePic.setImageResource(R.drawable.comedytv);
                    MovieChoice.setText("Scrubs");
                    break;
                case "Action":
                    MoviePic.setImageResource(R.drawable.actiontv);
                    MovieChoice.setText("Arrow");
                    break;
                default:
                    MoviePic.setImageResource(R.drawable.horrortv);
                    MovieChoice.setText("Stranger Things");
            }
        }
        if (picture != true)
        {
            MoviePic.setVisibility(View.INVISIBLE);
        }
        else
        {
            MoviePic.setVisibility(View.VISIBLE);
        }
    }

}

