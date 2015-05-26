package com.mamababy.admin;

import com.mamababy.Service.DateFormater;
import com.mamababy.domain.Board.Bbs;
import com.mamababy.domain.Board.FileBean;
import com.mamababy.domain.Board.noticeBbs;
import com.mamababy.domain.repository.BbsRepository;
import com.mamababy.domain.repository.BbsService;
import com.mamababy.domain.repository.noticeBbsRepository;
import com.mamababy.domain.repository.replyRepository;
import com.mamababy.domain.user.Reply;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * Created by hoy on 2015. 5. 21..
 */
@Controller
public class AdminBbsController {

    private static final Logger logger = LoggerFactory.getLogger(AdminBbsController.class);

    private final BbsRepository bbsRepository;
    private final BbsService bbsService;
    private final FileBean fileBean;
    private final replyRepository replyRepository;
    private final noticeBbsRepository  noticeBbsRepository;

    @Autowired
    public AdminBbsController(BbsRepository bbsRepository, BbsService bbsService, FileBean fileBean, replyRepository replyRepository, noticeBbsRepository noticeBbsRepository){
        this.bbsRepository = bbsRepository;
        this.bbsService = bbsService;
        this.fileBean = fileBean;
        this.replyRepository = replyRepository;
        this.noticeBbsRepository = noticeBbsRepository;
    }


    @RequestMapping(value = "/admin/bbsList/write", method = RequestMethod.GET)
    public String BbsWirte(@RequestParam String cate, Model model){
        logger.info("Display view |bbs Wirte|");
        model.addAttribute("cate", cate);
        return "/admin/noticeWrite";
    }




    @RequestMapping(value = "/admin/bbsList/{cate}")
    public String getBbs(@PathVariable("cate") String cate,  @RequestParam("page")int pageNo, Model model){
        int PageNum;
        if(pageNo <0){
            PageNum = 1;
        }else{
            PageNum = pageNo;
        }

        Page<Bbs> page = bbsService.getBbsLog(PageNum, cate);

        int current = page.getNumber()+1;
        int begin = Math.max(1, current-5);
        int end = Math.min(begin + 10, page.getTotalPages());
        List<Bbs> bbs = page.getContent();


        model.addAttribute("bbsLog", page);
        model.addAttribute("beginIndex", begin);
        model.addAttribute("endIndex", end);
        model.addAttribute("currentIndex", current);
        model.addAttribute("bbs", bbs);
        model.addAttribute("cate", cate);

        for (int i = 0; i < bbs.size() - 1; i++) {

            logger.info("category=" + bbs.get(i).getCategory());
            if (!(bbs.get(i).getCategory().matches(cate))) {
                logger.info("i=" + i);

            }
        }
        return "/admin/bbs_list";


    }
    @RequestMapping(value = "/admin/bbsList/read")
    public String getReadVeiw(@RequestParam("id") String id, Model model){
        logger.info("get Read View");

        Bbs bbs = bbsRepository.findById(id);

        List<Reply> reply = replyRepository.findByBbsId(id);

        model.addAttribute("bbs", bbs);
        model.addAttribute("reply", reply);

        return "read";
    }

    @RequestMapping(value = "/admin/bbsList/delete")
    public String bbsDelete(@RequestParam("id") String id, @RequestParam("cate") String cate){
        logger.info(id + cate);
        bbsRepository.delete(bbsRepository.findById(id));

        return "redirect:/admin/bbsList/"+cate+"?page=1";
    }

    @RequestMapping(value = "/admin/notice/write_ok", method = RequestMethod.POST)
    public ModelAndView writeNotice(noticeBbs noticeBbs , Model model){
        Date date = new Date();

        String id = UUID.randomUUID().toString();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String regDate=  sdf.format(date).toString();

        noticeBbs.setRegDate(regDate);
        noticeBbs.setId(id);

        model.addAttribute("noticebbs", noticeBbs);
        noticeBbsRepository.save(noticeBbs);
        return new ModelAndView("read","noticeBbs", noticeBbs);

    }
}
