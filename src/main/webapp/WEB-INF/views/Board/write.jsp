<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css" integrity="sha512-GQGU0fMMi238uA+a/bdWJfpUGKUkBdgfFdgBm72SUQ6BeyWjoY/ton0tEjH+OSH9iP4Dfh+7HM0I9f5eR0L/4w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>

<title>Insert title here</title>
</head>
<body>
		
	<my:navBar current="write"></my:navBar>
	
	<%-- 
	<div class="container">
		<div class="row">
			<div class="col-6">
			
				<h2>글 작성</h2>
				
				<c:url value="/Board/write" var="writeLink" />
				
				<form action="${writeLink }" method="post">
					
					<div>
						<label class="form-label" for="input1">제목</label>
						<input class="form-control" type="text" name="title" required id="input1" />
					</div>
					
					<div>
						<label class="form-label" for="textarea1">본문</label>
						<textarea class="form-control" name="body" id="textarea1" cols="20" rows="10"></textarea>
					</div>
					
					<button class="btn btn-primary">작성</button>
				</form>
			</div>
		</div>
	</div> --%>
	
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
			
				<h2 class="text-center" style="margin-bottom:22px; margin-top:15px;">글 작성</h2>
				
				<c:url value="/Board/write" var="writeLink" />
				
				<form action="${writeLink }" method="post">
					<div class="table table-responsive">
						<table class="table table-striped">
					
							<tr>
								<td>제목</td>
								<td><input class="form-control" type="text" name="title" required id="input1" /></td>
							</tr>
							
							<tr>
								<td>본문</td>
								<td><textarea class="form-control" name="body" id="textarea1" cols="20" rows="18"></textarea></td>
							</tr>
							
						</table>
						
					</div>
			
					<div style="text-align : center;">
						<button type="submit" class="btn btn-outline-secondary" id="button">작성</button>
					</div>
					
				</form>
			</div>
		</div>
			
	
</body>
</html>








































