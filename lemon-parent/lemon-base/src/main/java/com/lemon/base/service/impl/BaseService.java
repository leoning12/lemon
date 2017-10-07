package com.lemon.base.service.impl;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import com.lemon.base.dao.impl.BaseDao;
import com.lemon.base.service.IBaseService;

public abstract class BaseService<T> implements IBaseService<T> {
	@Autowired
	private BaseDao<T> baseDao;

	private static final long serialVersionUID = -8206975034992193024L;
	
	public Session getSession(){
		return baseDao.getSession();
	}
	public JdbcTemplate getJdbcTemplate(){
		return baseDao.getJdbcTemplate();
	}
	
	public BaseDao<T> getBaseDao(){
		return baseDao;
	}

	public void save(T entity) {
		baseDao.save(entity);
	}

	public T get(Serializable id) {
		return baseDao.get(id);
	}

	public void delete(T entity) {
		baseDao.delete(entity);
	}

	public T update(T entity) {
		return baseDao.update(entity);
	}

	public List<T> getAll() {
		return baseDao.getAll();
	}

	public T getByHQL(String hql, Map<String, Object> params) {
		return baseDao.getByHQL(hql, params);
	}
	

}
