<%--
  Created by IntelliJ IDEA.
  User: hoy
  Date: 15. 4. 30.
  Time: 오전 12:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>MaMa baby</title>
    <meta charset="utf-8"/>
    <link href="css/test.css" rel="stylesheet" media="screen">
  <link rel="stylesheet" type="text/css"
        href="fonts/foundation-icons/foundation-icons.css">
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"></script>
</head>
<body>
  <jsp:include page="header.jsp"></jsp:include>
  <div id="shop-nav">
    <ul class="shop-nav-ul">
      <li>
        <h4>
          <a id="mom_active" href="" style="color : #FF4800">Mom</a>
        </h4>
        <ul>
          <li><a href="/items1?cate1=MOM&cate2=Outer">Outer</a></li>
          <li><a href="/items1?cate1=MOM&cate2=Top">Top</a></li>
          <li><a href="/items1?cate1=MOM&cate2=Bottom">Bottom</a></li>
          <li><a href="/items1?cate1=MOM&cate2=Dress">Dress</a></li>
          <li><a href="/items1?cate1=MOM&cate2=Shoes">Shoes</a></li>
          <li><a href="/items1?cate1=MOM&cate2=Etc">Etc</a></li>
          <li><a href="/items1?cate1=MOM&cate2=Sale">Sale</a></li>
        </ul>
      </li>
    </ul>
  </div>
</body>
</html>
