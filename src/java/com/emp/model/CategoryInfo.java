/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.emp.model;

import java.io.Serializable;

/**
 *
 * @author RuBaYeT
 */
public class CategoryInfo implements Serializable{
     private String catid;
    private String catName;
    private String description;
    private String userid;
    private String created_at;

    public CategoryInfo() {
    }

    public CategoryInfo(String catid, String catName, String description, String userid, String created_at) {
        this.catid = catid;
        this.catName = catName;
        this.description = description;
        this.userid = userid;
        this.created_at = created_at;
    }

    public String getCatid() {
        return catid;
    }

    public void setCatid(String catid) {
        this.catid = catid;
    }

    public String getCatName() {
        return catName;
    }

    public void setCatName(String catName) {
        this.catName = catName;
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
