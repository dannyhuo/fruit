package com.fruit.valicode;

import java.awt.BasicStroke;
import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.geom.AffineTransform;
import java.awt.geom.Line2D;
import java.awt.image.BufferedImage;
import java.util.Random;


public class ValiCode {
	
	public static BufferedImage createValiCode(String valCode){
		//指定生成的验证码的宽和高
		int width = 68;
		int height = 23;
		
		//创建BufferedImage对象，其作用相当于一图片
		BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
		//创建Graphics对象，其作用相当于一个画笔
		Graphics g = image.getGraphics();
		image.setRGB(22, 13, 6);
		
		//创建Graphics2D对象
		Graphics2D g2d = (Graphics2D) g;
		
		Random random = new Random();
		
		Font mfont = new Font("宋体",Font.BOLD,20);
		
		//设置字体
		g2d.setFont(mfont);
		
		//设置颜色
		g2d.setColor(getRandColor(180, 200));
		
		//绘制100条颜色和位置全部随机生成的线条，该线条为2f
		for(int i = 0; i < 10000; i++){
			int x = random.nextInt(width-1);
			int y = random.nextInt(height-1);
			int x1 = random.nextInt(6) + 1;
			int y1 =random.nextInt(12) + 1;
			//定制线条样式
			BasicStroke bs = new BasicStroke(2f,BasicStroke.CAP_BUTT,BasicStroke.JOIN_BEVEL);
			Line2D line = new Line2D.Double(x,y,x+x1,y+y1);
			
			g2d.setStroke(bs);
			
			g2d.draw(line);
		}
		
		//制定输入的验证码为四位
		for(int i =0; i < valCode.length(); i++){
			Color color = new Color(20+random.nextInt(110),20+random.nextInt(110),random.nextInt(110));
			g2d.setColor(color);
			//将生成的随机数进行随机缩放并旋转制定角度PS.建议不要对文字进行缩放与旋转，因为这样图片可能不正常显示
			/*将文字旋转制定角度*/
			
			AffineTransform trans = new AffineTransform();
			trans.rotate(45*3.14/180,15*i+8,7);
			/*缩放文字*/
			float scaleSize = random.nextFloat() + 0.8f;
			
			if(scaleSize > 1f){
				scaleSize = 1f;
			}
			
			trans.scale(scaleSize, scaleSize);
			
			g2d.setTransform(trans);
			
			g2d.drawString(String.valueOf(valCode.charAt(i)), 15*i+5, 16);
		}
		//释放g所占用的系统资源
		g.dispose();
		g2d.dispose();
		return image;
	}
	
	/**
	 * 随机生成颜色
	 * @param s
	 * @param e
	 * @return
	 */
	public static Color getRandColor(int s,int e){
		Random random = new Random();
		if(s > 255){
			s = 255;
		}
		if(e > 255){
			e = 255;
		}
		int r,g,b;
		r = s + random.nextInt(e-s);
		g = s + random.nextInt(e-s);
		b = s + random.nextInt(e-s);
		
		return new Color(r,g,b);
	}

}
