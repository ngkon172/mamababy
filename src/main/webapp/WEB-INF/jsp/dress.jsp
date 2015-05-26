<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>마마베이비</title>
<link href="css/test.css" rel="stylesheet" media="screen">
<link rel="stylesheet" type="text/css"
	href="fonts/foundation-icons/foundation-icons.css">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"></script>


<script>
$(function() {

	// grab the initial top offset of the navigation 
	var sticky_navigation_offset_top = $('#nav').offset().top;
	
	// our function that decides weather the navigation bar should have "fixed" css position or not.
	var sticky_navigation = function(){
		var scroll_top = $(window).scrollTop(); // our current vertical position from the top
		
		// if we've scrolled more than the navigation, change its position to fixed to stick to top, otherwise change it back to relative
		if (scroll_top > sticky_navigation_offset_top) { 
			$('#nav').css({ 'position': 'fixed', 'top':0, 'left':0 });
		} else {
			$('#nav').css({ 'position': 'relative' }); 
		}   
	};
	
	// run our function on load
	sticky_navigation();
	
	// and run it again every time you scroll
	$(window).scroll(function() {
		 sticky_navigation();
	});
	
	// NOT required:
	// for this demo disable all links that point to "#"
	$('a[href="#"]').click(function(event){ 
		event.preventDefault(); 
	});
	
});
</script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div id="shop-nav">
		<ul class="shop-nav-ul">
			<li>
				<h4>
					<a href="" style="color: #ff4800">돌 드레스</a>
				</h4>
				<ul>
					<li><a href="/items1?cate1=DRESS&cate2=momDress">Mom's Dress</a></li>
					<li><a href="/items1?cate1=DRESS&cate2=momBolero">Mom's Bolero</a></li>
					<li><a href="/items1?cate1=DRESS&cate2=momACC">Mom's Acc</a></li>
					<li><a href="/items1?cate1=DRESS&cate2=momShoes">Mom's Shoes</a></li>
					<li><a href="/items1?cate1=DRESS&cate2=girlsDress">Girl's Dress</a></li>
					<li><a href="/items1?cate1=DRESS&cate2=girlsACC">Girl's 보넷, 헤어띠 외 ACC</a></li>
				</ul>
			</li>
		</ul>
	</div>

</body>
</html>
