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
    public String Reply(@RequestParam("id") String id, Reply reply){

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

        return "redirect:read?id="+id;

        //리플 삭제 구현하기.


    }
}
