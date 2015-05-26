

var count =0;

function idCheck(){

    var text = $("#member_id").val();

    var regexp = /[0-9a-zA-Z]/; // 숫자,영문,특수문자
    // var regexp = /[0-9]/; // 숫자만
//         var regexp = /[a-zA-Z]/; // 영문만
    if(text.length < 4 || text.length >12){
        alert("ID 를 4 ~ 12 자로 해주세요");
        return ;
    }

    for(var i=0; i<text.length; i++){
        if(text.charAt(i) != " " && regexp.test(text.charAt(i)) == false ){
            alert("한글이나 특수문자는 입력불가능 합니다.");
            return false;
        }
    }

    overlapCheck();

}

function overlapCheck(){

    var param = "member_id" + "=" + $("#member_id").val();
    if($("#member_id").val() === '' || $("#member_id").val()===null)
    {
        alert("아이디를 입력하세요");
        return false;
    }


    $.ajax({
        url : "/reg/overlaptest.do",
        type : "GET",
        data : param,
        cache : false,
        async : false,
        dataType : "text",

        success : function(response) {
            if(response=='0')
            {
                count = 1;
                alert("아이디가 중복이 되지 않습니다. 쓰셔도 됩니다.")

            }
            else
            {
                alert("아이디가 중복이 됩니다. 다시 입력 해주세요");
                return false;
            }
        },
        error : function(request, status, error) {
            if (request.status != '0') {
                alert("code : " + request.status + "\r\nmessage : "
                + request.reponseText + "\r\nerror : " + error);
            }
        }


    });
}


function checkemailaddy(){
        if (joinForm.email_select.value === '1')
        {
            joinForm.email2.readOnly = false;
            joinForm.email2.value = '';
            joinForm.email2.focus();
        }
        else {
            joinForm.email2.readOnly = true;
            joinForm.email2.value = joinForm.email_select.value;
        }
    }


function onlyNumber(event) {
    var key = window.event ? event.keyCode : event.which;    

    if ((event.shiftKey == false) && ((key  > 47 && key  < 58) || (key  > 95 && key  < 106)
    || key  == 35 || key  == 36 || key  == 37 || key  == 39  
    || key  == 8  || key  == 9 || key  == 46 )) {
        return true;
    }else {
        return false;
        
    }    
};


function memberChk()
 {
  var check = document.getElementById('join') ;

 if (check.member_id.value === "") {
   alert("아이디를 입력하세요");
   check.member_id.focus();
   return false;
  }

 else if (check.member_password.value === "") {
   alert("비밀번호를 입력하세요");
   check.member_password.focus();
   return false;
  }

 else if (check.member_password_check.value === "") {
   alert("비밀번호를 다시한번 입력해주세요");
   check.member_password_check.focus();
   return false;
  }

 else if (check.member_password.value !== check.member_password_check.value) {
   alert("비밀번호가 다릅니다.");
   check.member_password.value = "";
   check.member_password_check.value = "";
   check.member_password.focus();
   return false;
  }


 else if (check.userName.value === "") {
   alert("이름을 입력해 주세요" + count);
   check.member_name.focus();
   return false;
  }
else if (check.postcode1.value === "" || check.postcode2.value === "" || check.addr1.value === "" || check.addr2.value === ""){
   alert("주소를 입력해 주세요");
   check.addr2.focus();
   return  false;
  }     
     
else if (check.mobile2.value === "" || check.mobile3.value === "") {
   alert("핸드폰 번호를 입력해 주세요");
    if(check.mobile2.value ===""){
        check.mobile2.focus();
    }else{
        check.mobile3.focus();
    }
   return false;
  }
else if (check.email1.value === "" || check.email2.value === "") {
    alert("e-mail을 입력해 주세요");
    check.email1.focus();
    return false;
}
else if(count ===0){
    alert("중북 체크를 해주세요");
    check.member_id.focus();
    return false;

}

     else{
         return true;
}
     check.action = "/reg";
     check.target = "form";
     check.method="post";
     check.submit();

 }


function openDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
            // 우편번호와 주소 정보를 해당 필드에 넣고, 커서를 상세주소 필드로 이동한다.
            document.getElementById('postcode1').value = data.postcode1;
            document.getElementById('postcode2').value = data.postcode2;
            document.getElementById('addr1').value = data.address;

            //전체 주소에서 연결 번지 및 ()로 묶여 있는 부가정보를 제거하고자 할 경우,
            //아래와 같은 정규식을 사용해도 된다. 정규식은 개발자의 목적에 맞게 수정해서 사용 가능하다.
            var addr = data.address.replace(/(\s|^)\(.+\)$|\S+~\S+/g, '');
            document.getElementById('addr1').value = addr;

            document.getElementById('addr2').focus();
        }
    }).open();
}