<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html lang="ko">
<head>
      <meta charset="UTF-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 정보 수정</title>
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
  <h3 style="margin-left:15%">회원 정보 수정</h3>


  <!-- 테이블 -->
  <form action="./my_page_edit_submit" method="post">
  
  <table class="table table-bordered" style="margin-top:15%; width: 80%; margin-left:15%;">

      <tr>
        <th class="col-md-1 col-xs-1" style="vertical-align: middle;">성명</th>
        <td class="col-md-5 col-xs-5" style="vertical-align: middle;">
          <input type='text' name="name" placeholder="성명" readonly=readonly style="width: 25%; height: 80%; padding-left:2%">
        </td>
      </tr> 
      <tr>
        <th style="vertical-align: middle; text-align:center;">비밀번호</th>
        <td class="col-md-5 col-xs-5" style="vertical-align: middle;">
          <input type='password'name="userPw" placeholder="비밀번호" style="width: 25%; height: 80%; padding-left:2%">
        </td>
      </tr>
      <tr>
        <th style="vertical-align: middle; text-align:center;">전화번호</th>
        <td class="col-md-5 col-xs-5" style="vertical-align: middle;">
          <input type='text' id="userPhoneNo" name="userPhoneNo" placeholder="전화번호" style="width: 25%; height: 80%; padding-left:2%">
        </td>
      </tr>
      <tr>
        <th style="vertical-align: middle; text-align:center;">우편번호</th>
        <td class="col-md-5 col-xs-5" style="vertical-align: middle;">
          <input type='text' class="address_input_1" name="userAddr1" placeholder="우편번호" style="width: 25%; height: 80%; padding-left:2%">
        </td>
      </tr>    
      <tr>
	      <td>
		      <button type="button" class="btn btn-block little-button" onclick="execution_daum_address()">주소찾기</button>
				</td>
	    </tr>      
      <tr>
        <th style="vertical-align: middle; text-align:center;">주소</th>
        <td class="col-md-5 col-xs-5" style="vertical-align: middle;">
          <input type='text' class="address_input_2" name="userAddr2" placeholder="주소" style="width: 25%; height: 80%; padding-left:2%">
        </td>
      </tr>      
      <tr>
        <th style="vertical-align: middle; text-align:center;">상세 주소</th>
        <td class="col-md-5 col-xs-5" style="vertical-align: middle;">
          <input type='text' class="address_input_3" name="userAddr3" placeholder="상세 주소" style="width: 25%; height: 80%; padding-left:2%">
        </td>
      </tr>
    </table>
    
      <input type="submit" value="수정" class="btn btn-default" style="color: black; float:right;">
</form>    
</section>


<footer>
  <p>(08787) 서울 관악구 남부순환로 1820 에그옐로우 14층 귀농귀촌 종합상담 : 1111-1111 시스템 문의 : 02-222-2222</p>
  <p>Copyright 2021 Farmporter. All rights reserved.</p>
</footer>


<script type="text/javascript" src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="<c:url value="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"/>"></script>
<script src="<c:url value="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"/>"></script>
<script type="text/javascript">
$(document).ready(function(){
	let result = '<c:out value="${enroll_result}"/>';
	let eresult = '<c:out value="${edit_result}"/>';
	
	checkResult(result);
	checkeResult(eresult);	

	function checkeResult(eresult){
		
		if(eresult === '1'){
			alert("회원 정보 수정을 완료하였습니다.");
		} else if(eresult === '0') {
			alert("회원 정보 수정을 하지 못하였습니다.")	
		}		
	}
});	


/* 다음 주소 연동 */
function execution_daum_address(){
    new daum.Postcode({
    	oncomplete: function(data) {
    		// 검색결과 항목 클릭 시 , 실행할 코드 
    		// 각 주소의 노출 규칙에 따라 주소를 조합한다.
        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
        var addr = ''; 			// 주소 변수
        var extraAddr = ''; // 참고항목 변수

        //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
        if (data.userSelectedType === 'R') { 	// 사용자가 도로명 주소를 선택했을 경우
            addr = data.roadAddress;
        } else { 															// 사용자가 지번 주소를 선택했을 경우(J)
            addr = data.jibunAddress;
        }

        // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
        if(data.userSelectedType === 'R'){
            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
                extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraAddr !== ''){
                extraAddr = ' (' + extraAddr + ')';
            }
         		// 주소변수 문자열과 참고항목 문자열 합치기
            addr += extraAddr;
        
        } else {
        		addr += ' ';
        }

        // 우편번호와 주소 정보를 해당 필드에 넣는다.
        $(".address_input_1").val(data.zonecode);
        $(".address_input_2").val(addr);
        // 상세주소 입력란 disabled 속성 변경 및 커서를 상세주소 필드로 이동한다.
        $(".address_input_3").attr("readonly",false);
        $(".address_input_3").focus();
    	}
    }).open();
}
</script>
</body>
</html>