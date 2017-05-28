/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.emp.dao;

import com.emp.model.ModelInfo;
import com.emp.model.SupplierInfo;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Humayun Kabir
 */

@Repository
@Transactional
public class ProductDaoImp implements ProductDao{
    
    private JdbcTemplate jdbcTemplate;
    
    @Override
    public void setDB() {
        MyConnection myConnection=new MyConnection();
        this.jdbcTemplate = new JdbcTemplate(myConnection.SetMySQL());
    }
    
    @Override
    public int createStockId() {
      String sql="select count(*) as num from stockinfo";
        int i=jdbcTemplate.queryForObject(sql,new Object[]{},Integer.class);
        if(i!=0){
         String sq="SELECT max(id) FROM stockinfo";
         int j=jdbcTemplate.queryForObject(sq,new Object[]{},Integer.class);
         return (j+1);
     }
     else return (i+1);
    }
    
    @Override
    public int createEntryId() {
      String sql="select count(*) as num from entryinfo";
        int i=jdbcTemplate.queryForObject(sql,new Object[]{},Integer.class);
        if(i!=0){
         String sq="SELECT max(id) FROM entryinfo";
         int j=jdbcTemplate.queryForObject(sq,new Object[]{},Integer.class);
         return (j+1);
     }
     else return (i+1);
    }
    
    @Override
    public List<SupplierInfo> retriveSupplier(){
        String sql = "SELECT `supplierid`,`name` FROM supplierinfo order by id desc";
        List<SupplierInfo> listOfSupplier=jdbcTemplate.query(sql, new RowMapper<SupplierInfo>() {
            @Override
            public SupplierInfo mapRow(ResultSet rs, int rowNum) throws SQLException {
                SupplierInfo supplierInfo=new SupplierInfo();
                supplierInfo.setName(rs.getString("name"));
                supplierInfo.setSupplierid(rs.getString("supplierid"));
                return supplierInfo;
            }
        });
        return listOfSupplier;
    }
    
     @Override
    public List<ModelInfo> retriveModel(String brandId,String catId){
        String sql = "SELECT `modelid` FROM modelinfo WHERE brandid=? AND catid=?";
        List<ModelInfo> listOfModel=jdbcTemplate.query(sql,new Object[]{brandId,catId},new RowMapper<ModelInfo>() {
            @Override
            public ModelInfo mapRow(ResultSet rs, int rowNum) throws SQLException {
                ModelInfo modelInfo=new ModelInfo();
                modelInfo.setModelid(rs.getString("modelid"));
                return modelInfo;
            }
        });
        return listOfModel;
    }
    
}
