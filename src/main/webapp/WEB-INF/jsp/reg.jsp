<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="utf-8">
    <link href="css/buttons.css" rel="stylesheet" />
    <link href="css/reg.css" rel="stylesheet" media="screen" />

    <script
            src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"></script>
    <script src="http://dmaps.daum.net/map_js_init/postcode.js"></script>
    <script src="js/reg.js" type="text/javascript"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>

    <script type="text/javascript">



        function formCheck() {
            var member_id = document.getElementById('member_id');
            var password = document.getElementById('password');
            var password_hint = document.getElementById('password_hint');
            var password_check = document.getElementById('password_check');
            var hp1 = document.getElementById('hp1');
            var hp2 = document.getElementById('hp2');
            var hp3 = document.getElementById('hp3');
            var hp = hp1.value + "-" + hp2.value + "-" + hp3.value;

            /*핸드폰 번호 길이 체크*/


            if (member_id.value == '' || member_id.value == null) {
                alert('ID를 입력하세요');
                focus.member_id;
                return false;
            }

            if (password.value == '' || password.value == null) {
                alert('비밀번호를 입력하세요');
                focus.password;
                return false;
            }

            if (password_check.value == '' || password_check.value == null) {
                alert('비밀번호확인란을 입력하세요');
                focus.password_hint;
                return false;
            }

            /*비밀번호와 비밀번호확인란 같은지 확인*/
            if (password.value != password_check.value){
                alert("비밀번호와 비밀번호 확인란이 다릅니다.");
                focus.passowrd;
                return false;
            }

            if (password_hint.value == '' || password_hint.value == null) {
                alert('비밀번호힌트를 입력하세요');
                focus.password_hint;
                return false;
            }

            /*핸드폰 번호 길이 체크*/
            if(hp2.value.length<=2 || hp3.value.length!=4){
                alert("휴대폰번호를 제대로 입력해주세요");
                focus.hp2;
                return false;
            }
            /*핸드폰이 숫자만 들어가는지 체크*/
            if(isNaN(hp2.value) || isNaN(hp3.value))
            {
                alert("휴대폰번호는 숫자만 들어갈 수 있습니다.");
                return false;
            }
            /**/
            if (hp2.value.length > 2 || hp3.value.length==4){
                document.getElementById("member_HP").value = hp;
            }

            if(count == 0)
            {
                alert("중복확인을 눌러주세요");
                return false;
            }

            else{
                save();
            }

        }


        function init(){
            count=0;
        }

        function save() {
// 		alert($("#password_hint").val());
// 		alert($("#member_HP").val());
            var str3 = document.getElementById('join');
            str3.submit();
            alert("가입이 완료되었습니다.")
        }

        function countCheck(){
            if(count==1){
                count=0;
            }
        }
    </script>

</head>
<body>
<div id="container">
    <div id="contents">
        <div class="detail_page">
            <div class="titleArea">
                <h2>join us</h2>
                <p>회원가입</p>
            </div>
            <form id="join" name="joinForm" method="post">
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
                                           type="text" value="" name="user" onkeydown="countCheck();" onkeypress="countCheck();"/>

                                    <button type="button" value="중복확인" onclick="idCheck();"/>

                                    (영문소문자/숫자, 4~16자)

                                </td>


                            </tr>
                            <tr>
                                <th scope="row">비밀번호</th>
                                <td><input id="passwd" type="password" value=""
                                           maxlength="16" name="member_password"> 4~16자로
                                    입력해 주세요.</td>
                            </tr>
                            <tr>
                                <th scope="row">비밀번호 확인</th>
                                <td><input id="user_passwd_confirm" type="password"
                                           value="" maxlength="16" name="member_password_check">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">비밀번호 확인 질문</th>
                                <td><select id="hint" name="hint">
                                    <option value="hint_01">기억에 남는 추억의
                                        장소는?</option>
                                    <option value="hint_02">자신의 인생
                                        좌우명은?</option>
                                    <option value="hint_03">자신의 보물
                                        제1호는?</option>
                                    <option value="hint_04">가장 기억에 남는
                                        선생님 성함은?</option>
                                    <option value="hint_05">타인이 모르는
                                        자신만의 신체비밀이 있다면?</option>
                                    <option value="hint_06">추억하고 싶은
                                        날짜가 있다면?</option>
                                    <option value="hint_07">받았던 선물 중
                                        기억에 남는 독특한 선물은?</option>
                                    <option value="hint_08">유년시절 가장
                                        생각나는 친구 이름은?</option>
                                    <option value="hint_09">인상 깊게 읽은 책
                                        이름은?</option>
                                    <option value="hint_10">읽은 책 중에서
                                        좋아하는 구절이 있다면?</option>
                                    <option value="hint_11">자신이 두번째로
                                        존경하는 인물은?</option>
                                    <option value="hint_12">친구들에게
                                        공개하지 않은 어릴 적 별명이 있다면?</option>
                                    <option value="hint_13">초등학교 때 기억에
                                        남는 짝꿍 이름은?</option>
                                    <option value="hint_14">다시 태어나면 되고
                                        싶은 것은?</option>
                                    <option value="hint_15">내가 좋아하는
                                        캐릭터는?</option>
                                </select></td>
                            </tr>
                            <tr>
                                <th scope="row">비밀번호 확인 답변</th>
                                <td><input id="hint_answer" class="inputTypeText"
                                           type="text" value="" name="pass_hint_answer"></td>
                            </tr>
                            <tr>
                                <th id="nameTitle" scope="row">이름</th>
                                <td><span id="nameContents"> <input id="name"
                                                                    type="text" maxlength="20" name="member_name">
										</span> <span id="under14Msg" class="displaynone">14세 미만
												사용자는 법정대리인 동의가 필요합니다.</span></td>
                            </tr>
                            <tr>
                                <th scope="row">주소</th>
                                <td><input id="postcode1" class="inputTypeText"
                                           type="text" value="" readonly="readonly" name="postcode1">
                                    - <input id="postcode2" class="inputTypeText" type="text"
                                             value="" readonly="readonly" name="postcode2"> <a
                                            id="postBtn" onclick="openDaumPostcode()"
                                            class="zipcode_check button button-border button-rounded"
                                            href="#none"> 우편번호 </a> <br> <input id="addr1"
                                                                                class="inputTypeText" type="text" value=""
                                                                                readonly="readonly" name="addr1"> 기본주소 <br>
                                    <input id="addr2" class="inputTypeText" type="text" value=""
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
                                </select> - <input id="mobile2" type="text" value="" maxlength="4"
                                                   name="mobile2" onkeydown="return onlyNumber(event)">
                                    - <input id="mobile3" type="text" value="" maxlength="4"
                                             name="mobile3" onkeydown="return onlyNumber(event)">
                                </td>
                            </tr>

                            <tr>
                                <th scope="row">이메일</th>
                                <td><input name="email1" type="text"> @ <input
                                        name="email2" type="text" readonly="readonly"> <select
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
                                           type="text" value="" maxlength="4" name="birth_year">
                                    년 <input id="birth_month" class="inputTypeText" type="text"
                                             value="" maxlength="2" name="birth_month"> 월 <input
                                            id="birth_day" class="inputTypeText" type="text" value=""
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
                                           type="text" value="" maxlength="4" name="partner_year">
                                    년 <input id="partner_month" class="inputTypeText"
                                             type="text" value="" maxlength="2" name="partner_month">
                                    월 <input id="partner_day" class="inputTypeText" type="text"
                                             value="" maxlength="2" name="partner_day"> 일</td>
                            </tr>
                            <tr class="">
                                <th scope="row">자녀생일2</th>
                                <td><input id="partner_year" class="inputTypeText"
                                           type="text" value="" maxlength="4" name="partner_year1">
                                    년 <input id="partner_month" class="inputTypeText"
                                             type="text" value="" maxlength="2" name="partner_month1">
                                    월 <input id="partner_day" class="inputTypeText" type="text"
                                             value="" maxlength="2" name="partner_day1"> 일</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <h3>이용약관 동의</h3>
                    <div class="agreeArea">
                        <div class="agree">
                            <p>조항 test</p>
                        </div>
                        <p class="check">
                            <span>이용약관에 동의하십니까?</span> <input
                                id="agree_service_check0" type="checkbox" value="1"
                                name="agree_service_check[]"> <label
                                for="agree_service_check0">동의함</label>
                        </p>
                    </div>
                    <div class="btnArea center">



                        <a onClick="memberChk(); joinform.submit();" href="#none"
                           class="joinus button button-border-highlight button-pill"
                           style="text-decoration: none;"> 회원가입 </a> <a
                            href="/index.html"
                            class="cancel button button-border-caution button-pill"
                            style="text-decoration: none;"> 취소 </a>
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