package cn.edu.zjut.dao;

import java.util.List;

import org.hibernate.Session;

import cn.edu.zjut.po.Example;

public interface IExampleDAO {
	public Session getSession();
	public List findByHql(String hql);
	public Example findById(Integer id);
	public Example findById1(Integer id);
	public void save(Example instance);
	public void update(Example instance);
	public void delete(Example instance);
	public void merge(Example instance);
}
