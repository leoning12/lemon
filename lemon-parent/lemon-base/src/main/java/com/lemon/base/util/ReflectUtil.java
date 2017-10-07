package com.lemon.base.util;

import java.lang.reflect.Field;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


public class ReflectUtil {
	private final static Logger logger = LoggerFactory.getLogger(ReflectUtil.class);

	public static Object getProperty(Object object, String property) {
		Field[] fields = object.getClass().getDeclaredFields();
		Field field = null;
		for (Field f : fields) {
			field = f;
			field.setAccessible(true);
			if (property.equals(field.getName())) {
				try {
					return field.get(object);
				} catch (IllegalArgumentException e) {
					logger.error("调用ReflectUtil.getProperty方法出现异常，参数错误："+e);
				} catch (IllegalAccessException e) {
					logger.error("调用ReflectUtil.getProperty方法出现访问异常，bean可能没有指定的方法："+e);
				}
			}
		}
		return null;

	}
	public static void setProperty(Object object, String property,Object value) {
		Field[] fields = object.getClass().getDeclaredFields();
		Field field = null;
		for (Field f : fields) {
			field = f;
			field.setAccessible(true);
			if (property.equals(field.getName())) {
				try {
					field.set(object, value);
				} catch (IllegalArgumentException e) {
					logger.error("调用ReflectUtil.setProperty方法出现参数异常，bean对象可能为空："+e);
				} catch (IllegalAccessException e) {
					logger.error("调用ReflectUtil.setProperty方法出现访问异常，bean可能没有指定的方法："+e);
				}
			}
		}
		
	}

}
