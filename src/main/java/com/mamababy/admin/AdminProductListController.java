package com.mamababy.admin;

import com.mamababy.domain.repository.ItemRepository;
import com.mamababy.domain.user.Item;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * Created by hoy on 2015. 5. 24..
 */
@Controller
public class AdminProductListController {

    private final ItemRepository itemRepository;

    @Autowired
    public AdminProductListController(ItemRepository itemRepository) {
        this.itemRepository = itemRepository;
    }

    @RequestMapping(value = "/admin/productList")
    public ModelAndView getProductList(){

        List<Item> itemList = itemRepository.findAll();

        return new ModelAndView("/admin/product_list", "itemList", itemList);
    }

    @RequestMapping(value = "/admin/productList/update")
    public ModelAndView updateProduct(@RequestParam("id") String id){

        Item item = itemRepository.findById(id);

        return new ModelAndView("/admin/product_update" , "item" , item);
    }
}
