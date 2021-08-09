package kr.co.alley;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
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
			String uploadFileName = multipartFile.getOriginalFilename();
			//파일의 원래 이름 저장
			
			//인터넷 익스플로어의 경우 , 예외 처리
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
			
			attachDTO.setFileName(uploadFileName);
			//파일 이름 저장.
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
		= new SimpleDateFormat("yyyy-mm-dd");
		Date date = new Date();
		String str = sdf.format(date);
		
		return str.replace("-", File.separator);
	}
}
