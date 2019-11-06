package cn.smbms.service.BackendUser;

import cn.smbms.dao.BackendUser.BackendUserDao;
import cn.smbms.pojo.BackendUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BackendUserServiceImpl implements BackendUserService {
    @Autowired
    private BackendUserDao backendUserDao;

    @Override
    public BackendUser login(String userCode, String userPassword) {
        return backendUserDao.login(userCode,userPassword);
    }
}
