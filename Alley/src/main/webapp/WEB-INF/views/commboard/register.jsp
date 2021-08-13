<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- jstl core 쓸때 태그에 c 로 표시. -->

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- jstl fmt 쓸때 위와 같음. fmt : formatter 형식 맞춰서 표시 -->
<!doctype html>

<%@ include file="../includes/header.jsp"%>

<!-- DataTables Example -->
<div class="card shadow mb-4">
	<div class="card-body">
		<div class="table-responsive">
			<div class="panel-heading">글 쓰기</div>
			<div class="panel-body">
				<form role="form" action="/commboard/register" method="post">
					
					<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
					
					<div class="form-group">
						<label>글 제목</label> <input class="form-control" name='title'>
					</div>

					<div class="form-group">
						<label>내용</label>
						<textarea class="form-control" rows="3" name='content'></textarea>
					</div>

					<div class="form-group">
						<label>작성자</label> 
						<input class="form-control" name="writer"
							value='<sec:authentication property="principal.username" />' readonly="readonly">
							
					</div>

					<button type="submit" class="btn btn-default">등록</button>
					<button type="reset" class="btn btn-default">다시 쓰기</button>
				</form>
			</div>
		</div>
	</div>


</div>

<br />
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading"></div>

			<div class="panel-body">
				<div class="form-group uploadDiv">
					파일 첨부: <input type="file" name="uploadFile" multiple>
				</div>

				<div class="uploadResult">
					<ul></ul>
				</div>
			</div>

		</div>
	</div>
</div>

<%@ include file="../includes/footer.jsp"%>


<script>
$(document).ready(function(e){
	var formObj = $("form[role='form']");

	$("button[type='submit']").on("click", function(e) {
		e.preventDefault();
		console.log("submit clicked");
		
		
		// 글 등록 버튼을 누르면 첨부파일의 정보도 함께 전송 되도록 수정.
		var str="";
		$(".uploadResult ul li").each(function(i,obj){
			var jobj=$(obj);// 첨부파일 목록 1개를 재할당.
			console.dir(jobj); // 오브젝트의 여러 속성들을 한눈에 표시.
			console.log("-----------------");
			console.log(jobj.data("filename"));
			
			str+="<input type='hidden' name='attachList[";
			str+=i+"].fileName' value='"+jobj.data("filename");
			str+="'>";
			
			str+="<input type='hidden' name='attachList[";
			str+=i+"].uuid' value='"+jobj.data("uuid");
			str+="'>";
			
			str+="<input type='hidden' name='attachList[";
			str+=i+"].uploadPath' value='"+jobj.data("path");
			str+="'>";
			
			str+="<input type='hidden' name='attachList[";
			str+=i+"].fileType' value='"+jobj.data("type");
			str+="'>";
		});
		formObj.append(str).submit();							
		// 첨부파일의 정보들을 li 의 data 값으로 가지고 있다가
		// hidden 으로 폼에 포함.
		
		
	});

	var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	// 정규표현식. 일부 파일의 업로드 제한.
	// https://developer.mozilla.org/ko/docs/Web/JavaScript/Guide/%EC%A0%95%EA%B7%9C%EC%8B%9D
	// https://regexper.com/

	var maxSize = 5242880; // 5MB
	
	function checkExtension(fileName, fileSize) {
		if (fileSize >= maxSize) {
			alert("파일 크기 초과");
			return false;
		}

		if (regex.test(fileName)) {
			alert("해당 종류의 파일은 업로드 불가.");
			return false;
		}
		return true;
	}
	
	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";
	
	$("input[type='file']")
			.change(
					function(e) {
						var formData = new FormData();
						var inputFile = $("input[name='uploadFile']");
						var files = inputFile[0].files;// 등록한 첨부파일의 정보를 배열형태로 전달.
						for (var i = 0; i < files.length; i++) {
							if (!checkExtension(
									files[i].name,
									files[i].size)) {
								return false;
							}
							formData.append("uploadFile",
									files[i]);
							// 첨부파일의 정보를 확인하여 크기와 종류가 맞다면,
							// formData 에 첨부파일 정보를 추가.
						}

						$.ajax({
							url : '/uploadAjaxAction',
							processData : false,// processData가 false로 되어 있으면 키와 값의 쌍으로 설정하지 않는다
							contentType : false,// 파일 첨부시 문서 정보를 따로 지정하지 않음
							beforeSend : function(xhr){
								xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
								},
							data : formData,
							type : 'POST',
							dataType : 'json',
							success : function(result) {
								console.log(result);
								showUploadResult(result);
							}
						});
					});
		
	function showUploadResult(uploadResultArr) {
		if ((!uploadResultArr) || (uploadResultArr.length == 0)) {
			// json 처리 결과가 없다면 함수 종료.
			return;
		}
		var uploadUL = $(".uploadResult ul");
		var str = "";

		// each 구문은 전달된 배열의 길이 만큼, 
		// each 이후의 함수를 반복 처리.
		// https://api.jquery.com/jQuery.each/#jQuery-each-array-callback
		$(uploadResultArr).each(function(i, obj) {
				var fileCallPath 
				= encodeURIComponent(obj.uploadPath	+ "/"+ obj.uuid	+ "_"+ obj.fileName);
				// encodeURIComponent : 
				// uri 로 전달되는 특수문자의 치환.
				// & ?
				var fileLink = fileCallPath.replace(new RegExp(/\\/g), "/");
				// 전달되는 값들 중에서 역슬러시를 찾아서 슬러시로 변경.

				str += "<li data-path='";
				str += obj.uploadPath+"' data-uuid='";
				str += obj.uuid+"' data-filename='";
				str += obj.fileName+"' data-type='";
				str += obj.image+"'><div>";
				str += "<img src='/resources/img/attach.png' width='20' height='20'>";
				str += "<span>" + obj.fileName + "</span> ";
				str += "<b data-file='"+fileCallPath;
				str += "' data-type='file'>[x]</b>";
				str += "</div></li>";
			});
		uploadUL.append(str);
	}// end_showUploadResult						
	
	
	$(".uploadResult").on("click", "b", function(e) {
		console.log("delete file");

		var targetFile = $(this).data("file");
		var type = $(this).data("type");
		var targetLi = $(this).closest("li");

		$.ajax({
			url : '/deleteFile',
			
			data : {
				fileName : targetFile,
				type : type
				},
				
			beforeSend : function(xhr){
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				},
				
			dataType : 'text',
			type : 'POST',
			success : function(result) {
				alert(result);
				targetLi.remove();
			}
		})
	});						
	

});// end_document_ready
</script>


