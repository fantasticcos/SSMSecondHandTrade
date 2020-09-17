<%@ page language="java" import="java.util.*,java.net.URLDecoder" contentType="text/html; charset=UTF-8"
     isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    
    <title>欢迎来到牛牛二手商城！</title>
</head>
<link rel="stylesheet" href="css/custom-pagination.min.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
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
        background: url(img/ox.png) no-repeat;
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
    .info{
        float: right;
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
        position: absolute;
        bottom: 0;
    }
    .goods
    {
        border: 1px solid #ededed;
        width: 160px;
        height: 250px;
        background-color: #ffffff;
        overflow: hidden;
        margin: 20px;
    }

    .goods img
    {
        padding:5px;
        width: 150px;
        height: 150px;
    }
    .page .custom-pagination
    {   height: 30px;
        color: #666;
        text-align: center;
        font-size: 14px;
        position: relative;
        top: -5px;

        left: 600px;
        width: 800px;
    }
</style>
<body>
<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
	String search=null;
	String type=request.getParameter("t");
		if(type==null||type.equals(""))
		{	type="";
//		search=request.getQueryString().substring(2);
		}
		 search=request.getParameter("s");
//		search=URLDecoder.decode(request.getQueryString(), "utf-8").substring(2);
		
//		System.out.println("type页面："+"page=1&type=&search=%E9%A3%8E%E8%A1%A3".split("&")[2]);
    System.out.println(search);
		if(search==null||search.equals(""))
			search="";
	
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
        <div  class="manythings">
            <div id="page" class="page">

            </div>
            <table>
				  <tr>
				    <td>
                        <div id="card1" class="ui card" style="margin: 5px;width: 220px;max-height: 290px;">
                            <a class="image" href="/SMM/type/detail">
                                <img src="img/2020060501.jpg" style="max-height: 220px;">
                            </a>
                            <div class="content">
                                <a class="header" href="/SMM/type/detail"><i class="shopping bag icon"></i>商品名称</a>
                                <div class="meta">
                                    <span><i class="yen sign icon"></i>100.00</span>
                                </div>
                            </div>
                        </div>
                    </td>
					<td>
                        <div id="card2" class="ui card" style="margin: 5px;width: 220px;max-height: 290px;">
                            <a class="image" href="/SMM/type/detail">
                                <img src="img/2020060501.jpg" style="max-height: 220px;">
                            </a>
                            <div class="content">
                                <a class="header" href="/SMM/type/detail"><i class="shopping bag icon"></i>商品名称</a>
                                <div class="meta">
                                    <span><i class="yen sign icon"></i>100.00</span>
                                </div>
                            </div>
                        </div>
                    </td>
					<td>
                        <div id="card3" class="ui card" style="margin: 5px;width: 220px;max-height: 290px;">
                            <a class="image" href="/SMM/type/detail">
                                <img src="img/2020060501.jpg" style="max-height: 220px;">
                            </a>
                            <div class="content">
                                <a class="header" href="/SMM/type/detail"><i class="shopping bag icon"></i>商品名称</a>
                                <div class="meta">
                                    <span><i class="yen sign icon"></i>100.00</span>
                                </div>
                            </div>
                        </div>
                    </td>
					<td>
                        <div id="card4" class="ui card" style="margin: 5px;width: 220px;max-height: 290px;">
                            <a class="image" href="/SMM/type/detail">
                                <img src="img/2020060501.jpg" style="max-height: 220px;">
                            </a>
                            <div class="content">
                                <a class="header" href="/SMM/type/detail"><i class="shopping bag icon"></i>商品名称</a>
                                <div class="meta">
                                    <span><i class="yen sign icon"></i>100.00</span>
                                </div>
                            </div>
                        </div>
                    </td>
					<td>
                        <div id="card5" class="ui card" style="margin: 5px;width: 220px;max-height: 290px;">
                            <a class="image" href="/SMM/type/detail">
                                <img src="img/2020060501.jpg" style="max-height: 220px;">
                            </a>
                            <div class="content">
                                <a class="header" href="/SMM/type/detail"><i class="shopping bag icon"></i>商品名称</a>
                                <div class="meta">
                                    <span><i class="yen sign icon"></i>100.00</span>
                                </div>
                            </div>
                        </div>
                    </td>
				  </tr>
				  
				  
				  
				  <tr>
				    <td>
                        <div id="card6" class="ui card" style="margin: 5px;width: 220px;max-height: 290px;">
                            <a class="image" href="/SMM/type/detail">
                                <img src="img/2020060501.jpg" style="max-height: 220px;">
                            </a>
                            <div class="content">
                                <a class="header" href="/SMM/type/detail"><i class="shopping bag icon"></i>商品名称</a>
                                <div class="meta">
                                    <span><i class="yen sign icon"></i>100.00</span>
                                </div>
                            </div>
                        </div>
                    </td>
					<td>
                        <div id="card7" class="ui card" style="margin: 5px;width: 220px;max-height: 290px;">
                            <a class="image" href="/SMM/type/detail">
                                <img src="img/2020060501.jpg" style="max-height: 220px;">
                            </a>
                            <div class="content">
                                <a class="header" href="/SMM/type/detail"><i class="shopping bag icon"></i>商品名称</a>
                                <div class="meta">
                                    <span><i class="yen sign icon"></i>100.00</span>
                                </div>
                            </div>
                        </div>
                    </td>
					<td>
                        <div id="card8" class="ui card" style="margin: 5px;width: 220px;max-height: 290px;">
                            <a class="image" href="/SMM/type/detail">
                                <img src="img/2020060501.jpg" style="max-height: 220px;">
                            </a>
                            <div class="content">
                                <a class="header" href="/SMM/type/detail"><i class="shopping bag icon"></i>商品名称</a>
                                <div class="meta">
                                    <span><i class="yen sign icon"></i>100.00</span>
                                </div>
                            </div>
                        </div>
                    </td>
					<td>
                        <div id="card9" class="ui card" style="margin: 5px;width: 220px;max-height: 290px;">
                            <a class="image" href="/SMM/type/detail">
                                <img src="img/2020060501.jpg" style="max-height: 220px;">
                            </a>
                            <div class="content">
                                <a class="header" href="/SMM/type/detail"><i class="shopping bag icon"></i>商品名称</a>
                                <div class="meta">
                                    <span><i class="yen sign icon"></i>100.00</span>
                                </div>
                            </div>
                        </div>
                    </td>
					<td>
                        <div id="card10" class="ui card" style="margin: 5px;width: 220px;max-height: 290px;">
                            <a class="image" href="/SMM/type/detail">
                                <img src="img/2020060501.jpg" style="max-height: 220px;">
                            </a>
                            <div class="content">
                                <a class="header" href="/SMM/type/detail"><i class="shopping bag icon"></i>商品名称</a>
                                <div class="meta">
                                    <span><i class="yen sign icon"></i>100.00</span>
                                </div>
                            </div>
                        </div>
                    </td>
				  </tr>
		
			 </table>

        </div> 
        <script type="text/javascript" src="js/custom-pagination.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.2/dist/jquery.min.js"></script>
      <script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
        <script>
        var pagenum=10;
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
        		ajax.send("post",url,async);
        		ajax.setRequestHeader("Content-Type","x-www-form-urlencoded");
        		ajax.send(data);
        	}
        }
        
  
        
        
        
            var box = new CustomPagination('#page', {
                total: 10,//总页数
                next_prev_links: 'yes',//是否开启[上一页/下一页]
                inupt_forward: 'yes',//是否开启[输入跳转]
                changePage: function (pageNum) {//切换页码成功回调
                console.log('当前页码：'+pageNum);
                console.log('开始ajax请求');
                var url='/SMM/type/more';
                var res=getData('get',
                							url,
                							true,
                							'page='+pageNum+'&type=<%=type%>&search=<%=search%>',
                							function(ajax)
                							{
	                							console.log('数据请求正常');
	                							var collections=eval("("+ajax.responseText+")");
	                							console.log(collections);
	                							this.box.options.total=collections.page;
	                							
	                							for(var i=1;i<=10;i++)
	                			                {
	                			                	var no='card'+i;
	                			                	var card=document.getElementById(no);
	                			                	if(collections.result[i-1]!=null)
	                			                	{	if(collections.result[i-1].name==undefined)
	                			                		{
	                			                			card.style.display="none";
	                			                		}
	                			                		else
	                			                		{
	                			                			// card.style.display="block";
	                			                			// card.children[0].href='/SMM/type/detail?No='+collections.result[i-1].No;
		                			                		// card.children[0].children[0].src=collections.result[i-1].pic;
		                			                		// card.children[0].children[2].innerHTML='<i class="shopping bag icon"></i>'+collections.result[i-1].name;

                                                            // card.children[0].children[4].innerHTML='<i class="yen sign icon"></i>'+collections.result[i-1].price;
                                                            card.style.display="block";
                                                            card.children[0].href='/SMM/type/detail?No='+collections.result[i-1].No;
                                                            card.children[0].children[0].src=collections.result[i-1].pic;
                                                            card.children[1].children[0].href='/SMM/type/detail?No='+collections.result[i-1].No;
                                                            card.children[1].children[0].innerHTML='<i class="shopping bag icon"></i>'+collections.result[i-1].name;
                                                            card.children[1].children[1].children[0].innerHTML='<i class="yen sign icon"></i>'+collections.result[i-1].price;
	                			                		}
	                			                		
	                			                	}
	                			                	else
	                			                	{
	                			                		console.log("没了");
	                			                		card.style.display="none";
	                			                	}
			                			                	
	                			                }
	                							
                							},
                							function(ajax){console.log('数据请求失败');});
                
                
                }
            });
        </script>
</body>
</html>