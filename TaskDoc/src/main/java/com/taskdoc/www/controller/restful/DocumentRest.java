package com.taskdoc.www.controller.restful;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.taskdoc.www.database.dto.DocumentVO;
import com.taskdoc.www.service.document.DocumentService;

@RestController
@RequestMapping("/document")
public class DocumentRest {

	@Autowired
	DocumentService service;

	@RequestMapping(value = "/task/{tcode}", method = RequestMethod.GET)
	public List<DocumentVO> taskList(@PathVariable int tcode) {
		return service.taskList(tcode);
	}

	@RequestMapping(value = "/room/{crcode}", method = RequestMethod.GET)
	public List<DocumentVO> roomList(@PathVariable int crcode) {
		return service.roomList(crcode);
	}

	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public int upload(@RequestParam("file") MultipartFile[] multipartFile, DocumentVO documentVo) {
		return service.fileUpload(multipartFile, documentVo);
	}
	
	@RequestMapping(value = "/move", method = RequestMethod.PUT)
	public int move(@RequestBody DocumentVO documentVo) {
		return service.documentMove(documentVo);
	}
	
	@RequestMapping(value = "/copy", method = RequestMethod.PUT)
	public int copy(@RequestBody DocumentVO documentVo) {
		return service.documentCopy(documentVo);
	}
	
	@RequestMapping(value = "", method = RequestMethod.PUT)
	public int update(@RequestBody DocumentVO documentVo) {
		return service.documentUpdate(documentVo);
	}

	@RequestMapping(value = "/{dmcode}", method = RequestMethod.DELETE)
	public int delete(@PathVariable int dmcode) {
		return service.documentDelete(dmcode);
	}

}
