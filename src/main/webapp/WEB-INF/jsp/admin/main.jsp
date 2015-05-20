<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Mamababy admin page</title>
	<link href="/css/bootstrap.css" rel="stylesheet">
	<style>

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
							<a href="#">게시판관리</a>
						</li>
					</ul>
				</div>
			</div>
		</nav>
		<div class="container-fluid">
			<div class="row">
				<div class="main">
					<h1 class="page-header">최근 주문 목록</h1>
					<div class="table-responsive">
						<table class="table table-striped">
							<thead>
								<tr>
									<th>주문날짜</th>
									<th>주문번호</th>
									<th>주문자</th>
									<th>결제금액</th>
									<th>결제방법</th>
									<th>주문상태</th>
								</tr>
							</thead>
							<tbody>
								<tr>
								<th>2014-03-16</th>
								<th>12345</th>
								<th>홍지수</th>
								<th>10000</th>
								<th>카드</th>
								<th>배송 준비중</th>
								</tr>
									<tr>
								<th>2014-03-16</th>
								<th>12345</th>
								<th>홍지수</th>
								<th>10000</th>
								<th>카드</th>
								<th>배송 준비중</th>
								</tr>
									<tr>
								<th>2014-03-16</th>
								<th>12345</th>
								<th>홍지수</th>
								<th>10000</th>
								<th>카드</th>
								<th>배송 준비중</th>
								</tr>
									<tr>
								<th>2014-03-16</th>
								<th>12345</th>
								<th>홍지수</th>
								<th>10000</th>
								<th>카드</th>
								<th>배송 준비중</th>
								</tr>
									<tr>
								<th>2014-03-16</th>
								<th>12345</th>
								<th>홍지수</th>
								<th>10000</th>
								<th>카드</th>
								<th>배송 준비중</th>
								</tr>
									<tr>
								<th>2014-03-16</th>
								<th>12345</th>
								<th>홍지수</th>
								<th>10000</th>
								<th>카드</th>
								<th>배송 준비중</th>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="row placeholders">





							<div class="col-xs-6 cos-sm-6">
									<h2 class="page-header">매출현황</h2>
								<div class="table-responsive">
						<table class="table table-striped">
							<tbody>
								<tr>
									<td>주문건</td>
									<td>건</td>
									<td>금액</td>
									<td>원</td>
								</tr>
								<tr>
									<td>미결제건</td>
									<td>건</td>
									<td>미배송건</td>
									<td>건</td>
								</tr>
							</tbody>
									</table>
								</div>
							</div>

						<div class="col-xs-6 cos-sm-6 ">
							<h2 class="page-header">상점현황</h2>
								<div class="table-responsive">
									<table class="table table-striped">
										<tbody>
											<tr>
											<td>오늘 매출액</td>
											<td>원</td>
											<td>이달 매출액</td>
											<td>원</td>
											</tr>
											<tr>
												<td>올해 매출액</td>
												<td>원</td>
												<td>총 매출액</td>
												<td>원</td>
											</tr>
										</tbody>
									</table>
								</div>

						</div>
					</div>

				</div>
			</div>
		</div>

	</body>
</html>