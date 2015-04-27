package com.mamababy.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by hoy on 15. 4. 27..
 */
@Controller
public class mainController {

    @RequestMapping(value = "/mom")
    public String getMomView(){

        return "mom";

    }

    @RequestMapping(value = "/dress")
    public String getDressView(){

        return "dress";
    }

    @RequestMapping(value = "/baby")
    public String getBabyView(){

        return "baby";
    }

    @RequestMapping(value ="/acc")
    public String getAccView(){

        return  "acc";
    }

    @RequestMapping(value = "/traditional")
    public String getTraditionalView(){

        return "traditional";
    }

}
