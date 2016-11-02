package com.zbk.session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zbk.base.Interface.dao.AbstractHibernateDao;
import com.zbk.base.Interface.service.AbstractService;

@Service
@Transactional
public class SessionServiceImpl extends AbstractService<Session, Integer> {

	@Autowired
	private SessionDaoImpl sessionDao;

	@Override
	public AbstractHibernateDao<Session, Integer> getDao() {
		return this.sessionDao;
	}
    

}
