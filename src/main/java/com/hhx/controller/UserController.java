package com.hhx.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hhx.body.*;
import com.hhx.service.IGoodsService;
import com.hhx.service.IUserService;
import com.hhx.service.Imp.UserService;
import com.hhx.util.GetBuy;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.support.JstlUtils;

import javax.jws.WebParam;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping(path = "/control")
public class UserController {
    @Autowired
    private IUserService userService;//调用的是接口！！！！！
    @Autowired
    private IGoodsService goodsService;
    @RequestMapping(path = "/getall")
    public String getAll(Model model)
    {
        System.out.println("获得所有");
        List<User> list = userService.getAll();
        model.addAttribute("list",list);
        for(User u :list)
        {
            System.out.println(u.toString());
        }
        return "success";
    }
    @GetMapping(path = "/testform")
    public String gettt( String acc)
    {

//        try {
////            acc = new String(acc.getBytes("iso8859-1"),"UTF-8");
//        } catch (UnsupportedEncodingException e) {
//            e.printStackTrace();
//        }
        System.out.println(acc);
        return "success";
    }
    @RequestMapping(path = "/login")
    public String llo()
    {
        return "Login";
    }

    @RequestMapping(path = "/signin")
    public String ssin(@RequestParam(value = "acc")String acc,@RequestParam(value = "pwd")String pwd,HttpSession session)
    {

        User u=new User();
        u.setID(acc);
        u.setPassword(pwd);
        User out = userService.indentify(u);
        if( out!= null)
        {
            out.distnum = goodsService.getdisnum(acc);
            out.buynum = goodsService.getbuynum(acc);
            session.setAttribute("user", out);
            session.setMaxInactiveInterval(18000);
            return "redirect:/index";
        }
        else
        {
            return "redirect:/error";
        }
    }
    @RequestMapping(path = "/signout")
    public String siout(HttpSession session)
    {
        session.setAttribute("user",null);
        return "redirect:/index";
    }

    @RequestMapping(path = "/hadbuy")
    public String hadbuyed(HttpSession session)
    {
        User user = (User) session.getAttribute("user");
        List<trades> list = goodsService.buyedlist(user.getID());
        user.list = list;
        session.setAttribute("user",user);
        return "hadbuyed";
    }

    @RequestMapping(path = "/dislist")
    public String dis(@RequestParam(required = false,defaultValue = "1",value = "pagenum")int pagenum,HttpSession session)
    {


        User user = (User) session.getAttribute("user");
        PageHelper.startPage(pagenum,6);
        List<distribute> list = goodsService.getdis(user.getID());
        PageInfo pageInfo = new PageInfo(list);
        for(distribute c :list)
        {
            Goods good = goodsService.getmoreinfo(c.getNo());
            c.setName(good.getName());
            c.setPrice(good.getPrice());
            c.setType(good.getType());
        }
        user.dislist = list;
        session.setAttribute("user",user);
        session.setAttribute("page",pageInfo);
        return "haddistried";
    }
    @RequestMapping(path = "/distrubute")
    public String fabu()
    {

        return "distrubute";
    }

    @PostMapping(path = "/dodistirbute")
    public String doo(HttpServletRequest request, @RequestParam MultipartFile file) {

        System.out.println("准备执行上传文件");
        String path = request.getSession().getServletContext().getRealPath("/img/");
        String ID=((User)(request.getSession().getAttribute("user"))).getID();
        String acc=((User)(request.getSession().getAttribute("user"))).getAcc();

        LocalDate ld= LocalDate.now();
        LocalTime lt=LocalTime.now();
        int year=ld.getYear();
        int month=ld.getMonthValue();
        int day=ld.getDayOfMonth();

        int hour=lt.getHour();
        int minut=lt.getMinute();

        String name=request.getParameter("goods");
        String type=request.getParameter("type");
        String price=request.getParameter("price");
        String desc=request.getParameter("desc");
        System.out.println(name);
        System.out.println(type);
        System.out.println(price);
        System.out.println(desc);


        File files = new File(path);
        System.out.println("路径为" + path);
        if (!files.exists())
            files.mkdirs();
//        DiskFileItemFactory factory = new DiskFileItemFactory();
//        ServletFileUpload upload = new ServletFileUpload(factory);
//        List<FileItem> list = null;
//        try {
//            list = upload.parseRequest(request);
//        } catch (FileUploadException e) {
//            e.printStackTrace();
//        }
        String filename = file.getOriginalFilename();
        String extname = filename.substring(filename.lastIndexOf('.'));
        String newfilename = year+month+day+hour+minut+ID+extname;
        System.out.println("文件名"+filename);
        System.out.println("新文件名"+newfilename);
//        for (FileItem item : list) {
//            System.out.println("循环遍历item");
//            if (item.isFormField()) {
//
//
//                System.out.println("普通表单域:" + item.getFieldName());
//            } else {
//
//
//
//                //String newfilename = year+month+day+hour+minut+ID+extname;
////                String filename = item.getName();
//                try {
//                    System.out.println("准备写入" + filename);
//                    System.out.println("Header:"+item.getHeaders());
//                    //item.write(new File(path, filename));
//                } catch (Exception e) {
//                    e.printStackTrace();
//                }
//                item.delete();
//            }
//        }
        try {
            file.transferTo(new File(path,newfilename));
        } catch (IOException e) {
            e.printStackTrace();
        }//上传文件结束
        com.hhx.body.distribute dis=new com.hhx.body.distribute();
        Goods gd=new Goods();
        dis.setAcc(acc);
        dis.setID(ID);
        dis.setNo(year+month+day+hour+minut+ID);
        dis.setTime(new Timestamp(new Date().getTime()));

        gd.setDesc(desc);
        gd.setName(name);
        gd.setNo(year+month+day+hour+minut+ID);
        gd.setPic("img/"+newfilename);
        gd.setPrice(Float.parseFloat(price));
        gd.setType(type);

        goodsService.addgoods(gd);
        goodsService.distribute(dis);
        return "redirect:/index";
    }

    @RequestMapping(path = "/adduser")
    public String addd(HttpServletRequest request, @RequestParam MultipartFile file)
    {
        String acc=request.getParameter("acc");
        String acc2=request.getParameter("2acc");
        String pwd=request.getParameter("pwd");
        String path = request.getSession().getServletContext().getRealPath("/img/");

        File files = new File(path);
        System.out.println("路径为" + path);
        if (!files.exists())
            files.mkdirs();

        String filename = file.getOriginalFilename();
        String extname = filename.substring(filename.lastIndexOf('.'));
        String newfilename = "pic"+acc+extname;
        try {
            file.transferTo(new File(path,newfilename));
        } catch (IOException e) {
            e.printStackTrace();
        }//上传文件结束

        User u=new User();
        u.setAcc(acc2);
        u.setID(acc);
        u.setPic("img/"+newfilename);
        u.setPassword(pwd);
        try
        {
            userService.adduser(u);
        }catch(Exception e)
        {
            return "redirect:/error";
        }


        return "redirect:/index";
    }
    @RequestMapping(path = "/deleteGood",produces = "text/plain;charset=utf-8")
    @ResponseBody
    public String deleteGood(@RequestParam(value = "No")String No)
    {
        String res = "删除成功";
        try{
            userService.deletecom(No);
            userService.deletedis(No);
            userService.deletegood(No);
        }catch (Exception e)
        {
            res  ="发生异常,删除失败!!";
        }
        return res;
    }
    @RequestMapping(path = "/comment",produces = "text/plain;charset=utf-8")
    @ResponseBody
    public String comment(HttpServletRequest request)
    {
        String s = "评论成功";
        if(((User)request.getSession().getAttribute("user"))==null)
            return "    请登录后再试";
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
        //1 商品号 2 内容 3 parientid  4 loc
        String [] get=sb.toString().split("A");
        com.hhx.body.User user=(User) request.getSession().getAttribute("user");
        Comments com=new Comments();
        com.setID(user.getID());
        com.setNo(get[0]);
        com.setContent(get[1]);
        com.setParentid(Integer.parseInt(get[2]));
        com.setLoc(Integer.parseInt(get[3]));
        java.util.Date t=new java.util.Date();
        com.setTime(new java.sql.Date(t.getTime()));
        try{
            userService.addcomment(com);
        }catch (Exception e)
        {
            s = "评论失败";
        }
        return s;
    }
    @RequestMapping(path = "/upinfo")
    public String upinfo(@RequestParam(value = "no")String no ,Model model)
    {
        Goods goods = goodsService.getmoreinfo(no);
        model.addAttribute("good",goods);
        return "redit";
    }

    @PostMapping(path = "/doupinfo")
    public String doup(HttpServletRequest request,@RequestParam MultipartFile file)
    {
        System.out.println("准备跟新商品信息");
        String name=request.getParameter("goods");
        String type=request.getParameter("type");
        String price=request.getParameter("price");
        String no = request.getParameter("goodsno");
        String desc=request.getParameter("desc");
        String ID= ((User)request.getSession().getAttribute("user")).getID();
        String path = request.getSession().getServletContext().getRealPath("/img/");
        Goods goods = new Goods();
        File files = new File(path);
        if(!files.exists())
            files.mkdirs();
        LocalDate ld= LocalDate.now();
        LocalTime lt=LocalTime.now();
        int year=ld.getYear();
        int month=ld.getMonthValue();
        int day=ld.getDayOfMonth();

        int hour=lt.getHour();
        int minut=lt.getMinute();
        String filename = file.getOriginalFilename();
        String extname = filename.substring(filename.lastIndexOf('.'));
        String newfilename = year+month+day+hour+minut+ID+extname;
        System.out.println("文件名"+filename);
        System.out.println("新文件名"+newfilename);


        try {
            file.transferTo(new File(path,newfilename));
        } catch (IOException e) {
            e.printStackTrace();
        }
        goods.setNo(no);
        goods.setDesc(desc);
        goods.setName(name);
        goods.setPrice(Double.parseDouble(price));
        goods.setType(type);
        goods.setPic("img/"+newfilename);

        goodsService.upinfo(goods);

        return "redirect:/control/dislist";
    }
}
