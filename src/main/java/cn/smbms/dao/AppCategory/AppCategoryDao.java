package cn.smbms.dao.AppCategory;

import cn.smbms.pojo.AppCategory;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AppCategoryDao {
    /**
     * 根据父类id查找分类
     * @return
     */
    public List<AppCategory> selectCatrgoryByParent(@Param("parentId") Integer parentId);
}
