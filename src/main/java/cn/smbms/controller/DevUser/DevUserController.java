package cn.smbms.controller.DevUser;

import cn.smbms.dao.APP.AppDao;
import cn.smbms.pojo.AppInfo;
import cn.smbms.pojo.devUser;
import cn.smbms.service.APP.AppService;
import cn.smbms.service.DevUser.DevUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/DevUser")
public class DevUserController {
    @Autowired
    private DevUserService devUserService;
    @Autowired
    private AppService appService;

    /**
     * 跳转到开发者登录页面
     * @return
     */
    @RequestMapping("/doLogin")
    public String doLogin(){
        System.out.println("dologin========");
        return "KFUser";
    }

    /**
     * 登录到主页
     * @param devCode
     * @param devPassword
     * @param model
     * @return
     */
    @RequestMapping("/doMain")
    public String doMain(@RequestParam(value = "devCode",required = false) String devCode, @RequestParam(value = "devPassword",required = false) String devPassword, Model model, HttpSession session){
        devUser devUser= devUserService.login(devCode,devPassword);
        if(devUser!=null){
            //登录成功
            model.addAttribute("devUser",devUser);
            session.setAttribute("devUser",devUser);
            return "main";
        }else{
            //登录失败
            return "redirect:/DevUser/doLogin";
        }
    }

    @RequestMapping("/doLogout")
    public String doLogout(HttpSession session){
        session.removeAttribute("devUser");
        return "redirect:/DevUser/doLogin";
    }

//    跳转到APP维护页面
    @RequestMapping("/manage")
    public String doManage(Model model){
        List<AppInfo> appInfoList=appService.selectAll();
        model.addAttribute("appList",appInfoList);
        return "APPSelect";
    }



}
