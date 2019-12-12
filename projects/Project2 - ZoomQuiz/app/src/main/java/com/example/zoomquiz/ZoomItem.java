package com.example.zoomquiz;

import android.media.Image;
import android.util.Log;

import java.net.IDN;

public class ZoomItem {
    private int MainImageID;
    private int ZoomedOutImageID;
    private int ZoomedOutImage2ID;
    private int CurrentID;
    private String answer;

    public ZoomItem(int mainI, int ZoomO, int ZoomO2, int current, String a) {
        MainImageID = mainI;
        ZoomedOutImageID = ZoomO;
        ZoomedOutImage2ID = ZoomO2;
        CurrentID = current;
        answer = a;
    }

    public int getMainImage() {
        return MainImageID;
    }

    public int getZoomedOutImage2() {
        return ZoomedOutImage2ID;
    }

    public int getZoomedOutImage() {
        return ZoomedOutImageID;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public void setMainImage(int mainImage) {
        MainImageID = mainImage;
    }

    public void setZoomedOutImage(int zoomedOutImage) {
        ZoomedOutImageID = zoomedOutImage;
    }

    public void setZoomedOutImage2(int zoomedOutImage2) {
        ZoomedOutImage2ID = zoomedOutImage2;
    }

    public void setCurrentID(int currentID) {
        CurrentID = currentID;
    }

    public int ZoomImage(){
        if (CurrentID == MainImageID){
            Log.i("mainID", "currentID");
            CurrentID = ZoomedOutImageID;
            return ZoomedOutImageID;
        }
        else{
            CurrentID = ZoomedOutImage2ID;
            return ZoomedOutImage2ID;
        }
    }

}
