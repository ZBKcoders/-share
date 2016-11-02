package com.zbk.user.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zbk.base.bo.QueryResult;
import com.zbk.base.constant.ResponseVoConstant;
import com.zbk.base.vo.ResponseVo;
import com.zbk.user.User;
import com.zbk.user.userServiceImpl;


@Controller
@RequestMapping(value = "/user")
public class userController {

	@Resource(name="userService")
	userServiceImpl userService;
     
	protected Logger webLogger = LoggerFactory.getLogger("调试日志");
	//编辑也就是update，当有id时通过id更新，没有时通过save存储
	@RequestMapping(value = "/editUser")
	public @ResponseBody ResponseVo createUser(@RequestParam String json) {
		JSONObject bean=JSONObject.fromObject(json);
		User user=(User) JSONObject.toBean(bean,User.class);
		webLogger.debug(user.toString());
		this.userService.save(user);
		return ResponseVo.status(ResponseVoConstant.OK).message("修改成功");
	}

	@RequestMapping(value = "user")
	public String quilkly() {

		return "userMenu";
	}

	// 分页查询有待改善
	@RequestMapping(value = "/pageQuery")
	public @ResponseBody QueryResult<User> pageQuery(@RequestParam String json) {
		webLogger.debug(json.toString());
		String hql = "from User";
		QueryResult<User> result = new QueryResult<User>();
		result.setPageNum(1);
		result.setPageSize(7);
		result = this.userService.queryList(result, hql);
		return result;
	}

	// get()通过ID查询
	@RequestMapping(value = "/getUserById")
	public @ResponseBody ResponseVo getUser(@RequestParam String json) {
	
	   JSONObject requestJson=JSONObject.fromObject(json);
	   String userId="";
	   if(requestJson.containsKey("userId")){
		    userId=requestJson.getString("userId");
	   }
		User user = this.userService.getById(Integer.valueOf(userId));
		
		
		return ResponseVo.status(ResponseVoConstant.OK).value(user);
	}
//更新数据
	@RequestMapping(value = "/edUser")
	public String updateUser() {
		User user = new User("", "1234", 3);
		user.setUserId(2);
		this.userService.update(user);
		System.out.println(user);
		return "success";
	}

	// 删除user 通过ID实体类
	@RequestMapping(value = "/deleteUser")
	public @ResponseBody ResponseVo deleteUser(@RequestParam String json) {
	
	JSONObject bean=JSONObject.fromObject(json);
	if(!bean.containsKey("userId")){
		return ResponseVo.status(ResponseVoConstant.INTERNAL_ERROR);
	}
		User user=this.userService.deleteById(Integer.valueOf(bean.getString("userId")));
		
		return ResponseVo.status(ResponseVoConstant.OK).value(user).message("删除成功");
	}

	@RequestMapping(value = "/register")
	public String register(@RequestParam User user) {

		return "redirect:login.jsp";
	}

	@RequestMapping(value = "/queryByName")
	public void queryByName() {

		List<User> user = this.userService.queryByName("周");
		for (User u : user) {
			System.out.println("zbk" + u.toString());
		}
	}

	// Do
	@RequestMapping(value = "/index")
	public String index() {

		return "redirect:/login.jsp";
	}

	// Do
	@RequestMapping(value = "/info")
	public String info() {

		return "manage";
	}

	// Do
	@RequestMapping(value = "/login")
	public String login(
			@RequestParam(value = "userName", required = true) String userName,
			@RequestParam(value = "passWord", required = true) String passWord,
			HttpServletRequest request) {
		System.out.println(userName);
		System.out.println(passWord);
		User user = this.userService.validateLogin(userName, passWord);
		if (user == null) {
			return "redirect:index";
		}
		HttpSession session = request.getSession();
		session.setAttribute("infomation", user);
		return "redirect:info";
	}
    @RequestMapping(value="/testt")
    public void test(){
    		JSONObject likeJson=new JSONObject();
    		JSONObject seacherJson=new JSONObject();
    		likeJson.put("userName","张%");
   		seacherJson.put("pageNum", "1");
 		seacherJson.put("pageSize", "7");
    		seacherJson.put("LIKE", likeJson);
    		
    	          QueryResult<?> user=this.userService.queryByCriteria(seacherJson);
    	          System.out.println(user.getResult());
    }
}
