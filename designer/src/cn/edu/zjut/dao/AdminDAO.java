package cn.edu.zjut.dao;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import cn.edu.zjut.po.Designer;
import cn.edu.zjut.po.Employer;
import cn.edu.zjut.po.Example;

public class AdminDAO extends BaseHibernateDAO implements IAdminDAO{
	private Log log = LogFactory.getLog(AdminDAO.class);
	public void delete(Employer employer) {
		log.debug("logout instance"); 
	    try {
    		 getSession().delete(employer);
 
    	 }catch(RuntimeException re) {
    		 throw re;
    	 }
		
	}
	public void delete(Designer designer) {
		log.debug("logout instance"); 
    	 try {
    		 getSession().delete(designer);
    	 }catch(RuntimeException re) {
    		 throw re;
    	 }
		
	}
	public Designer findD(String hql){
		log.debug("finding designer instance by designerId");
		Designer e;
		List list;
		try {
			Query queryObject=getSession().createQuery(hql);
			if(queryObject.list()!=null) {
				list=queryObject.list();
				e=(Designer)list.get(0);
				return e;
			}
			return null;
		}
		catch (RuntimeException re) { 
			log.error("find failed", re); 
			throw re;
		}
	}
	public Employer findE(String hql){
		log.debug("finding designer instance by designerId");
		Employer e;
		List list;
		try {
			Query queryObject=getSession().createQuery(hql);
			if(queryObject.list()!=null) {
				list=queryObject.list();
				e=(Employer)list.get(0);
			}
			return null;
		}
		catch (RuntimeException re) { 
			log.error("find failed", re); 
			throw re;
		}
	}
	public Integer findCount1() {
		   log.debug("finding maxId instance");
		   try {
			   Integer count=(Integer) getSession().createQuery("select max(visits) from Designer").uniqueResult();
			   if(count==null) {
				   return null;
			   }
			   return count;
			  
		   }catch(RuntimeException re) {
			   log.error("find failed", re);
			   System.out.println("err");
			   throw re;
		   }
	  }
	public Integer findCount2() {
		   log.debug("finding maxId instance");
		   try {
			   Integer count=(Integer)getSession().createQuery("select max(visits) from Example ").uniqueResult();
			   if(count==null) {
				   return null;
			   }
			   return count;
			  
		   }catch(RuntimeException re) {
			   log.error("find failed", re);
			   System.out.println("err");
			   throw re;
		   }
	  }
	public List findByhql(String hql) {
		   log.debug("find instance");
		   try {
			   Query queryObject = getSession().createQuery(hql); 
			   return queryObject.list();
		   }catch(RuntimeException re) {
			   log.error("find failed", re);
			   System.out.println("err");
			   throw re;
		   }
	  }
     public void update1(Example example) {
    	 log.debug("update instance"); 
    	 try {
    		 getSession().update(example);
    	 }catch(RuntimeException re) {
    		 throw re;
    	 }
     }
     public Integer confirm(String name,String Id) {
    	   log.debug("finding count");
		   try {
			   Integer count=(Integer)getSession().createQuery("select exampleId from Example where name='"+name+"'and designerId='"+Id+"'").uniqueResult();
			   if(count==null) {
				   return null;
			   }
			   return count;
			  
		   }catch(RuntimeException re) {
			   log.error("find failed", re);
			   System.out.println("err");
			   throw re;
		   }
     }
     public Designer findById(String id){
 		log.debug("finding designer instance by designerId");
 		Designer e;
 		try {
 			e=(Designer)getSession().get(Designer.class,id);
 			log.debug("find successful");
 			return e;
 		}
 		catch (RuntimeException re) { 
 			log.error("find failed", re); 
 			throw re;
 		}
 	}
 	public List findByHql(String hql) { 
 		log.debug("finding Designer instance by hql"); 
 		try {
 			String queryString = hql;
 			Query queryObject = getSession().createQuery(queryString); 
 			return queryObject.list();
 		} 
 		catch (RuntimeException re) { 
 			log.error("find by hql failed", re); 
 			throw re;
 		}
 	}
}
