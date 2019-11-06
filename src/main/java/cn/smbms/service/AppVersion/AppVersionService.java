package cn.smbms.service.AppVersion;

import cn.smbms.pojo.AppVersion;

import java.util.List;

public interface AppVersionService {

    /**
     * 根据APPid查询版本信息
     * @param appId
     * @return
     */
    List<AppVersion> selectVersionByAppId(Integer appId);

    /**
     * 增加APP版本
     * @param appVersion
     * @return
     */
    Integer addVersion(AppVersion appVersion);

    /**
     * 修改APP最新版本信息
     * @param appVersion
     * @return
     */
    Boolean updateVersion(AppVersion appVersion);

    /**
     * 根据APPid查询最新版本信息
     * @param appId
     * @return
     */
    AppVersion selectNewVersionByAppId(Integer appId);
}
