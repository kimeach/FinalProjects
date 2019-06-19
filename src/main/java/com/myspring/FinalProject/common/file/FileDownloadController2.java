package com.myspring.FinalProject.common.file;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jdk.nashorn.internal.ir.RuntimeNode.Request;



@Controller
public class FileDownloadController2 {
	@RequestMapping("/download2.do")
	protected void download(@RequestParam("imageFileName") String imageFileName,
							@RequestParam("reviewNO") String reviewNO,
			                 HttpServletResponse response,
			                 HttpServletRequest request)throws Exception {
		final String ImagePath = request.getRealPath("/resources/reviewImage/");
		OutputStream out = response.getOutputStream();
		String downFile = ImagePath + "\\" +reviewNO+"\\"+ imageFileName;
		File file = new File(downFile);

		response.setHeader("Cache-Control", "no-cache");
		response.addHeader("Content-disposition", "attachment; fileName=" + imageFileName);
		FileInputStream in = new FileInputStream(file);
		byte[] buffer = new byte[1024 * 8];
		while (true) {
			int count = in.read(buffer); 
			if (count == -1) 
				break;
			out.write(buffer, 0, count);
		}
		in.close();
		out.close();
	}
}
