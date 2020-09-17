package com.hhx.service.Imp;

import com.hhx.body.*;
import com.hhx.dao.IGoodsDao;
import com.hhx.dao.IUserDao;
import com.hhx.service.IGoodsService;
import com.hhx.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
@Service("UserService")
public class UserService implements IUserService {

    @Autowired
    private IUserDao userDao;
    @Autowired
    private IGoodsDao goodsDao;
    @Override
    public List<User> getAll() {
        System.out.println("getall!!!!");
        return userDao.getAll();
    }



    @Override
    public User indentify(User user) {
        return userDao.indentify(user);
    }

    @Override
    public void adduser(User user) {
        userDao.adduser(user);
    }

    @Override
    public void deletegood(String No) {
        userDao.deletegood(No);
    }

    @Override
    public void deletedis(String No) {
        userDao.deletedis(No);
    }

    @Override
    public void deletecom(String No) {
        userDao.deletecom(No);
    }

    @Override
    public void addcomment(Comments comments) {
        userDao.addcomment(comments);
    }

    @Override
    public List<Act> actlist() {
        List<trades> tradeslist = userDao.actbuy();
        List<distribute> distributeList = userDao.actdis();
        List<Act> list = new ArrayList<>();
        long nowtime = new Date().getTime();
        long daytime = 3600*24*1000;

        for(trades c : tradeslist)
        {
            Act temp = new Act();
            User u = userDao.reflectname(c.getID());
            temp.setAccname(u.getAcc());
            temp.setAct("购买");
            long t = c.getTime().getTime();
            int distance = (int) ((nowtime-t)/daytime);
            temp.setDistance(distance);
            temp.setIsbuy(true);
            temp.setGoodsname(c.getName());
            temp.setPic(u.getPic());
            temp.setTimestamp(c.getTime());
            list.add(temp);
        }
        for(distribute c : distributeList)
        {
            Act temp = new Act();
            User u = userDao.reflectname(c.getID());
            Goods good = goodsDao.getmoreinfo(c.getNo());
            temp.setAccname(u.getAcc());
            temp.setAct("发布");
            long t = c.getTime().getTime();
            int distance = (int) ((nowtime-t)/daytime);
            temp.setDistance(distance);
            temp.setGoodno(good.getNo());
            temp.setGoodspic(good.getPic());
            temp.setIsbuy(false);
            temp.setGoodsname(good.getName());
            temp.setPic(u.getPic());
            temp.setTimestamp(c.getTime());
            list.add(temp);
        }
        return list;
    }

    @Override
    public List<Msg> getmsg(String ID) {
        return userDao.getmsg(ID);
    }

    @Override
    public User getinfo(String ID) {
        return userDao.getinfo(ID);
    }

    @Override
    public void updatemsg(Msg msg) {
        userDao.updatemsg(msg);
    }

    @Override
    public List<String> checkmsg(String to) {
        return userDao.checkmsg(to);
    }

    @Override
    public void becomeold(String to) {
        userDao.becomeold(to);
    }


}
