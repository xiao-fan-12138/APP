package cn.smbms.controller.BackendUser;

import cn.smbms.pojo.AppInfo;
import cn.smbms.pojo.AppVersion;
import cn.smbms.pojo.BackendUser;
import cn.smbms.service.APP.AppService;
import cn.smbms.service.AppVersion.AppVersionService;
import cn.smbms.service.BackendUser.BackendUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;


@Controller
@RequestMapping("/BackendUser")
public class BackendUserController {

    @Autowired
    private BackendUserService backendUserService;
    @Autowired
    private AppService appService;
    @Autowired
    private AppVersionService appVersionService;

    /**
     * 跳转到后台登录页面
     * @return
     */
    @RequestMapping("/login")
    public String toLogin(){
        return "BKUserLogin";
    }

    /**
     * 登录到后台主页面
     * @return
     */
    @RequestMapping("/doMain")
    public String toDoMain(@RequestParam(value = "userCode")String userCode, @RequestParam(value = "userPassword")String userPassword, HttpSession session){
        BackendUser backendUser= backendUserService.login(userCode,userPassword);
        if(backendUser!=null){
            //验证成功
            session.setAttribute("BackendUser",backendUser);
            return "BackendUserMain";
        }else{
            return "redirect:/BackendUser/login";
        }
    }

    /**
     * 登出
     * @param session
     * @return
     */
    @RequestMapping("/logout")
    public String toLogout(HttpSession session){
        session.removeAttribute("BackendUser");
        return "redirect:/BackendUser/login";
    }

    /**
     * 跳转到APP审核页面
     * @return
     */
    @RequestMapping("/select")
    public String toSelect(Model model, @ModelAttribute("appInfo")AppInfo appInfo){
        List<AppInfo> appInfoList=appService.sendAppBy(null,1,null,null,null,null);
        model.addAttribute("appList",appInfoList);
        return "BackendUserAPPSelect";
    }

    /**
     * 根据条件查询APP
     * @param appInfo
     * @param model
     * @return
     */
    @RequestMapping("send")
    public String doSelect(AppInfo appInfo, Model model){
        System.out.println(appInfo);
        List<AppInfo> appList=appService.sendAppBy(appInfo.getSoftwareName(),1,appInfo.getFlatformId(),appInfo.getCategoryLevel1(),appInfo.getCategoryLevel2(),appInfo.getCategoryLevel3());
        model.addAttribute("appList",appList);
        System.out.println("applist个数："+appList.size());
        return "BackendUserAPPSelect";
    }

    /**
     * 跳转到审核页面
     * @return
     */
    @RequestMapping("/toShenHe")
    public String toShenHe(Model model, HttpServletRequest request){
        String id=request.getParameter("appId");
        Integer appId=Integer.valueOf(id);
        //查询审核APP信息
        AppInfo appInfo=appService.selectInfoAndVersionById(appId);
        //查询审核APP的最新版本信息
        AppVersion appVersion=appVersionService.selectNewVersionByAppId(appId);
        model.addAttribute("appInfo",appInfo);
        model.addAttribute("appVersion",appVersion);
        return "BackedUserShenHe";
    }

    @RequestMapping("/shenHe")
    public String ShenHe(HttpServletRequest request){
        String id=request.getParameter("appId");
        Integer appId=Integer.valueOf(id);
        String statu=request.getParameter("status");
        Integer status=Integer.valueOf(statu);
        if(appService.updateStatusById(status,appId)){
            //修改状态成功
            return "redirect:/BackendUser/select";
        }
        return null;
    }
}
