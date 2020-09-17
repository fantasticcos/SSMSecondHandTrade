package com.hhx.util;

import java.awt.*;
import java.awt.image.BufferedImage;
import java.util.Random;

public class Identify {
    private int width=60;
    private  int height=20;
    private int codeCount=4;
    private int x=0;
    private int fontHeight;
    private int codeY;
    char [] codeSequence= {'a','b','c','d','e','f','g','h','y','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z',
            'A','B','C','D','E','F','G','H','Y','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','1','2','3','4','5','6','7','8','9','0'};

    public BufferedImage bufflmg = null;
    public StringBuffer randomCode = null;
    public Identify() {
        Random random=new Random();

        x=width/(codeCount+1);
        fontHeight=height-2;
        codeY=height-4;

        bufflmg = new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB);
        Graphics2D g = bufflmg.createGraphics();
        // 将图像填充为白色
        g.setColor(Color.WHITE);
        g.fillRect(0, 0, width, height);
        //创建字体，字体的大小应该根据图片的高度来定
        Font font = new Font("Fixedsys", Font.PLAIN, fontHeight);
        // 设置字体
        g.setFont(font);
        // 画边框
        g.setColor(Color.BLACK);
        g.drawRect(0, 0, width- 1, height - 1);
        // 随机产生8条干扰线，使图象中的认证码不易被其它程序探测到


        g.setColor(Color.BLACK);
        for (int i=0;i<8; i++){
            int x = random.nextInt(width);
            int y = random.nextInt(height);
            int xl = random.nextInt(8);
            int yl = random.nextInt(8);
            g.drawLine(x, y,x+ xl,y + yl);
        }
        //2、生产随机数
        randomCode = new StringBuffer();
        int red= 0, green=0, blue = 0;
        //随机产生codeCount个数字的验证码
        for (int i=0; i < codeCount; i++){
            //得到随机产生的验证码数字
            String strRand = String.valueOf(codeSequence[random.nextInt(54)]);
            //产生随机的颜色分量来构造颜色值，这样输出的每位数字的颜色值都将不同
            red = random.nextInt(255);
            green = random.nextInt(255);
            blue = random.nextInt(255);
            //用随机产生的颜色将验证码绘制到图像中
            g.setColor(new Color(red, green, blue));
            g.drawString(strRand, (i+ 1)* x, codeY);
            //将产生的四个随机数组合在- - 起。
            randomCode .append(strRand);
        }
    }

}
