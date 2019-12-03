package com.example.newappwhodis;

public class DumbClass {
    private String DumbName;
    private String DumbURL;

    private void setDumbInfo(Integer dumbCrowd){
        switch (dumbCrowd){
            case 0:
                DumbName="superDumb";
                DumbURL="superDumb.com";
                break;
            case 1:
                DumbName="kindaSortReallyDumb";
                DumbURL="kindaDumb.com";
                 break;
            case 2:
                DumbName="smartInADumbWay";
                DumbURL="smartInADumbWay.com";
                break;
            case 3:
                DumbName="soDumbYourSmart";
                DumbURL="soDumbYourSmart.com";
                break;
            case 4:
                DumbName="soDumbYourStillDumb";
                DumbURL="soDumbYourStillDumb.com";
                break;
            default:
                DumbName="None";
                DumbURL="none.com";
        }
    }

    public String getDumbName(){
     return DumbName;
    }
    public String getDumbURL(){
        return DumbURL;
    }

    public void setDumbName(Integer dumbName) {
        setDumbInfo(dumbName);
    }
    public void setDumbURL(Integer dumbUrl){
        setDumbInfo(dumbUrl);
    }

}
