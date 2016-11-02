package com.zbk.user;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zbk.base.Interface.dao.AbstractHibernateDao;
import com.zbk.base.Interface.service.AbstractService;
import com.zbk.user.UserDao;
import com.zbk.user.User;

@Service("userService")
@Transactional
public class userServiceImpl extends AbstractService<User, Integer> {

	@Resource(name="userDao")
	private UserDao UserDao;

	@Override
	public AbstractHibernateDao<User, Integer> getDao() {
		return this.UserDao;
	}
    
	@SuppressWarnings("unchecked")
	public List<User> queryByName(String name){
		Query query=this.invokeNamedQuery("queryUser");
        query.setParameter("userName","%"+name+"%");
		List<User> user=query.list();
		
		return user;
	}
	
	public User validateLogin(String userName,String passWord){
		
		if(userName!=""&&passWord!=""){
			String hql="from User t where t.userName=:userName and t.passWord=:passWord";
			User user = queryOne(hql,"userName",userName,"passWord",passWord);
			return user;
		}
	   return null;
	}
}
