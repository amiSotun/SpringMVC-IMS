/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.emp.model;

/**
 *
 * @author Humayun Kabir
 */
public class ModelInfo {
    public String modelid;
    public String brandid;
    public String brandname;
    public String catid;
     public String catname;
    public String userid;
    public String details;
    public String created_at;

    public ModelInfo() {
    }

    public ModelInfo(String modelid, String brandid, String catid, String userid, String details,String created_at) {
        this.modelid = modelid;
        this.brandid = brandid;
        this.catid = catid;
        this.userid = userid;
        this.details = details;
        this.created_at = created_at;
    }

    public ModelInfo(String modelid, String brandid, String brandname, String catid, String catname, String userid, String details, String created_at) {
        this.modelid = modelid;
        this.brandid = brandid;
        this.brandname = brandname;
        this.catid = catid;
        this.catname = catname;
        this.userid = userid;
        this.details = details;
        this.created_at = created_at;
    }
    
       public String getModelid() {
        return modelid;
    }


    public void setModelid(String modelid) {
        this.modelid = modelid;
    }

    public String getBrandid() {
        return brandid;
    }

    public void setBrandid(String brandid) {
        this.brandid = brandid;
    }

    public String getCatid() {
        return catid;
    }

    public void setCatid(String catid) {
        this.catid = catid;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }
    
    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details;
    }
     public String getCreated_at() {
        return created_at;
    }

    public void setCreated_at(String created_at) {
        this.created_at = created_at;
    }

    public String getBrandname() {
        return brandname;
    }

    public void setBrandname(String brandname) {
        this.brandname = brandname;
    }

    public String getCatname() {
        return catname;
    }

    public void setCatname(String catname) {
        this.catname = catname;
    }
    
    
}
