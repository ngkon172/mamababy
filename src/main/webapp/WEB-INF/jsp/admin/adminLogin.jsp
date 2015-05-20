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
		<div class="container">
			<div class="header">
			<h3 class="text-muted">MAMA BABY</h3>
			</div>
			<div class="jumbotron" style="text-algin=center">
				<h2>관리자 로그인 </h2>
				<br/>
				<form action="/admin/login" method="post">
					<label>Id</label>
					<input type="text" name="id"/>
					<label>password</label>
					<input name="password" type="password">
					<input type="submit" value="log-in">
				</form>
			</div>
		</div>
	</body>
</html>