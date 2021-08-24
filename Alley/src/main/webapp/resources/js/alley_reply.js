/**
 * 
 */


console.log("Reply module..55");
 
 var Alley_ReplyService = (function() {
    function add(reply, callback, error) {
       console.log("add reply..");
       
       $.ajax({
          type : 'post',
          url : '/alleyreplies/new',
          data : JSON.stringify(reply),
          contentType : "application/json; charset=utf-8",
          success : function(result, status, xhr) {
             if(callback){
                callback(result);
             }
          },
          error : function(xhr, status, er){
             if(error){
                error(er);
             }
          }
       });
    }
    
    //댓글목록 가져오기
	function getList(param, callback, error) {
		console.log("getList..");
		var ano = param.ano;
		var page = param.page || 1;
		//|| 는 T or F를 리턴하는 관계연산자가 아님
		console.log("page :"+page);
		//페이지 번호가 있으면 페이지 번호 전달 없으면 1전달
		$.getJSON("/alleyreplies/pages/" + ano + "/" + page + ".json",
				function(data) {
				if (callback) {
					callback(data);
				}
			}).fail(function(xhr, status, err) {
			//xhr : xml http request 의 약자
			//현재는 사용되지 않고, 형식만 맞춰줌.
			if(error) {
				error(er);
			}
		});
	}
	
	function displayTime(timeValue)	{
		var today = new Date();
		var gap = today.getTime() - timeValue;
		var dateObj = new Date(timeValue);
		var str = "";
		
		if(gap<(1000*60*60*24)){
			var hh=dateObj.getHours();
			var mi=dateObj.getMinutes();
			var ss=dateObj.getSeconds();
			
			return [ (hh>9?'':'0')+hh, ':'
				,(mi>9?'':'0')+mi
				,':',(ss>9?'':'0')+ss].join('');
			}else{
				var yy=dateObj.getFullYear();
				var mm=dateObj.getMonth()+1;
				var dd=dateObj.getDate();
				
				return[yy,'/', (mm>9?'':'0')+mm, '/',
					(dd>9?'':'0')+dd].join('');
			}
		}
		
		//댓글 수정
		function update(reply, callback, error){
			console.log("arno: " + reply.arno);
			$.ajax({
				type : 'put',
				url : '/alleyreplies/' + reply.arno,
				data : JSON.stringify(reply),
				contentType : "application/json;charset=utf-8",
				success : function(result, status, xhr){
					if(callback){
						callback(result);
					}
				},
				error : function(xhr, status, er){
					if(error){
						error(er);
					}
				}
			});
		}
		
		//댓글 읽기
		function get(arno, callback, error){
			$.get("/alleyreplies/" + arno + ".json", function(result){
				if(callback){
					callback(result);
				}
			}).fail(function(xhr, status, er){
				if(error){
					error(er);
				}
			});
		}
		
		//댓글 삭제
		function remove(arno, replyer, callback, error){
			$.ajax({
				type : 'delete',
				url : '/alleyreplies/' + arno,
				data : JSON.stringify({arno:arno,replyer:replyer}),
					contentType : "application/json; charset=utf-8",
				success : function(deleteResult, status, xhr){
					if(callback){
						callback(deleteResult);
					}
				},
				error : function(xhr, status, er){
					if(error){
						error(er);
					}
				}
			});
		}

	return {
		add: add,		
		getList: getList,
		displayTime: displayTime,
		update: update,
		get: get,
		remove: remove
	};
 })();