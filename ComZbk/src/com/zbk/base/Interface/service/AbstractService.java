package com.zbk.base.Interface.service;

import java.io.Serializable;
import java.util.List;

import net.sf.json.JSONObject;

import org.hibernate.Query;
import org.hibernate.ScrollableResults;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.transaction.annotation.Transactional;

import com.zbk.base.Interface.Pojo;
import com.zbk.base.Interface.dao.AbstractHibernateDao;
import com.zbk.base.bo.QueryResult;
import com.zbk.base.exception.OfficeException;
import com.zbk.base.utils.PojoUtils;

@SuppressWarnings("unchecked")
@Transactional
public abstract class AbstractService<T extends Pojo, PK extends Serializable> {

	protected static final String EHCACHENAME = "${ehcache_name}";

	protected Logger webLogger = LoggerFactory.getLogger("webLogger");

	public AbstractService() {

	}
	
	public abstract AbstractHibernateDao<T, PK> getDao();
	//缓存，value是存到哪里
	@Cacheable(value = EHCACHENAME, key = "#root.target.entityClassName + #id")
	public T get(PK id) {
		T t = this.getDao().get(id);
		return t;
	}

	
	@Cacheable(value = EHCACHENAME, key = "#root.target.entityClassName")
	public String getEntityClassName() {
		return this.getDao().getEntityClass().getName();
	}
	/*
	 * start 
	 */
	@Cacheable(value = EHCACHENAME, key = "#root.target.entityClassName + #t.key", condition = "#t.key != null")
	public T create(T t) {
		this.getDao().save(t);
		return t;
	}

	@SuppressWarnings("hiding")
	public <T> QueryResult<T> queryList(QueryResult<T> result,String hql){
		
		Query q=this.getDao().createQuery(hql);
		int first=(result.getPageNum()-1)*result.getPageSize();
		int max=result.getPageSize();
		q.setFirstResult(first);//从哪一条开始
		q.setMaxResults(max);//取出几条记录
		Query p=this.getDao().createQuery(hql);
		ScrollableResults scrol=p.scroll();
		scrol.last();
		int totalNum=scrol.getRowNumber()+1;
		List<T> list=q.list();
		result.setResult(list);
		//共分了几页

		result.setResultAmount(totalNum);
		return  result;
	}
	 
	public T getById(PK id){
		T t=this.get(id);
		return t;
	}
	
	@CachePut(value = EHCACHENAME, key = "#root.target.entityClassName + #t.key")
	public T update(T t) {
		this.getDao().saveOrUpdate(t);
		return t;
	}

	@CacheEvict(value = EHCACHENAME, key = "#root.target.entityClassName + #t.key")
	public T delete(T t) {
		this.getDao().delete(t);
		return t;
	}

	public T deleteById(PK id) {
		return this.delete(this.get(id));
	}

	public T save(T t) {
		if (t.getKey() != null) {
			return this.update(t);
		} else {
			return this.create(t);
		}
	}

	public T createByJson(JSONObject jsonObject) {
		T t;
		try {
			t = (T) PojoUtils.convertTo(jsonObject, this.getDao()
					.getEntityClass());
			return this.create(t);
		} catch (OfficeException e) {
			e.printStackTrace();
			return null;
		}
	}

	public T createByJson(String jsonString) {
		return this.createByJson(JSONObject.fromObject(jsonString));
	}

	public T createOrUpdateByJson(JSONObject jsonObject) {
		T t;
		try {
			t = (T) PojoUtils.convertTo(jsonObject, this.getDao().getClass());
			if (t.getKey() == null) {
				return this.create(t);
			} else {
				t = this.get((PK) t.getKey());
				PojoUtils.Load4Json(t, jsonObject);
				return this.update(t);
			}
		} catch (OfficeException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}

	public T createOrUpdateByJson(String jsonString) {
		return this.createOrUpdateByJson(JSONObject.fromObject(jsonString));
	}

	public T updateByJson(JSONObject jsonObject) throws OfficeException {
		T t = (T) PojoUtils.convertTo(jsonObject, this.getDao()
				.getEntityClass());
		if (t.getKey() == null) {
			throw new OfficeException(OfficeException.BAD_REQUEST, "请指定要更新的对象.");
		}
		t = this.get((PK) t.getKey());
		PojoUtils.Load4Json(t, jsonObject);
		return this.update(t);
	}

	public T updateByJson(String jsonString) throws OfficeException {
		return this.updateByJson(JSONObject.fromObject(jsonString));
	}

	public T saveOrUpdate(T t) {
		if (t.getKey() == null) {
			return this.create(t);
		} else {
			return this.update(t);
		}
	}

	public T deleteByJson(JSONObject jsonObject) throws OfficeException {
		T t = (T) PojoUtils.convertTo(jsonObject, this.getDao()
				.getEntityClass());
		if (t.getKey() == null) {
			throw new OfficeException("请指定要删除的对象.");
		}
		this.deleteById((PK) t.getKey());
		return t;
	}

	public T deleteByJson(String jsonString) throws OfficeException {
		return this.deleteByJson(JSONObject.fromObject(jsonString));
	}

	protected void dealWithElement(Object t) {

	}

	public QueryResult<?> queryByCriteria(JSONObject jsonObject) {
		QueryResult<?> queryResult = this.getDao().queryByCriteria(jsonObject);
	List<?> list = queryResult.getResult();
		for (Object t : list) {
		this.dealWithElement(t);
        }
		return queryResult;
	}

	@Transactional(readOnly = true)
	public List<T> query(String hql, Object... objects) {
		return this.getDao().query(hql, objects);
	}

	 @Transactional(readOnly = true)
	public T queryOne(String hql, Object... objects) {
		return this.getDao().queryOne(hql, objects);
	}

	/**
	 * 查询，自动确定返回类型<br/>
	 * 但不做类型匹配检测<br/>
	 * 
	 * @param hql
	 * @param objects
	 * @return
	 */
	@Transactional(readOnly = true)
	public <E> List<E> queryAny(String hql, Object... objects) {
		return this.getDao().queryAny(hql, objects);
	}

	@Transactional(readOnly = true)
	public <E> E queryAnyOne(String hql, Object... objects) {
		return this.getDao().queryAnyOne(hql, objects);
	}

	public int executeQuery(String hql, Object... objects) {
		return this.getDao().executeQuery(hql, objects);
	}

	public T get(PK id, boolean nullCheck) throws OfficeException {
		T t = this.get(id);
		if (nullCheck && t == null) {
			throw new OfficeException("不存在的记录：" + id);
		}
		return t;
	}

	public <E> E getView(PK id) {
		return (E) this.getDao().get(this.getDao().getViewClass(), id);
	}

	public <E> E get(Class<E> clazz, Serializable id) {
		return this.getDao().get(clazz, id);
	}

	protected Query createQuery(String hql, Object... objects) {
		// TODO Auto-generated method stub
		return this.getDao().createQuery(hql, objects);
	}

	/**
	 * 通过 JSONObject 直接读取实体<br/>
	 * 如果进行空值检测在空值的时候会抛出异常<br/>
	 * 
	 * @param object
	 * @param nullCkeck
	 *            指定是否进行空值检测
	 * @return
	 * @throws OfficeException
	 */
	public T getByJson(JSONObject object, boolean nullCkeck)
			throws OfficeException {
		T t = (T) JSONObject.toBean(object, this.getDao().getEntityClass());
		Serializable id = t.getKey();
		if (null == id) {
			throw new OfficeException("缺少主键参数.");
		}
		t = this.get((PK) id);
		if (null == t && nullCkeck) {
			throw new OfficeException("主键参数有误：查无此值 " + id);
		}
		return t;
	}

	@Transactional(readOnly = true)
	public <E> E queryScalar(String hql, Object... objects) {
		return this.getDao().queryScalar(hql, objects);
	}

	public Query invokeNamedQuery(String queryName) {
		return this.getDao().getSession().getNamedQuery(queryName);
	}
}