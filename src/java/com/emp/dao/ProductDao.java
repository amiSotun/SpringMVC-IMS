/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.emp.dao;

import com.emp.model.ModelInfo;
import com.emp.model.SupplierInfo;
import java.util.List;

/**
 *
 * @author Humayun Kabir
 */
public interface ProductDao {
     public void setDB();
    public int createStockId();
    public int createEntryId();
    public List<SupplierInfo> retriveSupplier();
     public List<ModelInfo> retriveModel(String brandId,String catId);
    
}
