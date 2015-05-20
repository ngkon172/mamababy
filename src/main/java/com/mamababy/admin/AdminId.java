package com.mamababy.admin;

/**
 * Created by hoy on 2015. 5. 18..
 */
public class AdminId {
    public String id = "mamababy";
    public String password = "8956";
    public  static  boolean index =false;

    public String getId() {
        return id;
    }


    public String getPassword() {
        return password;
    }

    public String auth(boolean index , String view){

        if(index){
            return view;
        }else {
            return "/admin/adminLogin";
        }

    }

}
