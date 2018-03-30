package cn.app.service.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.app.dao.AppCategoryMapper;
import cn.app.dao.AppInfoMapper;
import cn.app.dao.BackendUserMapper;
import cn.app.pojo.BackendUser;
import cn.app.vo.AppCategoryVo;
import cn.app.vo.AppInfoVo;
import cn.app.vo.UserInfoVo;
import cn.app.vo.UserVo;


@Service
public class BackUserServiceImpl implements BackUserService {
	@Autowired
	private BackendUserMapper bumapper;
	
	@Autowired
	private AppInfoMapper appInfoMapper;
	
	@Autowired
	private AppCategoryMapper appCategoryMapper;
	
	public void setUserMapper(BackendUserMapper bumapper) {
		this.bumapper = bumapper;
	}

	@Override
	public BackendUser login(String userCode, String userPassword) {
		BackendUser bu = null;
		try {
			bu = bumapper.selectByCodeAndPwd(userCode, userPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
		//ƥ������
		
		return bu;
	}

	
	public List<UserVo> queryAll() {
		List<UserVo> list = bumapper.selectAllUser();
		return list;
	}

	@Override
	public UserInfoVo selectById(Long id) {
		UserInfoVo userInfo = bumapper.selectById(id);
		return userInfo;
	}

	@Override
	public int addUser(BackendUser user) {
		int flag = bumapper.insert(user);
		return flag;
	}

	@Override
	public int modifyUser(BackendUser user) {
		int flag = bumapper.updateByPrimaryKey(user);
		return flag;
	}

	@Override
	public int deleteUser(Long id) {
		int flag = bumapper.deleteByPrimaryKey(id);
		return flag;
	}

}
