/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.emp.dao;

import org.springframework.jdbc.datasource.DriverManagerDataSource;

/**
 *
 * @author Humayun Kabir
 */
public class MyConnection {
    DriverManagerDataSource dataSource;

    public MyConnection() {
    }
    public DriverManagerDataSource SetMySQL() {
        dataSource = new DriverManagerDataSource();
        dataSource.setDriverClassName("com.mysql.jdbc.Driver");
        dataSource.setUrl("jdbc:mysql://localhost:3306/dbims");
        dataSource.setUsername("root");
        dataSource.setPassword("123456");
        return dataSource;
    }
}
