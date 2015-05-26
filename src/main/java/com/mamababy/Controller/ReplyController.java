package com.mamababy.Controller;

import com.mamababy.Service.DateFormater;
import com.mamababy.domain.Board.Bbs;
import com.mamababy.domain.repository.BbsRepository;
import com.mamababy.domain.repository.BbsService;
import com.mamababy.domain.repository.replyRepository;
import com.mamababy.domain.user.Reply;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.UUID;

/**
 * Created by hoy on 15. 4. 27..
 */
@Controller
public class ReplyController {

    Logger logger = LoggerFactory.getLogger(ReplyController.class);



    private final replyRepository replyRepository;
    private final BbsService bbsService;
    private final BbsRepository bbsRepository;

    @Autowired
    public ReplyController(com.mamababy.domain.repository.replyRepository replyRepository, BbsService bbsService, BbsRepository bbsRepository) {
        this.replyRepository = replyRepository;
        this.bbsService = bbsService;
        this.bbsRepository = bbsRepository;
    }


    @RequestMapping(value = "/reply", method = RequestMethod.POST)
    public String Reply(@RequestParam("id") String id, Reply reply ,Model model){

        String replyId = UUID.randomUUID().toString();

        DateFormater df = new DateFormater();
        String regDate = df.date();

        reply.setBbsId(id);
        reply.setRegDate(regDate);
        reply.setId(replyId);

        replyRepository.save(reply);


        Long replyCount = replyRepository.countByBbsId(id);
        Bbs bbs = bbsRepository.findById(id);
        bbs.setReplyCount(replyCount);

        bbsRepository.save(bbs);

        return "redirect:/bbs/read?id="+id;

        //리플 삭제 구현하기.


    }
    @RequestMapping(value = "/bbs/reply/passchk")
    public String passwordCheck(@RequestParam("id")String id, @RequestParam("rid")String rid, Model model){

        model.addAttribute("id", id);
        model.addAttribute("rid", rid);
        return "/replyPassCheck";
    }
    @RequestMapping(value = "/bbs/reply/del", method = RequestMethod.POST)
    public String replyDelete(@ModelAttribute("id") String id,@ModelAttribute("rid")String rid, @ModelAttribute("password") String password){

        if(password.equals(replyRepository.findById(rid).getPassword())){
            logger.info("reply id = " + id + "cid == "+ rid);
            replyRepository.deleteById(rid);
            Bbs bbs = bbsRepository.findById(id);
            Long replyCount = replyRepository.countByBbsId(id);
            bbs.setReplyCount(replyCount);
            bbsRepository.save(bbs);
            return "redirect:/bbs/read";
        }else
        {
            return "/replyPassCheckFail";
        }



    }
}
