package com.mamababy.Controller;

import com.mamababy.domain.repository.ItemRepository;
import com.mamababy.domain.user.Item;
import com.mamababy.domain.user.Option;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by hoy on 15. 4. 28..
 */

@Controller
public class ItemDetailController {

    private final ItemRepository itemRepository;

    @Autowired
    public ItemDetailController(ItemRepository itemRepository) {
        this.itemRepository = itemRepository;
    }
    // todo : 모듈화

    @RequestMapping("/itemDetail")
    public ModelAndView getItemDetail(@RequestParam("id") String id, Model model){

        Logger logger = LoggerFactory.getLogger(ModelAndView.class);

        logger.info("get item deail view");

        Item item = itemRepository.findById(id);
        model.addAttribute("item", item);


        logger.info("===========item Detail=========" +
                "\nid : "+item.getId()+
                "\ncategory1 :  " + item.getCategory1() +
                "\ncategory2 :  " + item.getCategory2() +
                "\ncontents  :  " + item.getContents() +
                "\ndel_type  :  " + item.getDel_type() +
                "\nfile_path :  " + item.getFilePath() +
                "\noptcode1  :  " + item.getOptcode1() +
                "\noptcode2  :  " + item.getOptcode2() +
                "\noptcode3  :  " + item.getOptcode3() +
                "\nopttitle1 :  " + item.getOpttitle1() +
                "\nopttitle2 :  " + item.getOpttitle2() +
                "\nopttitle3 :  " + item.getOpttitle3());
        // todo : 모듈화 시켜볼것
        String[] optCodeList1 = item.getOptcode1().split(",");
        String[] optCodeList2 = item.getOptcode2().split(",");
        String[] optCodeList3 = item.getOptcode3().split(",");

        Option opt1 = new Option();
        opt1.setOptitle(item.getOpttitle1());
        opt1.setOptCode(optCodeList1);

        Option opt2 = new Option();
        opt2.setOptitle(item.getOpttitle2());
        opt2.setOptCode(optCodeList2);



        Option opt3 = new Option();
        opt3.setOptitle(item.getOpttitle3());
        opt3.setOptCode(optCodeList3);


        model.addAttribute("opt1", opt1);
        if(opt2 != null)model.addAttribute("opt2", opt2);
        if(opt3 != null)model.addAttribute("opt3", opt3);

        return new ModelAndView("/item_detail");

    }
}
