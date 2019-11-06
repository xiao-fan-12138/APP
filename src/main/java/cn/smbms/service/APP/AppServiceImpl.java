package cn.smbms.service.APP;

import cn.smbms.dao.APP.AppDao;
import cn.smbms.pojo.AppInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AppServiceImpl implements AppService{

    @Autowired
    private AppDao appDao;

    @Override
    public List<AppInfo> sendAppBy(String softwareName, Integer status, Integer flatformId, Integer categoryLevel1, Integer categoryLevel2, Integer categoryLevel3) {
        return appDao.selectAppBy(softwareName,status,flatformId,categoryLevel1,categoryLevel2,categoryLevel3);
    }

    @Override
    public boolean addAPP(AppInfo appInfo) {
        return appDao.addApp(appInfo)>0;
    }


    @Override
    public List<AppInfo> selectAll() {
        return appDao.selectAll();
    }

    @Override
    public AppInfo selectById(Integer appId) {
        return appDao.selectById(appId);
    }

    @Override
    public Boolean updateApp(AppInfo appInfo) {
        return appDao.updateApp(appInfo)>0;
    }

    @Override
    public Boolean delApp(Integer id) {
        return appDao.delApp(id)>0;
    }

    @Override
    public AppInfo selectInfoAndVersionById(Integer id) {
        return appDao.selectInfoAndVersionById(id);
    }

    @Override
    public Boolean updateVersionId(Integer versionId, Integer id) {
        return appDao.updateVersionId(versionId,id)>0;
    }

    @Override
    public Boolean updateStatusById(Integer status, Integer id) {
        return appDao.updateStatusById(status,id)>0;
    }


}
