package com.common;

public class ManagerStaticAttribute {
	//C:\Users\Andrew\Desktop\web\web\data\WebContent\data
	//110.70.47.250
	//192.168.43.185
	public static String myIp = "192.168.43.185";
	public static String myPort = "8080";
	
	
	//http://localhost:8080/data/data/product/A7/베틀그라운드.jpg
	public static String dataPath = "C:/Users/Andrew/Desktop/web/web/data/WebContent/data";
	//public static String dataPath = "http://localhost:8080/data/data";
	public static String buyerDataPath = dataPath+"/buyer";
	public static String sellerDataPath = dataPath+"/seller";
	public static String productDataPath = dataPath+"/product";
	public static String orderDataPath = dataPath+"/order";
	public static String boardDataPath = dataPath+"/board";
	/*
	public static String dataUrl="http://localhost:8080/data/data";
	public static String buyerUrl="http://localhost:8080/buyer";
	public static String sellerUrl="http://localhost:8080/seller";
	public static String imgUrl="http://localhost:8080/data/img";
	*/
	public static String dataUrl="http://"+myIp+":"+myPort+"/data/data";
	public static String buyerUrl="http://"+myIp+":"+myPort+"/buyer";
	public static String sellerUrl="http://"+myIp+":"+myPort+"/seller";
	public static String imgUrl="http://"+myIp+":"+myPort+"/data/img";
	
	
	
	public static String testBuyerUrl="http://"+myIp+":"+myPort+"/buyer";
	public static String testBuyerUrlMain=testBuyerUrl+"/test_main" ;
	public static String testBuyerUrlLogin=testBuyerUrl+"/test_login" ;
	public static String testBuyerUrlSearchId = testBuyerUrl+"/test_search_idpw" ;
	public static String testBuyerUrlSearchPw = testBuyerUrl+"/test_search_idpw" ;
	public static String testBuyerUrlAccount = testBuyerUrl+"/test_account" ;
	public static String testBuyerUrlShowProduct = testBuyerUrl+"/test_showproduct" ;
}
