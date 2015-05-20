<%--
  Created by IntelliJ IDEA.
  User: hoy
  Date: 2015. 5. 17.
  Time: 오후 9:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<head>
  <meta charset="utf-8"/>
  <link href="css/login.css" rel="stylesheet"/>
  <link rel="stylesheet" type="text/css" href="fonts/foundation-icons/foundation-icons.css"/>
  <script type="javascript">
    var index = ${index};

    window.onload =function hey(){
      if(index ==2){
        document.getElementById('msg').style.color ="red";
        document.getElementById('msg').style.visibility ="visible";
      }
    }

  </script>
  <style type="text/css">
    .phidden {
      visibility: hidden;

    }
    .pmsg {
      visibility: visible;
      color: red;
    }
  </style>
</head>
<body>
  <div id="container">
    <div id="contents">
      <div class="detail_page">
        <div class="titleArea">
          <h2>Log In</h2>
          <p>로그인</p>
        </div>
        <form class="log-in" method="post" name="login" action="/loginValid">
          <h2 class="log-in-title">로그</h2>
          <input type="text" class="log-in-input" placeholder="아이디" name="id" autofocus/>

          <input type="password" class="log-in-input" placeholder="비밀번호" name="password"/>

          <p id ="msg">아이디 또는 비밀번호가 잘못 되었습니다.</p>
          <input type="submit" value="LOG IN" class="log-in-button"/>
        </form>
        <div class="join-form">
          <h2 class="log-in-title">회원가입</h2>
          <div class="join">
            <p class="plz_joinus">
              아직 회원이 아니세요?
              <br><br>
              회원을 위한 다양한 혜택이
              <br><br>
              준비되어 있습니다. ${index}
            </p>
            <p class="join-us">
              <a href="/reg" style="text-decoration: none;"><input type="submit" value="JOIN US" class="join-us-button"></a>
            </p>
            <div class="results"></div>
          </div>
        </div>
      </div>
    </div>
  </div>
</body>
