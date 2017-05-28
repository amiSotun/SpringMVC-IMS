/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.emp.dao;

import com.emp.model.BrandInfo;
import com.emp.model.CategoryInfo;
import com.emp.model.ModelInfo;
import java.util.List;

/**
 *
 * @author Humayun Kabir
 */
public interface ModelDao {
    
    public void setDB();
    public List<BrandInfo> retriveBrand();
    public List<CategoryInfo> retriveCategory();
    public int addModel(ModelInfo modelInfo);
    public List<ModelInfo> getModelDetails();
    public ModelInfo retriveModelInfo(String modelId);
    public int changeModelInfo(ModelInfo modelInfo);
    public int deleteModelInfo(String modelId);
    public List<ModelInfo> searchModelInfo(String searchVal);
}
