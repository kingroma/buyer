package com.main;

import com.seller.Seller;
import com.product.*;

import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.net.InetAddress;
import java.net.UnknownHostException;

import javax.imageio.ImageIO;
import javax.servlet.RequestDispatcher;
import javax.swing.ImageIcon;

import com.board.Board;
import com.buyer.Buyer;
import com.common.GetProductList;
import com.common.ManagerStaticAttribute;
import com.common.SearchProduct;
import com.common.SortArrayList;
import com.manager.Admin_BoardManager;
import com.manager.Admin_ProductManager;

import java.util.*;
public class main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Admin_ProductManager apm = new Admin_ProductManager();
		
		ArrayList<Product> list = apm.getBestReplyProduct();
		
		for(int i = 0 ; i < list.size() ;  i ++){
			System.out.println(list.get(i).getProduct_num()+"/"+list.get(i).getComment().size());
		}
		
	}
	

}
