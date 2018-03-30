package cn.app.service.user;

import java.util.List;

import cn.app.pojo.BackendUser;
import cn.app.vo.AppInfoVo;
import cn.app.vo.UserInfoVo;
import cn.app.vo.UserVo;



public interface BackUserService {
	/**
	 * 用户登录
	 * @param userCode
	 * @param userPassword
	 * @return
	 */
	public BackendUser login(String userCode,String userPassword);
	
	
	List<UserVo> queryAll();
	
	UserInfoVo selectById(Long id);
	
	int addUser(BackendUser user);
	
	int modifyUser(BackendUser user);
	
	int deleteUser(Long id);
}
