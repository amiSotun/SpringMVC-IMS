/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.emp.dao;

import com.emp.model.BrandInfo;
import java.util.List;

/**
 *
 * @author Humayun Kabir
 */
public interface BrandDao {
    
    public void setDB();
    public int createBrandId();
    public int addBrand(BrandInfo brandInfo);
    public List<BrandInfo> getBrandDetails();
    public BrandInfo retriveBrandInfo(String brandId);
    public int changeBrandInfo(BrandInfo brandInfo);
    public int deleteBrandInfo(String brandId);
    public List<BrandInfo> searchBrandInfo(String searchVal);
}
