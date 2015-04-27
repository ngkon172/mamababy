package com.mamababy.Service;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by hoy on 15. 4. 27..
 */
public class DateFormater {


    public String date(){
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String regDate = sdf.format(date).toString();

        return regDate;
    }
}
