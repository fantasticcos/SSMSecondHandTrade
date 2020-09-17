<%@page import="com.hhx.util.GetBuy"%>
<%@page import="com.hhx.body.trades"%>
<%@page import="java.util.List"%>
<%@ page language="java" import="com.hhx.body.Goods" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
    
    
    <title>评论</title>
</head>
<style>
    *{
        margin: 0;
        padding: 0;
    }
    body{
        background: url(https://i.alipayobjects.com/e/201311/1V4o0zhQPN_src.jpg) no-repeat;
    }
    .top {
    background: #e4b535;
    height: 48px;
    }
    .Logo {
    background: url(./img/ox.png) no-repeat;
    width: 100px;
    height: 45px;
    margin-left: 15px;
    float: left;
    }
    .welcome{
        float: left;
        font-size: 40px;
        color: #ec1d1d;
    }
    
    input, select, textarea {
    font-family: microsoft yahei,Helvetica,Tahoma,Arial,sans-serif;
    outline: none;
    border: none;
    
    }
  
    .manythings{
        background-color: rgba(228, 239, 240, 0.747);
        border: #c8e1e6 solid 1px;
        height: 600px;
        margin-top: 5px;
        margin-left: 30px;
        margin-right: 30px;
    }


    
    .UserInfo {
    float: right;
    padding: 4px 30px 0 10px;
    min-width: 140px;
}
    .ShowMenu {
        position: relative;
    }
    .Face {
    line-height: 40px;

    text-align: left;
    color: #FFF;
}
    a {
        outline: none;
        color: #00a4ff;
        text-decoration: none;
       
    }
    .page{
        position: absulote;
        bottom: 0;
    }
    .tag
    {
    margin-top:30px;
    	height: 100px;
    	width: 1218px;
    }
</style>
<body>
<%
	List<trades> list=null;
	com.hhx.body.User u=(com.hhx.body.User)session.getAttribute("user");
	String no=u.getID();
	if(no!=null)
	 list=u.list;
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
            
                
            <a href="/SMM/index" class="Face">首页
            </a>
          </div>
         
          
        </div> 
        <div  class=" ui raised very padded  container segment">
            <%if(list!=null){
	            for(trades t : list)
	            {
            %>
            <div class="ui segment" style="border: 1px solid #00a4ff;">
            	<h5 class="ui left floated header">订单号：<%=t.getTradeNo() %></h5>
                <div class="ui clearing divider"></div>
                <p></p>
            	<span>购买者：<%=t.getAcc() %></span><br>
            	<span>商品名：<%=t.getName() %></span><br>
            	<strong>时间:  <%=t.getTime()%></strong><br>
            	<a href="/SMM/type/detail?No=<%= t.getNo() %>">前去商品界面查看评论</a>
            </div>
            <%
            }
            }
            %>
            <div class="ui bottom attached segment m-opacity stackable grid">
                <div class="three wide column" align="center">
                    <a class="item" th:href="@{index(pagenum=${page.hasPreviousPage}?${page.prePage}:1)}">上一页</a>
                </div>

                <div class="ten wide column" align="center">
                    <p> <span></span> / <span></span> </p>
                </div>

                <div class="three wide column" align="center">
                    <a class="item" th:href="@{index(pagenum=${page.hasNextPage}?${page.nextPage}:${page.pages})}">下一页</a>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.2/dist/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
        <script type="text/javascript">
        function getData(method,url,async,data,deal200,deal400)
        {
        	var ajax;
        	if(window.XMLHttpRequest)
        	{
        		ajax=new XMLHttpRequest();
        	}
        	else if(window.ActiveXObject)
        	{
        		ajax=new ActiveXObject("Msxml12.XMLHTTP");
        	}
        	ajax.onreadystatechange=function()
        	{
        		if(ajax.readyState==4)
        		{
        			if(ajax.status==404)
        			{
        				if(deal404)
        				deal404(ajax);//想怎么处理获得的数据显示，自己传自己定义的函数过来
        			}
        			else if(ajax.status==200)
        			{
        				if(deal200)
        				deal200(ajax);
        			
        			}
        		}
        		else
        		{
        			console.log("暂未获取到数据(想要UI上的显示请更新此处代码)");
        		}
        	}
        	if("get"==method)
        	{
        		ajax.open(method,url+(data==null?"":"?"+data),async);
        		ajax.send(null);
        	}
        	else if("post"==method)
        	{
        		ajax.open("post",url,async);
        		ajax.setRequestHeader("Content-Type","x-www-form-urlencoded");
        		ajax.send(data);
        	}
        }
        
        function sendto(a)
        {
        	var content=document.getElementById(a).parentNode.children[9].value;
        	var res=getData('post',
					  'comment' ,
					true,
					a+'a'+content,
					function(ajax)
					{
						alert('评论正常');
					},
					function(ajax){alert('评论失败');});
        }
        </script>
</body>
</html>