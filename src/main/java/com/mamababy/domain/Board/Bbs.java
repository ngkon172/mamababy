package com.mamababy.domain.Board;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "bbs")
// @NamedQueries({
// @javax.persistence.NamedQuery(
// name = "findArticleCntByCategory",
// query =
// "SELECT count(b) from com.mamababy.domain.Board.Bbs b where category=:cate")
// })
public class Bbs implements Serializable {

	/**
	 * 
	 */

	private static final long serialVersionUID = -2996961608681856380L;
	private String subject;
	private String name;
	private String password;
	private String content;
	private String category;
	private String regDate;
	private String replyId;
	private String id;
	private int hit;
	private int no;
	private Long replyCount;

	@Column(name = "hit")
	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	@Column(name = "no")
	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

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

	@Column(name = "replyId")
	public String getReplyId() {
		return replyId;
	}

	public void setReplyId(String replyId) {
		this.replyId = replyId;
	}

	@Column(name = "subject",length = 10000)
	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	@Column(name = "name",length = 1000)
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "password")
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Column(name = "content", length = 100000)
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	@Column(name="replyCount")
	public Long getReplyCount() {
		return replyCount;
	}

	public void setReplyCount(Long replyCount) {
		this.replyCount = replyCount;
	}
	

}
