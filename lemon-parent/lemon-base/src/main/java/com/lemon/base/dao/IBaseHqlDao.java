package com.lemon.base.dao;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

public interface IBaseHqlDao<T extends Object> extends Serializable {
	/**
	 * 在数据库保存一个新的实体对象
	 * @param entity 实体对象（尚未持久化）
	 * @return
	 */
	public abstract T save(T entity);
	/**
	 * 根据对象ID（主键对象）从数据库获取对象实例
	 * @param id 对象的主键id
	 * @return 来自数据库的实体对象
	 */
	public T get(Serializable id);
	/**
	 * 从数据库删除一个实体对象
	 * @param entity 要删除的实体对象
	 */
	public void delete(T entity);
	/**
     * 更新数据库中的实体对象
     * @param entity （实体对象，已更改，尚未保存）
     * @return 更新后的实体对象（关联到数据库，【注意】后续不能再使用输入的entity对象，应使用本返回值!
     */
	public T update(T entity);
    /**
     * 从数据库返回本实体类的所有实例
     * @return 实体对象的数组
     */
    public List<T> getAll();
    /**
     * 执行HQL语句，指定参数（可为空）
     * @param hql
     * @param params
     * @return
     */
    public  T getByHQL(String hql, Map<String, Object> params);

}
