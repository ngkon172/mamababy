<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <meta charset="utf-8">
  <link href="/css/buttons.css" rel="stylesheet" />
  <link href="/css/reg.css" rel="stylesheet" media="screen" />

  <script
          src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"></script>
  <script src="http://dmaps.daum.net/map_js_init/postcode.js"></script>
  <script src="js/reg.js" type="text/javascript"></script>
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>





</head>
<body>
<div id="container">
  <div id="contents">
    <div class="detail_page">
      <div class="titleArea">
        <h2>join us</h2>
        <p>회원가입</p>
      </div>
      <form id="join" name="joinForm" method="post" action="/admin/userList/del">
        <div class="member-join">
          <h3>기본정보</h3>
          <div class="boardWrite">
            <table border="" summary="">
              <caption>회원 기본정보</caption>
              <tbody>
              <tr>
                <th scope="row">아이디</th>
                <td>



                  <input id="member_id" class="inputTypeText"
                         type="text" value="${user.user}" name="user" onkeydown="countCheck();" onkeypress="countCheck();"/>

                  <button type="button" value="중복확인" onclick="idCheck();"/>

                  (영문소문자/숫자, 4~16자)

                </td>


              </tr>



              <tr>
                <th id="nameTitle" scope="row">이름</th>
                <td><span id="nameContents">
                  <input id="name"  type="text" maxlength="20" name="userName" value="${user.userName}">

              </tr>
              <tr>
                <th scope="row">주소</th>
                <td><input id="postcode1" class="inputTypeText"
                           type="text" value="${user.postcode1}" readonly="readonly" name="postcode1">
                  - <input id="postcode2" class="inputTypeText" type="text"
                           value="${user.postcode2}" readonly="readonly" name="postcode2"> <a
                          id="postBtn" onclick="openDaumPostcode()"
                          class="zipcode_check button button-border button-rounded"
                          href="#none"> 우편번호 </a> <br> <input id="addr1"
                                                              class="inputTypeText" type="text" value="${user.addr1}"
                                                              readonly="readonly" name="addr1"> 기본주소 <br>
                  <input id="addr2" class="inputTypeText" type="text" value="${user.addr2}"
                         name="addr2"> 나머지주소</td>
              </tr>
              <tr>
                <th scope="row">휴대전화</th>
                <td><select id="mobile1" name="mobile1">
                  <option value="010">010</option>
                  <option value="011">011</option>
                  <option value="016">016</option>
                  <option value="017">017</option>
                  <option value="018">018</option>
                  <option value="019">019</option>
                </select> - <input id="mobile2" type="text" value="${user.mobile2}" maxlength="4"
                                   name="mobile2" onkeydown="return onlyNumber(event)">
                  - <input id="mobile3" type="text" value="${user.mobile3}" maxlength="4"
                           name="mobile3" onkeydown="return onlyNumber(event)">
                </td>
              </tr>

              <tr>
                <th scope="row">이메일</th>
                <td><input name="email1" type="text" value="${user.email1}"> @ <input
                        name="email2" type="text" readonly="readonly" value="${user.email2}"> <select
                        name="email_select" id="email_select"
                        onChange="checkemailaddy();">
                  <option selected="selected" value="">- 이메일
                    선택 -</option>
                  <option value="naver.com">naver.com</option>
                  <option value="daum.net">daum.net</option>
                  <option value="nate.com">nate.com</option>
                  <option value="hotmail.com">hotmail.com</option>
                  <option value="yahoo.com">yahoo.com</option>
                  <option value="empas.com">empas.com</option>
                  <option value="korea.com">korea.com</option>
                  <option value="dreamwiz.com">dreamwiz.com</option>
                  <option value="gmail.com">gmail.com</option>
                  <option value="1">직접입력</option>
                </select></td>
              </tr>

              <tr class="">
                <th scope="row">이메일 수신여부</th>
                <td><input id="is_news_mail0" type="radio"
                           checked="checked" value="T" name="is_news_mail"> <label
                        for="is_news_mail0">수신함</label> <input
                        id="is_news_mail1" type="radio" value="F" name="is_news_mail">
                  <label for="is_news_mail1">수신안함</label>
                  <p>쇼핑몰에서 제공하는 유익한 이벤트
                    소식을 이메일로 받으실 수 있습니다.</p></td>
              </tr>
              <tr>
                <th scope="row">적립금</th>
                <td><span>${user.point} point </span></td>
              </tr>
              </tbody>
            </table>
          </div>
          <h3 class="">추가정보</h3>
          <div class="boardWrite">
            <table border="1" summary="">
              <caption>회원 추가정보</caption>
              <tbody>
              <tr class="">
                <th scope="row">생년월일</th>
                <td><input id="birth_year" class="inputTypeText"
                           type="text" value="${user.birth_year}" maxlength="4" name="birth_year">
                  년 <input id="birth_month" class="inputTypeText" type="text"
                           value="${user.birth_month}" maxlength="2" name="birth_month"> 월 <input
                          id="birth_day" class="inputTypeText" type="text" value="${user.birth_day}"
                          maxlength="2" name="birth_day"> 일 <span
                          class="birth "> <input id="is_solar_calendar0"
                                                 type="radio" checked="checked" value="T"
                                                 name="is_solar_calendar"> <label
                          for="is_solar_calendar0">양력</label> <input
                          id="is_solar_calendar1" type="radio" value="F"
                          name="is_solar_calendar"> <label
                          for="is_solar_calendar1">음력</label>
										</span></td>
              </tr>
              <tr class="">
                <th scope="row">자녀생일</th>
                <td><input id="partner_year" class="inputTypeText"
                           type="text" value="${user.partner_year}" maxlength="4" name="partner_year">
                  년 <input id="partner_month" class="inputTypeText"
                           type="text" value="${user.partner_month}" maxlength="2" name="partner_month">
                  월 <input id="partner_day" class="inputTypeText" type="text"
                           value="${user.partner_day}" maxlength="2" name="partner_day"> 일</td>
              </tr>
              <tr class="">
                <th scope="row">자녀생일2</th>
                <td><input id="partner_year" class="inputTypeText"
                           type="text" value="${user.partner_year1}" maxlength="4" name="partner_year1">
                  년 <input id="partner_month" class="inputTypeText"
                           type="text" value="${user.partner_month1}" maxlength="2" name="partner_month1">
                  월 <input id="partner_day" class="inputTypeText" type="text"
                           value="${user.partner_day1}" maxlength="2" name="partner_day1"> 일</td>
              </tr>
              </tbody>
            </table>
          </div>

          <div class="btnArea center">



            <input type="submit"
               class="joinus button button-border-highlight button-pill"
               style="text-decoration: none;"> 삭제  </a>
            <a
                  href="/admin/userList"
                  class="cancel button button-border-caution button-pill"
                  style="text-decoration: none;"> 목록  </a>
          </div>
        </div>
      </form>
    </div>
    <!--page-->
  </div>
  <!--contents-->

</div>

<script type="text/javascript">

</script>
</body>
</html>