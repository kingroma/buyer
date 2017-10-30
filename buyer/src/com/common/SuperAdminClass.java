package com.common;

import java.util.ArrayList;

import com.buyer.Buyer;
import com.manager.Admin_BuyerManager;
import com.manager.Admin_OrderManager;
import com.manager.Admin_ProductManager;
import com.manager.Admin_SellerManager;
import com.order.Order;
import com.seller.Seller;
import com.product.Comment;
import com.product.Product;

public class SuperAdminClass {
	
	private Admin_BuyerManager abm = null;
	private Admin_OrderManager aom = null;
	private Admin_ProductManager apm = null;
	private Admin_SellerManager asm = null;
	private ManagerStaticAttribute path = null;
	
	private String buyerPath = path.buyerDataPath;
	private String orderPath = path.orderDataPath;
	private String productPath = path.productDataPath;
	private String sellerPath = path.sellerDataPath;
	
	private Buyer b = null;
	private Order o = null;
	private Seller s = null;
	private Product p = null;
	
	private String buyer_id = null;
	private String seller_id = null;
	private String product_num = null;
	private String order_num = null;
	
	public SuperAdminClass(String buyer_id , String seller_id , String product_num , String order_num){
		this.buyer_id = buyer_id;
		this.seller_id = seller_id;
		this.product_num = product_num;
		this.order_num = order_num;
		
		abm = new Admin_BuyerManager();
		aom = new Admin_OrderManager();
		apm = new Admin_ProductManager();
		asm = new Admin_SellerManager();
		path = new ManagerStaticAttribute();
		
		if(buyer_id!=null)
			b = abm.getBuyer(buyerPath, buyer_id);
		if(order_num!=null)
			o = aom.getOrder(orderPath, order_num);
		if(seller_id!=null)
			s = asm.getSeller(sellerPath, seller_id);
		if(product_num!=null)
			p = apm.getProduct(productPath, product_num);
	}
	
	
	public boolean changeOrderReplyBySeller(String num,String reply){
		o.getComment().get(Integer.parseInt(num)).setReply(reply);
		aom.fixOrder(orderPath, o);
		
		changeOrderWhatBuyerAndSeller(o);
		
		
		return true;
	}
	
	public boolean changeOrderStatusBySeller(String status_radio){
		o.setStatus(status_radio);
		aom.fixOrder(orderPath, o);
		changeOrderWhatBuyerAndSeller(o);
		return true;
	}
	
	

	public boolean createOrderCommentByBuyer(String textarea){
		ArrayList<Comment> comment_list = null;
		if(o.getComment()==null)
			comment_list = new ArrayList<Comment>();
		else{
			comment_list = o.getComment();
		}
		Comment c = new Comment();
		c.setBuyer(buyer_id);
		c.setOrder_num(order_num);
		c.setProduct_num(product_num);
		c.setSeller(seller_id);
		c.setTextarea(textarea);
		
		comment_list.add(c);
		
		o.setComment(comment_list);
		aom.fixOrder(orderPath, o);
		
		changeOrderWhatBuyerAndSeller(o);
		
		return true;
	}
	public void changeOrderWhatBuyerAndSeller(Order o){
		String order_num = o.getOrder_num();
		if(b.getOrder()!=null){
			for(int i = 0 ; i < b.getOrder().size() ; i ++){
				if(b.getOrder().get(i).getOrder_num().equals(order_num)){
					b.getOrder().set(i, o);
					abm.fixBuyer(buyerPath, b);
					break;
				}
			}
		}
		if(s.getOrder()!=null){
			for(int i = 0 ; i < s.getOrder().size() ; i ++){
				if(s.getOrder().get(i).getOrder_num().equals(order_num)){
					s.getOrder().set(i, o);
					asm.fixSeller(sellerPath, s);
					break;
				}
			}
		}
	}
	public boolean cancelOrderByBuyer(){
		o.setStatus("cancel");
		aom.fixOrder(orderPath, o);
		
		ArrayList<Order> order_list = b.getOrder();
		
		for(int i = 0 ; i < order_list.size() ; i ++){
			if(order_list.get(i).getOrder_num().equals(order_num)){
				order_list.set(i, o);
				b.setOrder(order_list);
				abm.fixBuyer(buyerPath, b);
				break;
			}
		}
		
		order_list = s.getOrder();
		
		for(int i = 0 ; i < order_list.size() ; i ++){
			if(order_list.get(i).getOrder_num().equals(order_num)){
				order_list.set(i, o);
				s.setOrder(order_list);
				asm.fixSeller(sellerPath, s);
				break;
			}
		}
		
		return true;
	}
	
	public boolean fixOrderInfoByBuyer(String price , String comment , String phone){
		//order buyer seller 다바꾸야함
		
		o.setPrice(price);
		o.setOrder_comment(comment);
		o.setBuyer_phone(phone);
		aom.fixOrder(orderPath, o);
		
		ArrayList<Order> order_list = b.getOrder();
		
		for(int i = 0 ; i < order_list.size() ; i ++){
			if(order_list.get(i).getOrder_num().equals(order_num)){
				order_list.set(i, o);
				b.setOrder(order_list);
				abm.fixBuyer(buyerPath, b);
				break;
			}
		}
		
		order_list = s.getOrder();
		
		for(int i = 0 ; i < order_list.size() ; i ++){
			if(order_list.get(i).getOrder_num().equals(order_num)){
				order_list.set(i, o);
				s.setOrder(order_list);
				asm.fixSeller(sellerPath, s);
				break;
			}
		}
		
		return true;
	}
	
	public Admin_BuyerManager getAbm() {
		return abm;
	}

	public void setAbm(Admin_BuyerManager abm) {
		this.abm = abm;
	}

	public Admin_OrderManager getAom() {
		return aom;
	}

	public void setAom(Admin_OrderManager aom) {
		this.aom = aom;
	}

	public Admin_ProductManager getApm() {
		return apm;
	}

	public void setApm(Admin_ProductManager apm) {
		this.apm = apm;
	}

	public Admin_SellerManager getAsm() {
		return asm;
	}

	public void setAsm(Admin_SellerManager asm) {
		this.asm = asm;
	}

	public ManagerStaticAttribute getPath() {
		return path;
	}

	public void setPath(ManagerStaticAttribute path) {
		this.path = path;
	}

	public String getBuyerPath() {
		return buyerPath;
	}

	public void setBuyerPath(String buyerPath) {
		this.buyerPath = buyerPath;
	}

	public String getOrderPath() {
		return orderPath;
	}

	public void setOrderPath(String orderPath) {
		this.orderPath = orderPath;
	}

	public String getProductPath() {
		return productPath;
	}

	public void setProductPath(String productPath) {
		this.productPath = productPath;
	}

	public String getSellerPath() {
		return sellerPath;
	}

	public void setSellerPath(String sellerPath) {
		this.sellerPath = sellerPath;
	}

	public Buyer getB() {
		return b;
	}

	public void setB(Buyer b) {
		this.b = b;
	}

	public Order getO() {
		return o;
	}

	public void setO(Order o) {
		this.o = o;
	}

	public Seller getS() {
		return s;
	}

	public void setS(Seller s) {
		this.s = s;
	}

	public Product getP() {
		return p;
	}

	public void setP(Product p) {
		this.p = p;
	}
	
	
	
}
