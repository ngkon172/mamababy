<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Mamababy admin page</title>
  <link href="/css/bootstrap.css" rel="stylesheet">
  <style>
    .container {
      text-align: center;
    }
  </style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="container">
  <div class="header">
    <h3 class="text-muted">MAMA BABY</h3>
  </div>
  <div class="jumbotron" style="text-algin:center">
    <h2>비밀번호 확인  </h2>
    <br/>
    <form action="/bbs/reply/del" method="post">


      <label>password</label>
      <input  name="id" value="${id}" type="hidden"/>
      <input name="rid" value="${rid}" type="hidden"/>
      <input name="password" type="password"/>
      <input type="submit" value="확인"/>
    </form>
  </div>
</div>
</body>
</html>