<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ attribute name="current" %>

<c:url value="/Board/list" var="listUrl"></c:url>
<c:url value="/Board/write" var="insertUrl"></c:url>

<nav class="navbar navbar-expand-md navbar-light bg-light mb-3">
  <div class="container">
    <a class="navbar-brand" href="${listUrl }"><i class="fa-solid fa-house"></i></a>
    
    <button class="navbar-toggler" 
    	    data-bs-toggle="collapse"
    	    data-bs-target="#navbarSupportedContent">
    	<span class="navbar-toggler-icon"></span>
    </button>
    
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link ${current == 'list' ? 'active' : '' }" href="${listUrl }">목록보기</a>
        </li>
        <li class="nav-item">
          <a class="nav-link ${current == 'insert' ? 'active' : '' }" href="${insertUrl }">글쓰기</a>
        </li>
      </ul>
    </div>
  </div>
</nav>