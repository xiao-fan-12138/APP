package cn.smbms.service.BackendUser;

import cn.smbms.pojo.BackendUser;
import org.apache.ibatis.annotations.Param;

public interface BackendUserService {

    /**
     * 登录方法
     * @param userCode
     * @param userPassword
     * @return
     */
    BackendUser login(@Param(value = "userCode") String userCode, @Param(value = "userPassword") String userPassword);
}
