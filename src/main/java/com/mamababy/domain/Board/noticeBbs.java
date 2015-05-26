package com.mamababy.domain.Board;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Created by hoy on 2015. 5. 21..
 */
@Entity
@Table(name = "notice_bbs")
public class noticeBbs {
    private String subject;


    private String content;
    private String category;
    private String regDate;

    private String id;






    @Id
    @Column(name = "id")
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    @Column(name = "category")
    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    @Column(name = "regDate")
    public String getRegDate() {
        return regDate;
    }

    public void setRegDate(String regDate) {
        this.regDate = regDate;
    }



    @Column(name = "subject",length = 10000)
    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }



    @Column(name = "content", length = 100000)
    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }


}
