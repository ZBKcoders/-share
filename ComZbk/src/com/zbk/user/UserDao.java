package com.zbk.user;

import org.springframework.stereotype.Repository;

import com.zbk.base.Interface.dao.AbstractHibernateDao;

import com.zbk.user.User;

@Repository("userDao")
public class UserDao extends AbstractHibernateDao<User, Integer>{
			
	public UserDao() {
		this.entityClass = User.class;
	}
}
