<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="ko">
<head>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css">

    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
    <c:url var="firstUrl" value="/bbs/${cate}?page=1"/>
    <c:url var="lastUrl" value="/bbs/${cate}?page=${bbsLog.totalPages}"/>
    <c:url var="prevUrl" value="/bbs/${cate}?page=${currentIndex-1}"/>
    <c:url var="nextUrl" value="/bbs/${cate}?page=${currentIndex+1}"/>
    <meta charset="utf-8">
    <link href="/css/board.css" rel="stylesheet" media="screen"/>
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="fonts/foundation-icons/foundation-icons.css"/>
    <link href="/css/bootstrap.min.css" rel="stylesheet" media="screen"/>
    <link href="/css/test.css" rel="stylesheet" media="screen">
    <link href="/css/footer.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" media="screen"
          href="/css/style.css" />
    <link href="/css/slideshow.css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css"
          href="/fonts/foundation-icons/foundation-icons.css">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"></script>
</head>
<body>
<jsp:include page="header.jsp"/>
<div id="container">

    <div id="contents">
        <div class="detail_page">
            <div class="element- board board-listpackage-4 board-listpackage board-4 ">
                <div class="element- board board-title-4 board-title board-4 ">
                    <div class="titleArea">
                        <h2>${cate} Board</h2>

                    </div>
                </div>
                <div class="boardList">
                    <table border="1" summary="">
                        <thead class="element- board board-listheader-4 board-listheader board-4 ">
                        <tr style=" ">
                            <th class="number" scope="col"> no</th>

                            <th class="category displaynone" scope="col">category</th>
                            <th class="subject" scope="col">subject</th>
                            <th class="writer" scope="col">name</th>
                            <th class="date " scope="col">date</th>
                            <th class="hit displaynone" scope="col">hit</th>
                            <th class="recom displaynone" scope="col">like it</th>
                            <th class="grade displaynone" scope="col">grade</th>
                        </tr>
                        </thead>
                        <tbody class="element- board board-notice-4 board-notice board-4 notice">
                        <tr class="record-" style="background-color:#FFFFFF; color:#555555;">
                            <td class="number">
                                <i class="fa fa-bell"></i>
                            </td>

                            <td class="subject">
                                <a href="read.html">공지사항 테스트</a>
                                <i class="notice_check fi-check"></i>
                            </td>
                            <td class="writer" id="admin_writer">
                                Mama Baby
                            </td>
                            <td class="date ">2014-07-01</td>
                        </tr>

                        </tbody>
                        <tbody class="element- board board-list-4 board-list board-4">

                        <!--  게시글   -->
                        <c:forEach var="bbsitem" items="${bbs}" varStatus="status">
                            <tr class="record-" style="background-color:#FFFFFF; color:#555555;">
                                <td class="number">${bbsitem.no}</td>
                                <td class="category displaynone"></td>
                                <td class="subject">
                                            <span class="displaynone">
                                                <a onclick="" href="#none">
                                                    <img alt="" src="">
                                                </a>
                                            </span>
                                    <i class="fa fa-lock"></i>
                                    <a href="./read?id=${bbsitem.id}">${bbsitem.subject}<span class="romi_date">

    [${bbsitem.replyCount}]

</span></a>
                                    <!--                                             <i class="new fi-burst-new"></i>
                                     -->                                            <span class="reple"></span>
                                </td>
                                <td class="writer">${bbsitem.name}</td>
                                <td class="date ">${bbsitem.regDate}</td>
                                <td class="hit displaynone">3</td>
                                <td class="recom displaynone">0</td>
                                <td class="grade displaynone">
                                    <img alt="0점" src="">
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <button><a href="/write?cate=${cate}">글쓰기</a></button>
                </div>
            </div>



            <div class="element- board board-paging-4 board-paging board-4 paging">
                <ul>
                    <c:choose>
                        <c:when test="${currentIndex == 1}">
                            <li class="disabled"><a href="#">&lt;&lt;</a></li>
                            <li class="disabled"><a href="#">&lt;</a></li>
                        </c:when>
                        <c:otherwise>
                            <li><a href="${firstUrl}">&lt;&lt;</a></li>
                            <li><a href="${prevUrl}">&lt;</a></li>
                        </c:otherwise>
                    </c:choose>
                    <li class="record-">
                        <c:forEach var="i" begin="${beginIndex}" end="${endIndex}">
                            <c:url var="pageUrl" value="/bbs/${cate}?page=${i}" />
                        <c:choose>
                        <c:when test="${i == currentIndex}">
                    <li class="this"><a class="this" href="${pageUrl}"><c:out value="${i}" /></a></li>
                    </c:when>
                    <c:otherwise>
                        <li><a href="${pageUrl}"><c:out value="${i}" /></a></li>
                    </c:otherwise>
                    </c:choose>
                    </c:forEach>
                    </li>
                    <c:choose>
                        <c:when test="${currentIndex == deploymentLog.totalPages}">
                            <li class="disabled"><a href="#">&gt;</a></li>
                            <li class="disabled"><a href="#">&gt;&gt;</a></li>
                        </c:when>
                        <c:otherwise>
                            <li><a href="${nextUrl}">&gt;</a></li>
                            <li><a href="${lastUrl}">&gt;&gt;</a></li>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </div>

        </div>
    </div>
</div>
<jsp:include page="../jsp/footer.jsp" flush="false"></jsp:include>
</body>

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

        // NOT required:가나다
        // for this demo disable all links that point to "#"
        $('a[href="#"]').click(function(event){
            event.preventDefault();
        });

    });
</script>
</html>