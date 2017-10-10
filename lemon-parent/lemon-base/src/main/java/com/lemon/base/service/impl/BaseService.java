package com.lemon.base.service.impl;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import com.lemon.base.dao.impl.BaseDao;
import com.lemon.base.service.IBaseService;
import com.lemon.base.util.PageBean;
import com.lemon.base.util.PageHelper;
import com.lemon.base.util.PageResult;

public abstract class BaseService<T> implements IBaseService<T> {
	@Autowired
	private BaseDao<T> baseDao;

	private static final long serialVersionUID = -8206975034992193024L;

	public Session getSession() {
		return baseDao.getSession();
	}

	public JdbcTemplate getJdbcTemplate() {
		return baseDao.getJdbcTemplate();
	}

	public BaseDao<T> getBaseDao() {
		return baseDao;
	}

	@Override
	public void save(T entity) {
		baseDao.save(entity);
	}

	@Override
	public T get(Serializable id) {
		return baseDao.get(id);
	}

	@Override
	public void delete(T entity) {
		baseDao.delete(entity);
	}

	@Override
	public T update(T entity) {
		return baseDao.update(entity);
	}

	@Override
	public List<T> getAll() {
		return baseDao.getAll();
	}

	@Override
	public T getByHQL(String hql, Map<String, Object> params) {
		return baseDao.getByHQL(hql, params);
	}

	@Override
	public List<T> getByProperty(String propertyName, Object value) {
		return baseDao.getByProperty(propertyName, value);
	}

	@Override
	public PageResult getPageList(String hql, PageHelper pageHelper) {
		// TODO Auto-generated method stub
		return baseDao.getPageList(hql, pageHelper);
	}

	@Override
	public PageResult getPageList(Class<T> entityClass, PageHelper pageHelper) {
		// TODO Auto-generated method stub
		return baseDao.getPageList(entityClass, pageHelper);
	}
	

}
