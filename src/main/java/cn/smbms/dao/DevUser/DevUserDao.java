package cn.smbms.dao.DevUser;

import cn.smbms.pojo.devUser;
import org.apache.ibatis.annotations.Param;

public interface DevUserDao {

    /**
     *登录验证方法
     */
    public devUser login(@Param("devCode") String devCode,@Param("devPassword") String devPassword);
}
