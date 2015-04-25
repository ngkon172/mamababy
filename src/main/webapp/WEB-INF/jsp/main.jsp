<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>마마베이비</title>
    <link href="css/test.css" rel="stylesheet" media="screen">
    <link href="css/footer.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" media="screen"
          href="css/style.css" />
    <link href="css/slideshow.css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css"
          href="fonts/foundation-icons/foundation-icons.css">
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

            // NOT required:가나다
            // for this demo disable all links that point to "#"
            $('a[href="#"]').click(function(event){
                event.preventDefault();
            });

        });
    </script>
</head>
<body>
<!-- <div id="header_st2">
    <div id="header_st2_bottom">
        <div class="xans-element- xans-layout xans-layout-logotop ">
            <a class="logo_on" href="main.html">                <img alt="로고" src="http://www.pink-tiara.co.kr/web/upload/romi/top_st2/top_logo.png">
                <h1 id="main_logo">Mama Baby</h1>
            </a>
        </div>
    </div>
</div> -->
<jsp:include page="../jsp/header.jsp"></jsp:include>

<div class="container">
    <div id="content-slider">
        <div id="slider">
            <div id="mask">
                <ul>
                    <li id="first" class="firstanimation"><a href="#"> <img width="680" height="320"
                                                                            src="/resources/files/attach/3.jpg" alt="Cougar"  />
                    </a>
                        <div class="tooltip">
                            <h1>Test1</h1>
                        </div></li>

                    <li id="second" class="secondanimation"><a href="#"> <img width="680" height="320"
                                                                              src="/resources/files/attach/1.jpg" alt="Lions" />
                    </a>
                        <div class="tooltip">
                            <h1>Test2</h1>
                        </div></li>

                    <li id="third" class="thirdanimation"><a href="#"> <img width="680" height="320"
                                                                            src="/resources/files/attach/2.jpg" alt="Snowalker" />
                    </a>
                        <div class="tooltip">
                            <h1>Test3</h1>
                        </div></li>

                    <li id="fourth" class="fourthanimation"><a href="#"> <img width="680" height="320"
                                                                              src="/resources/files/attach/2.jpg" alt="Howling" />
                    </a>
                        <div class="tooltip">
                            <h1>Test4</h1>
                        </div></li>

                    <li id="fifth" class="fifthanimation"><a href="#"> <img width="680" height="320"
                                                                            src="http://placehold.it/680x320" alt="Sunbathing" />
                    </a>
                        <div class="tooltip">
                            <h1>Test5</h1>
                        </div></li>
                </ul>
            </div>
            <div class="progress-bar"></div>
        </div>
    </div>
</div>
<!--footer-->
<div id="footer">
    <div class="footer_wrapper">
        <div class="footer-top">
            <a href="">ABOUT</a> <a href="">TERMS OF USE</a> <a href="">PRIVACY
            POLICY</a> <a href="">SHOPPING GUIDE</a> <a target="_blank"
                                                        href="https://www.doortodoor.co.kr/main/index.jsp">TRACKING</a> <a
                href="">ORDER</a>
        </div>
        <div class="clearfix"></div>
        <div class="footer-bottom">
            Nam-dong, Cheoin-gu, <br> Yongin-si, Gyeonggi-do, Korea <br>
            010 - 8822 - 6716 <br> <span
                style="color: #878787; font-size: 10px;">OFFICE HOUR : MON —
					FRI / AM 10:00 — PM 06:00</span> <br> Site by <span
                style="font-size: 12px; font-weight: bold;"><a
                target="_blank" href="">Two Soo</a></span>
        </div>
        <div class="clearfix"></div>
        <p class="footer-contact"></p>
        <div class="clearfix"></div>
    </div>
</div>

</body>
</html>
