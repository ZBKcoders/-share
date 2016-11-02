package com.zbk.base.Interface.dao;

import java.io.Serializable;

public interface GenericDao<T, PK extends Serializable> {

	public PK save(T entity);

	public void saveOrUpdate(T entity);

	public void delete(T entity);

	public void deleteById(PK id);

	public T get(final PK id);
	public <E> E get(Class<E> clazz, Serializable id);
}
