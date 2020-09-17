package com.hhx.body;

import java.sql.Timestamp;

public class Act {
    private Timestamp timestamp = null;
    private String goodno = null;
    private int distance;
    private boolean isbuy = false;
    private String goodspic = null;
    private String accname = null;
    private String act = null;
    private String goodsname = null;
    private String message = null;
    private String pic = null;

    public String getGoodno() {
        return goodno;
    }

    public void setGoodno(String goodno) {
        this.goodno = goodno;
    }

    public boolean isIsbuy() {
        return isbuy;
    }

    public void setIsbuy(boolean isbuy) {
        this.isbuy = isbuy;
    }

    public String getGoodspic() {
        return goodspic;
    }

    public void setGoodspic(String goodspic) {
        this.goodspic = goodspic;
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }

    public Timestamp getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(Timestamp timestamp) {
        this.timestamp = timestamp;
    }

    public int getDistance() {
        return distance;
    }

    public void setDistance(int distance) {
        this.distance = distance;
    }

    public String getAccname() {
        return accname;
    }

    public void setAccname(String accname) {
        this.accname = accname;
    }

    public String getAct() {
        return act;
    }

    public void setAct(String act) {
        this.act = act;
    }

    public String getGoodsname() {
        return goodsname;
    }

    public void setGoodsname(String goodsname) {
        this.goodsname = goodsname;
    }

    public String getMessage() {
        this.message = this.accname+this.act+"了"+this.goodsname;
        return this.message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    @Override
    public String toString() {
        return "Act{" +
                "timestamp=" + timestamp +
                ", distance=" + distance +
                ", accname='" + accname + '\'' +
                ", act='" + act + '\'' +
                ", goodsname='" + goodsname + '\'' +
                ", message='" + message + '\'' +
                ", pic='" + pic + '\'' +
                '}';
    }
}
