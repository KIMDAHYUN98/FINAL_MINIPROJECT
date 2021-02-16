<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="Free Website Template" name="keywords">
<meta content="Free Website Template" name="description">
<!-- Title -->
<title>YD Dosirak</title>

<!-- 폰트 -->
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400|Nunito:600,700" rel="stylesheet">

<!-- CSS 라이브러리 -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
<link href="lib/animate/animate.min.css" rel="stylesheet">
<link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
<link href="lib/flaticon/font/flaticon.css" rel="stylesheet">
<link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

<!-- CSS 스타일 -->
<link href="css/style.css" rel="stylesheet">
<link href="css/style(board).css" rel="stylesheet">

<script type="text/javascript">
	function clickFunc(e) {
		console.log($(e.target).parent().parent().parent().parent().children().eq(0).html());
		$('#bNumberD').val($(e.target).parent().parent().parent().parent().children().eq(0).html());
	}
	
	function formSubmit(str) {
		frm.bNumberRow.value = str;
		frm.submit();
	}
</script>
</head>
<jsp:include page="../common/menu.jsp" />

<!-- 페이지 내용 Start -->
<!-- Page Header Start -->
<div class="page-header">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<h2>Board</h2>
			</div>
		</div>
	</div>
</div>
<form id="frm" name="frm" action="boardView.do" method="post">
	<input type="hidden" id="bNumberRow" name="bNumberRow">
</form>
<!-- Page Header End -->
<!-- 페이지 내용 Start -->
<c:if test="${admin eq null }">
<jsp:forward page="../member/loginForm.jsp" />
</c:if>
<c:if test="${admin ne null }">
<div class="container">
	<table class="table table-bordered">
		<thead>
			<c:choose>
			<c:when test="${admin eq 'N' }">
			<tr class="trTitle">
				<th id="th-no" width="40">No.</th>
				<th id="th-Id" width="30">ID</th>
				<th id="th-title" width="50">제목</th>
				<th id="th-content" width="100">내용</th>
				<th id="th-bkind" width="30">종류</th>
				<th id="th-btn" width="50">수정 / 삭제</th>
			</tr>
			</c:when>
			<c:when test="${admin eq 'Y' }">
			<tr class="trTitle">
				<th id="th-no" width="40">No.</th>
				<th id="th-Id" width="30">ID</th>
				<th id="th-title" width="50">제목</th>
				<th id="th-content" width="100">내용</th>
				<th id="th-bkind" width="30">종류</th>
				<th id="th-btn" width="50">삭제</th>
			</tr>
			</c:when>
			</c:choose>
		</thead>
		<tbody>
			<c:forEach var="board" items="${board }">
			<c:choose>
			<c:when test="${board.mId eq id }">
			<tr class="trContent">
				<td>${board.bNumber }</td>
				<td>${board.mId }</td>
				<td>${board.bTitle }</td>
				<td>${board.bContent }</td>
				<td>${board.bKind }</td>
				<td>
					<div class="btn-group" >
						<a onclick="formSubmit(${board.bNumber })">
							<button name="list" class="btn btn-xs btn-primary">보기</button>
						</a>
						<form action="boardEditForm.do" method="post">
							<input type="hidden" value="${board.bNumber }" id="bNumber" name="bNumber">
							<input name="modify" type="submit" class="btn btn-xs btn-warning" value="수정">
						</form>
						<a href="#deleteEmployeeModal" data-toggle="modal" onclick='clickFunc(event)'>
							<button name="delete" class="btn btn-xs btn-danger">삭제</button>
						</a>
					</div>
				</td>
			</tr>
			</c:when>
			<c:when test="${admin eq 'Y' }">
			<tr class="trContent">
				<td>${board.bNumber }</td>
				<td>${board.mId }</td>
				<td>${board.bTitle }</td>
				<td>${board.bContent }</td>
				<td>${board.bKind }</td>
				<td>
					<div class="btn-group">
						<a onclick="formSubmit(${board.bNumber })">
							<button name="list" class="btn btn-xs btn-primary">보기</button>
						</a>
						<a href="#deleteEmployeeModal" data-toggle="modal" onclick='clickFunc(event)'>
							<button name="delete" class="btn btn-xs btn-danger">삭제</button>
						</a>
					</div>
				</td>
			</tr>
			</c:when>
			</c:choose>
			</c:forEach>
		</tbody>
	</table>
	<form action="boardForm.do" method="post">
		<input type="hidden" value="${id }" id="mId" name="mId">
		<button id="createBtn" type="submit" class="btn btn-info btn-sm" data-toggle="modal">새 글 쓰기</button>
	</form>
</div>
</c:if>

<!-- 글쓰기 삭제 -->
<div id="deleteEmployeeModal" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<form action="boardDelete.do" method="post">
			<input type="hidden" id="bNumberD" name="bNumberD">
				<div class="modal-header">						
					<h4 class="modal-title">게시글 삭제</h4>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">					
					<p>정말로 게시글을 삭제하시겠습니까?</p>
					<p class="text-warning"><small>이 작업은 되돌릴 수 없습니다.</small></p>
				</div>
				<div class="modal-footer">
					<input type="button" class="btn btn-default" data-dismiss="modal" value="취소">
					<input type="submit" class="btn btn-danger" value="삭제">
				</div>
			</form>
		</div>
	</div>
</div>
</body>
<!-- 페이지 내용 End -->
<jsp:include page="../common/footer.jsp" />