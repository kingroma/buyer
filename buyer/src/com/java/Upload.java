
/*
 * package com.java;
 

import java.io.File;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import com.common.CurrentTime;
import com.common.ManagerStaticAttribute;
import com.common.ProductFileNumber;
import com.manager.Admin_ProductManager;
import com.manager.Admin_SellerManager;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.product.Product;
import com.seller.Seller;

public class Upload {
	public String path = "";
	public int num = 0;
	
	private int sizeLimit = 5 * 1024 * 1024 ; // 5�ް����� ���� �Ѿ�� ���ܹ߻�
	private MultipartRequest multi; 
	private String id = "";
	public Upload(HttpServletRequest request,String id){
		//System.out.println(exists()+"����");
		
		System.out.println(id);
		this.id = id;
		if(id != null){
			exists();
			upload(request);
			AdminManager(multi , id);
		}
	}
	
	public int exists(){
		String productPath = ManagerStaticAttribute.productDataPath; // ������ ���丮 (������)
		File file = null;
		
		int i = 0;
		while(true){
			file = new File(productPath+"/A"+i+"");
			if(file.exists()){
				i++;
			}else{
				file.mkdirs();
				num = i;
				path = productPath+"/A"+i+"";
				break;
			}
		}
		return i;
	}
	
	public void upload(HttpServletRequest request){
		//SaveClass sc = new SaveClass();
		try{
			multi=new MultipartRequest
				(request, path, sizeLimit,"UTF-8", new DefaultFileRenamePolicy());
			//Product p = new Product();
			
			//new String((multi.getParameter("text")).getBytes("UTF-8"),"UTF-8");
			System.out.println("���� : "+multi.getParameter("text")+"");
			//p.setId(multi.getParameter("text"));
			
			//sc.save(p, path+"/data.d");
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public void AdminManager(MultipartRequest multi , String id){
		
		Product p = setProduct(multi,id);
		
		setProductAdmin(p);
		setSellerAdmin(p);		
	}
	
	public Product setProduct(MultipartRequest multi,String id){
		Product p = new Product();
		CurrentTime ct = new CurrentTime();
		
		p.setTime(ct.getTime());
		p.setPrice(multi.getParameter("price"));
		p.setStatus("ing");
		p.setTitle(multi.getParameter("title"));
		
		p.setProduct_num("A"+num);
		p.setSeller(id);//id session ���� ���Ŀ� �ޱ� 
		p.setFile_name(multi.getFile("file").getName());
		p.setTextarea(multi.getParameter("textarea"));
		p.setFile(multi.getFile("file"));
		if(multi.getParameter("categori")!=null)
			p.setCategori(multi.getParameter("categori"));
		else{
			p.setCategori("null");
		}
		return p;
	}
	
	public void setProductAdmin(Product p){
		Admin_ProductManager apm = new Admin_ProductManager();
		apm.createProduct(ManagerStaticAttribute.productDataPath, p);
	}
	
	public void setSellerAdmin(Product p){
		Admin_SellerManager asm = new Admin_SellerManager();
		Seller seller = asm.getSeller(ManagerStaticAttribute.sellerDataPath, id);
		
		ArrayList<Product> list = seller.getSell_product();
		if(list==null)
			list = new ArrayList<Product>();
		list.add(p);
		seller.setSell_product(list);
		asm.fixSeller(ManagerStaticAttribute.sellerDataPath, seller);
	}
}
*/