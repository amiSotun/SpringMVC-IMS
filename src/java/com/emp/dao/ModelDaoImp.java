/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.emp.dao;

import com.emp.model.BrandInfo;
import com.emp.model.CategoryInfo;
import com.emp.model.ModelInfo;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


/**
 *
 * @author Humayun Kabir
 */

@Repository
@Transactional
public class ModelDaoImp implements ModelDao{
    private JdbcTemplate jdbcTemplate;

    @Override
    public void setDB() {
        MyConnection myConnection=new MyConnection();
        this.jdbcTemplate = new JdbcTemplate(myConnection.SetMySQL());
    }
    
     @Override
    public List<BrandInfo> retriveBrand(){
        
        String sql = "SELECT `brandid`,`brandname` FROM brandinfo order by id desc";
        List<BrandInfo> listOfBrand=jdbcTemplate.query(sql, new RowMapper<BrandInfo>() {
            @Override
            public BrandInfo mapRow(ResultSet rs, int rowNum) throws SQLException {
                BrandInfo brandInfo=new BrandInfo();
                brandInfo.setBrandName(rs.getString("brandname"));
                brandInfo.setBrandid(rs.getString("brandid"));
                //brandInfo.setDescription(rs.getString("description"));
                return brandInfo;
            }
        });
        return listOfBrand;
    }
    
    @Override
     public List<CategoryInfo> retriveCategory(){
        
        String sql = "SELECT `catid`,`catname` FROM categoryinfo order by id desc";
        List<CategoryInfo> listOfCategory=jdbcTemplate.query(sql, new RowMapper<CategoryInfo>() {
            @Override
            public CategoryInfo mapRow(ResultSet rs, int rowNum) throws SQLException {
                CategoryInfo categoryInfo=new CategoryInfo();
                categoryInfo.setCatName(rs.getString("catname"));
                categoryInfo.setCatid(rs.getString("catid"));
                return categoryInfo;
            }
        });
        return listOfCategory;
    }
     
     @Override
    public int addModel(ModelInfo modelInfo){
        String qu="select count(*) as num from modelinfo where modelid=?";
        int i=jdbcTemplate.queryForObject(qu,new Object[]{modelInfo.getModelid()},Integer.class);
        if(i>0)return 0;
        else {
            String sql = "INSERT INTO modelinfo (modelid,brandid,catid,userid,details,created_at)"
                    + " VALUES (?,?,?,?,?,?)";
            return jdbcTemplate.update(sql, modelInfo.getModelid(),modelInfo.getBrandid(),modelInfo.getCatid(),modelInfo.getUserid(),modelInfo.getDetails(),modelInfo.getCreated_at());
        }
    }
    
     @Override
    public List<ModelInfo> getModelDetails(){
        String sql = "SELECT modelinfo.modelid,modelinfo.details,brandinfo.brandname,categoryinfo.catname FROM modelinfo,brandinfo,categoryinfo WHERE brandinfo.brandid=modelinfo.brandid AND categoryinfo.catid=modelinfo.catid";
        List<ModelInfo> listOfModel=jdbcTemplate.query(sql, new RowMapper<ModelInfo>() {
            @Override
            public ModelInfo mapRow(ResultSet rs, int rowNum) throws SQLException {
                ModelInfo modelInfo=new ModelInfo();
                modelInfo.setBrandname(rs.getString("brandname"));
                modelInfo.setModelid(rs.getString("modelid"));
                modelInfo.setCatname(rs.getString("catname"));
                modelInfo.setDetails(rs.getString("details"));
                return modelInfo;
            }
        });
        return listOfModel;
    }
    
     @Override
    public ModelInfo retriveModelInfo(String modelId){  
        String sql="select * from modelinfo where modelid=?";
        return jdbcTemplate.queryForObject(sql, new Object[]{modelId},new BeanPropertyRowMapper<ModelInfo>(ModelInfo.class));

    }
    
    @Override
    public int changeModelInfo(ModelInfo modelInfo){
        String sql = "update modelinfo set brandid=?, catid=?, details=? where modelid=?";
        int i= jdbcTemplate.update(sql,modelInfo.getBrandid(),modelInfo.getCatid(),modelInfo.getDetails(),modelInfo.getModelid());
        return (i+2);
    }
    
    @Override
     public int deleteModelInfo(String modelId){
         String sql = "delete from modelinfo where modelid=?";
         int i= jdbcTemplate.update(sql, modelId);
         return (i+4);
     }
     
     @Override
     public List<ModelInfo> searchModelInfo(String searchVal){
         searchVal="%" +searchVal+ "%";
        String sql = "SELECT modelinfo.modelid,modelinfo.details,brandinfo.brandname,categoryinfo.catname FROM modelinfo,brandinfo,categoryinfo WHERE brandinfo.brandid=modelinfo.brandid AND categoryinfo.catid=modelinfo.catid";
        List<ModelInfo> listOfModel=jdbcTemplate.query(sql,new RowMapper<ModelInfo>() {
            @Override
            public ModelInfo mapRow(ResultSet rs, int rowNum) throws SQLException {
                ModelInfo modelInfo=new ModelInfo();
                modelInfo.setBrandname(rs.getString("brandname"));
                modelInfo.setModelid(rs.getString("modelid"));
                modelInfo.setCatname(rs.getString("catname"));
                modelInfo.setDetails(rs.getString("details"));
                return modelInfo;
            }
        });
        return listOfModel;
     }

    
}
