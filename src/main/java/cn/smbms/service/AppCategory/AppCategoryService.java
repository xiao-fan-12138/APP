package cn.smbms.service.AppCategory;

import cn.smbms.pojo.AppCategory;

import java.util.List;

public interface AppCategoryService {

    /**
     * 根据父类id查找分类
     * @return
     */
    public List<AppCategory> sendCatrgoryByParent(Integer parentId);
}
