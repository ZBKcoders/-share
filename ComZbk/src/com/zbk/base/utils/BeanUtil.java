package com.zbk.base.utils;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;



public class BeanUtil {

  /**
   * 
   * 
   * @param clazz
   * @param fieldName
   * @return
   */
  public static boolean hasField(Class<?> clazz, String fieldName) {
    try {
      return null != clazz.getDeclaredField(fieldName);
    } catch (NoSuchFieldException e) {
      return false;
    } catch (SecurityException e) {
      e.printStackTrace();
    }
    return false;
  }

  public static List<String> getFieldNames(Class<?> clazz) {
    Field[] fields = clazz.getDeclaredFields();
    return BeanUtil.getFieldNames(fields);
  }

  public static List<String> getFieldNames(Field[] fields) {
    List<String> names = new ArrayList<>();
    for (int i = 0; i < fields.length; i++) {
      Field field = fields[i];
      names.add(field.getName());
    }
    return names;
  }

  public static Map<String, Object> toMap(Object object) {

    Map<String, Object> map = new HashMap<String, Object>();

    Field[] fields = object.getClass().getDeclaredFields();
    for (int i = 0; i < fields.length; i++) {
      Field field = fields[i];
      field.setAccessible(true);
      try {
        map.put(field.getName(), field.get(object));
      } catch (IllegalArgumentException | IllegalAccessException e) {
        // map.put(field.getName(), null);
      }
    }
    return map;
  }

  /**
   * 
   * 
   * @param object
   * @param fieldName
   * @return
   * @throws CampusPlusException
   */
 

  public static void main(String args[]) {
   // System.out.println(hasField(User.class, "userId"));
    String str = "http://www.campusplus.com/uploads/images/tqeditor/d75664f9-25ab-4d72-9cc3-6da53cf1c917.jpg";
    System.out.println(str.replace("tqeditor/", "tqeditor/thumbnail/"));
  }
}