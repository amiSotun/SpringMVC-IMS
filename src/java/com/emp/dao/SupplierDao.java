/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.emp.dao;

import com.emp.model.SupplierInfo;
import java.util.List;

/**
 *
 * @author Humayun Kabir
 */
public interface SupplierDao {
    public void setDB();
    public int createSupplierId();
    public int addSupplier(SupplierInfo supplierInfo);
    public List<SupplierInfo> getSuppliersDetails();
    public SupplierInfo retriveSupplierInfo(String supplierId);
    public int changeSupplierInfo(SupplierInfo supplierInfo);
    public int deleteSupplierInfo(String supplierId);
    public List<SupplierInfo> searchSupplierInfo(String searchVal);
}
