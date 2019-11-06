package cn.smbms.service.AppCategory;

import cn.smbms.dao.AppCategory.AppCategoryDao;
import cn.smbms.pojo.AppCategory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class AppCategoryServiceImpl implements AppCategoryService {

    @Autowired
    private AppCategoryDao appCategoryDao;

    @Override
    public List<AppCategory> sendCatrgoryByParent(Integer parentId) {
        return appCategoryDao.selectCatrgoryByParent(parentId);
    }
}
