package com.hhx.body;

import java.io.Serializable;
import java.util.List;

public class User implements Serializable {
    private String ID;
    private String acc;
    private String password;
    private String pic;
    public int buynum = 0;
    public int distnum = 0;
    public List<trades> list = null;
    public List<distribute> dislist = null;
    private Comments comments = null;

    public Comments getComments() {
        return comments;
    }

    public void setComments(Comments comments) {
        this.comments = comments;
    }

    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public String getAcc() {
        return acc;
    }

    public void setAcc(String acc) {
        this.acc = acc;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }

    @Override
    public String toString() {
        return "User{" +
                "ID='" + ID + '\'' +
                ", acc='" + acc + '\'' +
                ", password='" + password + '\'' +
                ", pic='" + pic + '\'' +
                '}';
    }
}
