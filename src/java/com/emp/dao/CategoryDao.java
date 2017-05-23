/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.emp.dao;

import com.emp.model.CategoryInfo;
import java.util.List;

/**
 *
 * @author RuBaYeT
 */
public interface CategoryDao {
    public void setDB();
    public int createCategoryId();
    public int addCategory(CategoryInfo categoryInfo);
    public List<CategoryInfo> getCategoryDetails();
    public CategoryInfo retriveCategoryInfo(String catId);
    public int changeCategoryInfo(CategoryInfo categoryInfo);
    public int deleteCategoryInfo(String catId);
    public List<CategoryInfo> searchCategoryInfo(String searchVal);
    
}
