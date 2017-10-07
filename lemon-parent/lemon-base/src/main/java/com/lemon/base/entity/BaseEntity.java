package com.lemon.base.entity;

import java.io.Serializable;
import java.lang.reflect.Field;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public class BaseEntity implements Serializable{

	private static final long serialVersionUID = 8008962056333938696L;
	private static final int privateStaticFinal = 26;
	
	public String toJSON() throws IllegalArgumentException, IllegalAccessException {
        StringBuilder jsonBuff = new StringBuilder();
        jsonBuff.append("{");
        Field[] fields = this.getClass().getDeclaredFields();
        for (Field item : fields) {
            if (item.getModifiers() == privateStaticFinal) {
                continue;
            }
            item.setAccessible(true);
            String name = item.getName();
            jsonBuff.append("\"" + name + "\"" + ":");
            Object value = item.get(this);
            if (value != null) {
                Class<?> type = item.getType();
                if (type == String.class) {
                    jsonBuff.append(value);
                } else if (type == int.class || type == Integer.class) {
                    jsonBuff.append(value);
                } else if (type == short.class || type == Short.class) {
                    jsonBuff.append(value);
                } else if (type == long.class || type == Long.class) {
                    jsonBuff.append(value);
                } else if (type == float.class || type == Float.class) {
                    jsonBuff.append(value);
                } else if (type == double.class || type == Double.class) {
                    jsonBuff.append(value);
                } else if (type == char.class || type == Character.class) {
                    jsonBuff.append("\"" + value + "\"");
                } else if (type == boolean.class || type == Boolean.class) {
                    jsonBuff.append(value);
                } else if (type == Map.class) {
                    jsonBuff.append(mapToString((Map)value));
                } else if (type == List.class) {
                    jsonBuff.append(listToString((List)value));
                } else if (type.getSuperclass() == BaseEntity.class) {
                    jsonBuff.append(((BaseEntity)value).toJSON());
                }
            }
            jsonBuff.append(",");
        }
        return rtrim(jsonBuff, ",") + "}";
    }
	public String mapToString(Map<String, ? extends Object> map) {
        StringBuilder buff = new StringBuilder();
        Iterator<String> iter = map.keySet().iterator();
        buff.append("{");
        while (iter.hasNext()) {
            String name = iter.next();
            Object value = map.get(name);
            buff.append("\"" + name + "\"" + ":");
            if (value != null) {
                String valueStr = String.valueOf(value);
                if (value.getClass() == String.class) {
                    buff.append("\"" + valueStr + "\"");
                } else {
                    buff.append(valueStr);
                }
            }
            buff.append(",");
        }
        return rtrim(buff, ",") + "}";
    }
    
    public String listToString(List<? extends Object> list) {
        StringBuilder buff = new StringBuilder();
        buff.append("[");
        for (Object value : list) {
            String valueStr = String.valueOf(value);
            if (value.getClass() == String.class) {
                buff.append("\"" + valueStr + "\"");
            } else {
                buff.append(valueStr);
            }
            buff.append(",");
        }
        return rtrim(buff, ",") + "]";
    }
    
    public String rtrim(StringBuilder buff, String suffix) {
        String content = buff.toString();
        if (content.endsWith(suffix)) {
            content = content.substring(0, content.length() - suffix.length());
        }
        return content;
    }
}
