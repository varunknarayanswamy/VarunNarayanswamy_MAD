package com.example.bookreccomender;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.Spinner;

public class MainActivity extends AppCompatActivity {
    private Button BookButton;
    private Spinner GenreSpinner;
    private BookShop bookShop = new BookShop();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        GenreSpinner = findViewById(R.id.GenreSpinner);
        BookButton = findViewById(R.id.BookButton);

        View.OnClickListener onClick = new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                findBook(v);
            }
        };
        BookButton.setOnClickListener(onClick);
    }

    public void findBook(View view){
        Integer genre = GenreSpinner.getSelectedItemPosition();
        bookShop.setBookAuthor(genre);

        String suggestedBook = bookShop.getBookName();
        String BookAuthor = bookShop.getBookAuthor();
        Log.i("book suggested", suggestedBook);
        Log.i("book Author", BookAuthor);

        Intent intent = new Intent(this, Main2Activity.class);
        intent.putExtra("BookName", suggestedBook);
        intent.putExtra("BookAuthor", BookAuthor);
        startActivity(intent);
    }

}
