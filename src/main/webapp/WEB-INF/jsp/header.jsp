<%--
  Created by IntelliJ IDEA.
  User: hoy
  Date: 15. 4. 28.
  Time: 오후 4:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
  $(function(){
    var sticky_navigation_offset_top = $('#nav').offset().top;

    var sticky_navigation = function(){
        var scroll_top = $(window).scrollTop;

        if(scroll_top > sticky_navigation_offset_top{

            $('#nav').css({'position' : 'fixed', 'top':0, 'left':0 });

        }else{
            $('#nav').css({'position': 'relative'});
        }
    };

      sticky_navigation();

      $(window).scroll(function(){
          sticky_navigation();
      })
  })
</script>

<div id="header_st2">
    <div id="header_st2_bottom">
        <div class="xans-element- xans-layout xans-layout-logotop">
            <a class="logo_on" href="/"><h1 id="main_logo">MaMa Baby</h1></a>
        </div>
    </div>
</div>
<header id="nav">
    <div class="nav-container">
        <nav id="global-nav">
            <ul class="shop-nav">
                <li><a id="shop-nav-Mom" href="items?cate1=MOM">Mom</a> </li>
                <li><a id="shop-nav-Baby" href="items?cate1=BABY">Baby</a> </li>
                <li><a id="shop-nav-home" href="items?cate1=DRESS">Dress</a> </li>
                <li><a class="project" href="rent?page=1">Rent</a> </li>
                <li><a class="project" href="QnA?page=1">QnA</a> </li>
                <li><a class="project" href="Review?page=1">review</a> </li>
            </ul>
        </nav>
    </div>
</header>
<nav id="side-nav">
    <ul class="nav">
        <c:choose>
            <c:when test="${sessionScope.user eq null}">
                <li class="login"><a href="login.html"><i class="step fi-torso size-36"></i><span>로그인</span></a></li>
                <li class="account"><a href="reg.html"><i class="step fi-pencil size-36"></i><span>회원가입</span></a></li>
            </c:when>
            <c:when test="${sessionScope.user ne null}">
                <li class="login"><a href="/logOut"><i class="step fi-torso size-36"></i><span>로그아웃 </span></a></li>
            </c:when>

        </c:choose>


        <li class="orderS"><a href=""><i class="step fi-list-thumbnails size-36"></i><span>주문조회</span></a></li>
        <!--<li class="heart">
        <a href="/mypage/heart/product.asp">마이하트</a>
        </li>-->
        <li class="cart"><a href="/cart"><i
                class="step fi-shopping-cart size-36"></i><span>장바구니</span></a></li>
    </ul>
</nav>