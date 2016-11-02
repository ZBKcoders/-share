package com.zbk.session.dao;

import org.springframework.stereotype.Repository;

import com.zbk.base.Interface.dao.AbstractHibernateDao;
import com.zbk.session.Session;

@Repository
public class SessionDaoImpl extends AbstractHibernateDao<Session, Integer>{
			
	public SessionDaoImpl() {
		this.entityClass = Session.class;
	}
}
