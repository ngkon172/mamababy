<%--
  Created by IntelliJ IDEA.
  User: hoy
  Date: 15. 5. 7.
  Time: 오후 10:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>MaMaBaby</title>
    <link href="/css/comment.css" rel="stylesheet"/>
    <link href="/css/read.css" rel="stylesheet" media="screen"/>
    <link href="/css/bootstrap.css" rel="stylesheet"/>
</head>
<body>
    <jsp:include page="header.jsp"/>
    <div id="container">
        <div id="contents">
            <div class="detail_page">
                <div class="element- board board-readpackage-4 board-readpackage board-4 ">
                    <div class="element- board board-title-4 board-title board-4 ">

                    <div class="titleArea">
                            <h2>Read</h2>
                            <p>게시판</p>
                        </div>
                    </div>
                    <form id="BoardDelForm" method="post" >
                        <div class="element- board board-read-4 board-read board-4">
                            <div class="board-view">
                                <table border="1">
                                    <tbody>
                                        <tr>
                                            <th scope="row">Subject</th>
                                            <td><span class="kor">${bbs.subject}</span> </td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Name</th>
                                            <td>
                                                <span class="kor"></span>
                                                <span class="admin_writer">${bbs.name}</span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Date</th>
                                            <td>
                                                <span class="kor"></span>
                                                <span class="admin_writer">${bbs.regDate}</span>
                                            </td>
                                        </tr>
                                        <tr class="view">
                                            <td colspan="2">
                                                <div class="detail">
                                                    <p>${bbs.content}</p>
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="btnArea">
                                <span class="left">
                                    <a href="/bbs/${bbs.category}?page=1">
                                        <span class="button s romi_btn white">목록</span>
                                    </a>
                                </span>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="xans-element- xans-board xans-board-commentpackage-4 xans-board-commentpackage xans-board-4 ">
                    <div class="xans-element- xans-board xans-board-commentlist-4 xans-board-commentlist xans-board-4">
                        <ul class="boardComment">
                            <c:forEach var="reply" items="${reply}" varStatus="status">
                                <li class="first  xans-record-">
                                    <strong class="name">${reply.userName}</strong>
                                    <span class="date">${reply.regDate}</span>
                                    <span class="grade displaynone"><img src="./images/ico_point0.gif" alt="0점"/></span>
                                <span class="button">
                                    <a href="/bbs/reply/passchk?id=${bbs.id}&rid=${reply.id}">삭제</a>

                                    <a href="javascript:;" onclick="" class="displaynone"><img src="./images/btn_ico_reply.gif" alt="댓글"/></a>
                                </span>
                                    <p class="comment">
                                    <span id="comment_contents16543">
                                            ${reply.contents}</span></p>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
                <div class="element- board board-commentpackage-4 commentpackage board-4 ">
                    <form id="commentWriteForm" enctype="" method="post" action="/reply?id=${bbs.id}" name="">
                        <div class="commentWrite">


                            <fieldset>

                                <p>

                                    <strong>Comment</strong>

                                        <span class="">
                                        이름
                                            <input id="comment_name" class="inputTypeText" type="text" value="" name="userName">
                                        </span>
                                    비밀번호
                                    <input id="comment_password" type="password" value="" name="password">
                                </p>
                                <p>
                                    <textarea id="comment" name="contents"></textarea>
                                    <button  class="button s romi_btn white" onclick="commentWriteForm.submit();" style="height: 50px;" href="#none">

                                                댓글 달기
                                    </button>

                                </p>

                            </fieldset>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
