package cn.smbms.controller.APP;

import cn.smbms.dao.AppCategory.AppCategoryDao;
import cn.smbms.pojo.AppCategory;
import cn.smbms.pojo.AppInfo;
import cn.smbms.pojo.AppVersion;
import cn.smbms.pojo.devUser;
import cn.smbms.service.APP.AppService;
import cn.smbms.service.AppCategory.AppCategoryService;
import cn.smbms.service.AppVersion.AppVersionService;
import com.alibaba.fastjson.JSON;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang.math.RandomUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.*;

@Controller
@RequestMapping("/App")
public class AppController {

    @Autowired
    private AppService appService;
    @Autowired
    private AppCategoryService appCategoryService;
    @Autowired
    private AppVersionService appVersionService;


    /**
     * 根据条件查询APP
      */
    @RequestMapping("/select")
    public String doSelect(AppInfo appInfo, Model model){
        System.out.println(appInfo);
         List<AppInfo> appList=appService.sendAppBy(appInfo.getSoftwareName(),appInfo.getStatus(),appInfo.getFlatformId(),appInfo.getCategoryLevel1(),appInfo.getCategoryLevel2(),appInfo.getCategoryLevel3());
         model.addAttribute("appList",appList);
         System.out.println("applist个数："+appList.size());
        return "APPSelect";
    }

    /**
     * 跳转到APP添加页面
     * @return
     */
    @RequestMapping(value = "/Add",method = RequestMethod.GET)
    public String toAdd(Model model, @ModelAttribute("appInfo") AppInfo appInfo ){
        System.out.print("toAdd=======");
        List<AppCategory> appCategoryLists=appCategoryService.sendCatrgoryByParent(0);
        model.addAttribute("categoryLevel1",appCategoryLists);
        return "APPAdd";
    }

    /**
     * 点击分类触发
     * @param parentId
     * @return
     */
    @RequestMapping(value = "/categoryLevel",produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String toCategoryLevel(@RequestParam(value = "parentId",required = false) Integer parentId){
        System.out.print(parentId);
        List<AppCategory> appCategorys=appCategoryService.sendCatrgoryByParent(parentId);
        System.out.print(appCategorys);
       return JSON.toJSONString(appCategorys);
    }

    /**
     * 添加APP
     * @return
     */
    @RequestMapping("/AddApp")
    public String toAddAPP(AppInfo appInfo,
                           @RequestParam(value = "multipartFile",required = false)MultipartFile multipartFile,
                           Model model, HttpSession session,HttpServletRequest request ){
        String path=null;
        String filename=null;
        if(!multipartFile.isEmpty()){
            path=session.getServletContext().getRealPath("statics"+ File.separator+"uploadfiles");
            System.out.println("项目路径：==="+path);
            String oldFilename=multipartFile.getOriginalFilename();//原文件名
            String prefix= FilenameUtils.getExtension(oldFilename);//后缀
            if(multipartFile.getSize()>5000000){
                model.addAttribute("uploadFileError","上传文件不能大于5M");
                return "APPAdd";
            }else if(prefix.equals("jpg") || prefix.equals("png") || prefix.equals("jpeg") || prefix.equals("pneg")){
                //给文件重新起名以防重复
                 filename=System.currentTimeMillis()+ RandomUtils.nextInt(1000000)+"_appLOGO.jpg";
                //上传
                File file=new File(path,filename);
                if(!file.exists()){
                    //如果文件不存在，则创建
                    file.mkdirs();
                }
                //保存
                try {
                    multipartFile.transferTo(file);
                }catch (Exception e){
                    e.printStackTrace();
                    model.addAttribute("uploadFileError","上传失败");
                    return "APPAdd";
                }

            }else{
                model.addAttribute("uploadFileError","图片格式不正确！");
                return "APPAdd";
            }
        }
        devUser user=(devUser) session.getAttribute("devUser");
        appInfo.setDevId(user.getId());
        appInfo.setCreatedBy(user.getId());
        appInfo.setCreationDate(new Date());
        appInfo.setLogoPicPath(path+"\\"+filename);
        System.out.print(appInfo);
        if(appService.addAPP(appInfo)){
            //添加成功
            List<AppInfo> appInfos=appService.selectAll();
            model.addAttribute("appList",appInfos);
            return "APPSelect";
        }else{
            session.setAttribute("addError","添加失败");
            return "recirect:WEB-INF/jsp/APPAdd.jsp";
        }
    }

    /**
     * 跳转到修改APP信息页面
     * @return
     */
    @RequestMapping("/update")

    public String toUpdate(@RequestParam(value = "appId",required = false) Integer appId,Model model,@ModelAttribute("appInfo") AppInfo app){
        //查询要修改的APP信息
        AppInfo appInfo=appService.selectById(appId);
        System.out.print("修改信息"+appInfo);
        model.addAttribute("updateApp",appInfo);
        //查询一级分类
        List<AppCategory> appCategoryLists=appCategoryService.sendCatrgoryByParent(0);
        model.addAttribute("categoryLevel1",appCategoryLists);
      return "APPUpdate";
    }

    /**
     * 修改APP信息
     */
    @RequestMapping("/UpdateApp")
    public String toUpdateApp(AppInfo app,
                              @RequestParam(value = "multipartFile",required = false)MultipartFile multipartFile,
                              Model model, HttpSession session,HttpServletRequest request){
        String path=null;
        String filename=null;
        if(!multipartFile.isEmpty()){
            path=session.getServletContext().getRealPath("statics"+ File.separator+"uploadfiles");
            System.out.println("项目路径：==="+path);
            String oldFilename=multipartFile.getOriginalFilename();//原文件名
            String prefix= FilenameUtils.getExtension(oldFilename);//后缀
            if(multipartFile.getSize()>5000000){
                model.addAttribute("uploadFileError","上传文件不能大于5M");
                return "APPAdd";
            }else if(prefix.equals("jpg") || prefix.equals("png") || prefix.equals("jpeg") || prefix.equals("pneg")){
                //给文件重新起名以防重复
                filename=System.currentTimeMillis()+ RandomUtils.nextInt(1000000)+"_appLOGO.jpg";
                //上传
                File file=new File(path,filename);
                if(!file.exists()){
                    //如果文件不存在，则创建
                    file.mkdirs();
                }
                //保存
                try {
                    multipartFile.transferTo(file);
                }catch (Exception e){
                    e.printStackTrace();
                    model.addAttribute("uploadFileError","上传失败");
                    return "APPAdd";
                }

            }else{
                model.addAttribute("uploadFileError","图片格式不正确！");
                return "APPAdd";
            }
        }
        devUser user=(devUser) session.getAttribute("devUser");
        app.setLogoPicPath(path+"\\"+filename);
        app.setLogoLocPath(filename);
        app.setModifyBy(user.getId());
        app.setModifyDate(new Date());
        String id=request.getParameter("id");
        Integer Id=0;
        if(id!=null){
            Id=Integer.valueOf(id);
        }
        app.setId(Id);
        if(appService.updateApp(app)){
            //修改成功
            List<AppInfo> appInfos=appService.selectAll();
            model.addAttribute("appList",appInfos);
            return "APPSelect";
        }else{
            session.setAttribute("addError","添加失败");
            return "recirect:WEB-INF/jsp/APPAdd.jsp";
        }
    }

    /**
     * 删除APP
     * @param request
     * @return
     */
    @RequestMapping("/delApp")
    @ResponseBody
    public String toDelApp(HttpServletRequest request){
        String id=request.getParameter("id");
        Integer Id=Integer.valueOf(id);
        Map<String,Object> map=new HashMap<String, Object>();
        List<String> list=new ArrayList<String>();

        if(appService.delApp(Id)){
            System.out.println("删除id========"+Id);
           // map.put("data","true");
            list.add("true");
            String json=JSON.toJSONString(list);
            return json;
        }else{
            //map.put("data","false");
            list.add("false");
            String json=JSON.toJSONString(list);
            return json;
        }
    }

    /**
     * 查看APP信息
     * @return
     */
    @RequestMapping("/lookInfo")
    public String toLookInfo(HttpServletRequest request,Model model){
        String id=request.getParameter("appId");
        Integer appId=Integer.valueOf(id);
        //获取APPID
        AppInfo appInfo=appService.selectInfoAndVersionById(appId);
        //获取APP版本信息
        List<AppVersion> appVersions=appVersionService.selectVersionByAppId(appId);
        //填充APP版本信息
        appInfo.setHistoryVersions(appVersions);
        model.addAttribute("appInfo",appInfo);
        //获取历史版本信息
        List<AppVersion> appVersionList=appVersionService.selectVersionByAppId(appId);
        model.addAttribute("appVersionList",appVersionList);
        System.out.println(appVersionList);
        return "APPLook";
    }

    /**
     * 跳转到版本新增页面
     * @return
     */
    @RequestMapping("/versionAdd")
    public String toVersionAdd(HttpServletRequest request,Model model,@ModelAttribute("appInfo") AppVersion appVersion){
        String id=request.getParameter("appId");
        Integer appId=Integer.valueOf(id);
        AppInfo appInfo=appService.selectInfoAndVersionById(appId);
        //获取APP版本信息
        List<AppVersion> appVersions=appVersionService.selectVersionByAppId(appId);
        //填充APP版本信息
        appInfo.setHistoryVersions(appVersions);
        model.addAttribute("appInfo",appInfo);
        List<AppVersion> appVersionList= appVersionService.selectVersionByAppId(appId);
        model.addAttribute("appVersionList",appVersionList);
        return "VersionAdd";
    }

}
