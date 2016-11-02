package com.zbk.base.utils;

import java.lang.reflect.Field;
import java.math.BigDecimal;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Hashtable;

import com.zbk.base.exception.OfficeException;

import net.sf.json.JSONObject;


public class PojoUtils {
	// TODO 
	public static void Load4Hash(Object object, Hashtable<String, String> param)
	        throws OfficeException {
		Field[] fields = object.getClass().getDeclaredFields();
		PojoUtils.Load4Hash(object, fields, param);

		// TODO If Has SuperClass, Load From SuperClass.Fields
		Class<?> superClass = object.getClass().getSuperclass();
		while (superClass != null) {
			fields = superClass.getDeclaredFields();
			PojoUtils.Load4Hash(object, fields, param);
			superClass = superClass.getSuperclass();
		}
	}

	private static void Load4Hash(Object object, Field[] fields,
	        Hashtable<String, String> param) throws OfficeException {
		for (Field field : fields) {
			String fieldName = field.getName();
			String fieldValue = param.get(fieldName);
			if (param.containsKey(fieldName)) {
				PojoUtils.setValue(object, field, fieldValue);
			}
		}
	}

	public static void Load4Json(Object object, JSONObject jsonObject)
	        throws OfficeException {
		Field[] fields = object.getClass().getDeclaredFields();
		for (Field field : fields) {
			String fieldName = field.getName();
			if (jsonObject.containsKey(fieldName)) {
				PojoUtils.setValue(object, field, jsonObject.get(fieldName));
				System.out.println("PojoUtils.Load4Json()"+jsonObject.get(fieldName).toString());
			}
		}
	}

	private static void setValue(Object object, Field field, Object value)
	        throws OfficeException {
		if (object == null || field == null || value == null) {
			return;
		}
		String typeName = field.getType().getName();
		String fieldValue = "";
		try {
			field.setAccessible(true);
			if (field.getType().equals(value.getClass())) {
				field.set(object, value);
				return;
			} else {
				fieldValue = value.toString();
			}
			if (typeName == Integer.class.getName() || typeName.equals("int")) {
				field.set(object, Integer.parseInt(fieldValue));
			} else if (typeName == Long.class.getName()
			        || typeName.equals("long")) {
				field.set(object, Long.parseLong(fieldValue));
			} else if (typeName == Double.class.getName()
			        || typeName.equals("double")) {
				field.set(object, Double.parseDouble(fieldValue));
			} else if (typeName == Float.class.getName()
			        || typeName.equals("float")) {
				field.set(object, Float.parseFloat(fieldValue));
			} else if (typeName == String.class.getName()) {
				field.set(object, fieldValue);
			} else if (typeName == BigDecimal.class.getName()) {
				field.set(object,
				        BigDecimal.valueOf(Double.parseDouble(fieldValue)));
			} else if (typeName == Date.class.getName()) {
				field.set(object, Date.valueOf(fieldValue));
			} else if (typeName == java.util.Date.class.getName()) {
				if (fieldValue.length() < "1970-1-2 0:0:0".length()) {
					fieldValue += " 00:00:00";
				}
				field.set(object,
				        new java.util.Date(Timestamp.valueOf(fieldValue)
				                .getTime()));
			} else if (typeName == Timestamp.class.getName()) {
				if (fieldValue.length() < "1970-1-2 0:0:0".length()) {
					fieldValue += " 00:00:00";
				}
				field.set(object, Timestamp.valueOf(fieldValue));
			} else if (typeName == Date.class.getName()) {
				field.set(object, Date.valueOf(fieldValue));
			} else if (typeName == java.util.Date.class.getName()) {
				SimpleDateFormat sdf = new SimpleDateFormat(
				        "yyyy-MM-dd HH:mm:ss");
				field.set(object, sdf.parse(fieldValue));
			} else if (typeName == "boolean"
			        || typeName.equals(Boolean.class.getName())) {
				field.set(object, Boolean.parseBoolean(fieldValue));
			} else {

			}
		} catch (Exception e) {
			// e.printStackTrace();
			String format = "Param error : %s is %s but value is %s.";
			throw new OfficeException("400", String.format(format,
			        field.getName(), field.getType().getName(), fieldValue));
		}
	}

	public static Object convertTo(JSONObject jsonObject, Class<?> clazz)
	        throws OfficeException {
		Object object;
		try {
			object = clazz.newInstance();
			PojoUtils.Load4Json(object, jsonObject);
			return object;
		} catch (OfficeException e) {
			throw e;
		} catch (Exception e) {
			throw new OfficeException(OfficeException.INTERNAL_ERROR,
			        e.getMessage());
		}
	}

	class Test {
		private int id;
		private String name;
		private Long verId;

		public int getId() {
			return id;
		}

		public void setId(int id) {
			this.id = id;
		}

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public Long getVerId() {
			return verId;
		}

		public void setVerId(Long verId) {
			this.verId = verId;
		}
	}

	public static void main(String[] args) {

		// Field[] fields = Test.class.getDeclaredFields();
		// for (Field field : fields) {
		// System.out.println(String.format("FieldName : %s, FieldType : %s",
		// field.getName(), field.getType()));
		// }
		//
		// System.out.println(new java.util.Date());

		// JSONObject jsonObject =
		// JSONObject.fromObject(ResponseVo.status(ResponseVoConstant.OK).message("娴ｇ姴銈介崯锟�").finished(false));
		// System.out.println(jsonObject);
		// ResponseVo responseVo = (ResponseVo) JSONObject.toBean(jsonObject,
		// ResponseVo.class);
		// System.out.println(responseVo);
		//
		// jsonObject = JSONObject.fromObject(new UniversityApp());
		// System.out.println(jsonObject);

		// for (int i = 0; i < 10; i++) {
		// System.out.println(UUID.randomUUID().toString().substring(0, 8));
		// }
		// System.out.println(UUID.randomUUID());
		// System.out.println(UUID.randomUUID());

		// Calendar calendar = Calendar.getInstance();
		// calendar.setTimeInMillis(System.currentTimeMillis());
		// System.out.println(calendar.getTime());
		// calendar.add(Calendar.DAY_OF_MONTH, -21);
		// System.out.println(calendar.getTime());

		System.out.println(System.currentTimeMillis());
		System.out.println(new java.util.Date(1395810600000L));
	}
}