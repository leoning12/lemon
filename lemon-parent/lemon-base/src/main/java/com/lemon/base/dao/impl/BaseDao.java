package com.lemon.base.dao.impl;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import com.lemon.base.dao.IBaseHqlDao;
import com.lemon.base.dao.IBaseSqlDao;
import com.lemon.base.util.HibernateUtil;
import com.lemon.base.util.ReflectUtil;
import com.lemon.base.util.UUIDHelper;

public abstract class BaseDao<T> implements IBaseHqlDao<T>,IBaseSqlDao{
	
	private static final long serialVersionUID = -5274280042995891677L;
	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Autowired
	private SessionFactory sessionFactory;
	private Class<T> entityClass;

	@SuppressWarnings("unchecked")
	public BaseDao() {
		Type type = getClass().getGenericSuperclass();
		if (type instanceof ParameterizedType) {
			this.entityClass =  (Class<T>) ((ParameterizedType) type).getActualTypeArguments()[0];
		} else {
			this.entityClass = null;
		}
	}
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	public JdbcTemplate getJdbcTemplate(){
		return jdbcTemplate;
	}
	/**************************↓↓↓↓↓↓↓↓↓↓以下是hql操作↓↓↓↓↓↓↓↓↓↓*****************************/
	@Override
	public T save(T entity) {
		//createIdForPK(entity);
		Serializable pk = getSession().save(entity);
		return get(pk);
	}
	protected Object createIdForPK(T entity){
		String pkKey = HibernateUtil.getEntityPKName(entity.getClass());
		Object id = ReflectUtil.getProperty(entity, pkKey);
		if (id == null) {
			id = UUIDHelper.generateUUID();
			ReflectUtil.setProperty(entity, pkKey, id);
		}
		return id;
	}
	@SuppressWarnings("unchecked")
	@Override
	public T get(Serializable id) {
		return (T) getSession().get(entityClass, id);
	}
	public void delete(T entity) {
		getSession().delete(entity);
	}
	@SuppressWarnings("unchecked")
	@Override
	public T update(T entity) {
		return (T) getSession().merge(entity);
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<T> getAll() {
		return getSession().createQuery("from "+entityClass.getName()).list();
	}
	@SuppressWarnings("unchecked")
	@Override
	public T getByHQL(String hql, Map<String, Object> params) {
		Query query = getSession().createQuery(hql);
		if (params != null && !params.isEmpty()) {
			if (params != null && !params.isEmpty()) {
                for (String key : params.keySet()) {
                    query.setParameter(key, params.get(key));
                }
            }
		}
		return (T) query.uniqueResult();
	}
}
