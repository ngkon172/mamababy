package com.mamababy.domain.Board;

import org.springframework.web.multipart.MultipartFile;

public class FileDao {
	private String attach_path;
	private MultipartFile uplaod;
	private String fileName;
	private String CKEditorFuncNum;

	public String getAttach_path() {
		return attach_path;
	}

	public void setAttach_path(String attach_path) {
		this.attach_path = attach_path;
	}

	public MultipartFile getUplaod() {
		return uplaod;
	}

	public void setUplaod(MultipartFile uplaod) {
		this.uplaod = uplaod;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getCKEditorFuncNum() {
		return CKEditorFuncNum;
	}

	public void setCKEditorFuncNum(String cKEditorFuncNum) {
		CKEditorFuncNum = cKEditorFuncNum;
	}

}