package com.mamababy.Controller;

import com.mamababy.domain.repository.ItemRepository;
import com.mamababy.domain.user.Item;
import org.apache.log4j.spi.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import sun.misc.Contended;

import java.util.List;

/**
 * Created by hoy on 15. 4. 27..
 */

@Contended
public class ItemListController {


    private final ItemRepository itemRepository;

    @Autowired
    public ItemListController(ItemRepository itemRepository) {
        this.itemRepository = itemRepository;
    }



    @RequestMapping(value = "/items")
    public String getListView(@RequestParam("cate1") String cate1, Model model){

        List<Item> item = itemRepository.findByCategory1(cate1);
        String cate = cate1.toLowerCase()+".jsp";
        model.addAttribute("cate1", cate);
        model.addAttribute("item", item);

        return "item_view";

    }

    @RequestMapping("/items1")
    public String getCate2View(@RequestParam("cate1") String cate1, @RequestParam("cate2") String cate2, Model model){

        List<Item> items = itemRepository.findByCategory(cate1, cate2);
        model.addAttribute("item", items);
        String cate = cate1.toLowerCase()+".jsp";
        model.addAttribute("cate1", cate);

        return "item_view";
    }
}
