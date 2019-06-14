package com.myspring.FinalProject.common.ItemDownload;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

public class DownloadController {
	private static final String ImagePath = "C:\\item\\itemImage";
	@RequestMapping("/itemDownload")
	protected void download(@RequestParam("imageFileName") String imageFileName,HttpServletResponse response)throws Exception {
		OutputStream out = response.getOutputStream();
		String downFile = ImagePath +"\\"+ imageFileName;
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
