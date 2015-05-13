<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html>
<head>
    <link href="/css/test.css" rel="stylesheet" media="screen">
    <link href="/css/footer.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" media="screen"
          href="/css/style.css"/>
    <link href="/css/write.css" rel="stylesheet" media="screen" />
    <link href="/css/editor.css" rel="stylesheet" />
    <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
    <script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
    <script src="/js/ckeditor/ckeditor.js"></script>
</head>
<body>
<script>
    // ckeditor setting
    var ckeditor_config = {
        resize_enabled : false, // 에디터 크기를 조절하지 않음
        enterMode : CKEDITOR.ENTER_BR , // 엔터키를 <br> 로 적용함.
        shiftEnterMode : CKEDITOR.ENTER_P ,  // 쉬프트 +  엔터를 <p> 로 적용함.
        toolbarCanCollapse : true ,
        removePlugins : "elementspath", // DOM 출력하지 않음
        filebrowserUploadUrl: '/file_upload', // 파일 업로드를 처리 할 경로 설정.

        // 에디터에 사용할 기능들 정의
        toolbar : [
            [ 'Source', '-' , 'NewPage', 'Preview' ],
            [ 'Cut', 'Copy', 'Paste', 'PasteText', '-', 'Undo', 'Redo' ],
            [ 'Bold', 'Italic', 'Underline', 'Strike', 'Subscript', 'Superscript'],
            [ 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock' ],
            '/',
            [ 'Styles', 'Format', 'Font', 'FontSize' ],
            [ 'TextColor', 'BGColor' ],
            [ 'Image', 'Flash', 'Table' , 'SpecialChar' , 'Link', 'Unlink']

        ]

    };
    var editor = null;

    jQuery(function() {
        // ckeditor 적용
        editor = CKEDITOR.replace( "content" , ckeditor_config );
    });

    // 전송을 위한 체크 함수
    function form_save(form) {
        editor.updateElement();
        var is = true;
        //filter([
        /*  { target : '#subject' , filter : 'empty' , title : '제목' },
         { target : '#content' , filter : 'empty' , title : '내용' } ,
         { target : '#name' , filter : 'empty' , title : '작성자' },
         { target : '#password' , filter : 'empty', title :'비밀번호'} */
        // ]);

        if (is == true) {
            jQuery.ajax({
                type : 'POST' ,
                url : './write_ok' ,
                data : jQuery('#form :input').serialize()
            }).done(function(data) {
                var message = jQuery(data).find("message").text();
                var error = jQuery(data).find("error").text();
                alert(message);
                if (error == 'false') location.href = './';
            });
        }
    }

    // 입력 항목의 체크 함수
    function filter(options) {
        var is = true;

        jQuery(options).each(function() {
            var item = this;

            switch (item.filter) {
                case 'empty' :
                    var val = jQuery(item.target).val();
                    if (val == '') {
                        alert(item.title + '을(를) 입력하세요.');
                        jQuery(item.target).focus();
                        is = false;
                    }
                    break;

                case 'number' :
                    var val = jQuery(item.target).val();
                    var num_regx = /[^0-9]/;
                    if (num_regx.test(val)) {
                        alert(item.title + '을(를) 숫자만 입력하세요.');
                        jQuery(item.target).focus();
                        is = false;
                    }
                    break;

            }
        });
        return is;
    }

</script>


<jsp:include page="../jsp/header.jsp" flush="false"></jsp:include>

<div id="container">

    <div id="contents">
        <div
                class="element- board board-readpackage-4 board-readpackage board-4 ">
            <div class="element- board board-title-4 board-title board-4 ">
                <div class="titleArea">
                    <h2>${cate} Write</h2>
                    <p>게시판</p>
                </div>
            </div>

            <div class="element- board board-read-4 board-read board-4">
                <div class="boardView">
                    <form id = "form" method = "post" action="./write_ok">
                        <table border="1" summary="">
                            <tbody>
                            <tr>
                                <th scope="row">subject</th>
                                <td><input id="subject" name="subject" value="${bbs.subject}"></td>
                            </tr>
                            <tr>
                                <th scope="row">name</th>
                                <td><span class="kor"> </span><input id="name" name="name" value="${bbs.name}"/></td>
                            </tr>
                            <tr>
                                <th scope="row">password</th>
                                <td><input id="password" name="password" type = "password" value="${bbs.password}" /></td>
                            </tr>
                            <tr class="category displaynone" >
                                ,						<td><input id="category" name="category" value="${cate}"/>
                            </tr>


                            <tr>

                                <td colspan="2">
                                    <textarea id="content"  name="content" rows="10" cols ="20">${bbs.content}</textarea>
                                </td>
                            </tr>

                            <tr>
                                <td>

                            </tr>

                            </tbody>




                        </table>
                        <input type="submit"/>
                        <div class="btnArea ">
						<span class="left"> <a href="/${cate}?page=1"> <span
                                class="button s romi_btn white">목록</span>
                        </a>
					<a class="" href=""> <span class="button s romi_btn gray"><button id="save" type="button" onclick="form_save('#form');">작성</button></span>

                    </a>
						</span>

                        </div>

                    </form>

                </div>

            </div>
        </div>

    </div>
    <jsp:include page="../jsp/footer.jsp" flush="false"></jsp:include>
</div>
<!--container-->
<!-- 에디터 끝 -->

</body>
</html>