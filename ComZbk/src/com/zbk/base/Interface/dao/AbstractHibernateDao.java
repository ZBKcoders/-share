package com.zbk.base.Interface.dao;

import java.io.Serializable;
import java.lang.reflect.Field;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Set;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;
import com.zbk.base.constant.ParamConstants;
import com.zbk.base.bo.QueryResult;
import com.zbk.base.utils.PojoUtils;

@SuppressWarnings("unchecked")
@Repository
public class AbstractHibernateDao<T, PK extends Serializable> implements
		GenericDao<T, PK> {

	protected static final String LIKE = "LIKE";
	protected static final String EQ = "EQ";
	protected static final String IN = "IN";
	protected static final String NULL = "NULL";
	protected static final String NOTNULL = "NOTNULL";
	protected static final String OR = "OR";
	protected static final String GT = "GT";
	protected static final String LT = "LT";
	protected static final String GE = "GE";
	protected static final String LE = "LE";
	protected static final String NE = "NE";
	protected static final String ORDER_ASC = "ASC";
	protected static final String ORDER_DESC = "DESC";
	protected static final String LIKE_TEMPLATE = "%%%s%%";
	protected Logger webLogger = LoggerFactory.getLogger("webLogger");
	protected Logger debugLogger = LoggerFactory.getLogger("debugLogger");

	@Autowired
	private SessionFactory sessionFactory;

	
	private static ThreadLocal<Field[]> fields = new ThreadLocal<Field[]>();

	
	private static ThreadLocal<List<String>> fieldNames = new ThreadLocal<List<String>>();

	public Class<T> entityClass;
	public AbstractHibernateDao() {
//		Type genType = getClass().getGenericSuperclass();
//        Type[] params = ((ParameterizedType) genType).getActualTypeArguments();
//        entityClass =  (Class)params[0];
	}
	public Class<T> getEntityClass() {
		 
		return this.entityClass;
	}

	public Class<?> getViewClass() {
		return this.entityClass;
	}

	



	public AbstractHibernateDao(SessionFactory sessionFactory,
			Class<T> entityClass) {
		this.sessionFactory = sessionFactory;
		this.entityClass = entityClass;
	}

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	@Override
	public PK save(T entity) {
		Assert.notNull(entity);
		PK id = null;
		id = (PK) getSession().save(entity);
		return id;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public void saveOrUpdate(T entity) {
		Assert.notNull(entity);
		getSession().saveOrUpdate(entity);
		webLogger.info("ZBK-----saveOrUpdate entity: {} ", entity);
		
	}

	@Override
	public void delete(T entity) {
		Assert.notNull(entity);
		getSession().delete(entity);
		webLogger.info("delete entity: {}", entity);
	}

	@Override
	public void deleteById(PK id) {
		Assert.notNull(id);
		delete(get(id));
	}

	@Override
	public T get(final PK id) {
		if (id == null) {
			return null;
		}
	
		return (T) getSession().get(entityClass, id);
	}

	public <E> E get(Class<E> clazz, Serializable id) {
		return (E) this.getSession().get(clazz, id);
	}


	public Query invokeNamedQuery(String queryName) {
		return getSession().getNamedQuery(queryName);
	}

	public Query createQuery(String hql, Object... objects) {
		Query query = this.getSession().createQuery(hql);
		if (objects != null && objects.length > 1) {
			for (int i = 0; i < objects.length; i += 2) {
				query.setParameter(objects[i].toString(), objects[i + 1]);
			}
		}
		
		return query;
	}
    public Query createQuery(String hql){
    	
    	Query query=this.getSession().createQuery(hql);
    	return query;
    }
	public List<T> query(String hql, Object... objects) {
		List<T> list = this.createQuery(hql, objects).list();
		return list;
	}

	public <E> List<E> queryAny(String hql, Object... objects) {
		List<E> list = this.createQuery(hql, objects).list();
		return list;
	}
	
	public T queryOne(String hql, Object... objects) {
		List<T> list = this.createQuery(hql, objects).list();
		if (null != list && list.size() > 0) {
			return list.get(0);
		} else {
			return null;
		}
	}

	public <E> E queryAnyOne(String hql, Object... objects) {
		List<E> list = this.createQuery(hql, objects).list();
		if (null != list && list.size() > 0) {
			return list.get(0);
		} else {
			return null;
		}
	}

	public int executeQuery(String hql, Object... objects) {
		Query query = this.createQuery(hql, objects);
		webLogger.info("execute Query : {} ", query.getQueryString());
		return query.executeUpdate();
	}

	public List<T> query(Query query, Object... objects) {
		if (objects != null && objects.length > 1) {
			for (int i = 0; i < objects.length; i += 2) {
				query.setParameter(objects[i].toString(), objects[i + 1]);
			}
		}
		return query.list();
	}

	public <ReturnType> ReturnType queryScalar(String hql, Object... objects) {
		ReturnType t = (ReturnType) this.createQuery(hql, objects)
				.uniqueResult();
		return t;
	}

	public T createOrUpdate(JSONObject json) throws Exception {
		T t = this.entityClass.newInstance();
		PojoUtils.Load4Json(t, json);
		this.saveOrUpdate(t);
		return t;
	}

	public T createByJson(JSONObject json) throws Exception {
		T t = this.entityClass.newInstance();
		PojoUtils.Load4Json(t, json);
		return t;
	}

	protected static final String PageSize = "pageSize";
	protected static final String PageNum = "pageNum";
	protected static final String ASC = "ASC";
	protected static final String DESC = "DESC";

	
	public Criteria generateCriteria(Class<?> clazz,
			QueryResult<?> queryResult, JSONObject json) {
//创建一个criteria
		Criteria criteria = this.getSession().createCriteria(clazz);
//不知道做什么的     《----
		Field[] tempFields = this.getFields(clazz);
		List<String> tempFieldNames = new ArrayList<String>();
		for (Field field : tempFields) {
			tempFieldNames.add(field.getName());
		}
		this.setFields(tempFields);
		this.setFieldNames(tempFieldNames);
//         -->>>>
		this.generateCommonConditions(clazz, queryResult, criteria, json);  
		System.out.println("1----->>>"+json+"---"+criteria.list());
		this.addCriterion(criteria, json, clazz);
		System.out.println("2----->>>"+json+"---"+criteria.list());
		this.addCriterions(criteria, json, clazz);
		System.out.println("3----->>>"+json+"---"+criteria.list());
		this.addOrder(criteria, json, clazz);
		System.out.println("4----->>>"+json+"---"+criteria.list());
		return criteria;
	}

	protected void generateCommonConditions(Class<?> clazz,
			QueryResult<?> queryResult, Criteria criteria, JSONObject json) {
		if (json.containsKey(PageSize)) {
			queryResult.setPageSize(json.getInt(PageSize));
		}
		if (json.containsKey(PageNum)) {
			queryResult.setPageNum(json.getInt(PageNum));
		}
	}

	/**
	 * 
	 * 
	 * @param criteria
	 * @param json
	 * @param clazz
	 * @return
	 */
	protected Criteria addCriterion(Criteria criteria, JSONObject json,
			Class<?> clazz) {

		Field[] fields = this.getFields(clazz);

		for (Field field : fields) {
			String propertyName = field.getName();
			if (json.containsKey(propertyName)) {
				if (field.getType() == String.class) {
					webLogger.info(propertyName
							+ " like "
							+ String.format(LIKE_TEMPLATE,
									json.getString(propertyName)));
					criteria.add(Restrictions.like(
							propertyName,
							String.format(LIKE_TEMPLATE,
									json.getString(propertyName))));
				} else if (field.getType() == int.class
						|| field.getType() == Integer.class) {
					criteria.add(Restrictions.eq(propertyName,
							json.getInt(propertyName)));
				} else if (field.getType() == long.class
						|| field.getType() == Long.class) {
					criteria.add(Restrictions.eq(propertyName,
							json.getLong(propertyName)));
				} else if (field.getType() == boolean.class
						|| field.getType() == Boolean.class) {
					criteria.add(Restrictions.eq(propertyName,
							json.getBoolean(propertyName)));
				}
			}
		}
		return criteria;
	}

	/**
	 * 
	 * 
	 * 
	 * 
	 * @param criteria
	 * @param json
	 * @param fields
	 * @return
	 */
	protected Criteria addOrder(Criteria criteria, JSONObject json,
			Class<?> clazz) {

		if (json.containsKey(ASC)) {
			JSONArray array = json.getJSONArray(ASC);
			for (Object object : array) {
				String key = object == null ? null : object.toString();
				if (false == this.isValidKey(key)) {
					continue;
				}
				criteria.addOrder(Order.asc(key));
			}
		}

		if (json.containsKey(DESC)) {
			JSONArray array = json.getJSONArray(DESC);
			for (Object object : array) {
				String key = object == null ? null : object.toString();
				if (false == this.isValidKey(key)) {
					continue;
				}
				criteria.addOrder(Order.desc(key));
			}
		}

		return criteria;
	}

	@Cacheable(value = "${ehcache_name}", key = "#clazz.name")
	public Field[] getFields(Class<?> clazz) {
		return clazz.getDeclaredFields();
	}
	//分页查询
	public QueryResult<?> queryByCriteria(Class<?> clazz, JSONObject json) {
		@SuppressWarnings("rawtypes")
		QueryResult<?> queryResult = new QueryResult();

		Criteria criteria = this.generateCriteria(clazz, queryResult, json);
		webLogger.info(criteria.toString());
//		Criteria criteriaRowCount = criteria;//查询总记录数
	  //  criteriaRowCount.setFirstResult(0);
	 //   criteriaRowCount.setMaxResults(0);
	   // criteriaRowCount.setProjection(Projections.rowCount());
	 //   queryResult.setResultAmount(Integer.parseInt(criteriaRowCount.uniqueResult().toString()));
	    queryResult.setPageAmount(criteria.list().size());
		if (queryResult.getPageSize() > 0) {
			criteria.setFirstResult(queryResult.getPageNum()
					* queryResult.getPageSize() - queryResult.getPageSize());
			criteria.setMaxResults(queryResult.getPageSize());
		}
		queryResult.setResult(criteria.list());
		
		return queryResult;
	}

	public QueryResult<?> queryByCriteria(JSONObject json) {
		ParamConstants.clearParam(json, true);
		return this.queryByCriteria(this.getViewClass(), json);
	}

	
	private Criteria addCriterions(Criteria criteria, JSONObject json,
			Class<?> clazz) {
		List<Criterion> restrictions = this.toCriterions(criteria, json, clazz);
		for (Criterion criterion : restrictions) {
			criteria.add(criterion);
		}
		this.debugLogger.info(criteria.toString());
		return criteria;
	}

	private List<Criterion> toCriterions(Criteria criteria, JSONObject json,
			Class<?> clazz) {

		List<Criterion> criterions = new ArrayList<>();
		Field[] fields = this.getFields(clazz);

		List<String> fieldNames = new ArrayList<>();
		for (Field field : fields) {
			fieldNames.add(field.getName());
		}
		Set<String> keys = json.keySet();
		for (String key : keys) {
			switch (key) {
			case LIKE:
				criterions
						.addAll(this.toLikeCriterions(json.getJSONObject(key)));
				break;
			case EQ:
				criterions.addAll(this.toEqCriterions(json.getJSONObject(key)));
				break;
			case IN:
				criterions.addAll(this.toInCriterions(json.getJSONObject(key)));
				break;
			case NULL:
				criterions
						.addAll(this.toNullCriterions(json.getJSONArray(key)));
				break;
			case NOTNULL:
				criterions.addAll(this.toNotNullCriterions(json
						.getJSONArray(key)));
				break;
			case OR:
				criterions.addAll(this.toOrCriterions(criteria,
						json.getJSONArray(key), clazz));
				break;
			case GT:
				criterions.addAll(this.toGtCriterions(json.getJSONObject(key)));
				break;
			case LT:
				criterions.addAll(this.toLtCriterions(json.getJSONObject(key)));
				break;
			case GE:
				criterions.addAll(this.toGeCriterions(json.getJSONObject(key)));
				break;
			case LE:
				criterions.addAll(this.toLeCriterions(json.getJSONObject(key)));
				break;
			case NE:
				criterions.addAll(this.toNeCriterions(json.getJSONObject(key)));
				break;
			default:
				break;
			}
		}
		return criterions;
	}

	
	private boolean isValidKey(String key) {
		return this.getFieldNames().contains(key);
	}

	private Object toActualValue(String key, String value) {
		if (null == value) {
			return null;
		}
		if (false == this.isValidKey(key)) {
			return null;
		}
		for (Field field : this.getFields()) {
			if (field.getName().equals(key)) {
				Class<?> clazz = field.getType();
				return this.toActualValue(clazz, value);
			}
		}
		return null;
	}

	
	private Object toActualValue(Class<?> clazz, String value) {
		String className = clazz.getSimpleName();
		switch (className) {
		case "int":
		case "Integer":
			return Integer.parseInt(value);
		case "long":
		case "Long":
			return Long.parseLong(value);
		case "float":
		case "Float":
			return Float.parseFloat(value);
		case "double":
		case "Double":
			return Double.parseDouble(value);
		case "BigDecimal":
			return BigDecimal.valueOf(Double.parseDouble(value));
		case "boolean":
		case "Boolean":
			return Boolean.valueOf(value);
		case "String":
			return value;
		case "Date":
		case "TimeStamp":
    case "Timestamp":
      if (value.length() < 12) {
        value = value + " :00:00:00";
      }
			return Timestamp.valueOf(value);
		default:
			// Unknown Type : className
			return null;
		}
	}

	private Collection<? extends Criterion> toLikeCriterions(JSONObject json) {
		List<Criterion> criterions = new ArrayList<>();
		Set<String> keys = json.keySet();
		for (String key : keys) {
			if (false == this.isValidKey(key)) {
				continue;
			}
			Object value = this.toActualValue(key, json.getString(key));
			if (null == value) {
				continue;
			}
			criterions.add(Restrictions.like(key, value));
		}
		return criterions;
	}

	private Collection<? extends Criterion> toEqCriterions(JSONObject json) {
		List<Criterion> criterions = new ArrayList<>();
		Set<String> keys = json.keySet();
		for (String key : keys) {
			if (false == this.isValidKey(key)) {
				continue;
			}
			Object value = this.toActualValue(key, json.getString(key));
			criterions.add(Restrictions.eq(key, value));
		}
		return criterions;
	}

	private Collection<? extends Criterion> toInCriterions(JSONObject json) {
		List<Criterion> criterions = new ArrayList<>();
		Set<String> keys = json.keySet();
		for (String key : keys) {
			if (false == this.isValidKey(key)) {
				continue;
			}
			JSONArray values = json.getJSONArray(key);
			List<Object> list = new ArrayList<Object>();
			for (int i = 0; i < values.size(); i++) {
				list.add(this.toActualValue(key, values.getString(i)));
			}
			criterions.add(Restrictions.in(key, list.toArray()));
		}
		return criterions;
	}

	private Collection<? extends Criterion> toNullCriterions(JSONArray json) {
		List<Criterion> criterions = new ArrayList<>();
		Object[] keys = json.toArray();
		for (Object key : keys) {
			if (false == this.isValidKey(key.toString())) {
				continue;
			}
			criterions.add(Restrictions.isNull(key.toString()));
		}
		return criterions;
	}

	private Collection<? extends Criterion> toNotNullCriterions(JSONArray json) {
		List<Criterion> criterions = new ArrayList<>();
		Object[] keys = json.toArray();
		for (Object key : keys) {
			if (false == this.isValidKey(key.toString())) {
				continue;
			}
			criterions.add(Restrictions.isNotNull(key.toString()));
		}
		return criterions;
	}

	private Collection<? extends Criterion> toOrCriterions(Criteria criteria,
			JSONArray array, Class<?> clazz) {

		List<Criterion> criterions = new ArrayList<>();

		List<JSONObject> jsons = new ArrayList<JSONObject>();
		for (int i = 0; i < array.size(); i++) {
			jsons.add(array.getJSONObject(i));
		}

		List<Criterion> andCriterions = new ArrayList<>();

		for (JSONObject json : jsons) {
			List<Criterion> tmpCriterions = this.toCriterions(criteria, json,
					clazz);
			if (tmpCriterions.size() < 1) {
				continue;
			}
			if (tmpCriterions.size() > 1) {
				andCriterions.add(Restrictions.and((Criterion[]) tmpCriterions
						.toArray()));
			} else {
				andCriterions.add(tmpCriterions.get(0));
			}
		}
		int l = andCriterions.size();
		Criterion[] tmpCriterions = new Criterion[l];
		for (int i = 0; i < l; i++) {
			tmpCriterions[i] = andCriterions.get(i);
		}
		Criterion orCriterion = Restrictions.or(tmpCriterions);
		criterions.add(orCriterion);
		return criterions;
	}

	private Collection<? extends Criterion> toGtCriterions(JSONObject json) {
		List<Criterion> criterions = new ArrayList<>();
		Set<String> keys = json.keySet();
		for (String key : keys) {
			if (false == this.isValidKey(key)) {
				continue;
			}
			Object value = this.toActualValue(key, json.getString(key));
			criterions.add(Restrictions.gt(key, value));
		}
		return criterions;
	}

	private Collection<? extends Criterion> toLtCriterions(JSONObject json) {
		List<Criterion> criterions = new ArrayList<>();
		Set<String> keys = json.keySet();
		for (String key : keys) {
			if (false == this.isValidKey(key)) {
				continue;
			}
			Object value = this.toActualValue(key, json.getString(key));
			criterions.add(Restrictions.lt(key, value));
		}
		return criterions;
	}

	private Collection<? extends Criterion> toGeCriterions(JSONObject json) {
		List<Criterion> criterions = new ArrayList<>();
		Set<String> keys = json.keySet();
		for (String key : keys) {
			if (false == this.isValidKey(key)) {
				continue;
			}
			Object value = this.toActualValue(key, json.getString(key));
			criterions.add(Restrictions.ge(key, value));
		}
		return criterions;
	}

	private Collection<? extends Criterion> toLeCriterions(JSONObject json) {
		List<Criterion> criterions = new ArrayList<>();
		Set<String> keys = json.keySet();
		for (String key : keys) {
			if (false == this.isValidKey(key)) {
				continue;
			}
			Object value = this.toActualValue(key, json.getString(key));
			criterions.add(Restrictions.le(key, value));
		}
		return criterions;
	}

	private Collection<? extends Criterion> toNeCriterions(JSONObject json) {
		List<Criterion> criterions = new ArrayList<>();
		Set<String> keys = json.keySet();
		for (String key : keys) {
			if (false == this.isValidKey(key)) {
				continue;
			}
			Object value = this.toActualValue(key, json.getString(key));
			criterions.add(Restrictions.ne(key, value));
		}
		return criterions;
	}

	public Field[] getFields() {
		return fields.get();
	}

	public void setFields(Field[] array) {
		fields.set(array);
	}

	public List<String> getFieldNames() {
		return fieldNames.get();
	}

	public void setFieldNames(List<String> list) {
		fieldNames.set(list);
	}

}