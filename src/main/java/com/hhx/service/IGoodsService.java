package com.hhx.service;

import com.hhx.body.*;

import java.util.List;

public interface IGoodsService {
    public int  getPageNum();
    public List<Goods> freshtypePage(Page page);
    public List<Goods> findgoods(Page page);
    public Goods getmoreinfo(String id);
    public int getbuynum(String ID);
    public int getcomnum(String no);
    public int getsinglebnum(String id);
    public int getdisnum(String no);
    public List<trades> buyedlist(String no);
    public List<distribute> getdis(String id);
    public List<Comments> getcomments(String No);
    public void addtrades(trades trades);
    public void addgoods(Goods goods);
    public void distribute(distribute dis);
    public void upinfo(Goods goods);

}
