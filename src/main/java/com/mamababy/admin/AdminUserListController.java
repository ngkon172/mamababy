package com.mamababy.admin;

import com.mamababy.domain.repository.UserRepository;
import com.mamababy.domain.user.Users;
import com.sun.javafx.sg.prism.NGShape;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * Created by hoy on 2015. 5. 23..
 */
@Controller
public class AdminUserListController {

    private final UserRepository userRepository;

    @Autowired
    public AdminUserListController(UserRepository userRepository) {
        this.userRepository = userRepository;
    }



    @RequestMapping(value = "/admin/userList")
    public ModelAndView getUserList(){

        List<Users> usersList = userRepository.findAll();

        return new ModelAndView("/admin/user_list", "userList", usersList);
    }

    @RequestMapping(value = "/admin/userList/detail")
    public ModelAndView getUserDetail(@RequestParam("id") String id){

        Users user = userRepository.findByUser(id);

        return new ModelAndView("/admin/userDetail" , "user" ,user );

    }

    @RequestMapping(value = "/admin/userList/del")
    public String userDelete(@ModelAttribute("joinForm") Users user,Model model){

        userRepository.delete(user);
        model.addAttribute("msg", "삭제 되었습니다.");
        model.addAttribute("url", "/admin/userList");

        return "/alert";
    }


}
