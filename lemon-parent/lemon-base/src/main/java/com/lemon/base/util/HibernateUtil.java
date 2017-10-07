package com.lemon.base.util;

import java.lang.annotation.Annotation;
import java.lang.reflect.Field;
import java.lang.reflect.Method;

import org.apache.commons.lang3.StringUtils;

public class HibernateUtil {

	/**
	 * 根据实体类字段的注解，获取此实体对象的主键（属性名）
	 * @param entityClass 实体类的class
	 * @return 主键的属性名，否则返回空字符串
	 */
	public static String getEntityPKName(Class entityClass) {
		if (entityClass == null) {
			return "";
		}
		Field[] fields = entityClass.getDeclaredFields();
		for (Field f : fields) {
			Annotation[] annotations = f.getAnnotations();
			if (annotations.length <= 0) {
				String name = f.getName();
				String setMethodName = "get" + StringUtils.left(name, 1).toUpperCase() + StringUtils.substring(name, 1);
				try {
					Method method = entityClass.getDeclaredMethod(setMethodName);
					annotations = method.getAnnotations();
				} catch (Exception e) {
					if (!name.equals("serialVersionUID")) {
						return "";
					}
				}
			}
			for (Annotation anno : annotations) {
				if (anno.toString().contains("@javax.persistence.Id()"))
					return f.getName();
			}
		}
		return "";
	}

}
