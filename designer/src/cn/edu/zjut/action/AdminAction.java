package cn.edu.zjut.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import cn.edu.zjut.po.Designer;
import cn.edu.zjut.po.Example;
import cn.edu.zjut.service.IAdminService;

public class AdminAction {
	private String phone; 
	private String userId;
    public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	private IAdminService adminService=null;
    public void setAdminService(IAdminService service) {
  	  this.adminService=service;
    }
    private Designer designer;
    public Designer getDesigner() {
		return designer;
	}
	public void setDesigner(Designer designer) {
		this.designer = designer;
	}
	 private Example example;
	    public Example getExample() {
			return example;
		}
		public void setExample(Example example){
			this.example=example;
		}
	
	//admin logout designer or employer	
    public String Logout(){
  	String message;
    HttpServletRequest request=ServletActionContext.getRequest();
  	  if(adminService.Logout(userId,phone)) {
  		  System.out.println(userId);
  		  System.out.println(phone);
  		  message = "ע���ɹ�!";
    	  request.setAttribute("tipMessage", message);
  		  return "success";
  	  }
  	  message = "ע��ʧ��!";
		  request.setAttribute("tipMessage", message);
  	  return "fail";
    }
    
    //exit
    public String Exit(){
      	String message;
        HttpServletRequest request=ServletActionContext.getRequest();
      	adminService.Exit();
        message = "�˳���¼!";
        request.setAttribute("tipMessage", message);
      	 return "success";   
      	 
    }
   

    //designer recommend 
    public String Recommend(){
    	String message;
        HttpServletRequest request=ServletActionContext.getRequest();
      	  if(adminService.Recommend(designer)) {
      		  System.out.println("���ţ�");
      		  System.out.println(designer.getDesignerId());
      		  message = "���ųɹ�,�˵�����ĸ��ͻ�!";
        	  request.setAttribute("tipMessage", message);
        	  System.out.println(message);
      		  return "success";
      	  }
      	  message = "����ʧ��!";
      	  System.out.println(message);
    	  request.setAttribute("tipMessage", message);
      	  return "fail";
        }
   
    //example recommend
    public String Recommend1(){
    	String message;
        HttpServletRequest request=ServletActionContext.getRequest();
      	  if(adminService.Recommend1(example,designer)) {
      		  message = "���ųɹ�,�˵�����ĸ��ͻ�!";
              request.setAttribute("tipMessage", message);
      		  return "success";
      	  }
      	  message = "����ʧ��!";
    		  request.setAttribute("tipMessage", message);
      	  return "fail";
        }
    
    //show push-top table
    public String display() {
    	adminService.display();
    	return "success";
    }
    
    //designer authen
    public String Authen(){
    	String message;
      	HttpServletRequest request=ServletActionContext.getRequest();
    	  if(adminService.Authen(designer)) {
    		  message = "��֤�ɹ�!";
      		  request.setAttribute("tipMessage", message);
      		  request.setAttribute("designer",designer);
    		  return "success";
    	  }
    	  message = "��֤ʧ��!";
  		  request.setAttribute("tipMessage", message);
  		  request.setAttribute("designer",designer);
    	  return "fail";
      }
    
      //view certification details
      public String View() {
    	  adminService.View(designer);
  		return"success";
      }
      
      //show designer to be certified
      public String display1() {
    	  adminService.display1();
    		return"success";
        }
      
      //show Certified Designer
      public String display2() {
    	  adminService.display2();
      		return"success";
          }
}
