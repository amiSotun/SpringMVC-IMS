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
public class BrandInfo implements Serializable{
    
    private String brandid;
    private String brandName;
    private String description;
    private String userid;
    private String created_at;

    public BrandInfo() {
    }

    public BrandInfo(String brandid, String brandName, String description, String userid, String created_at) {
        this.brandid = brandid;
        this.brandName = brandName;
        this.description = description;
        this.userid = userid;
        this.created_at = created_at;
    }

    public String getBrandid() {
        return brandid;
    }

    public void setBrandid(String brandid) {
        this.brandid = brandid;
    }

    public String getBrandName() {
        return brandName;
    }

    public void setBrandName(String brandname) {
        this.brandName = brandname;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
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
