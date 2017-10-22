package com.lemon.base.dao.impl;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.List;
import java.util.Map;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.util.Assert;
import org.springframework.util.StringUtils;

import com.lemon.base.dao.IBaseHqlDao;
import com.lemon.base.dao.IBaseSqlDao;
import com.lemon.base.util.HibernateUtil;
import com.lemon.base.util.PageBean;
import com.lemon.base.util.PageHelper;
import com.lemon.base.util.PageResult;
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
	@Override
	public List<T> getByProperty(String propertyName, Object value) {
		Assert.hasText(propertyName, "propertyName不能为空。");
		Criterion criterion = Restrictions.eq(propertyName, value);
		return find(criterion);
	}
	
	@Override
	public PageResult getPageList(String hql,PageHelper pageHelper) {
		Query query = getSession().createQuery(hql);
		int count = query.list().size();
		query.setMaxResults(pageHelper.getLimit());
		query.setFirstResult(pageHelper.getOffset());
		if (!StringUtils.isEmpty(pageHelper.getSort())) {
			hql += " order by "+pageHelper.getSort() + " "+pageHelper.getOrder();
		}
		List<T> list = query.list();
		PageResult pb = new PageResult(count, list);
		return pb;
	}
	
	@Override
	public PageResult getPageList(Class<T> entityClass,PageHelper pageHelper) {
		Criteria criteria = getSession().createCriteria(entityClass);
		int total = criteria.list().size();
		criteria.setMaxResults(pageHelper.getLimit());
		criteria.setFirstResult(pageHelper.getOffset());
		if (StringUtils.isEmpty(pageHelper.getSort())) {
			pageHelper.setSort(HibernateUtil.getEntityPKName(entityClass));
		}
		if (pageHelper.getOrder().equals("asc")) {
			criteria.addOrder(Order.asc(pageHelper.getSort()));
		}else {
			criteria.addOrder(Order.desc(pageHelper.getSort()));
		}
		List<T> rows = criteria.list();
		return new PageResult(total, rows);
	}
	/****************************hibernate tool method**************************************/
	/**
	 * 根据Criterion条件创建Criteria. 与find()函数可进行更加灵活的操作. 
	 * @param criterions 数量可变的Criterion
	 * @return
	 * 参考：http://blog.csdn.net/u013433821/article/details/48731367
	 */
	public Criteria createCriteria(final Criterion... criterions) {  
        Criteria criteria = getSession().createCriteria(entityClass);  
        for (Criterion c : criterions) {  
                criteria.add(c);  
        }  
        return criteria;
    }
	/**
	 * 按Criteria查询对象列表
	 * @param criterions 数量可变的Criterion
	 * @return
	 */
	public List<T> find(final Criterion... criterions) {  
        return createCriteria(criterions).list();
    }
	
}
