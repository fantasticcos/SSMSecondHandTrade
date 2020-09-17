package com.hhx.service;

import com.hhx.body.*;

import java.util.List;

public interface IUserService {
    public List<User> getAll();

    public User indentify(User user);
    public void adduser(User user);
    public void deletegood(String No);
    public void deletedis(String No);
    public void deletecom(String No);
    public void addcomment(Comments comments);
    public List<Act> actlist();
    public List<Msg> getmsg(String ID);
    public User getinfo(String ID);
    public void updatemsg(Msg msg);
    public List<String> checkmsg(String to);
    public void becomeold(String to);
}
