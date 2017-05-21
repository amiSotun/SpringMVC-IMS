/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.emp.model;

import java.io.Serializable;

/**
 *
 * @author Humayun Kabir
 */
public class SupplierInfo implements Serializable{
    private int id;
    private String supplierid;
    private String name;
    private String address;
    private String email;
    private String phone;
    private String userid;
    private String created_at;

    public SupplierInfo() {
    }

    public SupplierInfo(int id, String supplierid, String name, String address, String email, String phone, String userid, String created_at) {
        this.id = id;
        this.supplierid = supplierid;
        this.name = name;
        this.address = address;
        this.email = email;
        this.phone = phone;
        this.userid = userid;
        this.created_at = created_at;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getSupplierid() {
        return supplierid;
    }

    public void setSupplierid(String supplierid) {
        this.supplierid = supplierid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getCreated_at() {
        return created_at;
    }

    public void setCreated_at(String created_at) {
        this.created_at = created_at;
    }
    
}
