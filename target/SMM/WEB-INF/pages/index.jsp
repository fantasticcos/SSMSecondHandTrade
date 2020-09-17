<%@page import="com.hhx.util.GetBuy"%>
<%@ page language="java" import="java.util.ArrayList,com.hhx.body.Goods" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
    <link type="text/css" rel="stylesheet" href="css/base.css" >
    <title>欢迎来到牛牛二手商城！</title>
</head>
<body>
	 <%
	 	request.setCharacterEncoding("utf-8");
	    response.setContentType("text/html;charset=utf-8");
	 	String acc="请登录！";
	 	String pic="img/user.png";
	 	int buynum=0;
	 	int distrinum=0;
	 	boolean hadlogin=false;
	 	com.hhx.body.User cur=null;
	 	cur=(com.hhx.body.User)session.getAttribute("user");
	 	if(cur!=null)
	 		{
	 			hadlogin=true;
	 			acc=cur.getAcc();
	 			pic=cur.getPic();
	 			buynum=cur.buynum;
	 			distrinum=cur.distnum;
	 		}
	 	ArrayList<Goods> cart=(ArrayList<Goods>)session.getAttribute("cartlist");
	 	int cartnum=((cart==null||cur==null)?0:cart.size());
	 	String tar=hadlogin?"control/signout":"control/login";
	 %>
      <div class="top">
          <div class="Logo">

          </div>
          <div>
              <span class="welcome">
                  牛牛二手
              </span>
          </div>
          <div class="ShowMenu UserInfo">
            
                
            <a href="/SMM/index" class="Face"><i class="home icon"></i>首页
            </a>
          </div>
          
          
      </div>  <!--导航-->
      <div class="search-box">
      <div class="ui input focus search">
  			<input type="text" placeholder="搜索..."  id="search">
		</div>
   
        <div class=" ui primary button" tabindex="0"><a href="type?s=" onmouseover="search11(this)">搜 索</a> </div>
        
      </div>
      <div class="ui raised very padded  segment container">
        
            
            <div class="ui  vertical  menu">
				  <a href="type?t=clothes&s=" class="item">衣服</a>
                <a href="type?t=shoes&s=" class="item">鞋</a>
                <a href="type?t=jiadian&s=" class="item">家电</a>
                <a href="type?t=shouji&s=" class="item">手机</a>
                <a href="type?t=zhubao&s=" class="item">珠宝</a>
                <a href="type?t=box&s=" class="item">箱包</a>
                <a href="type?t=watch&s=" class="item">手表</a>
                <a href="type?t=instrument&s=" class="item">乐器</a>
               	<a href="type?t=tools&s=" class="item">器械</a>
                <a href="type?t=study&s=" class="item">学习</a>
                <a href="type?t=books&s=" class="item">书本</a>
                <a href="type?t=desk&s=" class="item">桌椅</a>
			
        </div>
        <div class="flow" >
            
            <div class="box" id="box">
                <div class="inner">
                    <!--轮播图-->
                    <ul>
                        <li><a href="#"><img src="img\flow1.jpg" alt=""></a></li>
                        <li><a href="#"><img src="img\flow2.jpg" alt=""></a></li>
                        <li><a href="#"><img src="img\flow3.jpg" alt=""></a></li>
                        <li><a href="#"><img src="img\flow4.jpg" alt=""></a></li>
                        <li><a href="#"><img src="img\flow5.jpg" alt=""></a></li>
                    </ul>
                    <ol class="bar">
                        小按钮数量无法确定，由js动态生成
                    </ol>
                    <!--左右焦点-->
                    <div id="arr">
                        <span id="left"> <</span>
                        <span id="right">></span>
                    </div>
            
                </div>
            </div>

            
        </div>

        <div class="personal ui card">
            <div class="member-db">
                <div class="wrappper">
                    <a href="<%=tar%>"><img id="user-pic" src="<%=pic %>" alt=""></a><br>
                    <span><%=acc %></span>
                </div>
            </div>
            <br>
            <c:if test="${bellnum.size()!=0}">
                <c:forEach items="${bellnum}" var="from">
                    <a href="/SMM/dochat?to=${from}"><i class="bell icon"></i>新消息</a>
                </c:forEach>

            </c:if>
            <br><br>
            <div class="user-detail">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="control/hadbuy" class="count"><span><%=buynum %></span><br><span><i class="archive icon"></i>已购买</span></a>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="type/cart" class="count"><span><%=cartnum %></span><br><span><i class="shopping cart icon"></i>购物车</span></a>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="control/dislist" class="count"><span><%=distrinum %></span><br><span><i class=" paper plane icon"></i>已发布</span></a>
            </div>
        </div>
          <div class="ui horizontal divider">动态</div>
          <div class="ui bottom attached segment">
              <div class="ui feed">
                  <c:forEach items="${actlist}" var="map">
                      <div class="event">
                          <div class="label">
                              <img src="${map.pic}">
                          </div>
                          <div class="content">
                              <div class="summary"><a class="user">${map.accname}</a>${map.act}了<a href="/SMM/type/detail?No=${map.goodno}">${map.goodsname}</a><div class="date">${map.distance}天前</div>
                              </div>
                              <c:if test="${!map.isbuy}">
                                  <div class="extra images">
                                      <a href="/SMM/type/detail?No=${map.goodno}"><img src="${map.goodspic}"></a>
                                  </div>
                              </c:if>
                          </div>
                      </div>
                  <div class="ui horizontal divider">.</div>
                  </c:forEach>
<%--                  <div class="event">--%>
<%--                      <div class="label">--%>
<%--                          <img src="/images/avatar/small/helen.jpg">--%>
<%--                      </div>--%>
<%--                      <div class="content">--%>
<%--                          <div class="summary"><a>Helen Troy</a> 增加 <a>2 新的 illustrations</a> <div class="date">4 天前 </div>--%>
<%--                          </div>--%>
<%--                          <div class="extra images">--%>
<%--                              <a><img src="/images/wireframe/image.png"></a>--%>
<%--                              <a><img src="/images/wireframe/image.png"></a>--%>
<%--                          </div>--%>
<%--                      </div>--%>
<%--                  </div>--%>
<%--                  <div class="ui horizontal divider">.</div>--%>
<%--                  <div class="event">--%>
<%--                      <div class="label">--%>
<%--                          <img src="/images/avatar/small/jenny.jpg">--%>
<%--                      </div>--%>
<%--                      <div class="content">--%>
<%--                          <div class="summary"><a class="user"> Jenny Hess </a> 将你加为好友 <div class="date">2 天前 </div>--%>
<%--                          </div>--%>
<%--                      </div>--%>
<%--                  </div>--%>
              </div>
          </div>
      </div>
      <script src="https://cdn.jsdelivr.net/npm/jquery@3.2/dist/jquery.min.js"></script>
      <script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
      <script>
    var box=document.getElementById("box");
    var inner=box.children[0];
    var ulObj=inner.children[0];
    var list=ulObj.children;
    var olObj=inner.children[1];
    var arr=document.getElementById("arr");
    var imgWidth=inner.offsetWidth;
    var right=document.getElementById("right");
    var pic=0;
    //根据li个数，创建小按钮
    	function search11(a)
    	{
    		var content=document.getElementById('search').value;
    		console.log(a);
    		console.log(content);
    		if(content==null||content==="")
    			{
    				alert('你不可以搜索空的值');
    				a.herf="#";
    			}
    		a.href='type?s='+content+'&t=';
    	}
    for(var i=0;i<list.length;i++){
        var liObj=document.createElement("li");
 
        olObj.appendChild(liObj);
        liObj.innerText=(i+1);
        liObj.setAttribute("index",i);
 
        //为按钮注册mouseover事件
        liObj.οnmοuseοver=function () {
            //先清除所有按钮的样式
 
            for (var j=0;j<olObj.children.length;j++){
                olObj.children[j].removeAttribute("class");
            }
            this.className="current";
            pic=this.getAttribute("index");
            animate(ulObj,-pic*imgWidth);
        }
 
    }
 
 
    //设置ol中第一个li有背景颜色
    olObj.children[0].className = "current";
    //克隆一个ul中第一个li,加入到ul中的最后=====克隆
    ulObj.appendChild(ulObj.children[0].cloneNode(true));
 
    var timeId=setInterval(onmouseclickHandle,2500);
    //左右焦点实现点击切换图片功能
    box.onmouseover=function () {
        arr.style.display="block";
        clearInterval(timeId);
    };
    box.οnmοuseοut=function () {
        arr.style.display="none";
        timeId=setInterval(onmouseclickHandle,1000);
    };
 
    right.onclick=onmouseclickHandle;
    function onmouseclickHandle() {
        //如果pic的值是5,恰巧是ul中li的个数-1的值,此时页面显示第六个图片,而用户会认为这是第一个图,
        //所以,如果用户再次点击按钮,用户应该看到第二个图片
        if (pic == list.length - 1) {
            //如何从第6个图,跳转到第一个图
            pic = 0;//先设置pic=0
            ulObj.style.left = 0 + "px";//把ul的位置还原成开始的默认位置
        }
        pic++;//立刻设置pic加1,那么此时用户就会看到第二个图片了
        animate(ulObj, -pic * imgWidth);//pic从0的值加1之后,pic的值是1,然后ul移动出去一个图片
        //如果pic==5说明,此时显示第6个图(内容是第一张图片),第一个小按钮有颜色,
        if (pic == list.length - 1) {
            //第五个按钮颜色干掉
            olObj.children[olObj.children.length - 1].className = "";
            //第一个按钮颜色设置上
            olObj.children[0].className = "current";
        } else {
            //干掉所有的小按钮的背景颜色
            for (var i = 0; i < olObj.children.length; i++) {
                olObj.children[i].removeAttribute("class");
            }
            olObj.children[pic].className = "current";
        }
    }
    left.onclick=function () {
        if (pic==0){
            pic=list.length-1;
            ulObj.style.left=-pic*imgWidth+"px";
        }
        pic--;
        animate(ulObj,-pic*imgWidth);
        for (var i = 0; i < olObj.children.length; i++) {
            olObj.children[i].removeAttribute("class");
        }
        //当前的pic索引对应的按钮设置颜色
        olObj.children[pic].className = "current";
    };
    
    //设置任意的一个元素,移动到指定的目标位置
    function animate(element, target) {
        clearInterval(element.timeId);
        //定时器的id值存储到对象的一个属性中
        element.timeId = setInterval(function () {
            //获取元素的当前的位置,数字类型
            var current = element.offsetLeft;
            //每次移动的距离
            var step = 10;
            step = current < target ? step : -step;
            //当前移动到位置
            current += step;
            if (Math.abs(current - target) > Math.abs(step)) {
                element.style.left = current + "px";
            } else {
                //清理定时器
                clearInterval(element.timeId);
                //直接到达目标
                element.style.left = target + "px";
            }
        }, 10);
    }
    
    
      </script>
</body>
</html>