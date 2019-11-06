package cn.smbms.service.DevUser;

import cn.smbms.dao.DevUser.DevUserDao;
import cn.smbms.pojo.devUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DevUserServiceImpl  implements DevUserService{

    @Autowired
    private DevUserDao devUserDao;

    @Override
    public devUser login(String devCode, String devPassword) {
        devUser devUser=devUserDao.login(devCode,devPassword);
        return devUser;
    }
}
