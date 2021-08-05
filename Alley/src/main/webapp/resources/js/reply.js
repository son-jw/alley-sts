/*
*
*/


console.log("Reply module..55");
 
 var Comm_ReplyService = (function() {
    function add(reply, callback, error) {
       console.log("add reply..");
       
       $.ajax({
          type : 'post',
          url : '/replies/new',
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
		console.log("getList......");
		var bno = param.bno;
		var page = param.page || 1;
		//|| 는 T or F를 리턴하는 관계연산자가 아님
		console.log("page :"+page);
		//페이지 번호가 있으면 페이지 번호 전달 없으면 1전달
		$.getJSON("/replies/pages/" + bno + "/" + page + ".json",
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

	return {
	// 변수명.호출명 예) replyService.add
		add: add ,		
		getList : getList
	};
 })();