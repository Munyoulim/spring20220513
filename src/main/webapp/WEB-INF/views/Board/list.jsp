<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
	integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css"
	integrity="sha512-GQGU0fMMi238uA+a/bdWJfpUGKUkBdgfFdgBm72SUQ6BeyWjoY/ton0tEjH+OSH9iP4Dfh+7HM0I9f5eR0L/4w=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
	referrerpolicy="no-referrer"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>

<script>

	$(document).ready(function() {
		$(".search_area button").on("click", function(e) {
			e.preventDefault();
			let moveForm = $("#moveForm");
			let val1 = $("input[name='keyword']").val();
			let val2 = $("input[name='current']").val();
			moveForm.find("input[name='keyword']").val(val1);
			moveForm.find("input[name='current']").val(val2);
			moveForm.find("input[name='searchType']").val("title");
			moveForm.submit();
		});
	});

</script>

<style>
.search_area {
	float: right;
	margin-top: 30px;
	margin-left: 260px;
}

.search_content {
	height: 30px;
	width: 250px;
}

.search_button {
	width: 100px;
	height: 36px;
}

.mt-3 {
	border-radius: 5px;
}
</style>

<title>Insert title here</title>
</head>
<body>

	<my:navBar current="list" />

	<div class="container">
		<div class="row">
			<div class="col">
				<div class="search_area">
					<div class="search_area" id="search_area">
						<input style="border-radius: 20px" type="text" name="keyword"
							value="${pageInfo.keyword }" id="search_content" />
						<button id="search_button" class="btn btn-outline-secondary">
							<i class="fa-solid fa-magnifying-glass"></i>
						</button>
					</div>
				</div>

				<form id="moveForm" method="get">
					<input type="hidden" name="current" value="${pageInfo.current }" />
					<input type="hidden" name="keyword" value="${pageInfo.keyword }" />
					<input type="hidden" name="searchType"
						value="${pageInfo.searchType }" />
				</form>

				<h2 style="margin-top: 20px;">글 목록</h2>

				<table class="table">
					<thead>
						<tr>
							<th>
								<i class="fa-solid fa-hashtag"></i>
							</th>
							<th>제목</th>
							<th>시간</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${boardList }" var="board">
							<tr>
								<td>${board.id }</td>

								<td>
									<c:url value="/Board/${board.id }" var="getUrl" />

									<a href="${getUrl }"> ${board.title } </a>

									<c:if test="${board.numOfReply > 0 }">
										<span>
											<i class="fa-solid fa-comment-dots"></i>
											${board.numOfReply }
										</span>
									</c:if>

								</td>

								<td>${board.prettyInserted }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>

	<div class="mt-3">

		<my:PageNation path="list" />

	</div>

</body>
</html>







