package com.roc.sysmanager.dwr;



import com.roc.sysmanager.base.service.ClienService;

public class SingleInstanceClientSer {
	private static ClienService service = null;
	private static SingleInstanceClientSer clientServiceInstance = null;
	private SingleInstanceClientSer(){
		service = new ClienService();
	}
	public static  synchronized SingleInstanceClientSer getClientService(){
		if(clientServiceInstance == null){
			clientServiceInstance = new SingleInstanceClientSer();
		}
		return clientServiceInstance;
	}
	public  ClienService getService(){
		return service;
	}
}
