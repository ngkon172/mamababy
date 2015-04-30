package com.mamababy.Controller;

import com.mamababy.Service.DateFormater;
import com.mamababy.domain.Board.FileBean;
import com.mamababy.domain.repository.productRepository;
import com.mamababy.domain.user.Item;
import com.mamababy.domain.user.ItemForm;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;

/**
 * Created by hoy on 15. 4. 27..
 */

@Controller
@RequestMapping("/admin")
public class productUploadController {

    private static int cnt = 0;
    Logger logger = LoggerFactory.getLogger(productUploadController.class);

    private final productRepository productRepository;
    @Autowired
    public productUploadController(com.mamababy.domain.repository.productRepository productRepository) {
        this.productRepository = productRepository;
    }

    @RequestMapping(value = "/product_upload", method = RequestMethod.POST)
    public String uploadProduct(ItemForm itemForm, HttpServletRequest request, Model model) throws IOException {
        logger.info("get product upload View");
        logger.info("=========upload Item info========" +
                        "category1 : " + itemForm.getCategory1() + "\n" +
                        "category2 : " + itemForm.getCategory2() + "\n" +
                        "prdname :   " + itemForm.getPrdname() + "\n" +
                        "sellprice:  " + itemForm.getSellprice() + "\n" +
                        "stock:      " + itemForm.getStock() + "\n" +
                        "reserve :   " + itemForm.getReserve() + "\n" +
                        "filename : " + itemForm.getRealimg().getOriginalFilename() + "\n"
                        + "content : " + itemForm.getContent()
        );

        HttpSession session = request.getSession();
        String rootPath = session.getServletContext().getRealPath("/");
        String attachPath = "/resources/files/attach/";
        String fileName = "";
        String filePath = "";

        DateFormater df = new DateFormater();

        String idDate = df.date();

        DecimalFormat format = new DecimalFormat("0000");
        String idI = format.format(cnt).toString();
        String id = idDate + idI;

        MultipartFile img = itemForm.getRealimg();

        if (img != null) {
            fileName = img.getOriginalFilename();
            filePath = rootPath + attachPath + id + "/";
            File file1 = new File(filePath);
            file1.mkdirs();
            File file = new File(filePath + fileName);
            img.transferTo(file);
        }

        String newfilePath = attachPath + "/" + fileName;
        cnt = cnt + 1;

        Item item = new Item(id, itemForm.getCategory1(), itemForm.getCategory2(), itemForm.getPrdname(),
                itemForm.getSellprice(), itemForm.getReserve(), itemForm.getStock(),
                itemForm.getStrprice(), itemForm.getDel_type(), newfilePath, itemForm.getOpttitle1(),
                itemForm.getOptcode1(), itemForm.getOpttitle2(), itemForm.getOptcode2(), itemForm.getOpttitle3(),
                itemForm.getOptcode3(), itemForm.getContent());

        productRepository.save(item);

        model.addAttribute("item", item);

        return "/item_detail-test";

    }

}