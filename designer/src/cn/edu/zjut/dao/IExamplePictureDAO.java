package cn.edu.zjut.dao;

import java.util.List;

import org.hibernate.Session;

import cn.edu.zjut.po.Example;
import cn.edu.zjut.po.ExamplePicture;

public interface IExamplePictureDAO {
	public Session getSession();
	public List findByHql(String hql,Example example);
	public String findById1(Integer Id);
	public void save(ExamplePicture instance);
	public void update(ExamplePicture instance);
	public void delete(ExamplePicture instance);
}
