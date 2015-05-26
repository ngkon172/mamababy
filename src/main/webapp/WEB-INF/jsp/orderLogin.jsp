<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <link rel="stylesheet" href="css/login.css">
    <link rel="stylesheet" type="text/css" href="fonts/foundation-icons/foundation-icons.css">
</head>
<body>
    <div id="container">
         <div id="contents">
            <div class="detail_page">
                <div class="titleArea">
                        <h2>log in</h2>
                        <p>로그인</p>
                </div>
                <form class="log-in" method="post" name="login" action="/orderLogin?ItemId=${id}">
                    <h2 class="log-in-title">로그인</h2>
                    <input type="text" class="log-in-input" placeholder="아이디" name="id"autofocus>
                    <input type="password" class="log-in-input" placeholder="비밀번호" name="password">
                    <input type="submit" value="LOG IN" class="log-in-button">
             
                   
           
                </form>
                
                <div class="join-form">
                    <h2 class="log-in-title">회원가입</h2>
                    <div class="join">
                        <p class="plz_joinus">
                        아직 회원이 아니세요?
                        <br><br>
                        회원을 위한 다양한 혜택이
                        <br><br>
                        준비되어 있습니다~!!
                        </p>
                        <p class="joinus">
                           <a href="reg.html" style="text-decoration:none;"><input type="submit" value="JOIN US" class="join-us-button"></a>
                        </p>
                    </div>
                </div>
                <div class="no-member">
                 <form action="/noMemOrder">
                    <h2 class="log-in-title">비회원</h2>
                     <input type="hidden" name ="itemId" value="${id}"/>
                    <input type="text" class="no-member-input" name ="noMemNmae" placeholder="주문자명">
                    <input type="password" class="no-member-input" name="noMemPasswrod" placeholder="비밀번호">
                    <input type="submit" value="OK" class="no-member-button">
             
                    </form>
                </div>
                
             </div>
        </div>
    </div>
</body>
</html>
