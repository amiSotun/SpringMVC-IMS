/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.emp.dao;
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
public class SupplierDaoImp implements SupplierDao{
    private JdbcTemplate jdbcTemplate;
    
    @Override
    public void setDB() {
        MyConnection myConnection=new MyConnection();
        this.jdbcTemplate = new JdbcTemplate(myConnection.SetMySQL());
    }
    
      @Override
    public int createSupplierId() {
      String sql="select count(*) as num from supplierinfo";
        int i=jdbcTemplate.queryForObject(sql,new Object[]{},Integer.class);
        if(i!=0){
         String sq="SELECT max(id) FROM supplierinfo";
         int j=jdbcTemplate.queryForObject(sq,new Object[]{},Integer.class);
         return (j+1);
     }
     else return (i+1);
    }
    
     @Override
    public int addSupplier(SupplierInfo supplierInfo){
        String qu="select count(*) as num from userinfo where userid=?";
        int i=jdbcTemplate.queryForObject(qu,new Object[]{supplierInfo.getUserid()},Integer.class);
        if(i>0){
            String sql = "INSERT INTO supplierinfo (supplierid,name,address,email,phone,userid,created_at)"
                        + " VALUES (?,?,?,?,?,?,?)";
            return jdbcTemplate.update(sql, supplierInfo.getSupplierid(),supplierInfo.getName(),supplierInfo.getAddress(),supplierInfo.getEmail(),supplierInfo.getPhone(),supplierInfo.getUserid(),supplierInfo.getCreated_at());
        }
        else return 0;
    }
    
    @Override
    public List<SupplierInfo> getSuppliersDetails(){
        String sql = "SELECT * FROM supplierinfo order by id desc";
        List<SupplierInfo> listOfSupplier=jdbcTemplate.query(sql, new RowMapper<SupplierInfo>() {
            @Override
            public SupplierInfo mapRow(ResultSet rs, int rowNum) throws SQLException {
                SupplierInfo supplierInfo=new SupplierInfo();
                supplierInfo.setName(rs.getString("name"));
                supplierInfo.setSupplierid(rs.getString("supplierid"));
                supplierInfo.setPhone(rs.getString("phone"));
                supplierInfo.setEmail(rs.getString("email"));
                supplierInfo.setAddress(rs.getString("address"));
                return supplierInfo;
            }
        });
        return listOfSupplier;
    }
    
    @Override
    public SupplierInfo retriveSupplierInfo(String supplierId){  
        String sql="select * from supplierinfo where supplierid=?";
        return jdbcTemplate.queryForObject(sql, new Object[]{supplierId},new BeanPropertyRowMapper<SupplierInfo>(SupplierInfo.class));

    }
    
    @Override
    public int changeSupplierInfo(SupplierInfo supplierInfo){
        String sql = "update supplierinfo set name=?, address=?, email=?, phone=? where supplierid=?";
        int i= jdbcTemplate.update(sql,supplierInfo.getName(),supplierInfo.getAddress(),supplierInfo.getEmail(),supplierInfo.getPhone(),supplierInfo.getSupplierid());
        return (i+2);
    }
    
     @Override
     public int deleteSupplierInfo(String supplierId){
         String sql = "delete from supplierinfo where supplierid=?";
         int i= jdbcTemplate.update(sql, supplierId);
         return (i+4);
     }
     
     
     @Override
    public List<SupplierInfo> searchSupplierInfo(String searchVal){
        searchVal="%" +searchVal+ "%";
        String sql = "SELECT * FROM supplierinfo where name like ? or supplierid like ? or phone like ? or email like ? or address like ?";
        //String sql = "SELECT * FROM supplierinfo order by id asc";
        List<SupplierInfo> listOfSupplier=jdbcTemplate.query(sql,new Object[]{searchVal,searchVal,searchVal,searchVal,searchVal}, new RowMapper<SupplierInfo>() {
            @Override
            public SupplierInfo mapRow(ResultSet rs, int rowNum) throws SQLException {
                SupplierInfo supplierInfo=new SupplierInfo();
                supplierInfo.setName(rs.getString("name"));
                supplierInfo.setSupplierid(rs.getString("supplierid"));
                supplierInfo.setPhone(rs.getString("phone"));
                supplierInfo.setEmail(rs.getString("email"));
                supplierInfo.setAddress(rs.getString("address"));
                return supplierInfo;
            }
        });
        return listOfSupplier;
    }
    
    
}
