<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>MaMababy</title>
    <link href="css/test.css" rel="stylesheet" media="screen">
    <link href="css/view.css" rel="stylesheet" media="screen">
    <link rel="stylesheet" type="text/css" href="fonts/foundation-icons/foundation-icons.css">

</head>
<body>
<jsp:include page="${cate1}"></jsp:include>

<div class="container-shop">

    <div class="element- product product-listmain-1 product-listmain product-1">
        <div class="titleArea">
            <h2>NEW ARRIVALS</h2>
        </div>

        <ul class="prdList itemline4">
            <c:forEach var="item" items="${item}" varStatus="status">
                <li id="anchorBoxId_261" class="item record-">
                    <div class="box">
                        <a name="anchorBoxName_261" href="/itemDetail?id=${item.id}">
                            <img class="thumb" alt="" src="${item.filePath }" width="250" height="300">
                        </a>
                        <p class="name">
                            <a href="#">${item.prdname}</a>
                        </p>
                        <p class="name product_new">
                            <a><i class="product_new_icon fi-burst-new"></i></a>
                        </p>
                        <ul class="element- product product-listitem-1 product-listitem product-1">
                            <li class=" record-">
                                <span style="font-size:13px;">${item.sellprice}</span>
                            </li>
                        </ul>
                    </div>
                </li>
            </c:forEach><!--
                <li id="anchorBoxId_262" class="item record-">
                    <div class="box">
                        <a name="anchorBoxName_261" href="">
                            <img class="thumb" alt="" src="http://placehold.it/250x300">
                        </a>
                        <p class="name">
                            <a href="#">item ì´ë¦ </a>
                        </p>
                        <p class="name product_new">
                            <a><i class="product_new_icon fi-burst-new"></i></a>
                        </p>
                        <ul class="element- product product-listitem-1 product-listitem product-1">
                            <li class=" record-">
                                <span style="font-size:13px;">ê°ê²©</span>
                            </li>
                        </ul>
                    </div>
                </li>
                <li id="anchorBoxId_263" class="item record-">
                    <div class="box">
                        <a name="anchorBoxName_261" href="">
                            <img class="thumb" alt="" src="http://placehold.it/250x300">
                        </a>
                        <p class="name">
                            <a href="#">item ì´ë¦ </a>
                        </p>
                        <p class="name product_new">
                            <a><i class="product_new_icon fi-burst-new"></i></a>
                        </p>
                        <ul class="element- product product-listitem-1 product-listitem product-1">
                            <li class=" record-">
                                <span style="font-size:13px;">ê°ê²©</span>
                            </li>
                        </ul>
                    </div>
                </li>
                <li id="anchorBoxId_264" class="item record-">
                    <div class="box">
                        <a name="anchorBoxName_261" href="">
                            <img class="thumb" alt="" src="http://placehold.it/250x300">
                        </a>
                        <p class="name">
                            <a href="#">item ì´ë¦ </a>
                        </p>
                        <p class="name product_new">
                            <a><i class="product_new_icon fi-burst-new"></i></a>
                        </p>
                        <ul class="element- product product-listitem-1 product-listitem product-1">
                            <li class=" record-">
                                <span style="font-size:13px;">ê°ê²©</span>
                            </li>
                        </ul>
                    </div>
                </li>
                <li id="anchorBoxId_265" class="item record-">
                    <div class="box">
                        <a name="anchorBoxName_261" href="">
                            <img class="thumb" alt="" src="http://placehold.it/250x300">
                        </a>
                        <p class="name">
                            <a href="#">item ì´ë¦ </a>
                        </p>
                        <p class="name product_new">
                            <a><i class="product_new_icon fi-burst-new"></i></a>
                        </p>
                        <ul class="element- product product-listitem-1 product-listitem product-1">
                            <li class=" record-">
                                <span style="font-size:13px;">ê°ê²©</span>
                            </li>
                        </ul>
                    </div>
                </li>
                <li id="anchorBoxId_266" class="item record-">
                    <div class="box">
                        <a name="anchorBoxName_261" href="">
                            <img class="thumb" alt="" src="http://placehold.it/250x300">
                        </a>
                        <p class="name">
                            <a href="#">item ì´ë¦ </a>
                        </p>
                        <p class="name product_new">
                            <a><i class="product_new_icon fi-burst-new"></i></a>
                        </p>
                        <ul class="element- product product-listitem-1 product-listitem product-1">
                            <li class=" record-">
                                <span style="font-size:13px;">ê°ê²©</span>
                            </li>
                        </ul>
                    </div>
                </li>
                <li id="anchorBoxId_267" class="item record-">
                    <div class="box">
                        <a name="anchorBoxName_261" href="">
                            <img class="thumb" alt="" src="http://placehold.it/250x300">
                        </a>
                        <p class="name">
                            <a href="#">item ì´ë¦ </a>
                        </p>
                        <p class="name product_new">
                            <a><i class="product_new_icon fi-burst-new"></i></a>
                        </p>
                        <ul class="element- product product-listitem-1 product-listitem product-1">
                            <li class=" record-">
                                <span style="font-size:13px;">ê°ê²©</span>
                            </li>
                        </ul>
                    </div>
                </li>
                <li id="anchorBoxId_268" class="item record-">
                    <div class="box">
                        <a name="anchorBoxName_261" href="">
                            <img class="thumb" alt="" src="http://placehold.it/250x300">
                        </a>
                        <p class="name">
                            <a href="#">i </a>
                        </p>
                        <p class="name product_new">
                            <a><i class="product_new_icon fi-burst-new"></i></a>
                        </p>
                        <ul class="element- product product-listitem-1 product-listitem product-1">
                            <li class=" record-">
                                <span style="font-size:13px;">ê°ê²©</span>
                            </li>-->
        </ul>
    </div>
    </li>
    </ul><!--
            <div class="titleArea">
                <h2>Best Items</h2>
            </div>
             <ul class="prdList itemline4">
                <li id="anchorBoxId_269" class="item record-">
                    <div class="box">
                        <a name="anchorBoxName_261" href="">
                            <img class="thumb" alt="" src="http://placehold.it/250x300">
                        </a>
                        <p class="name">
                            <a href="#">item ì´ë¦ </a>
                        </p>
                        <p class="name product_new">
                            <a><i class="product_new_icon fi-burst-new"></i></a>
                        </p>
                        <ul class="element- product product-listitem-1 product-listitem product-1">
                            <li class=" record-">
                                <span style="font-size:13px;">ê°ê²©</span>
                            </li>
                        </ul>
                    </div>
                </li>
                 <li id="anchorBoxId_270" class="item record-">
                    <div class="box">
                        <a name="anchorBoxName_261" href="">
                            <img class="thumb" alt="" src="http://placehold.it/250x300">
                        </a>
                        <p class="name">
                            <a href="#">item ì´ë¦ </a>
                        </p>
                        <p class="name product_new">
                            <a><i class="product_new_icon fi-burst-new"></i></a>
                        </p>
                        <ul class="element- product product-listitem-1 product-listitem product-1">
                            <li class=" record-">
                                <span style="font-size:13px;">ê°ê²©</span>
                            </li>
                        </ul>
                    </div>
                </li>
                 <li id="anchorBoxId_271" class="item record-">
                    <div class="box">
                        <a name="anchorBoxName_261" href="">
                            <img class="thumb" alt="" src="http://placehold.it/250x300">
                        </a>
                        <p class="name">
                            <a href="#">item ì´ë¦ </a>
                        </p>
                        <p class="name product_new">
                            <a><i class="product_new_icon fi-burst-new"></i></a>
                        </p>
                        <ul class="element- product product-listitem-1 product-listitem product-1">
                            <li class=" record-">
                                <span style="font-size:13px;">ê°ê²©</span>
                            </li>
                        </ul>
                    </div>
                </li>
                 <li id="anchorBoxId_272" class="item record-">
                    <div class="box">
                        <a name="anchorBoxName_261" href="">
                            <img class="thumb" alt="" src="http://placehold.it/250x300">
                        </a>
                        <p class="name">
                            <a href="#">item ì´ë¦ </a>
                        </p>
                        <p class="name product_new">
                            <a><i class="product_new_icon fi-burst-new"></i></a>
                        </p>
                        <ul class="element- product product-listitem-1 product-listitem product-1">
                            <li class=" record-">
                                <span style="font-size:13px;">ê°ê²©</span>
                            </li>
                        </ul>
                    </div>
                </li>
            </ul>-->
</div>

</div>
<jsp:include page="footer.jsp"></jsp:include>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"></script>


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
</body>
</html>
