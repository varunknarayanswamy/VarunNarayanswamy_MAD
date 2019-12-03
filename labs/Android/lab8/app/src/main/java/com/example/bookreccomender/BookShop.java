package com.example.bookreccomender;

public class BookShop {
    private String bookName;
    private String bookAuthor;

    private void setBookInfo(Integer SetBook){
        switch (SetBook){
            case 0:
                bookName = "Sherlock Holmes";
                bookAuthor = "https://www.arthurconandoyle.com/";
                break;
            case 1:
                bookName = "Harry Potter and the Sorceror Stone";
                bookAuthor = "https://www.jkrowling.com/";
                break;
            case 2:
                bookName = "Ender's Game";
                bookAuthor = "http://www.hatrack.com/";
                break;
            case 3:
                bookName = "Wonder";
                bookAuthor = "https://wonderthebook.com/";
                break;
            default:
                bookName = "none";
                bookAuthor = "https://www.google.com/search?q=author&oq=author&aqs=chrome..69i57j0l4j69i61.719j0j4&sourceid=chrome&ie=UTF-8";
        }
    }

    public void setBookAuthor(Integer bookAuthor) {
        setBookInfo(bookAuthor);
    }

    public void setBookName(Integer bookName) {
        setBookInfo(bookName);
    }

    public String getBookAuthor() {
        return bookAuthor;
    }

    public String getBookName() {
        return bookName;
    }
}
