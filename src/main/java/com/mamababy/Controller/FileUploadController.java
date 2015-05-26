package com.mamababy.Controller;

import com.mamababy.domain.Board.FileBean;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

/**
 * Created by hoy on 2015. 5. 23..
 */
@Controller
public class FileUploadController {

//    @RequestMapping(value = "/file_upload", method = RequestMethod.POST)
//    public String fileUpload(FileBean fileBean, HttpServletRequest request, Model model){
//        HttpSession session  =request.getSession();
//        String rootPath = session.getServletContext().getRealPath("/");
//
//        String attachPath = "/resources/images/bbs";
//        String Uid = UUID.randomUUID().toString();
//        MultipartFile upload = fileBean.getUpload();
//
//        String filename = "";
//        String CKEditorFuncNum = "";
//
//        if(upload != null){
//            filename = "_"+Uid+"_"+upload.getOriginalFilename();
//            fileBean.setFilename(filename);
//            CKEditorFuncNum = fileBean.getCKEditorFuncNum();
//
//            try{
//                File file = new File(rootPath +attachPath + filename);
//                upload.transferTo(file);
//            }catch (IOException e){
//                e.printStackTrace();
//            }
//        }
//
//        String filepath = attachPath + filename;
//        model.addAttribute("filepath", filepath);
//        model.addAttribute("CKEditorFuncNum", CKEditorFuncNum);
//
//        return "bbs.fileupload";
//
//
//    }


}

