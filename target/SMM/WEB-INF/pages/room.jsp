<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
    <title>聊天室</title>
    <style>
        body{
            background: url(https://cn.bing.com/th?id=OHR.MedievalRocamadour_ZH-CN7063423495_1920x1080.jpg&rf=LaDigue_1920x1080.jpg&pid=hp) fixed;
        }
        .panel{
            width: 600px;
        }
        .edit.panel{
            height: 170px;
        }
        .msg.panel{
            height: 400px;
            overflow: scroll;
        }
        img{
            max-width: 100%;
            vertical-align: middle
        }
        .time{
            font-size:0.24rem;
            color:#999;
            margin-bottom: 0.3rem;
            text-align: center;
        }
        .send:after,.show:after,.msg:after{
            content: "";
            clear: both;
            display: table;	
        }
        .msg>img{
            width: 48px;
            border-radius: 50%;
            float: left;
        }
        .msg>p{
            float: left;
           
            padding: 3px;
            background: rgb(158, 175, 231);
            
            position: relative;
            border-radius: 3px;
            
            box-sizing: border-box;
        }
        .show .msg img,.show .msg p,.show .msg{
            float: right;
        }
        .input_area{
            border-radius: 3px;
            width: 100%;
            height: 100px;
        }
        .guide{
            background-color: darkorange;
            display: flex;
            width: 100%;
            height: 60px;
        }
    </style>
</head>
<body>
    <div class="guide"><a><i class="home icon"></i>首页</a></div>
    <div class="ui segment  teal container ">
		<h3 class="ui dividing header" id="to">对面</h3>
        <div id="panel" class="top attached segment ui msg panel">


        </div>
        <div class="bottom attached segment ui edit panel">
            <input style="width: 100%;" id="mytxt">

            </input>
            <button class="ui primary button" onclick="send()">发送</button>
            <button class="ui primary button" onclick="receive()" >刷新</button>
        </div>
    </div>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.2/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<script type="text/javascript">
	var frompic ;var topic;
	var from;var to;
	var fromid;var toid;
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
	function init()
	{
		console.log('初始化')
		getData("get",
				"/SMM/chatinit",
				true,
				"to=<%=request.getParameter("to")%>",
		function(ajax){
			console.log('初始化数据请求正常');
			var collections=eval("("+ajax.responseText+")");
			console.log(collections);
			frompic = collections.frompic;
			fromid = collections.fromid;
			topic = collections.topic;
			toid = collections.toid;
			to = collections.to;
			document.getElementById('to').innerText = to;

		},
		function(ajax){
			console.log('数据请求异常');
		})	;
	}
	function send()
	{
		var txt = document.getElementById('mytxt').value;
		var s =	'<div class="show">'+
				'<div class="time">05/22 06:30</div>'+
				'<div class="msg">'+
				'<img src="./'+frompic+'" alt="" />'+
				'<p><i clas="msg_input"></i>'+txt+'</p>'+
				'</div>'+
				'</div>'
		$('#panel').append(s);
		getData("post",
				"/SMM/leftmsg?from="+fromid+"&to="+toid+"&topic="+topic+"&frompic="+frompic,
				true,
				txt,
				function (ajax) {
					console.log('yes');
				},function (ajax) {
					console.log('failed');
				});
	}
    init();
    function receive()
	{
        var collections;
		getData("get",
				"/SMM/getmsg",
				false,
				"",
				function (ajax) {
                     collections=eval("("+ajax.responseText+")");
					 console.log(collections);
				},function (ajax) {
					console.log('failed');
				});
				var s = '<div class="send">'+
				'<div class="time">'+collections.result[0].time+'</div>'+
				'<div class="msg">'+
				'<img src="./'+topic+'" alt="" />'+
				'<p><i class="msg_input"></i>'+collections.result[0].content+'</p>'+
				'</div>'+
				'</div>';
				 if(collections.result[0].content!=undefined)
		            $('#panel').append(s);

	};






</script>
</body>
</html>