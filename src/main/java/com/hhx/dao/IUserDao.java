package com.hhx.dao;

import com.hhx.body.*;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;
@Mapper
@Repository
public interface IUserDao {

    public List<User> getAll();
    public User indentify(User user);
    public void adduser(User user);
    public void deletegood(String No);
    public void deletedis(String No);
    public void deletecom(String No);
    public void addcomment(Comments comments);
    public List<trades> actbuy();
    public List<distribute> actdis();
    public User reflectname(String ID);
    public List<Msg> getmsg(String ID);
    public User getinfo(String ID);
    public void updatemsg(Msg msg);
    public List<String> checkmsg(String to);
    public void becomeold(String to);



}
