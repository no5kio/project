<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <!-- 합쳐지고 최소화된 최신 CSS -->
  <link href="<c:url value= "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"/>" rel="stylesheet"> 
  <!-- 부가적인 테마 -->
  <link href="<c:url value= "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"/> "rel="stylesheet"> 
  <!-- join.css -->
  <link href="<c:url value =  "/resources/css/user/join.css"/>" rel="stylesheet" >
  <link href="<c:url value = "https://use.fontawesome.com/releases/v5.15.4/css/all.css" />" rel="stylesheet" >
  <script  src="https://code.jquery.com/jquery-3.4.1.js"  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
  <title>회원가입 페이지</title>
</head>
<body>     
	<div class="jumbotron ">
		<h1 class="display-4">회원 가입</h1>      
	</div>   
	
	<div id="registration" class="registration-form">
		<form id="regstration_form" method="POST">
			<div class="form-icon">
				<span><a href="/main_page"><i class="fas fa-home"></i></a></span>
      </div>
      <div class="form-group id-check">
      	<input type="text" class="form-control item userid id_input" style="float: left;" name="userId" placeholder="아이디">
      	<span class="id_input_re_1">사용 가능한 아이디입니다.</span>
				<span class="id_input_re_2">아이디가 이미 존재합니다.</span>	
				<span class="final_id_ck">아이디를 입력해주세요.</span>
      </div>
      <div class="form-group">
       	<input type="text" class="form-control item name_input" name="userName" placeholder="이름"> 
       	<span class="final_name_ck">이름을 입력해주세요.</span>              
      </div> 
      <div class="form-group">
      	<input type="password" class="form-control item pw_input" name="userPw" placeholder="비밀번호">
      </div>
			<div class="form-group">
				<input type="password" class="form-control item pwck_input"  name="userPwck" placeholder="비밀번호 확인">
				<span class="pwck_input_re_1">비밀번호가 일치합니다.</span>
				<span class="pwck_input_re_2">비밀번호가 일치하지 않습니다.</span>
				<span class="final_pwck_ck">비밀번호 확인을 입력해주세요.</span>
      </div>				       
      <div class="form-group mail_input_box_warn">
      	<input type="email" class="form-control item mail_input" name="userMail" placeholder="이메일">
      	<div class="mail_check_input_box" id="mail_check_input_box_false">      	
        	<input class="mail_check_input" disabled="disabled" style="height: 32px; color: black">
        </div>
        <button type="button" class="btn btn-block little-button mail_check_button">인증번호 전송 </button>
   			<span id="mail_check_input_box_warn"></span>
        <span class="final_mail_ck">이메일을 입력해주세요.</span>
      </div>
      <div class="form-group">
      	<input type="text" class="form-control item phoneNo_input" name="userPhoneNo" placeholder="전화번호">
        <span class="final_phoneNo_ck">전화번호를 입력해주세요.</span>
      </div> 
      <div class="form-group">
      	<input type="date" class="form-control item birthday_input" name="birthday" placeholder="생년월일">
        <span class="final_birthday_ck">생일을 입력해주세요.</span>
      </div>
      <div class="form-group">
      	<input type="text" class="form-control item address_input_1" name="userAddr1" placeholder="우편번호" readonly="readonly">
      </div> 	
      <div class="form-group">
       	<button type="button" class="btn btn-block little-button" onclick="execution_daum_address()">주소찾기</button>
      </div>
      <div class="form-group">
      	<input type="text" class="form-control item address_input_2" name="userAddr2" placeholder="주소" readonly="readonly">
      </div>
      <div class="form-group">
      	<input type="text" class="form-control item address_input_3" name="userAddr3" placeholder="상세 주소" readonly="readonly">
      </div>
      	<span class="final_addr_ck">주소를 입력해주세요.</span>
      <div class="form-group">
      	<button type="submit" class="btn btn-block create-account"> 계정 생성</button>
      </div>
		</form>      
	</div>
   
<script type="text/javascript" src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.15/jquery.mask.min.js"></script> 
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript">

var code ="";								//이메일 전송 인증번호 저장

/* 유효성 검사 통과유무 변수 */
var idCheck = false;				// 아이디
var idckCheck = false;			// 아이디 중복 검사
var pwCheck = false;				// 비번
var pwckCheck = false;			// 비번 확인
var pwckcorCheck = false;		// 비번 확인 일치 확인
var nameCheck = false;			// 이름
var mailCheck = false;			// 이메일
var mailnumCheck = false;		// 이메일 인증번호 확인
var phoneNoCheck = false;		// 전화번호
var birthday = false;				// 생일 
var addrCheck = false 		// 주소

$(document).ready(function(){
	//회원가입 버튼(회원가입 기능 작동)
	$(".create-account").click(function(){
		
		/* 입력값 변수 */
		var id = $('.id_input').val();
		var pw = $('.pw_input').val();
		var pwck = $('.pwck_input').val();
		var name = $('.name_input').val();
		var mail = $('.mail_input').val();
		var phone = $('.phoneNo_input').val();
		var birthday = $('.birthday_input').val();
		var addr = $('.address_input_3').val();
	
    /* 아이디 유효성검사 */
    if(id == ""){
        $('.final_id_ck').css('display','block');
        idCheck = false;
    }else{
        $('.final_id_ck').css('display', 'none');
        idCheck = true;
    }
    
    /* 비밀번호 유효성 검사 */
    if(pw == "") {
    	$('.final_pw_ck').css('display', 'block');
    	pwCheck = false;
    }else {
    	pwCheck = true;
    }
    
    /* 비밀번호 확인 유효성 검사 */
    if(pwck == ""){
    	$('.final_pwck_ck').css('display','block');
    	pwckCheck = false;
    }else {
    	$('.final_pwck_ck').css('display','none');
    	pwckCheck = true;
    }
    
    /* 이름 유효성 검사 */
    if(name == ""){
    	$('.final_name_ck').css('display','block');
    	nameCheck = false;
    }else {
    	$('.final_name_ck').css('display','none');
    	nameCheck = true;
    }
    
    /* 이메일 유효성 검사 */
    if(mail == ""){
    	$('.final_mail_ck').css('display','block');
    	mailCheck = false;
    }else {
    	$('.final_mail_ck').css('display','none');
    	mailCheck = true;
    }
    
    /* 전화번호 유효성 검사 */
    if(phone == ""){
    	$('.final_phoneNo_ck').css('display','block');
    	phoneNoCheck = false;
    }else {
    	$('final_phoneNo_ck').css('display','none');
    	phoneNoCheck = true;
    }
    
    /* 생일 유효성 검사 */
    if(birthday == ""){
    	$('.final_birthday_ck').css('display','block');
    	birthdayCheck = false;
    }else {
    	$('final_birthday_ck').css('display','none');
    	birthdayCheck = true;
    }
    
    /* 주소 유효성 검사 */
    if(addr == ""){
    	$('.final_addr_ck').css('display','block');
    	addrCheck = false;
    }else {
    	$('.final_addr_ck').css('display','none');
    	addrCheck = true;
    }   
    
    if(idCheck&&idckCheck&&pwCheck&&pwckCheck&&pwckcorCheck&&nameCheck&&mailCheck&&mailnumCheck&&phoneNoCheck&&birthdayCheck&&addressCheck){
				$("#registration_form").attr("action", "/user/join");
				$("#registration_form").submit();
    }
		return false;
	});	
});

//아이디 중복 검사
$('.userid').on("propertychange change keyup paste input", function(){
	var userId = $('.userid').val();			// .id_input에 입력되는 값
	var data = {userId : userId}					// '컨트롤에 넘길 데이터 이름' : '데이터(.id_input에 입력되는 값)'
	$.ajax({
		type: "POST",
		url: "/user/userIdChk",
		data : data,
		success : function(result) {
//			console.log("성공 여부" + result);
			if(result !='fail'){
				$('.id_input_re_1').css("display", "inline-block");
				$('.id_input_re_2').css("display", "none");
				idckCheck = true;
			}else {
				$('.id_input_re_2').css("display", "inline-block");
				$('.id_input_re_1').css("display", "none");
				idckCheck = false;
			}
		} // success 종료
	});	// ajax 종료
}); 	// function 종료

/* 인증번호 이메일 전송 */
$(".mail_check_button").click(function(){
    var email = $(".mail_input").val();				//입력한 이메일
    var checkBox = $(".mail_check_input")			//인증번호 입력란
    var boxWrap = $(".mail_check_input_box")	//인증번호 입력란 박스
    var warnMsg = $(".mail_input_box_warn")		//이메일 입력 경고글
    
    /* 이메일 형식 유효성 검사 */
/*     if(mailFormCheck(email)){
        warnMsg.html("이메일이 전송 되었습니다. 이메일을 확인해주세요.");
        warnMsg.css("display", "inline-block");
    } else {
        warnMsg.html("올바르지 못한 이메일 형식입니다.");
        warnMsg.css("display", "inline-block");
        return false;
    }    
 */    
    $.ajax({
    	type:"GET",
    	url:"mailCheck?email=" + email,
    	success:function(data){
//    		console.log("data :" + data);
					checkBox.attr("disabled",false);
					boxWrap.attr("id", "mail_check_input_box_true");
					code = data;
    	}
    			
    });
});

/* 인증번호 비교 */
$(".mail_check_input").blur(function(){	
    var inputCode = $(".mail_check_input").val();        // 입력코드    
    var checkResult = $("#mail_check_input_box_warn");    // 비교 결과  
    
    if(inputCode == code) {
    	checkResult.html("인증번호가 일치합니다.");
    	checkResult.attr("class","correct");
    	mailnumCheck = true;
    }else{
    	checkResult.html("인증번호를 다시 확인해주세요.");
    	checkResult.attr("class", "incorrect");
    	mailnumCheck = false;
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

/* 비밀번호 확인 일치 유효성 검사 */

$('.pwck_input').on("propertychange change keyup paste input", function(){
    var pw = $('.pw_input').val();
    var pwck = $('.pwck_input').val();
    $('.final_pwck_ck').css('display', 'none');
});    

/* 비밀번호 확인 일치 유효성 검사 */
$('.pwck_input').on("propertychange change keyup paste input", function(){
 
    var pw = $('.pw_input').val();
    var pwck = $('.pwck_input').val();
    $('.final_pwck_ck').css('display', 'none');
 
    if(pw == pwck){
        $('.pwck_input_re_1').css('display','block');
        $('.pwck_input_re_2').css('display','none');
        pwckcorCheck = true;
    }else{
        $('.pwck_input_re_1').css('display','none');
        $('.pwck_input_re_2').css('display','block');
        pwckcorCheck = false;
    }        
});    

/* 입력 이메일 형식 유효성 검사 */
function mailFormCheck(email){
   var form = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
   return form.test(email);
}


</script>
</body>
</html>