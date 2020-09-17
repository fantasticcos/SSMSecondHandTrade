<%@ page language="java" import="com.hhx.body.Goods,com.hhx.util.GetBuy" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
    
    
    <title>欢迎来到牛牛二手商城！</title>
</head>
<style>
	*{
		margin: 0;
		padding: 0;
	}
	body{
		background: url(https://i.alipayobjects.com/e/201311/1V4o0zhQPN_src.jpg) ;
	}
	.top {
		background: #e4b535;
		height: 48px;
	}
	.Logo {
		background: url(../img/ox.png) no-repeat;
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
	h4{
		text-align: center;
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
	.show {
		display: inline;


		margin: 20px;
		background-color: #ffffff;
	}

	.show img{
		position:relative;
		margin:10px;
		width: 400px;
		height: 400px;
		overflow: hidden;
		display: inline-block;
	}

	.views{
		display:inline-block;
		width: 100px;

	}
	.count{
		display:inline-block;
		width: 100px;
	}
	.addcart{
		font-weight: bold;
		display: inline-block;
		text-decoration: none;
		width: 90px;
		height: 30px;
		line-height: 30px;
		margin: 0 10px 0 0;
		background-color: #6eb5df;
		color: #FFF;
		text-align: center;
		border-radius: 5px;
		border:none;
	}
	.tocart
	{
		font-weight: bold;
		display: inline-block;
		text-decoration: none;
		width: 90px;
		height: 30px;
		line-height: 30px;
		margin: 0 10px 0 0;
		background-color: #6eb5df;
		color: #FFF;
		text-align: center;
		border-radius: 5px;
		border:none;
	}
	.comments{
		overflow: scroll;
	}
	.pic{

		width: 300px;
	}
	.info{

		border: grey solid 1px;
		display: inline-block;
		box-sizing: border-box;
		margin: 10px;
		width: 300px;


	}
	.shopper{
		border: grey solid 1px;
		display: inline-block;
		width: 300px;
		margin: 10px;
		box-sizing: border-box;


	}
	.item{

		display: inline-block;
		border:1px  #00a4ff solid !important;
		width: 350px;
		height: 400px;
		margin-right: 10px !important;

	}
	.personitem{
		position: relative !important;
		top: -59px !important;
		border: none !important ;
	}
</style>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
//		Goods gd=(Goods)request.getAttribute("good");
		
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
        <div  class=" ui raised very padded  container segment" style="width: 1200px;">

			<div class="ui  attached segment">
				<div class="ui segment item" style="position: relative !important; ">

					<img alt="img/loading.gif" src="../${goods.pic}" class="pic" style="height: 350px;
    width: 300px;">
				</div>
				<div class="ui segment item">
					<h4>商品名:${goods.name}</h4><hr><br><br>
					<strong><em>价格：&nbsp;&nbsp;&nbsp;&nbsp;${goods.price}</em></strong>
					<hr><br><br>
					<h5>描述：&nbsp;&nbsp;&nbsp;&nbsp;${goods.desc}</h5><br><br>
					<hr><br><br>
					<div class="views">
						<a  >
									<span>
										${comnum}
									</span><br>
							<span>
										评论人数
									</span>
						</a>
					</div>
					<div class="count">
						<a >
									<span>
										${buynum}<br>
										购买人数
									</span>
						</a>
					</div>
					<br><br>
					<a href="/SMM/type/add?No=${goods.no}" class="addcart">加入购物车</a>
					<a href="/SMM/type/cart" class="tocart">查看购物车</a>
					<button class="ui primary button" onclick="docomment()"><i class="edit icon"></i>稍个信</button>
				</div>
				<div class="ui segment item personitem" >
					<div class="ui card" >
						<div class="image">
							<img src="../${goods.user.pic}" style="height: 300px !important;">
						</div>
						<div class="content">
							<a class="header">${goods.user.acc}</a>
							<div class="meta">

							</div>
						</div>
						<div class="extra content">
							<a><i class="shopping bag icon"></i> ${disnum} 个发布 </a>
							<button class="ui primary button"><a href="/SMM/dochat?to=${goods.user.ID}">联系店主</a></button>
						</div>
					</div>
				</div>
			</div>
			<div class="ui bottom attached segment " style="position: relative !important; ">
				<div id="comment-container"  class="ui teal segment">
					<div>
						<div id="comments" class="ui threaded comments" style="max-width: 100%;">
							<h3 class="ui dividing header">评论</h3>
							<c:forEach items="${comments}" var="com">
								<c:if test="${com.parentid==-1}">
								<div class="comment">
									<a class="avatar">
										<img src="../${com.userpic}">
									</a>
									<div class="content">
										<a class="author" >
											<span >${com.username}</span>
											<c:if test="${com.ID==shopperid}">
												<div class="ui mini basic teal left pointing label m-padded-mini" >店主</div>
											</c:if>

										</a>
										<div class="metadata">
											<span class="date" >${com.time}</span>
										</div>
										<div class="text" >
											${com.content}
										</div>
										<div class="actions">
											<a  class="reply" data-cid="${com.cid}" data-commentnickname="${com.username}" onclick="reply1(this)">回复</a>
											<!-- <a class="delete" href="#" onclick="return confirm('确定要删除该评论吗？三思啊! 删了可就没了！')" th:if="${session.user}">删除</a> -->

										</div>
									</div>
	<%--								子集评论--%>
									<div class="comments">
										<c:forEach items="${comments}" var="ccom">
											<c:if test="${ccom.loc==com.cid&&ccom.cid!=com.cid}">
												<div class="comment" >
													<a class="avatar">
														<img src="../${ccom.userpic}">
													</a>
													<div class="content">
														<a class="author" >
															<span >${ccom.username}</span>

															&nbsp;<span class="m-teal" >&nbsp;&nbsp;&nbsp;@ ${ccom.parentname}</span>
															<c:if test="${ccom.ID==shopperid} ">
																<div class="ui mini basic teal left pointing label m-padded-mini" >店主</div>
															</c:if>
														</a>
														<div class="metadata">
															<span class="date" >${ccom.time}</span>
														</div>
														<div class="m-text"   >
															${ccom.content}
														</div>
														<div class="actions">
															<a data-loc="${ccom.loc}" data-cid="${ccom.cid}" data-commentnickname="${ccom.username}"  onclick="reply1(this)">回复</a>
														</div>
													</div>
												</div>
											</c:if>
										</c:forEach>

									</div>
								</div>
								</c:if>
							</c:forEach>


						</div>
					</div>
				</div>
				<form class="ui reply form" id="reply" style="display: none;">
					<input type="hidden" name="loc" value="-1">
					<input type="hidden" name="parentid" value="-1">
					<div class="field">
						<textarea id="msg" name="content"></textarea>
					</div>
					<div class="ui blue labeled submit icon button" onclick="sendto('${goods.no}')"><i class="icon edit"></i> 发布 </div>
				</form>
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
        
        function showcomments()
        {
        	var res=getData('get',
					'/SMM/type/com',
					true,
					'No=${goods.no}',
					function(ajax)
					{
						console.log('数据请求正常');
						var collections=eval("("+ajax.responseText+")");
						console.log(collections);
						var blank=document.getElementById('comments');
						var shopper = '<div class="ui mini basic teal left pointing label m-padded-mini" >店主</div>';

						blank.innerHTML='<h3 class=\"ui dividing header\">评论</h3>';
						for(let i=0;i<collections.result.length-1;i++)
						{
						    if(collections.result[i].parentid==-1) {
						    	console.log(i);
								blank.innerHTML += '<div class="comment"  id="comment">' +
										'<a class="avatar">' +
										'<img src="../' + collections.result[i].pic + ' ">' +
										'</a>' +
										'<div class="content">' +
										'<a class="author" >' +
										'<span >' + collections.result[i].name + '</span>' +
										<%--collections.result[i].id=='${shopperid}'?shopper:''+--%>
										'</a>' +
										'<div class="metadata">' +
										'<span class="date" >' + collections.result[i].time + '</span>' +
										'</div>' +
										'<div class="text" >' +
										collections.result[i].content +
										'</div>' +
										'<div class="actions">' +
										'<a  class="reply" data-cid="' + collections.result[i].cid + '" data-loc="' + collections.result[i].cid + '" data-commentNickname= " ' + collections.result[i].name + '" onclick="reply1(this)">回复</a>' +
										'</div>' +
										'</div>' +
										'<div class="comments">';
							}

						    for(let inn = 0;inn<collections.result.length;inn++)
                            {
                                if(collections.result[inn].loc==collections.result[i].cid&&collections.result[inn].cid!=collections.result[i].cid) {
									console.log(inn);
									blank.innerHTML += '<div class="comment"  >' +
											'<a class="avatar">' +
											'<img src="../' + collections.result[inn].pic + ' ">' +
											'</a>' +
											'<div class="content">' +
											'<a class="author" >' +
											'<span >' + collections.result[inn].name + '</span>' +
											<%--collections.result[i].id=='${shopperid}'?shopper:''+--%>
											// '&nbsp;<span class="m-teal" >@'+ 小白+'</span>'
											'</a>' +
											'<div class="metadata">' +
											'<span class="date" >' + collections.result[inn].time + '</span>' +
											'</div>' +
											'<div class="m-text" >' +
											collections.result[inn].content +
											'</div>' +
											'<div class="actions">' +
											' <a data-loc="' + collections.result[inn].loc + '" data-cid="' + collections.result[inn].cid + '" data-commentNickname="' + collections.result[inn].name + '"  onclick="reply1(this)">回复</a>' +
											'</div>' +
											'</div>' +
											'</div>'+
											'</div>';
								}
                            }
                            blank.innerHTML+='</div>';
						}
						
						
						
						console.log(blank.innerHTML);
					},
					function(ajax){console.log('数据请求失败');});
        }
		function docomment()
		{
			var reply = document.getElementById('reply');
			if(reply.style.display=='none')
			{
				reply.style.display = 'block';
				// $(window).scrollTo($('#reply'),500);
			}
			else
				reply.style.display = 'none';
		}
		function sendto(a)
		{
			var content=document.getElementById('msg').value;


			var parentid = $("[name='parentid']").val();
			var loc = $("[name='loc']").val();
			console.log('有没有'+content);
			var res=getData('post',
					'/SMM/control/comment' ,
					true,
					a+'A'+content+'A'+parentid+'A'+loc,
					function(ajax)
					{
						alert(ajax.responseText);location.reload();
					},
					function(ajax){alert(ajax.responseText);});
		}
		function reply1(objj) {

			docomment();
			var commentId = $(objj).data('cid');
			var commentloc = $(objj).data('loc');
			var commentNickname = $(objj).data('commentnickname');

			$("[name='content']").attr("placeholder", "@"+commentNickname).focus();
			$("[name='parentid']").val(commentId);
			$("[name='loc']").val(commentloc);


		}
		// showcomments();
        </script>
</body>
</html>