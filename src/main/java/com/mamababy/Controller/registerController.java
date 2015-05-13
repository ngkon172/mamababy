package com.mamababy.Controller;

import com.mamababy.domain.repository.AdditionalInfoRepository;
import com.mamababy.domain.repository.UserRepository;
import com.mamababy.domain.user.Users;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by hoy on 15. 4. 27..
 */

@Controller
@RequestMapping(value = "/reg")
public class registerController {

    Logger logger = LoggerFactory.getLogger(registerController.class);

    private final UserRepository userRepository;
    private final AdditionalInfoRepository additionalInfoRepository;

    @Autowired
    public registerController(UserRepository userRepository, AdditionalInfoRepository additionalInfoRepository) {
        this.userRepository = userRepository;
        this.additionalInfoRepository = additionalInfoRepository;
    }

    @RequestMapping(method = RequestMethod.GET)
    public String getRegisterView(){

        return "reg";
    }

    @RequestMapping(method = RequestMethod.POST)
    public String registUser(@ModelAttribute Users users, BindingResult result){

        logger.info("============dataTEst ==============================");
        logger.info("addr1 = " + users.getAddr1());
        userRepository.save(users);

        return "/main";
    }

    @RequestMapping(value="/overlaptest.do")
    @ResponseBody
    public String overlapTest(String member_id){
        logger.info("=======================================ID CHECK=========================================");
        int countId = userRepository.countByUser(member_id);
        String count = Integer.toString(countId);
        return count;
    }

}
