<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html lang="ko">
<head>
      <meta charset="UTF-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Page</title>
    <link href="<c:url value="/resources/img/fruit/apple.jpg" />" type = "image/png" sizes = "32x32" rel="icon">
    <link href="<c:url value="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/css/main_side_1.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/css/table.css" />" rel="stylesheet">
    <style>
		table{height: 300px;}
	</style>
</head>
<body>
  <header>
    <div class="navbar navbar-default">
      <div class="container-fluid">

        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="/main">Farmporter</a>
        </div>
        
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
         <div class="menu">
          <ul class="nav navbar-nav">
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">소개</a>
              <ul class="dropdown-menu" role="menu">
                <li><a href="/intro">소개</a></li>
              </ul>
            </li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">귀농 가이드</a>
              <ul class="dropdown-menu" role="menu">
                <li><a href="/profit_crop">소득정보</a></li>
                <li><a href="/predict">가격정보</a></li>
                <li><a href="/farmer_profit">자금정보</a></li>
              </ul>
             </li>
             <li class="nav"><a href="/farm_sites">귀농 관련 사이트 <span class="sr-only">(current)</span></a></li>
             <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">알림소식</a>
              <ul class="dropdown-menu" role="menu">
                <li><a href="/notice">공지사항</a></li>
              </ul>
             </li>
          </ul>
         </div> 
    		<!-- 로그인 하지 않은 상태 -->
				 <c:if test="${user == null}">
					 <div id="before" class = "login">
	         		<ul class="nav navbar-nav navbar-right">
	           		<li><a href="/user/login">로그인</a></li>
	           		<li><a href="/user/agreement">회원가입</a></li>
	           	</ul>
	         </div>
         </c:if>
         <!-- 로그인 한 상태 -->
          <c:if test="${user != null}">
          <div id="after" class = "login">
         		<ul class="nav navbar-nav navbar-right">
	            <li><a href="/user/logout.do">로그아웃</a></li>
	            <li><a href="/user/my_page/${user.userId}">My page</a></li>
	        </ul>
          </div>
          </c:if>
        </div>
      </div>
    </div>
  </header>
<!-- 메인메뉴 -->
<section >
  <h3 style="margin-left:15%">My Page</h3>


  <!-- 테이블 -->
  
  	<table class="table table-bordered" style="margin-top:15%; width: 80%; margin-left:15%;">
      <tr>
        <th class="col-md-1 col-xs-1" style="vertical-align: middle;">성명</th>
        <td class="col-md-5 col-xs-5" style="vertical-align: middle;">${user.userName}</td>
      </tr> 
      <tr>
        <th style="vertical-align: middle; text-align:center;">아이디</th>
        <td class="col-md-5 col-xs-5" style="vertical-align: middle;">${user.userId}</td>
      </tr>
      <tr>
        <th style="vertical-align: middle; text-align:center;">생년월일</th>
        <td class="col-md-5 col-xs-5" style="vertical-align: middle;">${user.birthday}</td>
      </tr>
      <tr>
        <th style="vertical-align: middle; text-align:center;">이메일</th>
        <td class="col-md-5 col-xs-5" style="vertical-align: middle;">${user.userMail}</td>
      </tr>
      <tr>
        <th style="vertical-align: middle; text-align:center;">주소</th>
        <td class="col-md-5 col-xs-5" style="vertical-align: middle;">${user.userAddr1}, ${user.userAddr2}, ${user.userAddr3}</td>
      </tr>
      <tr>
        <th style="vertical-align: middle; text-align:center;">전화번호</th>
        <td class="col-md-5 col-xs-5" style="vertical-align: middle;">${user.userPhoneNo}</td>
      </tr>
      <tr>
        <th style="vertical-align: middle; text-align:center;">가입일자</th>
        <td class="col-md-5 col-xs-5" style="vertical-align: middle;">${user.regDate}</td>
      </tr>
    </table>
    
    <button type="button" class="btn btn-default btn-lg" style="background-color:#212121; color:white; float:right; margin-bottom: 15%; margin-right: 5%;">
      <a href="/user/my_page_edit" style="color: white;">회원 정보 수정</button></a>
    </button>
</section>   


<footer>
  <p>(08787) 서울 관악구 남부순환로 1820 에그옐로우 14층 귀농귀촌 종합상담 : 1111-1111 시스템 문의 : 02-222-2222</p>
  <p>Copyright 2021 Farmporter. All rights reserved.</p>
</footer>

<script src="<c:url value="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"/>"></script>
<script src="<c:url value="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"/>"></script>
</body>
</html>