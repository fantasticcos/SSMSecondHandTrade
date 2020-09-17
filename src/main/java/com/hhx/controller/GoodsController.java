package com.hhx.controller;

import com.hhx.body.*;
import com.hhx.service.IGoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(path = "/type")
public class GoodsController {

    @Autowired
    private IGoodsService goodsService;

    @GetMapping(path = "/more", produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String getpage(@RequestParam(value = "page")int page,@RequestParam(value = "type")String type,@RequestParam(value = "search")String search)
    {
        int p = page;
        int pnum=goodsService.getPageNum();
        List<Goods> goods=null;
        if(search==null||search.equals(""))
            goods=goodsService.freshtypePage(new Page(p,type)) ;
        else
            goods=goodsService.findgoods(new Page(p,search,1));

        StringBuffer sb=new StringBuffer();
        sb.append("{ 'page':'"+pnum+"','result' :[");
        for(Goods g :goods)
        {
            System.out.println("yes");
            sb.append("{");
            sb.append("'No':"+"'"+g.getNo()+"',");
            sb.append(" 'type':"+"'"+g.getType()+"',");
            sb.append(" 'name':"+"'"+g.getName()+"',");
            sb.append("'price':"+"'"+g.getPrice()+"',");
            sb.append(" 'desc':"+"'"+g.getDesc()+"',");
            sb.append(" 'comments':"+"'"+g.getComments()+"',");
            sb.append(" 'pic':"+"'"+g.getPic()+"'");
            sb.append("},");
        }
        sb.append("{} ] }");


        return sb.toString();

    }
    @RequestMapping(path = "/detail")
    public String getdetail(@RequestParam(value = "No")String No , Model model)
    {
        Goods goods = goodsService.getmoreinfo(No);
        List<Comments> list = goodsService.getcomments(No);
        model.addAttribute("goods",goods);
        int comnum = goodsService.getcomnum(No);
        int buynum = goodsService.getsinglebnum(No);
        String shopperid = goods.getUser().getID();
        int disnum = goods.getUser().distnum = goodsService.getdisnum(shopperid);


        Map<Integer,String> dp = new HashMap<>();
        for(Comments c :list)
        {
            dp.put(c.getCid(),c.getUsername());
        }
        for(Comments c :list)
        {
            if(c.getParentid()!=-1)
                c.setParentname(dp.get(c.getParentid()));
        }

        model.addAttribute("comnum",comnum);
        model.addAttribute("buynum",buynum);
        model.addAttribute("disnum",disnum);
        model.addAttribute("shopperid",shopperid);
        model.addAttribute("comments",list);

        return "detail";
    }

    @RequestMapping(path = "/com", produces = "application/json;charset=UTF-8")
    @ResponseBody()
    public String getcomlist(@RequestParam(value = "No")String No)
    {
        List<Comments> list = goodsService.getcomments(No);
        StringBuffer sb=new StringBuffer();
        sb.append("{  'result' :[");
        for(Comments c :list)
        {
            System.out.println(c.toString());
            sb.append("{");
            sb.append("'cid':"+"'"+c.getCid()+"',");
            sb.append("'userid':"+"'"+c.getID()+"',");
            sb.append("'loc':"+"'"+c.getLoc()+"',");
            sb.append("'parentid':"+"'"+c.getParentid()+"',");
            sb.append("'pic':"+"'"+c.getUserpic()+"',");
            sb.append("'name':"+"'"+c.getUsername()+"',");
            sb.append(" 'time':"+"'"+c.getTime()+"',");
            sb.append(" 'content':"+"'"+c.getContent()+"'");
            sb.append("},");
        }
        sb.append("{} ] }");
        return sb.toString();
    }
    @RequestMapping(path = "/add")
    public String addcart(@RequestParam(value = "No")String No, HttpSession session)
    {
        Goods goods = goodsService.getmoreinfo(No);
        List<Goods> list = null;
        if(session.getAttribute("cartlist")==null)
        {
            list = new ArrayList<>();
            list.add(goods);
            session.setAttribute("cartlist",list);
        }
        else
        {
            list = (List<Goods>) session.getAttribute("cartlist");
            list.add(goods);
            session.setAttribute("cartlist",list);
        }
        System.out.println("加入"+goods.toString());
        return "redirect:/type/detail?No="+No;
    }
    @RequestMapping(path = "/cart")
    public String cart(HttpSession session,Model model)
    {
//        List<Goods> list = (List<Goods>) session.getAttribute("cartlist");
//        model.addAttribute("list",list);
        return "showCart";
    }
    @RequestMapping(path = "/docart")
    public String docart(@RequestParam(value = "action")String action, HttpServletResponse response, HttpServletRequest request)
    {
        try {
            request.setCharacterEncoding("utf-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        HttpSession session = request.getSession();
        List<Goods> list = (List<Goods>) session.getAttribute("cartlist");
        if(action==null)
            action="manydelete";
        if(action.equals("add"))
        {
            String bookNo=request.getParameter("bookNo");
            String check=request.getParameter("check");
            //Book temp=(Book)books.get(bookNo);

            Goods gd=null;
            for(Goods t : list)
            {
                if(t.getNo().equals(bookNo))
                    gd=t;
            }
            if(check!=null)
                gd.setChecked(check.equals("yes"));
            gd.setNum(gd.getNum()+1);
            session.setAttribute("cartlist", list);

        }
        else if(action.equals("minus"))
        {
            String bookNo=request.getParameter("bookNo");
            String check=request.getParameter("check");
            //Book temp=(Book)books.get(bookNo);
            Goods gd=null;
            for(Goods t : list)
            {
                if(t.getNo().equals(bookNo))
                    gd=t;
            }

            if(check!=null)
                gd.setChecked(check.equals("yes"));
            if(gd.getNum()>1)
                gd.setNum(gd.getNum()-1);
            session.setAttribute("cartlist", list);
        }
        else if (action.equals("removeone"))
        {
            String bookNo=request.getParameter("bookNo");
            Goods gd=null;
            for(Goods t : list)
            {
                if(t.getNo().equals(bookNo))
                    gd=t;
            }
            list.remove(gd);

            session.setAttribute("cartlist", list);
        }
        else if(action.equals("manydelete"))
        {
            String [] bookNos=request.getParameterValues("cartCheckBox");
            System.out.println(bookNos);
            for(int i=0;i<bookNos.length;i++)
            {
                for(Goods t : list)
                {
                    if(t.getNo().equals(bookNos[i]))
                        list.remove(t);
                }
            }

            session.setAttribute("cartlist", list);
        }
        else if(action.equals("buyselect"))
        {

            String ss=request.getParameter("No");
            String [] Nos=ss.split("a");
            User u=(User) request.getSession().getAttribute("user");
            String ID=u.getID();
            String acc=u.getAcc();

            LocalDate ld= LocalDate.now();
            LocalTime lt=LocalTime.now();
            int year=ld.getYear();
            int month=ld.getMonthValue();
            int day=ld.getDayOfMonth();

            int hour=lt.getHour();
            int minut=lt.getMinute();
            int i=0;
            for(Goods g:list)
            {
                trades t=new trades();
                t.setAcc(u.getAcc());
                t.setID(u.getID());
                t.setName(g.getName());
                t.setNo(g.getNo());
                t.setTime(new Timestamp(new java.util.Date().getTime()));
                t.setTradeNo(""+year+month+day+hour+minut+i);
                i++;
                goodsService.addtrades(t);
            }
            list.clear();
            session.setAttribute("cartlist", list);
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = null;
            try {
                out = response.getWriter();
            } catch (IOException e) {
                e.printStackTrace();
            }
            out.println("<script>alert('购买成功! ');window.location='showCart.jsp'; </script>");
        }
        return "redirect:/type/cart";
    }
}
