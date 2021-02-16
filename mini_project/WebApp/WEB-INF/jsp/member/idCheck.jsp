<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="KO">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Title -->
<title>ID 중복 체크</title>

<!-- CSS 라이브러리 -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- CSS 스타일 -->
<link href="css/style.css" rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<script type="text/javascript">
	function formClose() {
		if(${check }) {
			window.opener.document.getElementById("mPassword").focus();
		} else {
			window.opener.document.getElementById("mId").value="";
			window.opener.document.getElementById("mId").focus();
		}
		
		window.close();
	}
</script>
<body>
<div class="modal-dialog modal-confirm">
	<div class="modal-content">
		<div class="modal-body text-center">
			<h3>${msg }</h3><br>
			<button class="btn btn-success" onclick="formClose()"><span>닫기</span></button>
		</div>
	</div>
 </div>
</body>
</html>