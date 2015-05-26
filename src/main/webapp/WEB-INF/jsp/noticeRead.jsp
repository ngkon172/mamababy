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
                  <td><span class="kor">${notice.subject}</span> </td>
                </tr>
                <tr>
                  <th scope="row">Name</th>
                  <td>
                    <span class="kor"></span>
                    <span class="admin_writer">MaMa Baby</span>
                  </td>
                </tr>
                <tr>
                  <th scope="row">Date</th>
                  <td>
                    <span class="kor"></span>
                    <span class="admin_writer">${notice.regDate}</span>
                  </td>
                </tr>
                <tr class="view">
                  <td colspan="2">
                    <div class="detail">
                      <p>${notice.content}</p>
                    </div>
                  </td>
                </tr>
                </tbody>
              </table>
            </div>
            <div class="btnArea">
                                <span class="left">
                                    <a href="/bbs/${notice.category}?page=1">
                                      <span class="button s romi_btn white">목록</span>
                                    </a>
                                </span>
            </div>
          </div>
        </form>
      </div>


    </div>
  </div>
</div>
</body>
</html>
