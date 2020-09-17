<%@ page language="java" import="java.util.ArrayList,com.hhx.body.Goods"  contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link type="text/css" href="../css/myCar.css" rel="stylesheet">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>购物车页面</title>
	<style type="text/css">
		body{
			background: url(https://cn.bing.com/th?id=OHR.MedievalRocamadour_ZH-CN7063423495_1920x1080.jpg&rf=LaDigue_1920x1080.jpg&pid=hp) fixed;
		}
	</style>
</head>
<%
	request.setCharacterEncoding("utf-8");
	ArrayList<Goods> cart=(ArrayList<Goods>)session.getAttribute("cartlist"); 
%>
<body>
	<div id="content">
		<div class="ui tablet stackable steps" style="    width: 800px;">
			<div class="step">
				<i class="shopping bag icon"></i>
				<div class="content">
					<div class="title">选择</div>
					<div class="description">选择您的商品数量</div>
				</div>
			</div>

			<div class="disabled step">
				<i class="info circle icon"></i>
				<div class="content">
					<div class="title">确认订单</div>
					<div class="description">核对订单详情</div>
				</div>
			</div>
		</div>
			<form  action="/SMM/type/docart?action=manydelete" method="get" name="myform">
					<table class="ui red table" width="100%" border="0" cellpadding="0" cellspacing="0" id="t1">
							<tr>
									<td class="title" width="60">
											<input id="allCheckBox" type="checkbox" onclick="selectAll()">全选
									</td>
									<td class="title" colspan="2">商品名称</td>
									<td class="title" width="80">单价（元）</td>
									<td class="title" width="80">数量</td>
									<td class="title" width="100">小计（元）</td>
									<td class="title" width="60">操作</td>
							</tr>
							<%
								
							if(cart==null||cart.size()==0){
							%>
							<tr height="100">
								<td colspan="7" align="center">没有商品可显示!</td>
							</tr>
							<%
							}else{
								Goods good;
								for(Goods gd :cart)
								{
									//book=(Book)entry.getValue();
							
							%>
							<tr>
								<td class="cart_td_1">
									<input id="h" name="cartCheckBox"  <%if(gd.isChecked())out.write("checked='checked' "); %> type="checkbox"  onclick="marktohref(this)" value="<%=gd.getNo() %>" >
								</td>
								<td class="cart_td_2">
									<img alt="<%=gd.getPic() %>" src="../<%=gd.getPic()  %>">
								</td>
								<td class="cart_td_3"><a href="#"><%=gd.getName() %></a></td>
								<td class="cart_td_4"><%=gd.getPrice() %></td>
								<td class="cart_td_5">
										<a href="/SMM/type/docart?action=minus&bookNo=<%=gd.getNo() %>">
											<img alt="img/minus.jpg"  src="../img/minus.jpg" class="hand" onclick="minus(this)">
										</a>
									<input name="num" type="text" value=<%=gd.getNum()%>
									     class="num_input" readonly="readonly" >
									     <a href="/SMM/type/docart?action=add&bookNo=<%=gd.getNo() %>">
									     		<img id="add"  src="../img/add.jpg" class="hand" onclick="plus(this)">
									     </a>
									 
								</td>
								<td class="cart_td_6" ><%=gd.getPrice()*gd.getNum() %></td>
								<td class="cart_td_7">
									<a href="/SMM/type/docart?action=removeone&bookNo=<%=gd.getNo() %>">删除</a>
								</td>
							</tr>
							<%}
								}%>
								
					
					</table>
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td background="white">
								<!-- <input class="bn" type="submit" value="删除所选"> -->
							</td>
							<td class="shopend"><br>商品总价(不含运费):
									<label id="total" class="yello"></label>元<br><br>
									<a id="a" class="bn"  onclick="buy()">立即购买</a>
									<a href="/SMM/index" class="bn">首页
            						</a>
							</td>
						</tr>
					</table>
			</form>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.2/dist/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
	<script type="text/javascript">
	var rows=document.getElementById('t1').rows;
	var tag=document.getElementById('a');
	var target='doCart.jsp?action=removeselect&bookNos=';
	var shop='/SMM/type/docart?action=buyselect&No=';

		function buy()
		{
				for(var i=1;i<rows.length;i++)
				{
					if(rows[i].cells[0].children[0].checked)
					shop+=rows[i].cells[0].children[0].value+"a";
				}
				tag.setAttribute('href',shop);
		}
		function marktohref(head)
		{
			console.log(head.parentNode.parentNode.children[4].children[0].href);
			if(head.checked)
				{
					head.parentNode.parentNode.children[4].children[0].href+='&check=yes';
					head.parentNode.parentNode.children[4].children[2].href+='&check=yes';
				}
			else
				{
				head.parentNode.parentNode.children[4].children[0].href+='&check=no';
				head.parentNode.parentNode.children[4].children[2].href+='&check=no';
				}
				
		}
		function check()
		{
				for(var i=1;i<rows.length;i++)
				{
					if(rows[i].cells[0].children[0].checked)
					target+=row[i].cells[0].children[0].value+"a";
				}
				tag.setAttribute('href',target);
		}
		function selectAll()
		{
			for(var i=1;i<rows.length;i++)
			{
				
				rows[i].cells[0].children[0].checked=!rows[i].cells[0].children[0].checked;
			}
		}
		function minus(obj)
		{
			if(obj.parentNode.children[1].value>1)
				{
					var n=obj.parentNode.children[1].value;
					obj.parentNode.children[1].value-=1;
					var price=Number(obj.parentNode.parentNode.children[3].innerText);
					obj.parentNode.parentNode.children[5].innerText=price*(n-1)*1.0;
					fresh();
				}
		}
		function plus(obj)
		{
				var n=obj.parentNode.children[1].value;
				obj.parentNode.children[1].value=Number(n)+1;
				var price=Number(obj.parentNode.parentNode.children[3].innerText);
				obj.parentNode.parentNode.children[5].innerText=price*(Number(n)+1)*1.0;
				fresh();
		}
		function fresh()
		{
			var total=0;
			var blank=document.getElementById('total');
			for(var i=1;i<rows.length;i++)
			{
				if(rows[i].children[0].children[0].checked)
				total+=Number(rows[i].children[5].innerText);
			}
			blank.innerText=total;
		}
		fresh();
		
	</script>
</body>
</html>