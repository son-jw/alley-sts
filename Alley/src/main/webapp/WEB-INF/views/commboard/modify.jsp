<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- jstl core 쓸때 태그에 c 로 표시. -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- jstl fmt 쓸때 위와 같음. fmt : formatter 형식 맞춰서 표시 -->


<%@ include file="../includes/header.jsp"%>

<!-- DataTables Example -->
<div class="card shadow mb-4">
	<div class="card-body">
		<div class="table-responsive">
			<div class="panel-heading">글 수정</div>
			<div class="panel-body">
				<form role="form" action="/commboard/modify" method="post">
					
					<input type="hidden" name= "${_csrf.parameterName }" value="${_csrf.token }"/>
					<input type="hidden" name="bno" value="${cb.bno }" />
					<input type="hidden" name="pageNum" value="${cri.pageNum }" />
					<input type="hidden" name="amount" value="${cri.amount }" />
					<input type="hidden" name= "type" value="${cri.type }">
					<input type="hidden" name= "keyword" value="${cri.keyword }">

					<div class="form-group">
						<label>글 제목</label> <input class="form-control" name='title'
							value='<c:out value="${cb.title }"/>'>
					</div>

					<div class="form-group">
						<label>내용</label>
						<textarea class="form-control" rows="3" name='content'>
						<c:out value="${cb.content }" /> </textarea>
					</div>

					<div class="form-group">
						<label>작성자</label> <input class="form-control" name="writer"
							value='<c:out value="${cb.writer }"/>' readonly="readonly">
					</div>
					<sec:authentication property="principal" var="pinfo" />
					<sec:authorize access="isAuthenticated()">
						<!-- 인증된 사용자만 허가 -->
						<c:if test="${pinfo.username eq board.writer }">
							<!-- 인증되었으면서 작성자가 본인 일때 수정 버튼 표시 -->
							<button type="submit" data-oper="modify" class="btn btn-success">수정</button>
							<button type="submit" data-oper="remove" class="btn btn-danger">삭제</button>
						</c:if>
					</sec:authorize>
							<button type="submit" data-oper="list" class="btn btn-info">목록</button>
				
				</form>

			</div>
		</div>
	</div>
</div>


<!-- 첨부파일 표시 -->
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
	$(document).ready(function() {
		/*문서가 준비 됐다면, 아래 함수를 실행함*/
		var csrfHeaderName = "${_csrf.headerName}";
		var csrfTokenValue="${_csrf.token}";
		
		$(document).ajaxSend(function(e,xhr,options){
			xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		});
		
		var formObj = $("form");
		$('button').on("click",function(e) {
			/* 버튼이 클릭된다면 아램함수들을 실행하도록, e라는 이베튼 개체를 전달*/
			e.preventDefault();/* 기본 이벤트(submit) 동작 막기.*/
			var operation = $(this).data("oper");
			/* 버튼에서 oper 속성 읽어서 변수에 할당.*/
			console.log(operation);
			/*브라우저 로그로 oper값을 추력*/
			
			if (operation==='remove') {
				formObj.attr("action","/commboard/remove");
				/*form에 액션 속성을 modify 에서 remove로 변경*/
			} else if (operation==='list') {
				formObj.attr("action","/commboard/list")
						.attr("method","get");
				
				var pageNumTag=$("input[name='pageNum']");
				var amountTag=$("input[name='amount']");
				var keywordTag=$("input[name='keyword']");
				var typeTag=$("input[name='type']");
				
				
				formObj.empty();
				formObj.append(pageNumTag);
				formObj.append(amountTag);
				formObj.append(keywordTag);
				formObj.append(typeTag);
				
			}else if(operation === 'modify') {
				
				var str="";
				
				$(".uploadResult ul li").each(function(i,obj){
					var jobj=$(obj);
					console.dir(jobj);
					console.log("........");
					console.log(jobj.data("filename"));
					
					str +="<input type='hidden' name='attachList[";
					str +=i+"].fileName' value='"+jobj.data("filename")
					str +="'>";
										
					str +="<input type='hidden' name='attachList[";
					str +=i+"].uuid' value='"+jobj.data("uuid")
					str +="'>";
					
					str +="<input type='hidden' name='attachList[";
					str +=i+"].uploadPath' value='"+jobj.data("path")
					str +="'>";
					
					str +="<input type='hidden' name='attachList[";
					str +=i+"].fileType' value='"+jobj.data("type")
					str +="'>";	
				});
				formObj.append(str);				
				
			}
			formObj.submit();
		});
			
		(function(){
			var bno='<c:out value="${cb.bno}"/>';
			// 화면상에 공유된 bno 값 가져와 사용 준비.
			$.getJSON("/commboard/getAttachList"
					,{bno:bno}, function(arr){
						console.log(arr);
						
						var str="";
						$(arr).each(function(i,attach){
							var fileCallPath
							= encodeURIComponent(attach.uploadPath
									+"/"+attach.uuid+"_"+attach.fileName);
							
							str+="<li data-path='";
							str+=attach.uploadPath+"' data-uuid='";
							str+=attach.uuid+"' data-filename='";
							str+=attach.fileName+"' data-type='";
							str+=attach.fileType+"'><div>";
							str+="<img src='/resources/img/attach.png' width='20'>";
							str+="<span> "+attach.fileName+"</span>&nbsp;&nbsp;";
							str+="<b data-file='"+fileCallPath;
							str+="' data-type='file'>[x]</b>";
							
							str+="</div></li>";
						});
						$(".uploadResult ul").html(str);
					});
		})();
			
			/*위 조건이 아니라면 수정처리*/
			
			
			//첨부파일 목록에서 삭제 처리
			$(".uploadResult").on("click","b",function(e){
			console.log("delete file");
			
			var targetFile=$(this).data("file");
			var type=$(this).data("type");
			var targetLi=$(this).closest("li");
			
			$.ajax({
				url : '/deleteFile',
				data : {
					fileName : targetFile,
					type : type
				},
				dataType : 'text',
				type : 'POST',
				success : function(result){
					alert(result);
					targetLi.remove();
				}
				
			})
			
		});
			var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
			// 정규표현식. 일부 파일의 업로드 제한.
			// https://developer.mozilla.org/ko/docs/Web/JavaScript/Guide/%EC%A0%95%EA%B7%9C%EC%8B%9D
			// https://regexper.com/
	
			var maxSize = 5242880;// 5MB
			
			function checkExtension(fileName, fileSize){
				if(fileSize >= maxSize){
					alert("파일 크기 초과");
					return false;
				}
				
				if(regex.test(fileName)){
					alert("해당 종류의 파일은 업로드 불가.");
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
						showUploadResult(result);
						// 첨부파일 업로드 결과를 json으로 받으면,
						// 그 내용을 화면에 표시.
					}
				});
			});
			
			function showUploadResult(uploadResultArr){
				if(!uploadResultArr || uploadResultArr.length == 0){
					// json 처리 결과가 없다면 함수 종료.
					return;
				}
				var uploadUL = $(".uploadResult ul");
				var str = "";
				
				// each 구문은 전달된 배열의 길이 만큼,
				// each 이후의 함수를 반복 처리.
				// http://api.jquery.com/jQuery.each/#jQuery-each-array-callback
				$(uploadResultArr).each(function(i,obj){
					var fileCallPath
					= encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName);
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
					str += "<span> " + obj.fileName + "</span>";
					str += "<b data-file='"+fileCallPath;
					str += "'data-type='file'>[x]</b>";
					str += "</div></li>";
					
					
				});
				uploadUL.append(str);
			}// end_showUploadResult		
	});
</script>