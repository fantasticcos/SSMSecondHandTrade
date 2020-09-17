package com.hhx.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import com.hhx.service.IGoodsService;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.hhx.body.Goods;
import com.hhx.body.trades;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class GetBuy {
	@Autowired
	private IGoodsService goodsService;
	int num=0;

	public GetBuy() {
	}

	public int getnum(String no) throws IOException
	{
		return goodsService.getbuynum(no);
	}
	public int getcomnum(String no) throws IOException
	{
		return goodsService.getcomnum(no);
	}
	public int getbbuynum(String no) throws IOException
	{

		return goodsService.getsinglebnum(no);
	}
	public int getdisnum(String no) throws IOException
	{

		return goodsService.getdisnum(no);
	}
	
	public List<trades> getbuyed(String no) throws IOException
	{
		return goodsService.buyedlist(no) ;
	}
	public List<com.hhx.body.distribute> getdis(String ID) throws IOException
	{
				return goodsService.getdis(ID);
	}
	public Goods reflectGoods(String No) throws IOException
	{

		return goodsService.getmoreinfo(No);
	}
}
