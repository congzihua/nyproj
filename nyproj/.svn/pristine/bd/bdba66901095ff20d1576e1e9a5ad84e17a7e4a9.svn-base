package com.founder.enp.service;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.upload.FormFile;

public class UploadFile {

	private String destPath;

	private String fileName;

	private FormFile file;

	private HttpServletRequest request;

	public UploadFile(String path, String name, FormFile file) {
		this.destPath = path;
		this.fileName = name;
		this.file = file;
	}

	public UploadFile(String path, String name, HttpServletRequest request) {
		this.destPath = path;
		this.fileName = name;
		this.request = request;

	}

	public void upload() throws IOException {
		InputStream in = file.getInputStream();
		OutputStream out = new FileOutputStream(destPath + fileName);
		int bytesRead = 0;
		byte[] buffer = new byte[8192];
		while ((bytesRead = in.read(buffer, 0, 8192)) != -1) {
			out.write(buffer, 0, bytesRead);
		}
		out.close();
		in.close();
		file.destroy();
	}

	public void uploadIEWord() throws IOException {
		InputStream in = request.getInputStream();
		OutputStream out = new FileOutputStream(destPath + fileName);
		int bytesRead = 0;
		byte[] buffer = new byte[8192];
		while ((bytesRead = in.read(buffer, 0, 8192)) != -1) {
			out.write(buffer, 0, bytesRead);
		}
		out.close();
		in.close();

	}

}
