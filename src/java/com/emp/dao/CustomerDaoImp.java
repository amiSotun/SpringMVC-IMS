/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.emp.dao;
import com.emp.model.CustomerInfo;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


@Repository
@Transactional
public class CustomerDaoImp implements CustomerDao{
    private JdbcTemplate jdbcTemplate;

    @Override
    public void setDB() {
        MyConnection myConnection=new MyConnection();
        this.jdbcTemplate = new JdbcTemplate(myConnection.SetMySQL());
    }

    @Override
    public int createCustomerId() {
      String sql="select count(*) as num from customerinfo";
        int i=jdbcTemplate.queryForObject(sql,new Object[]{},Integer.class);
        if(i!=0){
         String sq="SELECT max(id) FROM customerinfo";
         int j=jdbcTemplate.queryForObject(sq,new Object[]{},Integer.class);
         return (j+1);
     }
     else return (i+1);
    }
    
    @Override
    public int addCustomer(CustomerInfo customerInfo){
        String qu="select count(*) as num from userinfo where userid=?";
        int i=jdbcTemplate.queryForObject(qu,new Object[]{customerInfo.getUserid()},Integer.class);
        if(i>0){
            String sql = "INSERT INTO customerinfo (customerid,name,address,email,phone,userid,created_at)"
                        + " VALUES (?,?,?,?,?,?,?)";
            return jdbcTemplate.update(sql, customerInfo.getCustomerid(),customerInfo.getName(),customerInfo.getAddress(),customerInfo.getEmail(),customerInfo.getPhone(),customerInfo.getUserid(),customerInfo.getCreated_at());
        }
        else return 0;
    }
    
    @Override
    public List<CustomerInfo> getCustometsDetails(){
        String sql = "SELECT * FROM customerinfo order by id desc";
        List<CustomerInfo> listOfCustomer=jdbcTemplate.query(sql, new RowMapper<CustomerInfo>() {
            @Override
            public CustomerInfo mapRow(ResultSet rs, int rowNum) throws SQLException {
                CustomerInfo customerInfo=new CustomerInfo();
                customerInfo.setName(rs.getString("name"));
                customerInfo.setCustomerid(rs.getString("customerid"));
                customerInfo.setPhone(rs.getString("phone"));
                customerInfo.setEmail(rs.getString("email"));
                customerInfo.setAddress(rs.getString("address"));
                return customerInfo;
            }
        });
        return listOfCustomer;
    }
    
   
     @Override
    public CustomerInfo retriveCustomerInfo(String customerId){  
        String sql="select * from customerinfo where customerid=?";
        return jdbcTemplate.queryForObject(sql, new Object[]{customerId},new BeanPropertyRowMapper<CustomerInfo>(CustomerInfo.class));

    }
    
    @Override
    public int changeCustomeInfo(CustomerInfo customerInfo){
        String sql = "update customerinfo set name=?, address=?, email=?, phone=? where customerid=?";
        int i= jdbcTemplate.update(sql,customerInfo.getName(),customerInfo.getAddress(),customerInfo.getEmail(),customerInfo.getPhone(),customerInfo.getCustomerid());
        //String sql = "update customerinfo set name=? where customerid=?";
        //int i= jdbcTemplate.update(sql,customerInfo.getName(),"CUS-01");
        return (i+2);
    }
    
    @Override
     public int deleteCustomerInfo(String customerId){
         String sql = "delete from customerinfo where customerid=?";
         int i= jdbcTemplate.update(sql, customerId);
         return (i+4);
     }
     
     
     @Override
    public List<CustomerInfo> searchCustomerInfo(String searchVal){
        searchVal="%" +searchVal+ "%";
        String sql = "SELECT * FROM customerinfo where name like ? or customerid like ? or phone like ? or email like ? or address like ?";
        //String sql = "SELECT * FROM customerinfo order by id asc";
        List<CustomerInfo> listOfCustomer=jdbcTemplate.query(sql,new Object[]{searchVal,searchVal,searchVal,searchVal,searchVal}, new RowMapper<CustomerInfo>() {
            @Override
            public CustomerInfo mapRow(ResultSet rs, int rowNum) throws SQLException {
                CustomerInfo customerInfo=new CustomerInfo();
                customerInfo.setName(rs.getString("name"));
                customerInfo.setCustomerid(rs.getString("customerid"));
                customerInfo.setPhone(rs.getString("phone"));
                customerInfo.setEmail(rs.getString("email"));
                customerInfo.setAddress(rs.getString("address"));
                return customerInfo;
            }
        });
        return listOfCustomer;
    }
     
     
    
    
}

