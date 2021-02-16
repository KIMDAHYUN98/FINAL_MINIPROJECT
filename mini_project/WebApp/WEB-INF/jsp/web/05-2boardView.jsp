<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Title -->
<title>게시글 상세보기</title>

<!-- CSS 라이브러리 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

<!-- CSS 스타일 -->
<style type="text/css">
	#textarea {
		resize: none;
	}
	.center {
		  margin: 0;
		  position: absolute;
		  left: 50%;
		  -ms-transform: translate(-50%, -50%);
		  transform: translate(-50%, -50%);
	}
</style>

</head>
<jsp:include page="../common/menu.jsp" />

<!-- 페이지 내용 Start -->
<body>
<div class="container" align="center">
	<br><h1>게시글 상세보기</h1><br/>
		<form method="post" action="boardEdit.do">
			<div class="card bg-light">
			<table style="text-align: center;">
				<tbody>
					<tr>
						<th>ID</th>
						<td>
							<input type="text" id="mId" name="mId" class="form-control" value="${id }" readonly="readonly">
						</td>
						<th>Email</th>
						<td>
							<input type="text" id="mEmail" name="mEmail" class="form-control" value="${email }" readonly="readonly">
						</td>
					</tr>
					<tr>
						<th>연락처</th>
						<td>
							<input type="text" id="mTel" name="mTel" class="form-control" value="${tel }" readonly="readonly">
						</td>
						<th>종류</th>
						<td>
							<input list="bKind" name="bKind" class="form-control" value="${vo.bKind }">
							<datalist id="bKind">
								<option value="칭찬">칭찬</option>
								<option value="불만">불만</option>
								<option value="문의">문의</option>
								<option value="제안">제안</option>
							</datalist>
						</td>
					</tr>
					<tr>
						<td>제목</td>
						<td colspan="5">
							<input type="text" size="50" id="bTitle" name="bTitle" value="${vo.bTitle }"  class="form-control" placeholder="글 제목" maxlength="50"/>
						</td>
					</tr>
					<tr>
						<td colspan="6" >
							<textarea id="bContent" name="bContent" class="form-control" placeholder="글 내용" name="bbsContent" maxlength="2048" style="height: 350px;">${vo.bContent }</textarea>
						</td>
					</tr>
				</tbody>
			</table>
			</div><br/><br/>
			<div class="center">
				<button type="button" onclick="location.href='board.do'" id="boardbtn" class="btn btn-primary pull-right">돌아가기</button>
			</div>
		</form>
	</div>
</body>
<!-- 페이지 내용 End -->
</html>