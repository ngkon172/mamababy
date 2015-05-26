package com.mamababy.Controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.mamababy.domain.repository.ItemRepository;
import com.mamababy.domain.repository.NoMemberOrderLoginForm;
import com.mamababy.domain.repository.UserRepository;
import com.mamababy.domain.user.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;



@Controller
public class OrderLoginController {


    Logger logger = LoggerFactory.getLogger(OrderLoginController.class);

    private final UserRepository userRepo;
    private final ItemRepository itemRepo;

    @Autowired
    public OrderLoginController(UserRepository userRepo, ItemRepository itemRepo){
        this.userRepo = userRepo;
        this.itemRepo = itemRepo;


    }

    @RequestMapping(value="/orderLogin", method=RequestMethod.POST)
    public String OrderLogin(LoginForm loginForm,@RequestParam("ItemId") String id , HttpSession session, Model model){

        if(userRepo.findByUser(loginForm.getId())==null){
            return "Orderidfail";
        }else if(!userRepo.findByUser(loginForm.getId()).getMember_password().equals(loginForm.getPassword())){

//			logger.info("db password : " +userRepo.findByUser(loginForm.getId()).getMember_password());
//			logger.info("input password : " +loginForm.getPassword());
//			
            return "OdrderpasswordFail";


        }else{

            Users user = userRepo.findByUser(loginForm.getId());
            session.setAttribute("user", user);
            Item item = itemRepo.findById(id);
            model.addAttribute("item", item);
            SelectedOption Soption = (SelectedOption)session.getAttribute("sopt");
            session.removeAttribute("sopt");
            model.addAttribute("sopt",Soption);
            Users sessionUser = (Users) session.getAttribute("user");




            if(session.getAttribute("user")!=null)model.addAttribute("user", sessionUser);

            List<CartItem> orderList =new ArrayList<CartItem>();
            if(session.getAttribute("cart")!=null){
                orderList.addAll((List<CartItem>)session.getAttribute("cart"));
            }

            CartItem cart = new CartItem(id, item.getFilePath(), item.getPrdname(), item.getReserve(), Soption.getCount(), item.getSellprice());

            orderList.add(cart);

            int sumprice =0;
            int sumReserve=0;
            for(int i =0;i<=orderList.size()-1;i++){
                int tmpsumprice =Integer.parseInt(orderList.get(i).getSellPrice())* Integer.parseInt(orderList.get(i).getCount());
                sumprice = sumprice+tmpsumprice;
                int tmpReserve = Integer.parseInt(orderList.get(i).getReserve())*Integer.parseInt(orderList.get(i).getCount());
                sumReserve = sumReserve +tmpReserve;
            }
            model.addAttribute("orderList", orderList);

            model.addAttribute("totalPrice",sumprice);
            model.addAttribute("totalReserve",sumReserve);



            return "order";

        }


    }

    @RequestMapping("/noMemOrder")
    public String noMemOrder(@ModelAttribute("itemId") String id,HttpSession session, @ModelAttribute NoMemberOrderLoginForm loginForm, Model model){
        logger.info("=============get no memberOrder=================");
        logger.info("Item id =" +id);

        Item item = itemRepo.findById(id);
        SelectedOption Soption = (SelectedOption)session.getAttribute("sopt");

        List<CartItem> orderList =new ArrayList<CartItem>();
        if(session.getAttribute("cart")!=null){
            orderList.addAll((List<CartItem>)session.getAttribute("cart"));
        }

        CartItem cart = new CartItem(id, item.getFilePath(), item.getPrdname(), item.getReserve(), Soption.getCount(), item.getSellprice());

        orderList.add(cart);

        int sumprice =0;
        int sumReserve=0;
        for(int i =0;i<=orderList.size()-1;i++){
            int tmpsumprice =Integer.parseInt(orderList.get(i).getSellPrice())* Integer.parseInt(orderList.get(i).getCount());
            sumprice = sumprice+tmpsumprice;
            int tmpReserve = Integer.parseInt(orderList.get(i).getReserve())*Integer.parseInt(orderList.get(i).getCount());
            sumReserve = sumReserve +tmpReserve;
        }

        model.addAttribute("noMem", loginForm);
        model.addAttribute("orderList", orderList);

        model.addAttribute("totalPrice",sumprice);
        model.addAttribute("totalReserve",sumReserve);



        return "order";


    }


}
