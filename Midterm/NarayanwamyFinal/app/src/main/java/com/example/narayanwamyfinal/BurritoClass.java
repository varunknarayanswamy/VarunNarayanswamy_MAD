package com.example.narayanwamyfinal;

import android.util.Log;

public class BurritoClass {
    private String storeName;
    private String storeURL;

    public void setStoreName(Integer store) {
        Log.i("in class", "setStoreName: ");
        getLocation(store);
    }

    public void setStoreURL(Integer store) {
        getLocation(store);
    }

    public String getStoreName() {
        return storeName;
    }

    public String getStoreURL() {
        return storeURL;
    }
    private void getLocation(Integer Location) {
        switch (Location) {
            case 0:
                storeName = "illegal Petes";
                storeURL = "https://www.illegalpetes.com/";
                break;
            case 1:
                storeName = "Chipotle";
                storeURL = "https://www.chipotle.com/";
                break;
            case 2:
                storeName = "Centro Mexican Kitchen";
                storeURL = "https://www.centromexican.com/menus/";
                break;
            case 3:
                storeName = "Cafe Mexicali";
                storeURL = "https://www.cafemexicali.com/";
                break;
            default:
                storeName = "Cafe Mexicali";
                storeURL = "https://www.cafemexicali.com/";
        }
    }
}
