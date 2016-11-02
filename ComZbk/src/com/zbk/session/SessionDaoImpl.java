package com.zbk.session;

import org.springframework.stereotype.Repository;

import com.zbk.base.Interface.dao.AbstractHibernateDao;

@Repository
public class SessionDaoImpl extends AbstractHibernateDao<Session, Integer>{
			
	public SessionDaoImpl() {
		this.entityClass = Session.class;
	}
}
