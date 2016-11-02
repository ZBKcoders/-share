package com.zbk.Image.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping(value="/upload")
public class FileUpload {
		
	@RequestMapping(value="/img")
	public @ResponseBody JSONObject uploadImg(@RequestParam("files") MultipartFile imageFile,HttpServletRequest request){
		
		String uploadUrl=request.getSession().getServletContext().getRealPath("upload");
		String fileName=imageFile.getOriginalFilename();
		File dir=new File(uploadUrl);
		if(!dir.exists()){
			dir.mkdirs();
		}
		fileName=new Date().getTime()+fileName;
		File targetFile=new File(dir,fileName);
		System.out.println("图片URL路径"+targetFile);
		if(!targetFile.exists()){
			try {
				targetFile.createNewFile();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		try {
			imageFile.transferTo(targetFile);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		String url=request.getContextPath()+"/upload/"+fileName;
		JSONObject json=new JSONObject();
		json.put("value",url);
		json.put("url",url);
		return json;
	}
}
