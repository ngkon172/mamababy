package com.mamababy.admin;

import com.mamababy.domain.user.LoginForm;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by hoy on 2015. 5. 18..
 */

@Controller
@RequestMapping(value = "/admin")
public class AdminloginController {

    private static final Logger logger = LoggerFactory.getLogger(AdminloginController.class);

    @RequestMapping(method = RequestMethod.GET)
    public String getAdminLoginPage(){

        return "/admin/adminLogin";
    }

    @RequestMapping(value = "/login" , method = RequestMethod.POST)
    public String LoginCheck(LoginForm loginform, HttpSession session , HttpServletRequest request) {

        logger.info("======== admin id  & password" + loginform.getId() + loginform.getPassword());
        String returnUrl = "";
        if (loginform.getId().equals("ngkon") && loginform.getPassword().equals("8956")) {
            request.getSession().setAttribute("logininfo", true);

            returnUrl ="/admin/main";
        }else {
            returnUrl ="/admin";
        }

        return  returnUrl;
    }

    @RequestMapping(value = "/main" )
    public String getAdminMain(){
        return "/admin/main";
    }


    @RequestMapping(value = "/orderList")
    public String getOrderList(){ return  "/admin/order_list";}

    @RequestMapping(value = "/userList")
    public String getUserList(){return  "/admin/user_list";}

    @RequestMapping(value = "/productList")
    public String getProductList(){return  "/admin/product_list";}



}


