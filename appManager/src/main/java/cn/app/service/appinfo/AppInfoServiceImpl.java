package cn.app.service.appinfo;

import java.util.List;

import javax.annotation.PostConstruct;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.app.criteria.CriteriaApp;
import cn.app.dao.AppCategoryMapper;
import cn.app.dao.AppInfoMapper;
import cn.app.dao.DataDictionaryMapper;
import cn.app.dao.AppVersionMapper;
import cn.app.pojo.AppInfo;
import cn.app.pojo.DataDictionary;
import cn.app.vo.AppCategoryVo;
import cn.app.vo.AppInfoVo;
import cn.app.vo.AppVersionVo;

@Service
public class AppInfoServiceImpl implements AppInfoService {

	@Autowired
	private AppInfoMapper appInfoMapper;
	
	@Autowired
	private AppCategoryMapper appCategoryMapper;
	
	@Autowired
	private AppVersionMapper appVersionMapper;
	
	@Autowired
	private DataDictionaryMapper dataDictionMpper;
	
	@PostConstruct
	public void init(){
		List<AppCategoryVo> acvList = appCategoryMapper.selectAllCategoryVo();
		List<DataDictionary> dataList = dataDictionMpper.queryAllByType();
		AppInfoVo.setCategoryMap(acvList);
		AppInfoVo.setStatusMap(dataList);
	}
	
	@Override
	public List<AppInfoVo> queryAll(CriteriaApp ca) {
		List<AppInfoVo> list;
		if(ca != null){
			list = appInfoMapper.selectAllApp(ca);
		}else{
			list = appInfoMapper.selectAllApp(null);
		}
		return list;
	}

	@Override
	public List<AppCategoryVo> queryAllByParentId(Integer parentId) {
		
		return appCategoryMapper.selectByParent(parentId);
	}

	@Override
	public int addApp(AppInfo app) {
		int flag = 0;
		try {
			flag = appInfoMapper.insert(app);
			if(flag > 0){
				System.out.println("add success!");
			}else{
				System.out.println("add failed!");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return flag;
	}
	
	@Override
	public int deleteApp(Long appId) {
		int flag = 0;
		try {
			flag = appInfoMapper.deleteByPrimaryKey(appId);
			if(flag > 0){
				System.out.println("app delete success!");
			}else{
				System.out.println("app delete failed!");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return flag;
	}

	@Override
	public int selectBySoftwarename(String softwareName) {
		int flag = 0;
		try {
			flag = appInfoMapper.selectBySoftwarename(softwareName);
			if(flag > 0){
				System.out.println("app锟窖达拷锟斤拷========");
			}else{
				System.out.println("app锟斤拷锟斤拷锟斤拷锟�========");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return flag;
	}

	@Override
	public int deleteVersion(Long id) {
		int flag = 0;
		try {
			flag = appVersionMapper.deleteByPrimaryKey(id);
			if(flag > 0){
				System.out.println("version delete success!");
			}else{
				System.out.println("version delete failed!");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return flag;
	}


	public int modifyAppPutOrDown(Integer appId, Integer opt) {
		
		return appInfoMapper.updateByPutOrDown(appId, opt);
	}

	@Override
	public AppInfoVo queryById(Long appId,boolean cascade) {
		AppInfoVo appInfoVo = appInfoMapper.selectById(appId);
		
		if(cascade && appInfoVo != null){
			appInfoVo.getVersionList();
		}
		return appInfoVo;
	}

	@Override
	public int updateApp(AppInfo appInfo) {
		if(appInfo != null){
			return appInfoMapper.updateByPrimaryKeySelective(appInfo);
		}
		return 0;
	}
}
