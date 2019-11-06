package cn.smbms.dao.APP;

import cn.smbms.pojo.AppInfo;
import cn.smbms.pojo.AppVersion;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AppDao {

    public List<AppInfo> selectAppBy(@Param("softwareName") String softwareName, @Param("status") Integer status, @Param("flatformId") Integer flatformId, @Param("categoryLevel1") Integer categoryLevel1, @Param("categoryLevel2") Integer categoryLevel2, @Param("categoryLevel3") Integer categoryLevel3);

    /**
     * 新增APP
     * @param appInfo
     * @return
     */
    public int addApp(AppInfo appInfo);

    /**
     * 查询全部APP
     * @return
     */
    List<AppInfo> selectAll();

    /**
     * 根据id查询APP信息
     * @param appId
     * @return
     */
    AppInfo selectById(Integer appId);

    /**
     * 修改APP信息
     * @param appInfo
     * @return
     */
    Integer updateApp(AppInfo appInfo);

    /**
     * 删除APP
     * @param id
     * @return
     */
    Integer delApp(Integer id);

    /**
     * 根据id查询APP信息，和上面方法区别:有分类名称
     * @param id
     * @return
     */
    AppInfo selectInfoAndVersionById(Integer id);

    /**
     * 更新APP最新版本
     * @param versionId
     * @return
     */
    Integer updateVersionId(@Param(value = "versionId") Integer versionId,
                            @Param(value = "id") Integer id);

    /**
     * 根据id修改APP状态
     * @param status
     * @param id
     * @return
     */
    Integer updateStatusById(@Param(value = "status") Integer status,@Param(value = "id") Integer id);
}
