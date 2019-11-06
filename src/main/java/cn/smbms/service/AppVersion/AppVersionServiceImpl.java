package cn.smbms.service.AppVersion;

import cn.smbms.dao.AppVersion.AppVersionDao;
import cn.smbms.pojo.AppVersion;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class AppVersionServiceImpl implements AppVersionService {

    @Autowired
    private AppVersionDao appVersionDao;


    @Override
    public List<AppVersion> selectVersionByAppId(Integer appId) {
        return appVersionDao.selectVersionByAppId(appId);
    }

    @Override
    public Integer addVersion(AppVersion appVersion) {
        return appVersionDao.addVersion(appVersion);
    }

    @Override
    public Boolean updateVersion(AppVersion appVersion) {
        return appVersionDao.updateVersion(appVersion)>0;
    }

    @Override
    public AppVersion selectNewVersionByAppId(Integer appId) {
        return appVersionDao.selectNewVersionByAppId(appId);
    }
}
