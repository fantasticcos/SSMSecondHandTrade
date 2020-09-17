package com.hhx.service.Imp;

import com.hhx.body.*;
import com.hhx.dao.IGoodsDao;
import com.hhx.service.IGoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("goodsService")
public class GoodsService implements IGoodsService {
    @Autowired
    private IGoodsDao goodsDao;
    @Override
    public int getPageNum() {
        return goodsDao.getPageNum();
    }

    @Override
    public List<Goods> freshtypePage(Page page) {
        return goodsDao.freshtypePage(page);
    }

    @Override
    public List<Goods> findgoods(Page page) {
        return goodsDao.findgoods(page);
    }

    @Override
    public Goods getmoreinfo(String id) {
        return goodsDao.getmoreinfo(id);
    }

    @Override
    public int getbuynum(String ID) {
        return goodsDao.getbuynum(ID);
    }

    @Override
    public int getcomnum(String no) {
        return goodsDao.getcomnum(no);
    }

    @Override
    public int getsinglebnum(String id) {
        return goodsDao.getsinglebnum(id);
    }

    @Override
    public int getdisnum(String no) {
        return goodsDao.getdisnum(no);
    }

    @Override
    public List<trades> buyedlist(String no) {
        return goodsDao.buyedlist(no);
    }

    @Override
    public List<distribute> getdis(String id) {
        return goodsDao.getdis(id);
    }

    @Override
    public List<Comments> getcomments(String No) {
        return goodsDao.getcomments(No);
    }

    @Override
    public void addtrades(trades trades) {
        goodsDao.addtrades(trades);
    }

    @Override
    public void addgoods(Goods goods) {
        goodsDao.addgoods(goods);
    }

    @Override
    public void distribute(distribute dis) {
        goodsDao.distribute(dis);
    }

    @Override
    public void upinfo(Goods goods) {
        goodsDao.upinfo(goods);
    }

}
