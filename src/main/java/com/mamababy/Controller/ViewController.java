package com.mamababy.Controller;

import com.mamababy.domain.Board.Bbs;
import com.mamababy.domain.Board.FileBean;
import com.mamababy.domain.repository.BbsRepository;
import com.mamababy.domain.repository.BbsService;
import com.mamababy.domain.repository.replyRepository;
import com.mamababy.domain.user.Reply;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;


/**
 * Created by hoy on 15. 4. 25..
 */

@Controller

public class ViewController {



    private static final Logger logger = LoggerFactory.getLogger(ViewController.class);

    private final BbsRepository bbsRepository;
    private final BbsService bbsService;
    private final FileBean fileBean;
    private final replyRepository replyRepository;

    @Autowired
    public ViewController(BbsRepository bbsRepository, BbsService bbsService, FileBean fileBean, replyRepository replyRepository){
        this.bbsRepository = bbsRepository;
        this.bbsService = bbsService;
        this.fileBean = fileBean;
        this.replyRepository = replyRepository;
    }



    // 카테고리에 맞는 글쓰기 뷰를 불러온다.
    @RequestMapping(value = "/write", method = RequestMethod.GET)
    public String BbsWirte(@RequestParam String cate, Model model){
        logger.info("Display view |bbs Wirte|");
        model.addAttribute("cate", cate);
        return "write";
    }



    // 글쓰기에서 이미지파일을 업로드한다.
    @RequestMapping(value = "/file_upload", method = RequestMethod.POST)
    public String FileUpload(FileBean fileBean, HttpServletRequest request, Model model){

        HttpSession session = request.getSession();
        String rootPath = session.getServletContext().getRealPath("/");
        String attachPath = "/resources/files/attach";
        logger.info("root path :" +rootPath);
        MultipartFile upload = fileBean.getUpload();
        String fileName = "";
        String CKEditorFuncNum = "";
        if(upload != null){
            fileName = upload.getOriginalFilename();
            fileBean.setFilename(fileName);
            CKEditorFuncNum = fileBean.getCKEditorFuncNum();
            try{
                File file= new File(rootPath+attachPath+fileName);
                upload.transferTo(file);
            }catch (IOException e){
                e.printStackTrace();
            }
        }

        String filePath = attachPath+ fileName;
        model.addAttribute("file_path", filePath);
        model.addAttribute("CKEditorFuncNum", CKEditorFuncNum);

        return "bbs.fileupload";

    }


    @RequestMapping(value="/write_ok", method = RequestMethod.POST)
    public ModelAndView wirteOk(@ModelAttribute Bbs bbs, BindingResult result, Model model){
        model.addAttribute("bbs", bbs);
        Date date = new Date();

        String id = UUID.randomUUID().toString();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String regDate=  sdf.format(date).toString();

        bbs.setRegDate(regDate);
        bbs.setId(id);


        String no = bbsRepository.findArticleCntByCategory(bbs.getCategory());
        int num = Integer.parseInt(no) +1;
        bbs.setNo(num);
        logger.info("=================================================\n" +
                "bbs attribute \n" +
                "no : " + bbs.getNo() +
                "id : " + bbs.getId() +
                "\n subject : " + bbs.getSubject() +
                "\n name : " + bbs.getName() +
                "\n regdate : " + bbs.getRegDate() +
                "\n password : " + bbs.getPassword() +
                "\n contents : " + bbs.getContent() +
                "\n category : " + bbs.getCategory());


        bbsRepository.save(bbs);

        return new ModelAndView("read","bbs",bbs);



    }

    @RequestMapping(value = "/bbs/read", method = RequestMethod.GET)
    public String getReadVeiw(@RequestParam("id") String id, Model model){
        logger.info("get Read View");

        Bbs bbs = bbsRepository.findById(id);

        List<Reply> reply = replyRepository.findByBbsId(id);

        model.addAttribute("bbs", bbs);
        model.addAttribute("reply", reply);

        return "read";
    }


    // 각 게시판 불러오기  + Pageination.
    @RequestMapping(value="/bbs/{cate}")
    public String getBoard(@PathVariable("cate") String cate, @RequestParam("page")int pageNo, Model model){

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
        return "board";
    }



}
