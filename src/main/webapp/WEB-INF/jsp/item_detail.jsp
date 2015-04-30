<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>마마베이비</title>
    <link href="/css/test.css" rel="stylesheet" media="screen">
    <link href="/css/detail-test.css" rel="stylesheet" />
    <link href="/css/buttons.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css"
          href="fonts/foundation-icons/foundation-icons.css">
    <link
            href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css"
            rel="stylesheet">
    <script
            src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"></script>

    <script>
        function mySubmit(index){
            if(index==1){
                document.form.action="/order?id="+"<c:out value='${item.id}'/>";
            }if(index==2){
                document.form.action="/addCart?id="+"<c:out value='${item.id}'/>";
            }
            document.form.submit();
        }

    </script>
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
    <script type="text/javascript">
        function change(num)
        {
            var x  = document.form;
            var y = Number(x.count.value) + num;
            if(y < 1) y = 1;
            x.count.value = y;
        }
    </script>
</head>
<body>
<div id="header_st2">
    <div id="header_st2_bottom">
        <div class="xans-element- xans-layout xans-layout-logotop ">
            <a class="logo_on" href="main.html">
                <h1 id="main_logo">Mama Baby</h1>
            </a>
        </div>
    </div>
</div>
<header id="nav">
    <div class="nav-container" id="nav-container">

        <nav id="global-nav">
            <ul class="shop-nav">
                <li><a id="shop-nav-Mom" href="mom.html">Mom</a></li>
                <li><a id="shop-nav-Baby" href="baby.html">Baby</a></li>
                <li><a id="shop-nav-home" href="dress.html">Dress</a></li>
                <li><a id="shop-nav-life-style" href="acc.html">Acc</a></li>
                <li><a id="shop-nav-culture" class="bar"
                       href="traditonal.html">Traditional</a></li>

                <li><a class="project" href="">Rent</a></li>
                <li><a class="project" href="board.html">notice</a></li>
                <li><a class="project" href="">review</a></li>
            </ul>
        </nav>
    </div>
</header>
<nav id="side-nav">
    <ul class="nav">
        <li class="login"><a href="login.html"><i
                class="step fi-torso size-36"></i><span>로그인</span></a></li>
        <li class="account"><a href="reg.html"><i
                class="step fi-pencil size-36"></i><span>회원가입</span></a></li>
        <li class="orderS"><a href=""><i
                class="step fi-list-thumbnails size-36"></i><span>주문조회</span></a>
        </li>

        <li class="cart"><a href=""><i
                class="step fi-shopping-cart size-36"></i><span>장바구니</span></a>
        </li>
        <li class=""><a href="#header_st2"><i
                class="step fi-arrow-up size-36"></i><span>맨 위로</span></a></li>
    </ul>
</nav>

<div class="item-container">
    <div class="item-Box">
        <div class="item-order">
            <div class="i-container">
                <img  src="${item.filePath}">
            </div>
            <div class="d-container">
                <div class="name">${item.prdname}</div>
                <div class="price">${item.sellprice}</div>
                <ul>
                    <li><span>Code</span> <span>${item.id}</span></li>
                    <li><span>Point</span> <span>${item.reserve} point</span></li>
                    <li><span>Delivery</span> <span>50,000 원 이상
								구매시 무료배송 (배송료 2,500원)</span></li>

                </ul>
                <form action="" method="post" id="form" name="form">
                    <div class="num">

                        <a href='#' onclick='javascript_:change(-1);'><i
                                class="fa fa-chevron-down"></i></a> <input id="quantity" type="text"
                                                                           value="1" name='count' readonly> <a href='#'
                                                                                                               onclick='javascript_:change(1);'><i class="fa fa-chevron-up"></i></a>

                    </div>




                    <select id="size_option1" onchange=""
                            name="optCode1">
                        <option value="${opt1.optitle}">${opt1.optitle}</option>
                        <c:forEach var="optCode" items="${opt1.optCode}" varStatus="status2"><option value="${optCode}">${optCode}</option></c:forEach>

                    </select>
                    <c:if test="${opt2.optitle ne null}">
                        <select id="size_option2" onchange=""
                                name="optCode2">
                            <option value="${opt2.optitle}">${opt2.optitle}</option>
                            <c:forEach var="optCode" items="${opt2.optCode}" varStatus="status2"><option value="${optCode}">${optCode}</option></c:forEach>

                        </select>
                    </c:if>
                    <c:if test="${opt3.optitle ne null}">
                        <select id="size_option3" onchange=""
                                name="optCode3">
                            <option value="${opt3.optitle}">${opt3.optitle}</option>
                            <c:forEach var="optCode" items="${opt3.optCode}" varStatus="status2"><option value="${optCode}">${optCode}</option></c:forEach>

                        </select>
                    </c:if>



                    <div class="btn">
                        <button id="order_button" class="button-border-highlight"
                                onclick="mySubmit(1)">BUY NOW</button>
                        <button id="keep_button" class="button-border" onclick="mySubmit(2)">BAG</button>
                    </div>
                </form>
                <!-- 	<ul class="notice">
                        <li><span>NOTICE</span> <br></li>
                    </ul> -->
            </div>
        </div>
        <p>상품설명</p>
        <p>${item.contents}</p>


    </div>
</div>

</body>
</html>
