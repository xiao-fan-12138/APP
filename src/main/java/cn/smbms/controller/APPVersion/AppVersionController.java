package cn.smbms.controller.APPVersion;

import cn.smbms.pojo.AppInfo;
import cn.smbms.pojo.AppVersion;
import cn.smbms.pojo.devUser;
import cn.smbms.service.APP.AppService;
import cn.smbms.service.AppVersion.AppVersionService;
import com.sun.org.apache.xpath.internal.operations.Bool;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang.math.RandomUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/version")
public class AppVersionController {
    @Autowired
    private AppVersionService appVersionService;
    @Autowired
    private AppService appService;

    @RequestMapping("/addVersion")
    public String toAddVersion(AppVersion appVersion, HttpSession session,
                               @RequestParam(value = "multipartFile",required = false) MultipartFile multipartFile, Model model){
        String path=null;
        String filename=null;
        String oldFilename=null;
        if(!multipartFile.isEmpty()){
            path=session.getServletContext().getRealPath("statics"+ File.separator+"uploadfiles");
            System.out.println("项目路径：==="+path);
            oldFilename=multipartFile.getOriginalFilename();//原文件名
            String prefix= FilenameUtils.getExtension(oldFilename);//后缀
            if(multipartFile.getSize()>5000000){
                model.addAttribute("uploadFileError","上传文件不能大于5M");
                return "APPAdd";
            }else if(prefix.equals("apk")){
                //上传
                File file=new File(path,oldFilename);
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
                    return "redirect:/DevUser/manage";
                }

            }else{
                model.addAttribute("uploadFileError","文件格式不正确！");
                return "redirect:/DevUser/manage";
            }
        }

        devUser devUser=(devUser) session.getAttribute("devUser");
        Integer userId=devUser.getId();
        appVersion.setCreatedBy(userId);//添加创建人
        appVersion.setCreationDate(new Date());//添加创建日期
        appVersion.setModifyDate(new Date());
        String publishStatusName=appVersion.getPublishStatusName();
        if(publishStatusName.equals("预发布")){ //填充发布状态
            appVersion.setPublishStatus(3);
        }else if(publishStatusName.equals("不发布")){
            appVersion.setPublishStatus(1);
        }else if(publishStatusName.equals("已发布")){
            appVersion.setPublishStatus(2);
        }
        appVersion.setApkFileName(oldFilename);//apk名称

//        添加
        Integer num=appVersionService.addVersion(appVersion);
        System.out.println("新增的版本号是======="+appVersion.getId());
        Boolean flag=appService.updateVersionId(appVersion.getId(),appVersion.getAppId());
        if(num>0 && flag){
            //添加成功
            return "redirect:/DevUser/manage";
        }else{
            return "redirect:/DevUser/manage";
        }
    }

    /**
     * 跳转到修改最新版本信息页面
     * @return
     */
    @RequestMapping("/updateVersion")
    public String toUpdateVersion(HttpServletRequest request, Model model, @ModelAttribute(value = "appVersion") AppVersion appVer){
        String id=request.getParameter("appId");
        Integer appId=Integer.valueOf(id);
        AppInfo appInfo=appService.selectInfoAndVersionById(appId);
        //获取APP版本信息
        List<AppVersion> appVersions=appVersionService.selectVersionByAppId(appId);
        //填充APP版本信息
        appInfo.setHistoryVersions(appVersions);
        model.addAttribute("appInfo",appInfo);
        //获取历史版本信息
        List<AppVersion> appVersionList=appVersionService.selectVersionByAppId(appId);
        model.addAttribute("appVersionList",appVersionList);
        //获取最新的版本信息
        AppVersion appVersion=appVersionList.get(appVersionList.size()-1);
        model.addAttribute("newVersion",appVersion);
        return "VersionUpdate";
    }

    /**
     * 修改APP最新版本
     * @return
     */
    @RequestMapping("/versionUpdate")
    public String toUpdateVersion2(AppVersion appVer,
                                   HttpSession session,
                                   @RequestParam(value = "multipartFile",required = false) MultipartFile multipartFile, Model model){
        String path=null;
        String filename=null;
        String oldFilename=null;
        if(!multipartFile.isEmpty()){
            path=session.getServletContext().getRealPath("statics"+ File.separator+"uploadfiles");
            System.out.println("项目路径：==="+path);
            oldFilename=multipartFile.getOriginalFilename();//原文件名
            String prefix= FilenameUtils.getExtension(oldFilename);//后缀
            if(multipartFile.getSize()>5000000){
                model.addAttribute("uploadFileError","上传文件不能大于5M");
                return "APPAdd";
            }else if(prefix.equals("apk")){
                //上传
                File file=new File(path,oldFilename);
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
                    return "redirect:/DevUser/manage";
                }

            }else{
                model.addAttribute("uploadFileError","文件格式不正确！");
                return "redirect:/DevUser/manage";
            }
        }

        devUser devUser=(devUser) session.getAttribute("devUser");
        Integer userId=devUser.getId();

        appVer.setApkFileName(oldFilename);//apk名称
        appVer.setModifyBy(userId);
        appVer.setModifyDate(new Date());
        System.out.println("修改版本号========="+appVer.getId());
        System.out.println("修改版本========="+appVer.getVersionNo());
//        修改
        Boolean flag=appVersionService.updateVersion(appVer);
        System.out.println("修改结果是========="+flag);
        if(flag){
            //修改成功
            return "redirect:/DevUser/manage";
        }else{
            return "redirect:/DevUser/manage";
        }

    }
}
