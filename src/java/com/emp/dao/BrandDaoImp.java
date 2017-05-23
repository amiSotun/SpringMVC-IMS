/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.emp.dao;
import com.emp.model.BrandInfo;
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
public class BrandDaoImp implements BrandDao{
    private JdbcTemplate jdbcTemplate;
    
    @Override
    public void setDB() {
        MyConnection myConnection=new MyConnection();
        this.jdbcTemplate = new JdbcTemplate(myConnection.SetMySQL());
    }

    @Override
    public int createBrandId() {
      String sql="select count(*) as num from brandinfo";
        int i=jdbcTemplate.queryForObject(sql,new Object[]{},Integer.class);
        if(i!=0){
         String sq="SELECT max(id) FROM brandinfo";
         int j=jdbcTemplate.queryForObject(sq,new Object[]{},Integer.class);
         return (j+1);
     }
     else return (i+1);
    }
    
    @Override
    public int addBrand(BrandInfo brandInfo){
        String qu="select count(*) as num from userinfo where userid=?";
        int i=jdbcTemplate.queryForObject(qu,new Object[]{brandInfo.getUserid()},Integer.class);
        if(i>0){
            String sql = "INSERT INTO brandinfo (brandid,brandname,description,userid,created_at)"
                        + " VALUES (?,?,?,?,?)";
            return jdbcTemplate.update(sql, brandInfo.getBrandid(),brandInfo.getBrandName(),brandInfo.getDescription(),brandInfo.getUserid(),brandInfo.getCreated_at());
        }
        else return 0;
    }
    
    @Override
    public List<BrandInfo> getBrandDetails(){
        String sql = "SELECT * FROM brandinfo order by id desc";
        List<BrandInfo> listOfBrand=jdbcTemplate.query(sql, new RowMapper<BrandInfo>() {
            @Override
            public BrandInfo mapRow(ResultSet rs, int rowNum) throws SQLException {
                BrandInfo brandInfo=new BrandInfo();
                brandInfo.setBrandName(rs.getString("brandname"));
                brandInfo.setBrandid(rs.getString("brandid"));
                brandInfo.setDescription(rs.getString("description"));
                return brandInfo;
            }
        });
        return listOfBrand;
    }
    
      @Override
    public BrandInfo retriveBrandInfo(String brandId){  
        String sql="select * from brandinfo where brandid=?";
        return jdbcTemplate.queryForObject(sql, new Object[]{brandId},new BeanPropertyRowMapper<BrandInfo>(BrandInfo.class));

    }
    
    @Override
    public int changeBrandInfo(BrandInfo brandInfo){
        String sql = "update brandinfo set brandname=?, description=? where brandid=?";
        int i= jdbcTemplate.update(sql,brandInfo.getBrandName(),brandInfo.getDescription(),brandInfo.getBrandid());
        return (i+2);
    }
    
    @Override
     public int deleteBrandInfo(String brandId){
         String sql = "delete from brandinfo where brandid=?";
         int i= jdbcTemplate.update(sql, brandId);
         return (i+4);
     }
    
     @Override
    public List<BrandInfo> searchBrandInfo(String searchVal){
        searchVal="%" +searchVal+ "%";
        String sql = "SELECT * FROM brandinfo where brandname like ? or brandid like ? or description like ?";
        //String sql = "SELECT * FROM customerinfo order by id asc";
        List<BrandInfo> listOfBrand=jdbcTemplate.query(sql,new Object[]{searchVal,searchVal,searchVal}, new RowMapper<BrandInfo>() {
            @Override
            public BrandInfo mapRow(ResultSet rs, int rowNum) throws SQLException {
                BrandInfo brandInfo=new BrandInfo();
                brandInfo.setBrandName(rs.getString("brandname"));
                brandInfo.setBrandid(rs.getString("brandid"));
                brandInfo.setDescription(rs.getString("description"));
                return brandInfo;
            }
        });
        return listOfBrand;
    }
    
}
