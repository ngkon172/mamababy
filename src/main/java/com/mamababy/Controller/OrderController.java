package com.mamababy.Controller;


import javax.servlet.http.HttpSession;

import com.mamababy.domain.repository.ItemRepository;
import com.mamababy.domain.repository.UserRepository;
import com.mamababy.domain.user.CartItem;
import com.mamababy.domain.user.Item;
import com.mamababy.domain.user.SelectedOption;
import com.mamababy.domain.user.Users;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;


@Controller
public class OrderController {



    Logger logger= LoggerFactory.getLogger(OrderController.class);
    private final UserRepository userRepo;
    private final ItemRepository itemRepo;
    @Autowired
    public OrderController(ItemRepository itemRepo, UserRepository userRepo){
        this.userRepo = userRepo;
        this.itemRepo = itemRepo;
    }


    @RequestMapping(value="/order", method=RequestMethod.POST)
    public String getOrderView(@RequestParam String id, SelectedOption Soption, Model model,HttpSession session){

        logger.info(Soption.getOptCode1());
        logger.info(Soption.getOptCode2());
        logger.info(Soption.getOptCode3());


        if(session.getAttribute("user")!=null){

            Item item = itemRepo.findById(id);

            model.addAttribute("item", item);
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
        }else
            session.setAttribute("sopt", Soption);
        model.addAttribute("id", id);
        return "/orderLogin";

    }


}
