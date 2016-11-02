package com.zbk.base.constant;

import java.util.ArrayList;
import java.util.List;
import com.zbk.base.exception.OfficeException;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

//constant常量不变的
public class ParamConstants {
	//判断入参是否为空
	public static boolean IsEmpty(Object value) {
		//当value为对象时，判空。
		if (value == null) {
			return true;
		}
		//入参是否是String的衍生类，当入参为String类型时的判空。
		if (value instanceof String) {
			String string = (String) value;
		
			if (string.trim().equals("")) {
				return true;
			}
		}
		//当对象为JSONObject 时 判空
		if (value instanceof JSONObject) {
			if (((JSONObject) value).keySet().size() == 0) {
				return true;
			}
		}
		//当对象为JSONArrary时判空
		if (value instanceof JSONArray) {
			if (((JSONArray) value).size() == 0) {
				return true;
			}
		}
		return false;
	}

	public static boolean IsZero(Object value) {

		if (ParamConstants.IsEmpty(value)) {
			return true;
		}
		if (value instanceof String) {
			String str = ((String) value).trim();
			if (str.equals("")) {
				return true;
			}
			try {
				if (Integer.parseInt(str) == 0) {
					return true;
				}
			} catch (Exception e) {
				// TODO: handle exception
				return false;
			}
		}
		if (value instanceof Integer) {
			if (((Integer) value).intValue() == 0) {
				return true;
			}
		}
		if (value instanceof Long) {
			if (((Long) value).longValue() == 0L) {
				return true;
			}
		}
		return false;
	}
//如果没有就报错
	public static void checkParam(JSONObject jsonObject, Object... keys)
	        throws OfficeException {
		clearParam(jsonObject, false);
		for (Object key : keys) {
			if (key != null && key.equals("") == false) {
				if (jsonObject.containsKey(key) == false
				        || ParamConstants.IsZero(jsonObject.get(key))) {
					throw new OfficeException(
					        OfficeException.NO_REQUIRED_PARAM,
					        "the param '" + key + "' is required.");
				}
			}
		}
	}
//如果有就报错
	public static void checkNoParam(JSONObject jsonObject, Object... keys)
	        throws OfficeException {
		clearParam(jsonObject, false);
		for (Object key : keys) {
			if (jsonObject.containsKey(key)) {
				throw new OfficeException(
				        OfficeException.HAS_FORBIDDEN_PARAM, "the param '"
				                + key + "' is required.");
			}
		}
	}

	/**
	 * 通过 json串 构造JSONObject<br/>
	 * 并检测必需参数. 注意：0 会认为是没有传.
	 * 
	 * @param string
	 * @param keys
	 * @return
	 * @throws ActionFailedException
	 */
	public static JSONObject createAndCheck(String string, Object... keys)
	        throws OfficeException {
		JSONObject json = JSONObject.fromObject(string);
		ParamConstants.checkParam(json, keys);
		return json;
	}

	public static JSONObject createAndCheckNo(String json, Object... keys)
	        throws OfficeException {
		JSONObject jsonObject = JSONObject.fromObject(json);
		ParamConstants.checkNoParam(jsonObject, keys);
		return jsonObject;
	}

	/**
	 * 
	 * 
	 * @param obj
	 * @param alsoZero
	 *           
	 */
	public static void clearParam(JSONObject obj, boolean alsoZero) {
		List<Object> keys = new ArrayList<Object>();
		for (Object key : obj.keySet()) {
			if ((alsoZero && IsZero(obj.get(key)) || ParamConstants.IsEmpty(obj
			        .get(key)))) {
				keys.add(key);
			}
		}
		for (Object key : keys) {
			obj.remove(key);
		}
	}
}