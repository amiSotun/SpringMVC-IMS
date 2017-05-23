/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.emp.dao;

import com.emp.model.CategoryInfo;
import org.springframework.jdbc.core.JdbcTemplate;
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
 * @author RuBaYeT
 */

@Repository
@Transactional
public class CategoryDaoImp implements CategoryDao{
     private JdbcTemplate jdbcTemplate;
    
    @Override
    public void setDB() {
        MyConnection myConnection=new MyConnection();
        this.jdbcTemplate = new JdbcTemplate(myConnection.SetMySQL());
    }
    
     @Override
    public int createCategoryId() {
      String sql="select count(*) as num from categoryinfo";
        int i=jdbcTemplate.queryForObject(sql,new Object[]{},Integer.class);
        if(i!=0){
         String sq="SELECT max(id) FROM categoryinfo";
         int j=jdbcTemplate.queryForObject(sq,new Object[]{},Integer.class);
         return (j+1);
     }
     else return (i+1);
    }
    
     @Override
    public int addCategory(CategoryInfo categoryInfo){
        String qu="select count(*) as num from userinfo where userid=?";
        int i=jdbcTemplate.queryForObject(qu,new Object[]{categoryInfo.getUserid()},Integer.class);
        if(i>0){
            String sql = "INSERT INTO categoryinfo (catid,catname,description,userid,created_at)"
                        + " VALUES (?,?,?,?,?)";
            return jdbcTemplate.update(sql, categoryInfo.getCatid(),categoryInfo.getCatName(),categoryInfo.getDescription(),categoryInfo.getUserid(),categoryInfo.getCreated_at());
        }
        else return 0;
    }
    
        @Override
    public List<CategoryInfo> getCategoryDetails(){
        String sql = "SELECT * FROM categoryinfo order by id desc";
        List<CategoryInfo> listOfCategory=jdbcTemplate.query(sql, new RowMapper<CategoryInfo>() {
            @Override
            public CategoryInfo mapRow(ResultSet rs, int rowNum) throws SQLException {
                CategoryInfo categoryInfo=new CategoryInfo();
                categoryInfo.setCatName(rs.getString("catname"));
                categoryInfo.setCatid(rs.getString("catid"));
                categoryInfo.setDescription(rs.getString("description"));
                return categoryInfo;
            }
        });
        return listOfCategory;
    }
    
      @Override
    public CategoryInfo retriveCategoryInfo(String catId){  
        String sql="select * from categoryinfo where catid=?";
        return jdbcTemplate.queryForObject(sql, new Object[]{catId},new BeanPropertyRowMapper<CategoryInfo>(CategoryInfo.class));
    }
    
     @Override
    public int changeCategoryInfo(CategoryInfo catInfo){
        String sql = "update categoryinfo set catname=?, description=? where catid=?";
        int i= jdbcTemplate.update(sql,catInfo.getCatName(),catInfo.getDescription(),catInfo.getCatid());
        return (i+2);
    }
    
    @Override
     public int deleteCategoryInfo(String catId){
         String sql = "delete from categoryinfo where catid=?";
         int i= jdbcTemplate.update(sql, catId);
         return (i+4);
     }
     
      @Override
    public List<CategoryInfo> searchCategoryInfo(String searchVal){
        searchVal="%" +searchVal+ "%";
        String sql = "SELECT * FROM categoryinfo where catname like ? or catid like ? or description like ?";
        //String sql = "SELECT * FROM customerinfo order by id asc";
        List<CategoryInfo> listOfCategory=jdbcTemplate.query(sql,new Object[]{searchVal,searchVal,searchVal}, new RowMapper<CategoryInfo>() {
            @Override
            public CategoryInfo mapRow(ResultSet rs, int rowNum) throws SQLException {
                CategoryInfo catInfo=new CategoryInfo();
                catInfo.setCatName(rs.getString("catname"));
                catInfo.setCatid(rs.getString("catid"));
                catInfo.setDescription(rs.getString("description"));
                return catInfo;
            }
        });
        return listOfCategory;
    }
}
