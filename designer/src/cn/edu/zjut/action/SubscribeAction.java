package cn.edu.zjut.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import cn.edu.zjut.po.Subscribe;
import cn.edu.zjut.service.ISubscribeService;
import cn.edu.zjut.service.SubscribeService;

public class SubscribeAction {
	private Subscribe subscribe;   
	private String employerId;    
	private String designerId;    
	private String subscribeID;   
	
	 
	public String getSubscribeID() {
		return subscribeID;
	}
	public void setSubscribeID(String subscribeID) {
		this.subscribeID = subscribeID;
	}
	public String getEmployerId() {
		return employerId;
	}
	public void setEmployerId(String employerId) {
		this.employerId = employerId;
	}
	public String getDesignerId() {
		return designerId;
	}
	public void setDesignerId(String designerId) {
		this.designerId = designerId;
	}

	ISubscribeService subscribeServ=null;
	public void setSubscribeServ(ISubscribeService subscribeServ){this.subscribeServ=subscribeServ;}
	public Subscribe getSubscribe(){ return subscribe;}
	public void setSubscribe(Subscribe subscribe) {this.subscribe = subscribe;}
	
    public String subscribe() {
    	System.out.println("employerId"+employerId);
    	System.out.println("designerId"+designerId);
    	
    	String message;
    	HttpServletRequest request=ServletActionContext.getRequest();
    	if(subscribeServ.subscribe(subscribe,employerId,designerId)) {
    		message = "预约成功!";
    		request.setAttribute("tipMessage", message);
    		return "success";
    	}
    	message = "预约失败!";
    	request.setAttribute("tipMessage", message);
    	return "fail";
    }
    
    //When you enter the reservation details page, put the reservation details into the request
	public String putSubscribe()           
	{
		subscribeServ.putSubscribe(subscribe);
		return "success";
	}
	
	//accept order
	public String accept()   
	{
		System.out.println("subscibeID"+subscribeID);
		subscribeServ.accept(subscribeID);
		return "success";
	}
	
	//reject order
	public String reject()   
	{
		System.out.println("action收到的subsribeID："+subscribeID);
		subscribeServ.reject(subscribe);
		return "success";
	}
	
	//generate orders
	public String gotoGenerateOrder()  
	{
		subscribeServ.putSubscribe(subscribe);
		return "success";
	}
}
