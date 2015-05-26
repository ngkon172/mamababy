package com.mamababy.Controller;

import java.util.ArrayList;
import java.util.List;

import com.mamababy.domain.repository.ItemRepository;
import com.mamababy.domain.user.CartItem;
import com.mamababy.domain.user.Item;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;



@Controller
@SessionAttributes({"cart"})
public class CartController {

    Logger logger = LoggerFactory.getLogger(CartController.class);

    private final ItemRepository itemRepo;

    @Autowired
    public CartController(ItemRepository itmeRepo){
        this.itemRepo = itmeRepo;
    }

    @ModelAttribute("cart")
    public List<CartItem> cart(){
        return new ArrayList<CartItem>();
    }
    @RequestMapping(value="/cart",method = RequestMethod.GET)
    public String getCart(Model model,@ModelAttribute("cart") List<CartItem> cart) {
        if (!model.containsAttribute("cart")) {
            model.addAttribute("cart", new ArrayList<CartItem>());
        }
        int sumprice =0;
        int sumReserve=0;
        for(int i =0;i<=cart.size()-1;i++){
            int tmpsumprice =Integer.parseInt(cart.get(i).getSellPrice())* Integer.parseInt(cart.get(i).getCount());
            sumprice = sumprice+tmpsumprice;
            int tmpReserve = Integer.parseInt(cart.get(i).getReserve())*Integer.parseInt(cart.get(i).getCount());
            sumReserve = sumReserve +tmpReserve;
        }
        model.addAttribute("totalPrice",sumprice);
        model.addAttribute("totalReserve",sumReserve);
        return "/cart";
    }


    @RequestMapping(value="/addCart", method = RequestMethod.POST)
    public String add(@ModelAttribute CartItem goods,
                      @ModelAttribute("cart") List<CartItem> cart, Model model,@RequestParam("id")String id) {

        Item item = itemRepo.findById(id);

        CartItem cItem = new  CartItem(id, item.getFilePath(), item.getPrdname(),item.getReserve(),goods.getCount(), item.getSellprice());
        cart.add(cItem);
        int sumprice =0;
        int sumReserve=0;
        for(int i =0;i<=cart.size()-1;i++){
            int tmpsumprice =Integer.parseInt(cart.get(i).getSellPrice())* Integer.parseInt(cart.get(i).getCount());
            sumprice = sumprice+tmpsumprice;
            int tmpReserve = Integer.parseInt(cart.get(i).getReserve())*Integer.parseInt(cart.get(i).getCount());
            sumReserve = sumReserve +tmpReserve;
        }

        model.addAttribute("totalPrice",sumprice);
        model.addAttribute("totalReserve",sumReserve);


        return "/cart";
    }
    @RequestMapping(value="/cartDel")
    public String delCart(@RequestParam("id") String id,@ModelAttribute("cart") List<CartItem> cart, Model model){

        for(int i = 0 ; i<=cart.size()-1;i++){
            if(cart.get(i).getItemId().equals(id)){
                cart.remove(i);
            }
        }

        int sumprice =0;
        int sumReserve=0;
        for(int i =0;i<=cart.size()-1;i++){
            int tmpsumprice =Integer.parseInt(cart.get(i).getSellPrice())* Integer.parseInt(cart.get(i).getCount());
            sumprice = sumprice+tmpsumprice;
            int tmpReserve = Integer.parseInt(cart.get(i).getReserve())*Integer.parseInt(cart.get(i).getCount());
            sumReserve = sumReserve +tmpReserve;
        }

        model.addAttribute("totalPrice",sumprice);
        model.addAttribute("totalReserve",sumReserve);

        return "redirect:/cart";

    }


}
