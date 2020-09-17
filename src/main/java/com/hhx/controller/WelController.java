package com.hhx.controller;

import com.hhx.body.Act;
import com.hhx.body.Msg;
import com.hhx.body.User;
import com.hhx.service.IGoodsService;
import com.hhx.service.IUserService;
import com.hhx.util.Identify;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping(path = "/")
public class WelController {
    @Autowired
    private IGoodsService goodsService;

    @Autowired
    private IUserService userService;

    //分类菜单
    @RequestMapping(path = "/index")
    public String init(HttpSession session,Model model)
    {
        System.out.println("经过此处？？？？");
        User user = (User) session.getAttribute("user");
        if (user!=null)
        {
            user.distnum = goodsService.getdisnum(user.getID());
            user.buynum = goodsService.getbuynum(user.getID());
            model.addAttribute("bellnum",userService.checkmsg(user.getID()));
        }
        List<Act> list = userService.actlist();
        for (Act c : list)
        {
            System.out.println(c.toString());
        }
        model.addAttribute("actlist",list);

        return "index";
    }
    @GetMapping(path = "/type")
    public String type(@RequestParam(value = "t")String type,@RequestParam(value = "s")String search, Model model)
    {
        System.out.println("类别"+type);
        System.out.println("搜索"+search);
        model.addAttribute("type",type);
        model.addAttribute("search",search);

        return "type";
    }
    //已经购买
    @GetMapping(path = "/buyed")
    public String hadbuyed()
    {
        return "hadbuyed";
    }
    //已经发布
    @GetMapping(path = "distir")
    public String hasdistirbute()
    {
    return "haddistried";
    }
    //购物车
    @GetMapping(path = "/cart")
    public String cart()
    {
    return "showCart";
    }

    @RequestMapping(path = "/Validate")
    public void validate(HttpServletRequest request, HttpServletResponse response)
    {
        Identify identify =  new Identify();
        HttpSession session = request.getSession();
        session.setAttribute("validateCode", identify.randomCode.toString());
        //4、输出图片，禁止图像缓存
        response.setHeader("Pragma", "no-cache" );
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);
        response.setContentType("image/jpeg");
        ServletOutputStream out= null;
        try {
            out = response.getOutputStream();
        } catch (IOException e) {
            e.printStackTrace();
        }
        try {
            ImageIO.write(identify.bufflmg, "jpeg", out);
        } catch (IOException e) {
            e.printStackTrace();
        }
        try {
            out.flush();
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
        }


    }
    @RequestMapping(path = "/register")
    public String register()
    {
        return "register";
    }
    @RequestMapping(path = "/error")
    public String haserror()
    {
        return "error";
    }

    @RequestMapping(path = "/chatinit",produces = "application/json;charset=utf-8")
    @ResponseBody
    public String getfromandto(HttpServletRequest request)
    {
        StringBuffer sb = new StringBuffer();
        HttpSession session = request.getSession();
        String to = request.getParameter("to");
        String from = ((User)session.getAttribute("user")).getAcc();
        String fromid = ((User)session.getAttribute("user")).getID();
        String frompic = ((User)session.getAttribute("user")).getPic();
        User touser = userService.getinfo(to);
        sb.append("{");
        sb.append("'from':'"+from+"',");
        sb.append("'fromid':'"+fromid+"',");
        sb.append("'frompic':'"+frompic+"',");
        sb.append("'to':'"+touser.getAcc()+"',");
        sb.append("'toid':'"+touser.getID()+"',");
        sb.append("'topic':'"+touser.getPic()+"'");
        sb.append("}");

        return sb.toString();
    }
    @RequestMapping(path = "/dochat")
    public String dochat(@RequestParam(value = "to")String to,Model model,HttpSession session)
    {
        User u = (User) session.getAttribute("user");
//        userService.becomeold(u.getID());//放置消息为已读
        model.addAttribute("to",to);
        return "room";
    }

    @PostMapping(path = "leftmsg",produces = "text/plain;charset=utf-8")
    @ResponseBody
    public String leftmsg(HttpServletRequest request)
    {
        try {
            request.setCharacterEncoding("utf-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        BufferedReader reader= null;
        try {
            reader = request.getReader();
        } catch (IOException e) {
            e.printStackTrace();
        }
        char [] buff=new char [512];
        StringBuffer sb=new StringBuffer();
        int len = 0;
        while(true)
        {
            try {
                if (!((len=reader.read(buff))!=-1)) break;
            } catch (IOException e) {
                e.printStackTrace();
            }
            sb.append(buff,0,len);
        }
        try {
            reader.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        Msg msg = new Msg();
        msg.setContent(sb.toString());
        msg.setFrom(request.getParameter("from"));
        msg.setTo(request.getParameter("to"));
        msg.setIsnew(true);
        msg.setFrompic(request.getParameter("frompic"));
        msg.setTopic(request.getParameter("topic"));
        msg.setTime(new Timestamp(new Date().getTime()));
        userService.updatemsg(msg);
        return "yes";
    }
    @GetMapping(path = "/getmsg",produces = "application/json;charset=utf-8")
    @ResponseBody
    public String getmsg(HttpSession session)
    {
        User u = (User) session.getAttribute("user");
        List<Msg> list = userService.getmsg(u.getID());
        userService.becomeold(u.getID());
        StringBuffer sb = new StringBuffer();
        sb.append("{ 'result':[");
        for(Msg m :list)
        {
            sb.append("{");
            sb.append(" 'time':"+"'"+m.getTime()+"',");
            sb.append(" 'content':"+"'"+m.getContent()+"'");
            sb.append("},");
        }
        sb.append("{} ] }");
        return sb.toString();
    }



}
