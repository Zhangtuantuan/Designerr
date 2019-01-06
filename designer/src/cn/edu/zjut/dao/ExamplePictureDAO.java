package cn.edu.zjut.dao;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.Query;

import cn.edu.zjut.po.Example;
import cn.edu.zjut.po.ExamplePicture;

public class ExamplePictureDAO extends BaseHibernateDAO implements IExamplePictureDAO{
	private Log log = LogFactory.getLog(ExamplePictureDAO.class);

	public List findByHql(String hql,Example example) {
		log.debug("finding ExamplePicture instance by hql");
		try {
			String queryString = hql;
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setProperties(example);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by hql failed", re);
			throw re;
		}
	}
	public String findById1(Integer Id) {
		log.debug("finding ExamplePicture instance by exampleId");
		ExamplePicture e;
		List list=null;
		try {
			String hql="from ExamplePicture";
			Query queryObject = getSession().createQuery(hql); 
			list=queryObject.list();
			for(int i=0;i<list.size();i++) {
				e=(ExamplePicture)list.get(i);
				if((e.getExample().getExampleId())==Id) {
					return e.getPicture1();
				}
			}
			return null;
		} catch (RuntimeException re) {
			log.error("find failed", re);
			throw re;
		}
	}
	public void save(ExamplePicture instance) {
		log.debug("saving ExamplePicture instance");
		try {
			getSession().save(instance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void update(ExamplePicture instance) {
		log.debug("updating ExamplePicture instance");
		try {
			getSession().update(instance);
			log.debug("update successful");
		} catch (RuntimeException re) {
			log.error("update failed", re);
			throw re;
		}
	}

	public void delete(ExamplePicture instance) {
		log.debug("deleting ExamplePicture instance");
		try {
			getSession().delete(instance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}
}
