package com.example.narayanwamyfinal;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.Toast;
import android.widget.ToggleButton;

public class MainActivity extends AppCompatActivity {
    private TextView BurritoDesc;
    private CheckBox sourCream;
    private CheckBox guacamole;
    private CheckBox salsa;
    private RadioGroup foodType;
    private ToggleButton veggie;
    private EditText name;
    private Spinner locations;
    private BurritoClass burritoClass = new BurritoClass();



    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        BurritoDesc = findViewById(R.id.Answer);
        sourCream = findViewById(R.id.sourCream);
        guacamole = findViewById(R.id.gauc);
        salsa = findViewById(R.id.salsa);
        foodType = findViewById(R.id.foodType);
        veggie = findViewById(R.id.toggleButton);
        name = findViewById(R.id.name);
        locations = findViewById(R.id.location);
    }

    public void OnClick(View view)
    {
        String finalString = "";
        String userName = name.getText().toString();
        int food = foodType.getCheckedRadioButtonId();
        if (food == -1){
            Context context = getApplicationContext();
            CharSequence text = "Please select a type of food";
            int duration = Toast.LENGTH_SHORT;

            Toast toast = Toast.makeText(context, text, duration);
            toast.show();
        }
        else{
            if (food == R.id.Burrito)
            {
                finalString = userName+", you want a burrito with";
            }
            else if (food == R.id.Bowl)
            {
                finalString = userName+", you want a bowl with";
            }
            else
            {
                finalString = "you want a taco with";
            }
            boolean vegMeat = veggie.isChecked();
            if (vegMeat){
                finalString = finalString + " veggies";
            }
            else{
                finalString = finalString + " meat";
            }
            if(sourCream.isChecked())
            {
                finalString = finalString + ", sour Cream";
            }
            if (guacamole.isChecked())
            {
                finalString = finalString + ", guacamole";
            }
            if(salsa.isChecked())
            {
                finalString = finalString + " and salsa.";
            }
            BurritoDesc.setText(finalString);
        }
    }

    public void FindLocation(View view){
        String storeName = "";
        String storeURL = "";
        Integer place = locations.getSelectedItemPosition();
        Log.i("num", Integer.toString(place));
        burritoClass.setStoreName(place);
        storeName = burritoClass.getStoreName();
        storeURL = burritoClass.getStoreURL();
        Intent intent = new Intent(this, FindBurrito.class);
        intent.putExtra("storeName",storeName);
        intent.putExtra("storeUrl",storeURL);
        startActivity(intent);
    }

}
