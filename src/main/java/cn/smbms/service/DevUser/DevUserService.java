package cn.smbms.service.DevUser;

import cn.smbms.pojo.devUser;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;


public interface DevUserService {


    /**
     *登录验证方法
     */
    devUser login(@Param("devCode") String devCode, @Param("devPassword") String devPassword);
}
