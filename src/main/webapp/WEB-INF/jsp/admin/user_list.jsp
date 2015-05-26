<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Mamababy admin page</title>
	<link href="/css/bootstrap.css" rel="stylesheet">
	<style>

	th{
		text-align: center;
	}
		 
		.customT{
		
			margin-top : 50px;
			margin-left: 30px;
		
			
		}
		.customT td{
			border-bottom: 1px solid gray;
				
		}
		.abc{
			font-size: 25px;
			border: solid 2px; 
			padding: 1em  
			
		}
		
		h2{
			text-align: left;
		}
		/*
 * Base structure
 */

/* Move down content because we have a fixed navbar that is 50px tall */
body {
  padding-top: 50px;
}


/*
 * Global add-ons
 */

.sub-header {
  padding-bottom: 10px;
  border-bottom: 1px solid #eee;
}

/*
 * Top navigation
 * Hide default border to remove 1px line.
 */
.navbar-fixed-top {
  border: 0;
}

/*
 * Sidebar
 */

/* Hide for mobile, show later */
.sidebar {
  display: none;
}
@media (min-width: 768px) {
  .sidebar {
    position: fixed;
    top: 51px;
    bottom: 0;
    left: 0;
    z-index: 1000;
    display: block;
    padding: 20px;
    overflow-x: hidden;
    overflow-y: auto; /* Scrollable contents if viewport is shorter than content. */
    background-color: #f5f5f5;
    border-right: 1px solid #eee;
  }
}

/* Sidebar navigation */
.nav-sidebar {
  margin-right: -21px; /* 20px padding + 1px border */
  margin-bottom: 20px;
  margin-left: -20px;
}
.nav-sidebar > li > a {
  padding-right: 20px;
  padding-left: 20px;
}
.nav-sidebar > .active > a,
.nav-sidebar > .active > a:hover,
.nav-sidebar > .active > a:focus {
  color: #fff;
  background-color: #428bca;
}


/*
 * Main content
 */

.main {
  padding: 20px;
}
@media (min-width: 768px) {
  .main {
    padding-right: 40px;
    padding-left: 40px;
  }
}
.main .page-header {
  margin-top: 0;
}


/*
 * Placeholder dashboard ideas
 */

.placeholders {
  margin-bottom: 30px;
  text-align: center;
}
.placeholders h4 {
  margin-bottom: 0;
}
.placeholder {
  margin-bottom: 20px;
}
.placeholder img {
  display: inline-block;
  border-radius: 50%;
}


	</style>
	</head>
	<body>
		<nav class="navbar navbar-inverse navbar-fixed-top">
		
			<div class="container-fluid">
				<div class="navbar-header">
					<a class="navbar-brand" href="#">Mama Baby</a> 
				</div>
				<div id="navbar" class="navbar-collapse collapse">
					<ul class="nav navbar-nav navbar-right">
						<li>
							<a href="/admin/main">Main</a>
						</li>
						<li>
							<a href="/admin/productList">상품목록</a>
						</li>
						<li>
							<a href="/admin/userList">회원목록</a>
						</li>
						<li>
							<a href="/admin/orderList">주문목록</a>
						</li>
						<li>
							<a href="/admin/bbsList/rent?page=1">게시판관리</a>
						</li>
						<li>
							<a href="/admin/product/add">상품등록</a>
						</li>
					</ul>
				</div>
			</div>
		</nav>
		<div class="container-fluid">
			<div class="row">
				<div class="main">
					<h1 class="page-header">회원목록</h1>
					<div class="table-responsive">
						<table class="table table-striped">
							<thead>
								<tr>
									<th>이름</th>
									<th>아이디</th>
									<th>휴대폰</th>
									<th>이메일</th>
									<th>적립금</th>

									<th>상세보기</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="userItem" items="${userList}" varStatus="status">
								<tr>
									<th>${userItem.userName}</th> <!-- 이름  -->
									<th>${userItem.user}</th> <!-- id -->
									<th>${userItem.mobile1}-${userItem.mobile2}-${userItem.mobile3}</th> <!-- h.p-->
									<th>${userItem.email1}@${userItem.email2}</th>
									<th>${userItem.point}p</th>

									<th><a  href="/admin/userList/detail?id=${userItem.user}" class="btn btn-default">상세보기</a></th>
								</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>

