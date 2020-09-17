<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<title>用户登录</title>

</head>
<style>
	*{
		margin: 0;
		padding: 0;
	}
	body
	{
		
	}
	.login
	{
		position:relative;
		left:-10%;

		box-sizing: border-box;
		border: 1px dotted blue;
		background-color:#FFE1FF;
		width:450px !important;
		height: 400px;
	}
	.login h2
	{
		text-align:center;
		margin-top:10px;
  		border-bottom:thick solid #FFAEB9;
	}
	.login .content
	{
		position:absolute;
		margin:30px auto;
		align-items:center;
		box-sizing: border-box;
		border-top: 2px  thick  #FFAEB9;
	}
	.textVcode
	{
		
		width: 45px;
	}
	.textVcode span{
		margin-top:5px;: 
	}

	img
	{
		line-height: 25px;
	}
	.btnlogin
	{
		width: 35px;
		height: 20px;
		border-radius: 3px;
	}
	.btnregister
	{
		width: 35px;
		height: 20px;
		border-radius: 3px;
	}
	.i_user
	{
		position: absolute;left: 0；z-index:5;margin-top: 8px
		background-image: url(../img/acc.png); /*引入图片图片*/
      	background-repeat: no-repeat; /*设置图片不重复*/
     	 background-position: 0px 0px; /*图片显示的位置*/
     	      width: 20px; /*设置图片显示的宽*/
      		height: 20px; /*图片显示的高*/
	}
	.i_pwd
	{
		position: absolute;left: 0；z-index:5;margin-top: 8px
		background-image: url(../img/pwd.png); /*引入图片图片*/
      	background-repeat: no-repeat; /*设置图片不重复*/
     	 background-position: 0px 0px; /*图片显示的位置*/
     	  width: 20px; /*设置图片显示的宽*/
    	  height: 20px; /*图片显示的高*/
	}
</style>
<body>
	<div class="login ui container segment">
			<h2>用户登录</h2>
			<div class="content">
			<form name="ui form" action="signin" method="post">
					<div class="ui input" style="width:150% !important" >
					
						<input type="text" name=acc placeholder="用户名" />
					</div>
					<br><br>
					<div class="ui input" style="width:150% !important">
						<input type="password" name="pwd" placeholder="密码" />
					</div>
					<br><br>
					<div class="ui input" style="width:150% !important">
						<input type="text" name="userVCode" class="textVcode" placeholder="验证码" />
						<span>
						<img src="/SMM/Validate" id="validate" onclick="change()" />
						<a href="javascript:change()">看不清，换- -张</a>
						</span>
				</div>
				<br><br>
				<div class="btns">
					
					<button class="ui primary button" type="submit" name="login">
					  登录
					</button>
					<button class="ui button" type="button" name="register" onclick="window.open('/SMM/register')">
					  注册
					</button>
					
				</div>
				</form>
				</div>
				

		
		
		
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.2/dist/jquery.min.js"></script>
      <script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
				<script type="text/javascript">
						function change() {
							document.getElementById("validate").src="/SMM/Validate?random="+Math.random();
						}
				</script>
</body>
</html>