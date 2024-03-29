package com.mamababy.domain.Board;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
@Component
public class FileBean {
	private String attach_path;
	private MultipartFile upload;
	private String filename;
	private String CKEditorFuncNum;

	public String getAttach_path() {
		return this.attach_path;
	}

	public void setAttach_path(String attach_path) {
		this.attach_path = attach_path;
	}

	public MultipartFile getUpload() {
		return upload;
	}

	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}

	public String getFilename() {
		return this.filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getCKEditorFuncNum() {
		return this.CKEditorFuncNum;
	}

	public void setCKEditorFuncNum(String CKEditorFuncNum) {
		this.CKEditorFuncNum = CKEditorFuncNum;
	}
}