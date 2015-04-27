package com.mamababy.Controller;

import com.mamababy.domain.repository.ItemRepository;
import com.mamababy.domain.user.CartItem;
import com.mamababy.domain.user.Item;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by hoy on 15. 4. 28..
 */

@Controller
@SessionAttributes({"cart"})
public class CartController {

    private final ItemRepository itemRepo;


    @Autowired
    public CartController(ItemRepository itemRepo) {
        this.itemRepo = itemRepo;
    }
//
//    @ModelAttribute("cart")
//    public List<CartItem> cart(){
//        return new ArrayList<CartItem>();
//    }

    @RequestMapping(value ="/cart", method = RequestMethod.GET)
    public String getCart(Model model , @ModelAttribute("Cart") List<CartItem> cart){
        if(!model.containsAttribute("cart")){
            model.addAttribute("cart", new ArrayList<CartItem>());
        }

        int sumPrice = 0;
        int sumReserve = 0;

        for(int i =0;i<=cart.size()-1;i++){
            int tmpsumprice =Integer.parseInt(cart.get(i).getSellPrice())* Integer.parseInt(cart.get(i).getCount());
            sumPrice = sumPrice+tmpsumprice;
            int tmpReserve = Integer.parseInt(cart.get(i).getReserve())*Integer.parseInt(cart.get(i).getCount());
            sumReserve = sumReserve +tmpReserve;
        }

        model.addAttribute("totalPrice", sumPrice);
        model.addAttribute("totalReserve", sumReserve);
        return "/cart";
    }

    @RequestMapping(value = "/addCart", method = RequestMethod.POST)
    public String add(@ModelAttribute CartItem goods,
                      @ModelAttribute("cart") List<CartItem> cart, Model model,
                      @RequestParam("id") String id)
    {
        Item item = itemRepo.findById(id);

        CartItem cartItem = new CartItem(id, item.getFilePath(), item.getPrdname(), item.getReserve(), goods.getCount(), item.getSellprice());
        cart.add(cartItem);
        int sumPrice = 0;
        int sumReserve = 0;

        for(int i =0;i<=cart.size()-1;i++){
            int tmpsumprice =Integer.parseInt(cart.get(i).getSellPrice())* Integer.parseInt(cart.get(i).getCount());
            sumPrice = sumPrice+tmpsumprice;
            int tmpReserve = Integer.parseInt(cart.get(i).getReserve())*Integer.parseInt(cart.get(i).getCount());
            sumReserve = sumReserve +tmpReserve;
        }

        model.addAttribute("totalPrice", sumPrice);
        model.addAttribute("totalReserve", sumReserve);

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

        return "/cart";

    }
}
