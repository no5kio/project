<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <title>소득정보-식량작물</title>
    <link href="<c:url value="/resources/img/fruit/apple.jpg" />" type = "image/png" sizes = "32x32" rel="icon">
    <link href="<c:url value="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/css/main_side_1.css" />" rel="stylesheet">
	
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


      <nav class="navbar navbar-default sidebar" role="navigation">
        <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-sidebar-navbar-collapse-1">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>      
        </div>
        <div class="collapse navbar-collapse" id="bs-sidebar-navbar-collapse-1">
          <ul class="nav navbar-nav">
            <li class="active"><a href="#">귀농 가이드<span style="font-size:16px;" class="pull-right hidden-xs glyphicon glyphicon-home"></span></a></li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">소득 정보 <span class="caret"></span><span style="font-size:16px;" class="pull-right hidden-xs glyphicon glyphicon-user"></span></a>
              <ul class="dropdown-menu stay-open" role="menu">
                <li><a href="/profit_crop">식량작물</a></li>
                <li class="divider"></li>
                <li><a href="/profit_fruit">과수</a></li>
                <li class="divider"></li>
                <li><a href="/profit_vegi_fac">시설채소</a></li>
                <li class="divider"></li>
                <li><a href="/profit_vegi_wild">노지채소</a></li>
              </ul>
            </li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">가격 정보 <span class="caret"></span><span style="font-size:16px;" class="pull-right hidden-xs glyphicon glyphicon-user"></span></a>
              <ul class="dropdown-menu" role="menu">
                <li><a href="/predict">농산물 가격 예측</a></li>
                <li class="divider"></li>
                <li><a href="/world_price">세계 주요식품 가격현황</a></li>
              </ul>
            </li>        
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">자금 정보 <span class="caret"></span><span style="font-size:16px;" class="pull-right hidden-xs glyphicon glyphicon-user"></span></a>
              <ul class="dropdown-menu" role="menu">
                <li><a href="/farmer_profit">농가 수입/소득</a></li>
                <li class="divider"></li>
                <li><a href="/gov_land_cost">정부지원금/농지가격</a></li>
                <li class="divider"></li>
                <li><a href="/loan_settle_cost">정착 자금/대출</a></li>
                <li class="divider"></li>
                <li><a href="/cost_comparison">도시/농촌 지출 비교</a></li>
              </ul>
            </li>                
          </ul>
        </div>
      </div>
      </nav>

      <section>
        <div class="container">
            <div class="row"><h3>소득정보 - 식량작물</h3></div><br/><br/><br/><br/>
            <div class="row">
                <div class="col-sm-2 item_button">
                    <h4 class="item_name">겉보리</h4>
                    <button type="button" class="btn btn-default btn-circle btn-lg">
                      <a href="#" data-toggle="modal" data-target="#squarespaceModal-barley">
                        <img class="item" class="rounded-circle" alt="겉보리" src="<c:url value="/resources/img/crop/barley.jpg"/>" data-holder-rendered="true" width="150px"></a>
                    </button>
                </div>
                <div class="col-sm-2 item_button">
                  <h4 class="item_name">쌀보리</h4>
                  <button type="button" class="btn btn-default btn-circle btn-lg">
                    <a href="#" data-toggle="modal" data-target="#squarespaceModal-ricebarley">
                      <img class="item" class="rounded-circle" alt="쌀보리" src="<c:url value="/resources/img/crop/ricebarley.PNG"/>" data-holder-rendered="true" width="150px"></a>
                  </button>
                </div>
                <div class="col-sm-2 item_button">
                  <h4 class="item_name">맥주보리</h4>
                  <button type="button" class="btn btn-default btn-circle btn-lg">
                    <a href="#" data-toggle="modal" data-target="#squarespaceModal-beerbarley">
                      <img class="item" class="rounded-circle" alt="맥주보리" src="<c:url value="/resources/img/crop/beerbarley.PNG"/>" data-holder-rendered="true" width="150px"></a>
                  </button>
                </div>
                <div class="col-sm-2 item_button">
                  <h4 class="item_name">노지풋옥수수</h4>
                  <button type="button" class="btn btn-default btn-circle btn-lg">
                    <a href="#" data-toggle="modal" data-target="#squarespaceModal-corn">
                      <img class="item" class="rounded-circle" alt="노지풋옥수수" src="<c:url value="/resources/img/crop/corn.jpeg"/>" data-holder-rendered="true" width="150px"></a>
                  </button>
                </div>
                <div class="col-sm-2 item_button">
                  <h4 class="item_name">고구마</h4>
                  <button type="button" class="btn btn-default btn-circle btn-lg">
                    <a href="#" data-toggle="modal" data-target="#squarespaceModal-sweetpotato">
                      <img class="item" class="rounded-circle" alt="고구마" src="<c:url value="/resources/img/crop/sweetpotato.jpg"/>" data-holder-rendered="true" width="150px"></a>
                  </button>
                </div>
              </div>
                <div class="row">
                <div class="col-sm-2 item_button">
                  <h4 class="item_name">봄감자</h4>
                  <button type="button" class="btn btn-default btn-circle btn-lg">
                    <a href="#" data-toggle="modal" data-target="#squarespaceModal-springpotato">
                      <img class="item" class="rounded-circle" alt="봄감자" src="<c:url value="/resources/img/crop/potato.jpg"/>" data-holder-rendered="true" width="150px"></a>
                  </button>
                </div>
                <div class="col-sm-2 item_button">
                  <h4 class="item_name">가을감자</h4>
                  <button type="button" class="btn btn-default btn-circle btn-lg">
                    <a href="#" data-toggle="modal" data-target="#squarespaceModal-fallpotato">
                      <img class="item" class="rounded-circle" alt="가을감자" src="<c:url value="/resources/img/crop/potato.jpg"/>" data-holder-rendered="true" width="150px"></a>
                  </button>
                </div>
                <div class="col-sm-2 item_button">
                  <h4 class="item_name">참깨</h4>
                  <button type="button" class="btn btn-default btn-circle btn-lg">
                    <a href="#" data-toggle="modal" data-target="#squarespaceModal-sesame">
                      <img class="item" class="rounded-circle" alt="참깨" src="<c:url value="/resources/img/crop/sesame.jpeg"/>" data-holder-rendered="true" width="150px"></a>
                  </button>
                </div>
                <div class="col-sm-2 item_button">
                  <h4 class="item_name">인삼</h4>
                  <button type="button" class="btn btn-default btn-circle btn-lg">
                    <a href="#" data-toggle="modal" data-target="#squarespaceModal-ginseng">
                      <img class="item" class="rounded-circle" alt="인삼" src="<c:url value="/resources/img/crop/ginseng.jpg"/>" data-holder-rendered="true" width="150px"></a>
                  </button>
                </div>
                <div class="col-sm-2 item_button">
                  <h4 class="item_name">엽연초</h4>
                  <button type="button" class="btn btn-default btn-circle btn-lg">
                    <a href="#" data-toggle="modal" data-target="#squarespaceModal-tobacco">
                      <img class="item" class="rounded-circle" alt="엽연초" src="<c:url value="/resources/img/crop/tobacco.PNG"/>" data-holder-rendered="true" width="150px"></a>
                  </button>
                  </div>
            </div>
        </div>

          <!-- modal -->
        <div class="modal fade" id="squarespaceModal-barley" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="container">
                <div class="row title_profit">
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                  <h2>소득정보 - 겉보리 (0.1ha 기준)</h2></div><br/>
                <div class="row">
                    <img src="<c:url value="/resources/img/crop/profit_barley.png"/>" width="500px" height="500px">
                </div> </div>
            </div> </div>      
        </div>
        <div class="modal fade" id="squarespaceModal-ricebarley" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="container">
                <div class="row title_profit">
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                  <h2>소득정보 - 쌀보리 (0.1ha 기준)</h2></div><br/>
                <div class="row">
                    <img src="<c:url value="/resources/img/crop/profit_ricebarley.png"/>" width="500px" height="500px">
                </div> </div>
            </div> </div>      
        </div>
        <div class="modal fade" id="squarespaceModal-beerbarley" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="container">
                <div class="row title_profit">
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                  <h2>소득정보 - 맥주보리 (0.1ha 기준)</h2></div><br/>
                <div class="row">
                    <img src="<c:url value="/resources/img/crop/profit_beerbarley.png"/>" width="500px" height="500px">
                </div> </div>
            </div> </div>      
        </div>
        <div class="modal fade" id="squarespaceModal-corn" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="container">
                <div class="row title_profit">
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                  <h2>소득정보 - 노지풋옥수수 (0.1ha 기준)</h2></div><br/>
                <div class="row">
                    <img src="<c:url value="/resources/img/crop/profit_corn.png"/>" width="500px" height="500px">
                </div> </div>
            </div> </div>      
        </div>
        <div class="modal fade" id="squarespaceModal-sweetpotato" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="container">
                <div class="row title_profit">
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                  <h2>소득정보 - 고구마 (0.1ha 기준)</h2></div><br/>
                <div class="row">
                    <img src="<c:url value="/resources/img/crop/profit_sweetpotato.png"/>" width="500px" height="500px">
                </div> </div>
            </div> </div>      
        </div>
        <div class="modal fade" id="squarespaceModal-springpotato" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="container">
                <div class="row title_profit">
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                  <h2>소득정보 - 봄감자 (0.1ha 기준)</h2></div><br/>
                <div class="row">
                    <img src="<c:url value="/resources/img/crop/profit_springpotato.png"/>" width="500px" height="500px">
                </div> </div>
            </div> </div>      
        </div>
        <div class="modal fade" id="squarespaceModal-fallpotato" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="container">
                <div class="row title_profit">
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                  <h2>소득정보 - 가을감자 (0.1ha 기준)</h2></div><br/>
                <div class="row">
                    <img src="<c:url value="/resources/img/crop/profit_fallpotato.png"/>" width="500px" height="500px">
                </div> </div>
            </div> </div>      
        </div>
        <div class="modal fade" id="squarespaceModal-sesame" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="container">
                <div class="row title_profit">
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                  <h2>소득정보 - 참깨 (0.1ha 기준)</h2></div><br/>
                <div class="row">
                    <img src="<c:url value="/resources/img/crop/profit_sesame.png"/>" width="500px" height="500px">
                </div> </div>
            </div> </div>      
        </div>
        <div class="modal fade" id="squarespaceModal-ginseng" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="container">
                <div class="row title_profit">
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                  <h2>소득정보 - 인삼(4년근) (0.1ha 기준)</h2></div><br/>
                <div class="row">
                    <img src="<c:url value="/resources/img/crop/profit_ginseng.png"/>" width="500px" height="500px">
                </div> </div>
            </div> </div>      
        </div>
        <div class="modal fade" id="squarespaceModal-tobacco" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="container">
                <div class="row title_profit">
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                  <h2>소득정보 - 엽연초 (0.1ha 기준)</h2>
                  </div><br/>
                <div class="row">
                    <img src="<c:url value="/resources/img/crop/profit_tobacco.png"/>" width="500px" height="500px">
                </div> </div>
            </div> </div>      
        </div>

      </section>
      
      <footer>
        <p>(08787) 서울 관악구 남부순환로 1820 에그옐로우 14층 귀농귀촌 종합상담 : 1111-1111 시스템 문의 : 02-222-2222</p>
        <p>Copyright 2021 Farmporter. All rights reserved.</p>
      </footer>

<script src="<c:url value="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"/>"></script>
<script src="<c:url value="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"/>"></script>
</body>
</html>