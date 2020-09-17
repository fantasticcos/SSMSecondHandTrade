<%--
  Created by IntelliJ IDEA.
  User: hhxio
  Date: 2020/9/11
  Time: 11:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>重新编辑</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
    <style type="text/css">
        body{
            background: url(https://cn.bing.com/th?id=OHR.MedievalRocamadour_ZH-CN7063423495_1920x1080.jpg&rf=LaDigue_1920x1080.jpg&pid=hp) fixed;
        }
    </style>
</head>
<body>
<div class="segment ui " style="width: 300px;height: 550px">
    <div><h2 >信息</h2></div>

    <img class="ui small image" src="../${good.pic}">
    <h5>类别：${good.type}</h5>
    <h5>商品名：${good.name}</h5>
    <h5>价格：${good.price}</h5>
    <h5>描述：${good.desc}</h5>
    <div class="but">
        <div class="b1">
            <button class="ui primary button" id="btn" onclick="show()">确认修改</button>
        </div>
    </div>


</div>



<div id="editpanel" class="segment ui " style="position:absolute;left:350px;top:3px;display: none;width: 300px;height: 550px;;">
    <div><h2 >信息修改</h2></div>

    <form class="ui form" action="doupinfo" method="post" id="tform" enctype="multipart/form-data" >

        选择头像:
        <input type="file" name="file">
        <br>
        商品名称:<input class="in" id="acc" type="text" name="goods"
                    placeholder="输入商品名称"
    >
        <div>
            类型：<select name="type" id="province"  >
            <option value ="衣服">-衣服-</option>
            <option value ="鞋">-鞋-</option>
            <option value ="家电">-家电-</option>
            <option value ="手机">-手机-</option>
            <option value ="珠宝">-珠宝-</option>
            <option value ="箱包">-箱包-</option>
            <option value ="手表">-手表-</option>
            <option value ="乐器">-乐器-</option>
            <option value ="器械">-器械-</option>
            <option value ="学习">-学习-</option>
            <option value ="书本">-书本-</option>
        </select>
        </div>
        决定价格:<input class="in" id="pwd" type="text" name="price">
        <br>
        <span>描述:</span>
        <textarea name="desc" id="person" ></textarea>
        <input type="hidden" name="goodsno" value="${good.no}">
        <div class="but">
                <button class="ui primary button" id="btn" type="submit" >提交</button>
            &nbsp;&nbsp;&nbsp;
                <button class="ui  button" >取消</button>

        </div>

    </form>

</div>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.2/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<script type="text/javascript">

    function show()
    {
        var panel = document.getElementById('editpanel');
        panel.style.display = 'block';
    }

</script>
</body>
</html>
