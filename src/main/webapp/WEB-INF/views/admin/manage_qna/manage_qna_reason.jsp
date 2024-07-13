<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<style>
th,td,tr{font-size: 13px;}
a {text-decoration: none;}
</style>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>All_About_Knowledge</title>

    
    
    <title>삭제 사유</title>
     <script type="text/javascript" src="<c:url value='/resources/js/jquery-3.3.1.min.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/resources/js/bootstrap.min.js'/>"></script>
    <script>
    	function validateInput(input) {
            // 허용할 문자의 정규식 패턴 (알파벳, 숫자, 공백, 한글, ?, ., ,, !, ', ")
            const pattern = /^[a-zA-Z0-9\s\u3131-\uD79D?.!,\'"-]*$/;
            return pattern.test(input);
        }

        $(document).ready(function() {
            $('#reaseon').on('input', function(event) {
                const isValid = validateInput(event.target.value);
                if (!isValid) {
                    alert('허용되지 않은 특수 문자가 입력되었습니다.');
                    event.target.value = event.target.value.replace(/[^a-zA-Z0-9\s\u3131-\uD79D?.!,\'"-]/g, '');
                }
            });

            $('#submitForm').click(function() {
                var reaseon = $('#reaseon').val().trim();
                if (reaseon === "") {
                    alert("삭제 사유를 입력해주세요.");
                    return false;
                }
                if (!confirm("삭제하시겠습니까?")) {
                    return;
                } else {
                    $("#deleteForm").attr("action", "manage_qna_delete.do");
                    $("#deleteForm").submit();
                }
            });

            var cnt = "${cnt}";
            if (cnt == 1) {
                alert("수행을 완료 했습니다.");
                window.onbeforeunload = function() {
                    // 부모 창을 새로고침
                    if (opener) {
                        opener.location.href = "manage_qna.do";
                    }
                };
                window.close();
            } else if (cnt == '0') {
                alert("수행 중 오류가 있습니다.");
            }
        });
    </script>
</head>
<body>
    <h2>삭제 사유 작성</h2>
    <form action="manage_qna_reason.do" id="deleteForm" method="post" >
        <input type="hidden" name="qna_no" value="${param.qna_no}">
        <label for="reason">Reason:</label><br>
        <textarea id="reaseon" name="reaseon" rows="4" cols="50" style="height: 185px; width: 414px;"></textarea><br><br>
        <button type="button" id="submitForm">확인</button>
        <button type="button" onclick="window.close()">취소</button>
    </form>
</body>
</html>
