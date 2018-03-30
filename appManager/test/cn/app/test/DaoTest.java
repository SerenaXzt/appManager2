package cn.app.test;

import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.app.criteria.CriteriaApp;
import cn.app.dao.AppCategoryMapper;
import cn.app.dao.AppInfoMapper;
import cn.app.dao.AppVersionMapper;
import cn.app.dao.BackendUserMapper;
import cn.app.dao.DevUserMapper;
import cn.app.pojo.AppInfo;
import cn.app.pojo.AppVersion;
import cn.app.pojo.DevUser;
import cn.app.vo.AppCategoryVo;
import cn.app.vo.AppInfoVo;
import cn.app.vo.AppVersionVo;
import cn.app.vo.UserInfoVo;

public class DaoTest {

	
	@Test
	public void testDevUser(){
		ApplicationContext context = 
				new ClassPathXmlApplicationContext("applicationContext-mybatis.xml");
		DevUserMapper mapper = (DevUserMapper) context.getBean("devUserMapper");
		DevUser user = mapper.selectByCodeAndPwd("test001", "123456");
		System.out.println(user.getDevcode()+"   "+user.getDevname());
		
		
	}
	
	
	@Test
	public void testApp(){
		ApplicationContext context = 
				new ClassPathXmlApplicationContext("applicationContext-mybatis.xml");
		AppCategoryMapper appCategoryMapper = (AppCategoryMapper) context.getBean("appCategoryMapper");
		AppInfoMapper appInfoMapper = (AppInfoMapper) context.getBean("appInfoMapper");
		
		List<AppCategoryVo> acvList = appCategoryMapper.selectAllCategoryVo();
		AppInfoVo.setCategoryMap(acvList);
		//System.out.println(appInfoMapper.selectById(55));
		
		
	}
	
	@Test
	public void testApp2(){
		ApplicationContext context = 
				new ClassPathXmlApplicationContext("applicationContext-mybatis.xml");
		AppVersionMapper appVersionMapper = (AppVersionMapper) context.getBean("appVersionMapper");
		AppInfoMapper appInfoMapper = (AppInfoMapper) context.getBean("appInfoMapper");
		
		AppInfoVo appInfoVo = appInfoMapper.selectById(58l);
		System.out.println(appInfoVo);
		System.out.println(appInfoVo.getVersionList());
	}
	
	@Test
	public void testApp3(){
		ApplicationContext context = 
				new ClassPathXmlApplicationContext("applicationContext-mybatis.xml");
		BackendUserMapper backendUserMapper = (BackendUserMapper) context.getBean("backendUserMapper");
		
		UserInfoVo user =  backendUserMapper.selectById(2l);
		System.out.println(user);
		
	}
}
