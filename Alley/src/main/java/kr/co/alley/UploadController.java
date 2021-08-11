package kr.co.alley;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.co.domain.AttachFileDTO;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class UploadController {
	String uploadFolder = "c:\\upload";
	
	@PostMapping(value = "/uploadAjaxAction" , produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity<List<AttachFileDTO>> uploadAjaxPost(MultipartFile[] uploadFile) {
	
				//rest 방식으로 ajax를 처리하곘다
		//파일을 받고 json값으로 리턴할것임
		
		List<AttachFileDTO> list = new ArrayList<>();
		
		//여러개 파일 저장을 위한 객체 배열 타입 선언.
		//컬렉션 프레임워크의 list 타입을 사용할것임
		
		String uploadFolderPath = getFolder();
		File uploadPath = new File(uploadFolder, uploadFolderPath);
		//ex_ c:\\upload\\2021\\05\\07 에 저장 예정
		
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
			//경로에 폴더들이 생성되어 있지 않다면, 폴더 생성.
		}
		for(MultipartFile multipartFile : uploadFile) {
			AttachFileDTO attachDTO = new AttachFileDTO();
			String  uploadFileName = multipartFile.getOriginalFilename();
			// 파일의 원래 이름 저장.
			
			// 인터넷 익스플로러 경우, 예외 처리
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
			
			attachDTO.setFileName(uploadFileName);
			// 파일 이름 저장.
			
			UUID uuid = UUID.randomUUID();
			// universal unique identifier, 범용 고유 식별자.
			// 파일의 중복을 회피.
			
			uploadFileName = uuid.toString() + "_" + uploadFileName;
			// 예) uuid_일일일.txt
			
			try {
				File saveFile = new File(uploadPath, uploadFileName);
				multipartFile.transferTo(saveFile);
				// 서버에 파일 저장.
				
				attachDTO.setUuid(uuid.toString());
				attachDTO.setUploadPath(uploadFolderPath);
				
				list.add(attachDTO);
				// 업로드된 파일 정보를 객체 배열에 담아서 리턴.
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	
	private String getFolder() {
		SimpleDateFormat sdf
		= new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		
		return str.replace("-", File.separator);
	}
	
	@PostMapping("/deleteFile")
	@ResponseBody
	public ResponseEntity<String> deleteFile(String fileName, String type){
		
		log.info("deleteFile: " + fileName);
		File file;
		
		try {
			file=new File("c:\\upload\\"
					+URLDecoder.decode(fileName, "UTF-8"));
			// 한글의 경우, 페이지 전환시 변경됨.
			// 알맞는 문자 포맷으로 해석해서 읽어 들여야 함.
			file.delete();
			// 파일 삭제.	
		}catch(UnsupportedEncodingException e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		
		return new ResponseEntity<String>("deleted", HttpStatus.OK);

	}
	
	@GetMapping(value = "/download" , produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
	@ResponseBody
	public ResponseEntity<Resource> downloadFile (
			@RequestHeader("User-Agent")String userAgent,
										String fileName){
		//서버에 접속한 브라우저의 정보는 헤더의 uger-agent 를보자
		// import org.springframework.core.io.Resource;
		Resource resource = new FileSystemResource("c:\\upload\\" + fileName);
		log.info("resouce: " + resource);
		
		if(resource.exists() == false) {
			return new ResponseEntity<> (HttpStatus.NOT_FOUND);
		}
		
		String resourceName = resource.getFilename();
		//리소스에서 파일명을 찾아서 할당.
		String resourceOriginalName 
		= resourceName.substring(resourceName.indexOf("_")+1);
		//uuid를 제외한 파일명을 만들기
		HttpHeaders headers = new HttpHeaders();
		
		//웹 브라주더별 특성 처리(한글 변환)
		try {
			String downloadName = null;
			
			if(userAgent.contains("Trident")) {
				log.info("IE browser");
				downloadName = URLEncoder.encode(resourceOriginalName, "UTF-8").replaceAll("\\"," ");
			}else if (userAgent.contains("Edge")) {
				log.info("Edge browser");
				downloadName = URLEncoder.encode(resourceOriginalName,"UTF-8");
			}else {
				log.info("chrome browser");
				downloadName = new String(resourceOriginalName.getBytes("UTF-8"), "ISO-8859-1");
			}
			log.info("downloadName : " +downloadName);
			headers.add("Content-disposition", "attachment; filename=" + downloadName);
			//헤더에 파일 다운로드 정보 추가.
		}catch(UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);
	}
}