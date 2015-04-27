package com.mamababy.Controller;

import com.mamababy.domain.repository.UserRepository;
import com.mamababy.domain.user.LoginForm;
import com.mamababy.domain.user.Users;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

/**
 * Created by hoy on 15. 4. 27..
 */
@Controller
public class loginController {

    Logger logger = LoggerFactory.getLogger(loginController.class);

    private final UserRepository userRepository;

    @Autowired
    public loginController(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @RequestMapping("/login")
    public String getLoginView(){
        return "login";
    }

    @RequestMapping("/idTest")
    public ModelAndView idTest(@RequestParam String id, Model model){
        Boolean index = true;
        index = userRepository.equals(id);

        return new ModelAndView("reg", "index", index);
    }

    @RequestMapping(value="/loginValid")
    public String loginValid(LoginForm loginform, HttpSession session){

        if(userRepository.findByUser(loginform.getId())==null){
            return "idfail";
        }else if(!userRepository.findByUser(loginform.getId()).getMember_password().equals(loginform.getPassword())){


            return "passwordFail";


        }else{

            Users user = userRepository.findByUser(loginform.getId());
            session.setAttribute("user", user);
            Users sessionUser = (Users) session.getAttribute("user");
            return "main";

        }

    }
    @RequestMapping(value = "/logout")
    public String logOut(HttpSession session){
        session.removeAttribute("user");
        return "main";
    }
}
