package cn.appManager.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import cn.app.service.user.BackUserService;
import cn.app.vo.AppInfoVo;

@Controller
public class AppBackUserController {

	private Logger logger = Logger.getLogger(AppInfoController.class);

	@Autowired
	private BackUserService bus;

	/*@RequestMapping(value = "/auditAppInfo", method = RequestMethod.GET)
	public String showAuditApp(Model model) {
		//List<AppInfoVo> AppList = bus.selectAppListByStatus();
		model.addAttribute("AuditAppList", AppList);
		return "appList/backUserAppList";
	}*/
	
	/*@RequestMapping
	public String ModifyAppStatus(@RequestParam(value="id",required=false)Long id,@RequestParam("status") Long status,Model model) {
		int count = bus.modifyStatus(id, status);
		model.addAttribute("audit",count);
		return"appList/AuditOneApp"; 
	}*/
}
