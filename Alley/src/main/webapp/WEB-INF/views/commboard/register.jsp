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
					<div class="form-group">
						<label>글 제목</label> <input class="form-control" name='title'>
					</div>

					<div class="form-group">
						<label>내용</label>
						<textarea class="form-control" rows="3" name='content'></textarea>
					</div>

					<div class="form-group">
						<label>작성자</label> <input class="form-control" name="writer">
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
				<div class="from-group uploadDiv">
					파일첨부 : <input type="file" name="uploadFile" multiple>
				</div>
				
				<div class="uploadResult">
					<ul></ul>
				</div>
			</div>
		
		</div>
	</div>
</div>


<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js"></script>
<script>
$(document).ready(function(e){
	var formObj=$("form[role='form']");
	$("button[type='submit']").on("click",function(e){
		e.preventDefault();
		console.log("submit clicked");
	});
	
	var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	// 정규표현식. 일부 파일의 업로드 제한.
	// https://developer.mozilla.org/ko/docs/Web/JavaScript/Guide/%EC%A0%95%EA%B7%9C%EC%8B%9D
	// https://regexper.com/
	
	var maxSize = 5242880;// 5MB
	
	function checkExtension(fileName, fileSize){
		if(fileSize >= maxSize){
			alert("너무 커..");
			return false;
		}
		
		if(regex.test(fileName)){
			alert("거긴 안댐;;");
			return false;
		}
		return true;
	}
	
	$("input[type='file']").change(function(e){
		var formData = new FormData();
		var inputFile=$("input[name='uploadFile']");
		var files = inputFile[0].files;// 등록한 첨부파일의 정보를 배열형태로 전달.
		for(var i = 0; i<files.length; i++){
			if(!checkExtension(files[i].name
					,files[i].size)){
				return false;
			}
			formData.append("uploadFile", files[i]);
			// 첨부파일의 정보를 확인하여 크기와 종류가 맞다면,
			// formData 에 첨부파일 정보를 추가.
		}
		
		$.ajax({
			url:'/uploadAjaxAction',
			processData:false,// processData 가 false 로 되어 있으면 키와 값의 쌍으로 설정하지 않는다.
			contentType:false,// 파일 첨부시 문서 정보를 따로 지정하지 않음.
			data:formData,
			type:'POST',
			dataType:'json',
			success:function(result){
				console.log(result);
                /* showUploadResult(result); */
			}
		});
	});
});
</script>

<%@ include file="../includes/footer.jsp"%>