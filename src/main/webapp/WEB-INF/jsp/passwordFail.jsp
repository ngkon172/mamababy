<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html>
<head>
  <meta charset="utf-8">

  <link href="css/reg.css" rel="stylesheet" media="screen" />
  <link rel="stylesheet" href="css/buttons.css" />
  <link rel="stylesheet" type="text/css"
        href="fonts/foundation-icons/foundation-icons.css">
  <script
          src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"></script>
</head>
<body>
<div id="container">
  <div id="contents">
    <div class="detail_page">
      <div class="titleArea">
        <h2>log in</h2>
        <p>로그인</p>
      </div>
      <form id="form" enctype="" method="post" action="/loginValid" name="">
        <div class="element- member member-login ">
          <div class="login_form">
            <h3>
              <a id="joinus_button" class=" button button-border">LOG IN</a>
            </h3>
            <div class="login">
              <fieldset>
                <p class="login_input">
                  <label class="id"> <span> <i
                          class="fi-torso size-36"></i>
										</span> <input id="member_id" class="inputTypeText" type="text"
                                                       value="" name="id">
                  </label> <label class="password"> <span> <i
                        class="step fi-lock size-36"></i>
										</span> <input id="member_passwd" type="password" value=""
                                                       name="password">
                </label>
                </p>
                <a onclick="document.getElementById('form').submit(); return false;" href="#" id="login_button"
                   class=" button button-border-highlight button-pill">로그인</a>
              </fieldset>
            </div>
            <div class="find">
              <!-- <span> <a href="" class="button button-border-caution"><i
                      class="fi-wrench"></i> 아이디 찾기 </a>
              </span> <span> <a href="" class="button button-border-caution">
                      <i class="fi-wrench"></i> 비밀번호 찾기
              </a>
              </span> -->
              <p>Password 를 잘못 입력 하셨습니다 </p>

            </div>
          </div>
          <div class="join_form">
            <h3>
              <a id="joinus_button" class=" button button-border">JOIN US</a>
            </h3>
            <div class="join">
              <p class="plz_joinus">
                아직 회원이 아니십니까? <br>
                <br> 회원을 위한 다양한 혜택이 <br>
                <br> 준비되어 있습니다.
              </p>
              <p class="joinus">
                <a href="reg.html" id="joinus_button"
                   class=" button button-border-caution button-pill">회원가입</a>
              </p>
            </div>
          </div>
        </div>
      </form>
    </div>
  </div>
</div>
<script>

  /**
   * 움직이는 배너 Jquery Plug-in
   * @author  cafe24
   */

  ;(function($){

    $.fn.floatBanner = function(options) {
      options = $.extend({}, $.fn.floatBanner.defaults , options);

      return this.each(function() {
        var aPosition = $(this).position();
        var node = this;

        $(window).scroll(function() {
          var _top = $(document).scrollTop();
          _top = (aPosition.top < _top) ? _top : aPosition.top;

          setTimeout(function () {
            $(node).stop().animate({top: _top}, options.animate);
          }, options.delay);
        });
      });
    };

    $.fn.floatBanner.defaults = {
      'animate'  : 200,
      'delay'    : 10
    };

  })(jQuery);

  /**
   * 문서 구동후 시작
   */
  $(document).ready(function(){
    $('#banner, #quick').floatBanner();
  });

</script>
</body>
</html>