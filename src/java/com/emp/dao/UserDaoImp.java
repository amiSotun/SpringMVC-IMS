/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.emp.dao;
import com.emp.model.UserInfo;
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
public class UserDaoImp implements UserDao{
    private JdbcTemplate jdbcTemplate;
    
    @Override
    public void setDB() {
        DriverManagerDataSource dataSource = new DriverManagerDataSource();
        dataSource.setDriverClassName("com.mysql.jdbc.Driver");
        dataSource.setUrl("jdbc:mysql://localhost:3306/dbims");
        dataSource.setUsername("root");
        dataSource.setPassword("123456");          
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }
    
    @Override
    public boolean checkCustomerExist(String userid,int usertype,String password){
        String sql="select count(*) as num from userinfo where userid=? AND type=? AND password=?";
        int i=jdbcTemplate.queryForObject(sql,new Object[]{userid,usertype,password},Integer.class);
        return i>0;
    }
}
