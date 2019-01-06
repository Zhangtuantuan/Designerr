package cn.edu.zjut.service;

import java.util.List;
import java.util.Map;

import org.hibernate.Transaction;

import com.opensymphony.xwork2.ActionContext;

import cn.edu.zjut.dao.IAdminDAO;
import cn.edu.zjut.dao.IDesignerDAO;
import cn.edu.zjut.dao.IExampleDAO;
import cn.edu.zjut.po.Designer;
import cn.edu.zjut.po.Employer;
import cn.edu.zjut.po.Example;

public class AdminService implements IAdminService{
	 private Map<String,Object> request, session; //鑾峰彇request,session
     private IAdminDAO adminDAO=null;
     private IDesignerDAO designerDAO=null;
     private IExampleDAO exampleDAO=null;
     public void setDesignerDAO(IDesignerDAO designerDAO) {this.designerDAO = designerDAO;}
     public void setExampleDAO(IExampleDAO exampleDAO) {this.exampleDAO = exampleDAO;}
     public void setAdminDAO(IAdminDAO dao) {
    	 this.adminDAO=dao;
     }
     public boolean Authen(Designer designer) {
    	 designer=designerDAO.findById(designer.getDesignerId());
    	 designer.setStatus("已审核");
    	 try {
 			designerDAO.update(designer);
 			designerDAO.update(designer);
 			request.put("designer", designer);
 			display1();
 			display2();
 			return true;
 		} catch (Exception e) {
 			e.printStackTrace();
 			return false;
 		}
     }
     public void View(Designer designer) {
  		ActionContext ctx = ActionContext.getContext();
  		request = (Map) ctx.get("request");
  		System.out.println("view");
  		System.out.println(designer.getDesignerId());
  		designer = adminDAO.findById(designer.getDesignerId());
  		request.put("designer", designer);
  	}
      //提交了认证申请，但还没被认证的设计师
      public List display1() {
     	 ActionContext ctx= ActionContext.getContext();
  		 session=(Map) ctx.get("session");
  		 String state="审核中";
     	 String hql="from Designer designer where designer.status='"+state+"'";
     	 List list=adminDAO.findByHql(hql);
     	 session.put("designers",list);
     	 return list;
      }
      //已经认定成功的设计师
      public List display2() {
     	 ActionContext ctx= ActionContext.getContext();
  		 session=(Map) ctx.get("session");
  		 String state="已审核";
     	 String hql="from Designer designer where designer.status='"+state+"'";
     	 List list=adminDAO.findByHql(hql);
     	 session.put("designerss",list);
     	 return list;
      }
     public boolean Logout(String userId,String phone) {
    	 System.out.println(userId);
    	 System.out.println(phone);
    	 System.out.println("aaaaaaaaaaaaaaaaaaa");
    	 String hql;
    	 String str=userId.substring(0,1);
    	 System.out.println(str);
    	 if(str.equals("0")) {
    		 System.out.println("ccccccccccccccccccccd");
    		 hql="from Designer  where designerId='"+userId+"'and phone='"+phone+"'";
    		 try {
    			    Designer designer=adminDAO.findD(hql);
    			    System.out.println(designer.getAccount());
 	    		    adminDAO.delete(designer);
    	 			return true;
    	 		} catch (Exception e) {
    	 			e.printStackTrace();
    	 			return false;
    	 		}
    	 }
    	 else {
    		 hql="from Employer  where employerId='"+userId+"'and phone='"+phone+"'";
    		 try {
    	    		Employer employer=adminDAO.findE(hql);
    	    		adminDAO.delete(employer);
    	 			return true;
    	 		} catch (Exception e) {
    	 			e.printStackTrace();
    	 			return false;
    	 		}
    	 }
    	 
     }
 	public boolean Recommend(Designer designer) {
 		try {
    		designer=designerDAO.findById(designer.getDesignerId());
    		Integer count=adminDAO.findCount1();
    		if(count==null) {
    			designer.setVisits(1);
    		}
    		else {
    			designer.setVisits(count+1);
    		}
    		designer.setStatus1(2);
    		designerDAO.update(designer);
    		display();
 			return true;
 		} catch (Exception e) {
 			e.printStackTrace();
 			return false;
 		}
    }
 	public boolean Recommend1(Example example,Designer designer) {
 		try {
 			Integer exampleId=adminDAO.confirm(example.getName(),designer.getDesignerId());
    		if(exampleId!=null)
    		{
    		  designer=designerDAO.findById(designer.getDesignerId());
    		  example=exampleDAO.findById1(exampleId);
    		  Integer count=adminDAO.findCount2();
    		  if(count==null) {
    			 example.setVisits(1);
    		   }
    		  else {
    			 example.setVisits(count+1);
    		  }
    		  adminDAO.update1(example);
    		  designer.setStatus1(4);
      		  designerDAO.update(designer);
    		  display();
 			  return true;
    		}else {
    			return false;
    		}
 		    } catch (Exception e) {
 			   e.printStackTrace();
 			   return false;
 		      }
 		
    }
 	  public List display() {
 		 ActionContext ctx= ActionContext.getContext();
 		 session=(Map) ctx.get("session");
     	 String hql="from Designer order by money1 desc";
     	 List list=adminDAO.findByhql(hql);
     	 session.put("Designerss", list);
		 return list;
      }
 	 public List displayExp() {
     	 String hql="from Example order by visits desc";
     	 String hql1="from Designer where status1=4";
     	 List list=adminDAO.findByhql(hql);
     	 List list1=adminDAO.findByhql(hql1);
     	 Example example=null;
     	 Designer designer=null;
     	 if(list1!=null) {
     		 if(list1.size()==4) {
     			 return list1;
     		 }
     		 else {
     			 for(int i=0;i<list.size() && list1.size()<4;i++) {
     				 example=(Example)list.get(i);
     				 designer=example.getDesigner();
     				 if(designer.getStatus1()!=null && designer.getStatus1().intValue()!=4) {
     					 list1.add(example);
     				 }
     			 }
     			 return list1;
     		 }
     	 }
     	 else
     		 return null;
      }
 	 public List displayDes() {
     	 String hql="from Designer order by visits desc";
     	 String hql1="from Designer where status1=2";
     	 List list=adminDAO.findByhql(hql);
     	 List list1=adminDAO.findByhql(hql1);
     	 Designer designer=null;
     	 if(list1!=null) {
     		 if(list1.size()==3) {
     			 return list1;
     		 }
     		 else {
     			 for(int i=0;i<list.size() && list1.size()<3;i++) {
     				 designer=(Designer)list.get(i);
     				 if(designer.getStatus1()!=null && designer.getStatus1().intValue()!=2) {
     					 list1.add(designer);
     				 }
     			 }
     			 return list1;
     		 }
     	 }
     	 else
     		 return null;
      }
 	 public void Exit() {
 		ActionContext ctx= ActionContext.getContext();
 		session=(Map)ctx.get("session");
 		 session.remove("id");
 		 session.remove("admin");
 	 }
}
