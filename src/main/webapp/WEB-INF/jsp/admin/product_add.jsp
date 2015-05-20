<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type">
    <meta charset="utf-8"/>
<title>::::: 쇼핑몰 관리자 :::::</title>
<link href="/css/style.css" rel="stylesheet" type="text/css">
	<link href="css/bootstrap.min.css" rel="stylesheet">
	
    <link href="/css/editor.css" rel="stylesheet"/>
    <script src="/js/editor_loader.js" type="text/javascript" charset="utf-8"></script>
    <script src="http://google-code-prettify.googlecode.com/svn/trunk/src/prettify.js"></script>
      <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
    <script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
    <script src="/resources/ckeditor/ckeditor.js" type="text/javascript"></script>
	
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
//-->
</script>
<script type="text/javascript">
		// ckeditor setting
    var ckeditor_config = {
         resize_enabled : false, // 에디터 크기를 조절하지 않음
         enterMode : CKEDITOR.ENTER_BR , // 엔터키를 <br> 로 적용함.
         shiftEnterMode : CKEDITOR.ENTER_P ,  // 쉬프트 +  엔터를 <p> 로 적용함.
         toolbarCanCollapse : true , 
         removePlugins : "elementspath", // DOM 출력하지 않음
         filebrowserUploadUrl: '/admin/file_upload', // 파일 업로드를 처리 할 경로 설정.

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
</head>

<body>
<nav class="navbar navbar-inverse navbar-fixed-top">
		
			<div class="container-fluid">
				<div class="navbar-header">
					<a class="navbar-brand" href="#">Mama Baby</a> 
				</div>
				<div id="navbar" class="navbar-collapse collapse">
					<ul class="nav navbar-nav navbar-right">
						<li>
							<a href="#">Main</a>
						</li>
						<li>
							<a href="#">상품목록</a>
						</li>
						<li>
							<a href="#">회원목록</a>
						</li>
						<li>
							<a href="#">주문목록</a>
						</li>
						<li>
							<a href="#">게시판관리</a>
						</li>
					</ul>
				</div>
			</div>
		</nav>
<script language="JavaScript" type="text/javascript">

  var loding = false;
  var prd_class = new Array();

  prd_class[0] = new Array();
  prd_class[0][0] = "10";
  prd_class[0][1] = "제화 명품 브랜드";
  prd_class[0][2] = "0";
  prd_class[0][3] = "1";


  prd_class[1] = new Array();
  prd_class[1][0] = "1010";
  prd_class[1][1] = "하위분류 1";
  prd_class[1][2] = "10";
  prd_class[1][3] = "2";


  prd_class[2] = new Array();
  prd_class[2][0] = "101010";
  prd_class[2][1] = "하위분류 11";
  prd_class[2][2] = "1010";
  prd_class[2][3] = "3";


  prd_class[3] = new Array();
  prd_class[3][0] = "1011";
  prd_class[3][1] = "하위분류 2";
  prd_class[3][2] = "10";
  prd_class[3][3] = "2";


  prd_class[4] = new Array();
  prd_class[4][0] = "1012";
  prd_class[4][1] = "하위분류 3";
  prd_class[4][2] = "10";
  prd_class[4][3] = "2";


  prd_class[5] = new Array();
  prd_class[5][0] = "11";
  prd_class[5][1] = "스니커즈/캐주얼브랜드";
  prd_class[5][2] = "0";
  prd_class[5][3] = "1";


  prd_class[6] = new Array();
  prd_class[6][0] = "1110";
  prd_class[6][1] = "하위분류 1";
  prd_class[6][2] = "11";
  prd_class[6][3] = "2";


  prd_class[7] = new Array();
  prd_class[7][0] = "111010";
  prd_class[7][1] = "하위분류 11";
  prd_class[7][2] = "1110";
  prd_class[7][3] = "3";


  prd_class[8] = new Array();
  prd_class[8][0] = "111011";
  prd_class[8][1] = "하위분류 12";
  prd_class[8][2] = "1110";
  prd_class[8][3] = "3";


  prd_class[9] = new Array();
  prd_class[9][0] = "111012";
  prd_class[9][1] = "하위분류 13";
  prd_class[9][2] = "1110";
  prd_class[9][3] = "3";


  prd_class[10] = new Array();
  prd_class[10][0] = "1111";
  prd_class[10][1] = "하위분류 2";
  prd_class[10][2] = "11";
  prd_class[10][3] = "2";


  prd_class[11] = new Array();
  prd_class[11][0] = "1112";
  prd_class[11][1] = "하위분류 3";
  prd_class[11][2] = "11";
  prd_class[11][3] = "2";


  prd_class[12] = new Array();
  prd_class[12][0] = "13";
  prd_class[12][1] = "가방 브랜드";
  prd_class[12][2] = "0";
  prd_class[12][3] = "1";


  prd_class[13] = new Array();
  prd_class[13][0] = "14";
  prd_class[13][1] = "의류 브랜드";
  prd_class[13][2] = "0";
  prd_class[13][3] = "1";


  prd_class[14] = new Array();
  prd_class[14][0] = "12";
  prd_class[14][1] = "잡화 브랜드";
  prd_class[14][2] = "0";
  prd_class[14][3] = "1";


  prd_class[15] = new Array();
  prd_class[15][0] = "15";
  prd_class[15][1] = "화장/미용 브랜드";
  prd_class[15][2] = "0";
  prd_class[15][3] = "1";


  prd_class[16] = new Array();
  prd_class[16][0] = "16";
  prd_class[16][1] = "레저 스포츠 브랜드";
  prd_class[16][2] = "0";
  prd_class[16][3] = "1";


  prd_class[17] = new Array();
  prd_class[17][0] = "17";
  prd_class[17][1] = "패션소품 브랜드";
  prd_class[17][2] = "0";
  prd_class[17][3] = "1";


  prd_class[18] = new Array();
  prd_class[18][0] = "18";
  prd_class[18][1] = "패션명품 / 수입 브랜드";
  prd_class[18][2] = "0";
  prd_class[18][3] = "1";


  prd_class[19] = new Array();
  prd_class[19][0] = "19";
  prd_class[19][1] = "명품캐주얼 브랜드";
  prd_class[19][2] = "0";
  prd_class[19][3] = "1";

var tno = 20;

function setClass01(){

  var arrayClass = eval("document.frm.class01");
  var arrayClass1 = eval("document.frm.class02");
  var arrayClass2 = eval("document.frm.class03");

  arrayClass.options[0] = new Option(":: 대분류 ::","");
  arrayClass1.options[0] = new Option(":: 중분류 ::","");
  arrayClass2.options[0] = new Option(":: 소분류 ::","");

  for(no=0,sno=1 ; no < tno ; no++){
	  if(prd_class[no][3]=='1'){
		 arrayClass.options[sno] = new Option(prd_class[no][1],prd_class[no][0]);
		 sno++;
	  }
  }
}

function changeClass01(){

  var arrayClass = eval("document.frm.class01");
  var arrayClass1 = eval("document.frm.class02");
  var arrayClass2 = eval("document.frm.class03");

  var selidx = arrayClass.selectedIndex;
  var selvalue = arrayClass.options[selidx].value;

  arrayClass1.options.length=0;
  arrayClass2.options.length=0;
  arrayClass1.options[0] = new Option(":: 중분류 ::","");
  arrayClass2.options[0] = new Option(":: 소분류 ::","");

  for(no=0,sno=1 ; no < tno ; no++){
	  if(prd_class[no][3]=='2' && prd_class[no][2]==selvalue){
		 arrayClass1.options[sno] = new Option(prd_class[no][1],prd_class[no][0]);
		 sno++;
	  }
  }

}

function changeClass02(){

  var arrayClass1 = eval("document.frm.class02");
  var arrayClass2 = eval("document.frm.class03");

  var selidx = arrayClass1.selectedIndex;
  var selvalue = arrayClass1.options[selidx].value;

  arrayClass2.options.length=0;
  arrayClass2.options[0] = new Option(":: 소분류 ::","");

  for(no=0,sno=1 ; no < tno ; no++){
	  if(prd_class[no][3]=='3' && prd_class[no][2]==selvalue){
		 arrayClass2.options[sno] = new Option(prd_class[no][1],prd_class[no][0]);
		 sno++;
	  }
  }

}

function changeClass03(){
}

// 상품카테고리 설정
function setCategory(){

  var arrayClass01 = eval("document.frm.class01");
  var arrayClass02 = eval("document.frm.class02");
  var arrayClass03 = eval("document.frm.class03");

  for(no=1; no < arrayClass01.length; no++){
    if(arrayClass01.options[no].value == ''){
      arrayClass01.options[no].selected = true;
      changeClass01();
    }
  }

  for(no=1; no < arrayClass02.length; no++){
    if(arrayClass02.options[no].value == ''){
      arrayClass02.options[no].selected = true;
      changeClass02();
    }
  }

  for(no=1; no < arrayClass03.length; no++){
    if(arrayClass03.options[no].value == '')
      arrayClass03.options[no].selected = true;
  }

}

function inputCheck(frm){

   if(loding == false){
   	alert("상품정보를 가져오고 있습니다. 잠시후 재시도 하세요");
   	return false;
   }
	if(frm.prdname.value == ""){
		alert("상품명을 입력하세요");
		frm.prdname.focus();
		return false;
	}
	if(frm.sellprice.value == ""){
		alert("판매가를 입력하세요");
		frm.sellprice.focus();
		return false;
	}
	content.outputBodyHTML();

/*
	var optvalue = "";
	var length = frm.optcode_tmp.length;
	for(ii = 0; ii < length; ii++){ optvalue += frm.optcode_tmp.options[ii].value+"^^"; }
	frm.optcode.value = optvalue;
*/
}

//해당 이미지를 삭제한다.
function deleteImage(prdcode, prdimg, imgpath){
	if(imgpath == ""){
		alert("삭제할 이미지가 없습니다.");
		return;
	}else{
	if(confirm("이미지를 삭제하시겠습니까?"))
		document.location = "prd_save.php?mode=delete_image&prdcode="+prdcode+"&prdimg="+prdimg+"&imgpath="+imgpath;
	}
	return;
}

function appendOption(){

	var frm = document.frm;
	var length = frm.optcode_tmp.length;

	var optcode_01 = frm.optcode_01.value;
	var optcode_02 = frm.optcode_02.value;
	var optcode_03 = frm.optcode_03.value;

	if(optcode_01 == ""){
		alert("옵션을 입력하세요.");
		frm.optcode_01.focus();
		return;
	}
	if(optcode_02 == "") optcode_02 = "0";
	if(optcode_03 == "") optcode_03 = "0";

	if(!Check_Num(optcode_02)){
		alert("가격은 숫자만 가능합니다.");
		frm.optcode_02.focus();
		return;
	}
	if(!Check_Num(optcode_03)){
		alert("재고는 숫자만 가능합니다.");
		frm.optcode_03.focus();
		return;
	}

	var opttxt = optcode_01+" - "+optcode_02+"원 : "+optcode_03+"개";
	var optvalue = optcode_01+"^"+optcode_02+"^"+optcode_03;

	var option1 = new Option(opttxt, optvalue, true);
	frm.optcode_tmp.options[length] = option1;

	frm.optcode_01.value = "";
	frm.optcode_02.value = "";
	frm.optcode_03.value = "";

}

function deleteOption(){

	var frm = document.frm;
	var index = frm.optcode_tmp.selectedIndex;

	if(index >= 0){
		frm.optcode_tmp.options[index] = null;
	}
	frm.optcode_01.value = "";
	frm.optcode_02.value = "";
	frm.optcode_03.value = "";
}

function editOption(){


	var frm = document.frm;
	var length = frm.optcode_tmp.length;
	var idx = document.frm.optcode_tmp.selectedIndex;

	if(idx < 0) return;

	var optcode_01 = frm.optcode_01.value;
	var optcode_02 = frm.optcode_02.value;
	var optcode_03 = frm.optcode_03.value;

	if(optcode_01 == ""){
		alert("옵션을 입력하세요.");
		frm.optcode_01.focus();
		return; 
	}
	if(optcode_02 == "") optcode_02 = "0";
	if(optcode_03 == "") optcode_03 = "0";

	if(!Check_Num(optcode_02)){
		alert("가격은 숫자만 가능합니다.");
		frm.optcode_02.focus();
		return;
	}
	if(!Check_Num(optcode_03)){
		alert("재고는 숫자만 가능합니다.");
		frm.optcode_03.focus();
		return;
	}

	var opttxt = optcode_01+" - "+optcode_02+"원 : "+optcode_03+"개";
	var optvalue = optcode_01+"^"+optcode_02+"^"+optcode_03;

	document.frm.optcode_tmp.options[idx].text = opttxt;
	document.frm.optcode_tmp.options[idx].value = optvalue;

}

function openOption(optno){

	var url = "option_list.php?optno=" + optno;
  window.open(url,"","height=270, width=350, menubar=no, scrollbars=no, resizable=no, toolbar=no, status=no");

}


function chgOption(){

	var tmp_optcode = document.frm.optlist.value.split("^^");
	var tmp_opttext = document.frm.opttext.value.split("^^");
   var length = document.frm.optcode_tmp.length;
	for(ii=0; ii < (tmp_optcode.length-1); ii++){
		var option1 = new Option(tmp_opttext[ii], tmp_optcode[ii], true);
		document.frm.optcode_tmp.options[length] = option1;

		length++;
	}

	return false;
}

function setOption(){
	var idx = document.frm.optcode_tmp.selectedIndex;
	if(idx >= 0){
		var tmp_optcode = document.frm.optcode_tmp.options[idx].value.split("^");
		frm.optcode_01.value = tmp_optcode[0];
		frm.optcode_02.value = tmp_optcode[1];
		frm.optcode_03.value = tmp_optcode[2];
	}

}


function optUp(){

	var frm = document.frm;
	var sel_idx = frm.optcode_tmp.selectedIndex;

	if(sel_idx > 0){

		chg_idx = sel_idx - 1;

		var sel_txt = frm.optcode_tmp.options[sel_idx].text;
		var sel_val = frm.optcode_tmp.options[sel_idx].value;
		var chg_txt = frm.optcode_tmp.options[chg_idx].text;
		var chg_val = frm.optcode_tmp.options[chg_idx].value;


		frm.optcode_tmp.options[chg_idx].text = sel_txt;
		frm.optcode_tmp.options[chg_idx].value = sel_val;
		frm.optcode_tmp.options[sel_idx].text = chg_txt;
		frm.optcode_tmp.options[sel_idx].value = chg_val;

		frm.optcode_tmp.options[chg_idx].selected = true;

	}



}

function optDown(){

	var frm = document.frm;
	var sel_idx = frm.optcode_tmp.selectedIndex;
	var opt_len = document.frm.optcode_tmp.length;

	if(-1 < sel_idx && sel_idx < (opt_len-1)){

		var chg_idx = sel_idx + 1;

		var sel_txt = frm.optcode_tmp.options[sel_idx].text;
		var sel_val = frm.optcode_tmp.options[sel_idx].value;
		var chg_txt = frm.optcode_tmp.options[chg_idx].text;
		var chg_val = frm.optcode_tmp.options[chg_idx].value;


		frm.optcode_tmp.options[chg_idx].text = sel_txt;
		frm.optcode_tmp.options[chg_idx].value = sel_val;
		frm.optcode_tmp.options[sel_idx].text = chg_txt;
		frm.optcode_tmp.options[sel_idx].value = chg_val;

		frm.optcode_tmp.options[chg_idx].selected = true;

	}

}

function prdlayCheck(){
	}

// 상품가격에 따른 적립금 적용 퍼센트에따라 적립금 적용
function setReserve(frm){

   if(frm.reserve != null){
   	var sellprice = frm.sellprice.value;
   	if(!Check_Num(sellprice)){
			alert("판매가는 숫자이어야 합니다.");
			frm.sellprice.value = "";
			frm.sellprice.focus();
		}else{
	      var reserve = "" + sellprice*(10/100)
	      reserve = reserve.split('.');
	      frm.reserve.value = reserve[0];
	   }
   }
}

function lodingComplete(){
	loding = true;
}

function prdCategory(){
  var url = "prd_catlist.php?prdcode=";
  window.open(url, "prdCategory", "height=330, width=600, menubar=no, scrollbars=yes, resizable=yes, toolbar=no, status=no, left=150, top=100");
}

function prdIcon(){
	var url = "prd_icon.php";
	window.open(url, "prdIcon", "height=250, width=450, menubar=no, scrollbars=yes, resizable=no, toolbar=no, status=no, left=150, top=100");
}

function setImgsize(){
	var url = "prd_imgsize.php";
   window.open(url, "setImgsize", "height=220, width=300, menubar=no, scrollbars=yes, resizable=no, toolbar=no, status=no, left=150, top=100");
}


function addopt(optid) {

	var frm = document.frm;
	var tbl = document.getElementById('opt');

	if(optid == 'opt1') {

		var row = tbl.insertRow(-1);

		var idx = tbl.rows.length - 2;

		for (i=0;i<tbl.rows[0].cells.length;i++){
			cell = row.insertCell(-1);
			switch (i){
				case 0: cell.innerHTML = "<input type=\"text\" class=\"input\" size=\"10\" name=\"tmp_optcode[]\" required>";break;
				default:
					cell.innerHTML = "<input type=\"text\" name=\"tmp_opt[sellprice][]\" class=\"input\" size=\"7\">";
					cell.innerHTML += ":<input type=\"text\" name=\"tmp_opt[reserve][]\" class=\"input\" size=\"7\">";
					cell.innerHTML += ":<input type=\"text\" name=\"tmp_opt[stock][]\" class=\"input\" size=\"7\">";
					break;
			}
		}

	} else if(optid == 'opt2') {

		for (i=0;i<tbl.rows.length;i++){

			cell = tbl.rows[i].insertCell(-1);
			switch (i){
				case 0: cell.innerHTML = "<input type=\"text\" class=\"input\" style=\"width:100%\" name=\"tmp_optcode2[]\" required>";break;
				default:
					cell.innerHTML = "<input type=\"text\" name=\"tmp_opt[sellprice][]\" class=\"input\" size=\"7\">";
					cell.innerHTML += ":<input type=\"text\" name=\"tmp_opt[reserve][]\" class=\"input\" size=\"7\">";
					cell.innerHTML += ":<input type=\"text\" name=\"tmp_opt[stock][]\" class=\"input\" size=\"7\">";
					break;
			}
		}

	} else if(optid == 'opt3') {

		var tbl = document.getElementById('opt3');
		var row = tbl.insertRow(-1);

		for (i=0;i<tbl.rows[0].cells.length;i++){
			cell = row.insertCell(0);
			cell.innerHTML = "&nbsp; &nbsp;항목 : <input type=\"text\" class=\"input\" name=\"optcode3_opt[]\">";
			cell.innerHTML += " 추가가격 : <input type=\"text\" size=\"10\" class=\"input\" name=\"optcode3_pri[]\">";
			cell.innerHTML += " 추가적립금 : <input type=\"text\" size=\"10\" class=\"input\" name=\"optcode3_res[]\">";
		}

	} else if(optid == 'opt4') {

		var tbl = document.getElementById('opt4');
		var row = tbl.insertRow(-1);

		for (i=0;i<tbl.rows[0].cells.length;i++){
			cell = row.insertCell(0);
			cell.innerHTML = "&nbsp; &nbsp;항목 : <input type=\"text\" class=\"input\" name=\"optcode4_opt[]\">";
			cell.innerHTML += " 추가가격 : <input type=\"text\" size=\"10\" class=\"input\" name=\"optcode4_pri[]\">";
			cell.innerHTML += " 추가적립금 : <input type=\"text\" size=\"10\" class=\"input\" name=\"optcode4_res[]\">";
		}

	}
}

function delopt(optid) {
	var tbl = document.getElementById('opt');

	if(optid == 'opt1') {

		if (tbl.rows.length > 2) opt.deleteRow(-1);

	} else if(optid == 'opt2') {

		if (tbl.rows[0].cells.length < 3) return;
		for (i=0;i<tbl.rows.length;i++){
			tbl.rows[i].deleteCell(-1);
		}

	} else if(optid == 'opt3') {
		var tbl = document.getElementById('opt3');
		if (tbl.rows.length > 1) opt3.deleteRow(-1);
	} else if(optid == 'opt4') {
		var tbl = document.getElementById('opt4');
		if (tbl.rows.length > 1) opt4.deleteRow(-1);
	}
}

// 상품별쿠폰 발급회원
function popMycoupon(prdcode){
	var url = "/shop/shop_mycoupon.php?prdcode=" + prdcode;
	window.open(url,"MyCouponList","height=400, width=600, menubar=no, scrollbars=yes, resizable=no, toolbar=no, status=no, top=100, left=100");
}

//-->
</script>
<div class="container-fluid">
<form action="product_upload" method="post" enctype="multipart/form-data">
      <table border="0" cellspacing="0" cellpadding="2">
          <tr>
              <td><img src="/images/ic_tit.gif"></td>
              <td valign="bottom" class="tit">상품등록</td>
              <td width="2"></td>
              <td valign="bottom" class="tit_alt">상품 상세정보를 설정합니다.</td>
          </tr>
      </table>
			<br>
      <table width="100%" border="0" cellspacing="0" cellpadding="2">
          <tr>
            <td class="tit_sub"><img src="/images/ics_tit.gif"> 기본정보</td>
          </tr>
      </table>

      <input type="hidden" name="tmp">
      <input type="hidden" name="mode" value="insert">
      <input type="hidden" name="optlist" value="">
      <input type="hidden" name="opttext" value="">
      <input type="hidden" name="prdcode" value="">
      <input type="hidden" name="relidx" value="">
      <input type="hidden" name="optcode" value="">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>
            <table width="100%" border="0" cellspacing="1" cellpadding="2" class="t_style">
              <tr>
                <td class="t_name">상품분류</td>
                <td class="t_value" colspan="3">
                <select name="Category1">
                	<option value="MOM">MOM</option>
                	<option value="BABY">BABY</option>
                	<option value="ACC">ACC</option>
                </select>
                <select name="Category2">
                	<optgroup label="MoM">MOM</optgroup>
                	<option value="Outer">Outer</option>
                	<option value="Top">Top</option>
                	<option value="Bottom">Bottom</option>
                	<option value="Dress">Dress</option>
                	<option value="Shoes">Shoes</option>
                	<option value="ETC">ETC</option>
                	<option value="sale">sale</option>
                	<optgroup label="Baby">Baby</optgroup>
                	<option value="Outer">Outer</option>
                	<option value="Top">Top</option>
                	<option value="Bottom">Bottom</option>
                	<option value="Skirt">Skirt&set</option>
                	<option value="WithMom">WithMom</option>
                	<option value="Shoes">Shoes</option>
                	<option value="ETC">ETC</option>
                	<option value="sale">sale</option>
                	<optgroup label="Dress">Dress</optgroup>
                	<option value="momDress">Mom's Dress</option>
                	<option value="momBolero">Mom's Bolero</option>
                	<option value="momACC">Mom's ACC</option>
                	<option value="momShoes">Mom's Shoes</option>
                	<option value="girlsDress">Girl's Dress</option>
                	<option vlaue="girlsACC">Girl's ACC</option>
                	
                	</select>
                	
                                </td>
              </tr>
              <!--<tr>
                <td class="t_name">상품그룹</td>
                <td class="t_value" colspan="3">
                  <input type="checkbox" name="new" value="Y" ><img src="/images/icon_new.gif" border="0"> &nbsp;
                  <input type="checkbox" name="best" value="Y" ><img src="/images/icon_best.gif" border="0"> &nbsp;
                  <input type="checkbox" name="popular" value="Y" ><img src="/images/icon_hit.gif" border="0"> &nbsp;
                  <input type="checkbox" name="recom" value="Y" ><img src="/images/icon_rec.gif" border="0"> &nbsp;
                  <input type="checkbox" name="sale" value="Y" ><img src="/images/icon_sale.gif" border="0"> &nbsp;
                </td>
              </tr>-->
              <tr>
                <td class="t_name">상품명 <font color="red">*</font></td>
                <td class="t_value" colspan="3">
                <input type="text" name="prdname" value="" size="60" class="input">
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>

      <br>
      <!--<table width="100%" border="0" cellspacing="0" cellpadding="2">
			  <tr>
			    <td class="tit_sub" width="15%"><img src="/images/ics_tit.gif"> 상품정보</td>
			    <td>
          	<input type="radio" name="info_use" onClick="if(this.checked==true) addinfo.style.display='none';" value="N" checked>사용안함
          	<input type="radio" name="info_use" onClick="if(this.checked==true) addinfo.style.display='';" value="Y" >사용함
          </td>
			  </tr>
			</table>-->
      <div id="addinfo" style=display:none>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>
            <table width="100%" border="0" cellspacing="1" cellpadding="2" class="t_style">
              <tr>
                <td width="15%" class="t_name">상품정보</td>
                <td width="85%" class="t_value">

                	<table border="0" cellspacing="5" cellpadding="0">
                		<tr>
                			<td></td>
                			<td>상품가격</td>
                			<td>1,000원 (예시)</td>
                		</tr>
                		<tr>
                			<td>1.</td>
                			<td><input name="info_name1" type="text" value="" size="15" class="input"></td>
                			<td><input name="info_value1" type="text" value="" size="20" class="input"></td>
                			<td width="60" align="right">4.</td>
                			<td><input name="info_name4" type="text" value="" size="15" class="input"></td>
                			<td><input name="info_value4" type="text" value="" size="20" class="input"></td>
                		</tr>
                		<tr>
                			<td>2.</td>
                			<td><input name="info_name2" type="text" value="" size="15" class="input"></td>
                			<td><input name="info_value2" type="text" value="" size="20" class="input"></td>
                			<td align="right">5.</td>
                			<td><input name="info_name5" type="text" value="" size="15" class="input"></td>
                			<td><input name="info_value5" type="text" value="" size="20" class="input"></td>
                		</tr>
                		<tr>
                			<td>3.</td>
                			<td><input name="info_name3" type="text" value="" size="15" class="input"></td>
                			<td><input name="info_value3" type="text" value="" size="20" class="input"></td>
                			<td align="right">6.</td>
                			<td><input name="info_name6" type="text" value="" size="15" class="input"></td>
                			<td><input name="info_value6" type="text" value="" size="20" class="input"></td>
                		</tr>
                	</table>

                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
      <br>
      </div>
			<br>
			<!--<table width="100%" border="0" cellspacing="0" cellpadding="2">
			  <tr>
			    <td class="tit_sub" width="15%"><img src="/images/ics_tit.gif"> 할인쿠폰</td>
			    <td>
          	<input type="radio" name="coupon_use" onClick="if(this.checked==true) coupon.style.display='none';" value="N" checked>사용안함
          	<input type="radio" name="coupon_use" onClick="if(this.checked==true) coupon.style.display='';" value="Y" >사용함
          </td>
			  </tr>
			</table>-->
      <div id="coupon" style=display:none>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>
            <table width="100%" border="0" cellspacing="1" cellpadding="2" class="t_style">
              <tr>
                <td class="t_name">쿠폰금액/할인율</td>
                <td colspan="3" class="t_value">
                	<input name="coupon_dis" type="text" value="" class="input">
                	<input type="radio" name="coupon_type" value="%" checked>% 퍼센트
                	<input type="radio" name="coupon_type" value="원" >원
                </td>
              </tr>
              <tr>
                <td width="15%" class="t_name">쿠폰수량</td>
                <td width="35%" class="t_value">
                	<input name="coupon_amount" type="text" value="" class="input"  >
                	<input type="checkbox" name="coupon_limit" value="N"  onClick="if(this.checked==true) this.form.coupon_amount.disabled = true; else this.form.coupon_amount.disabled = false;">수량제한없음
                </td>
                <td width="15%" class="t_name">쿠폰종료일</td>
                <td width="35%" class="t_value">
                	<input name="coupon_sdate" size="12" type="text" value="" class="input" onClick="Calendar1('document.frm','coupon_sdate');"> ~
                	<input name="coupon_edate" size="12" type="text" value="" class="input" onClick="Calendar1('document.frm','coupon_edate');">
                </td>
              </tr>
            </table>
          </td>
        </tr>
        <tr>
        	<td align="right" height="30"><img src="/images/btn_couponmem.gif" style="cursor:hand" align="absmiddle" onclick="popMycoupon('')"></td>
        </tr>
      </table>
      <br>
      </div>

			
      <br>
      <table width="100%" border="0" cellspacing="0" cellpadding="2">
			  <tr>
			    <td class="tit_sub" width="15%"><img src="/images/ics_tit.gif"> 가격및재고</td>
			  </tr>
			</table>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>
            <table width="100%" border="0" cellspacing="1" cellpadding="2" class="t_style">
              <tr>
                <td width="15%" class="t_name">판매가 <font color="red">*</font></td>
                <td width="35%" class="t_value"><input name="sellprice" type="text" value="" class="input" onchange="setReserve(this.form);"></td>
           <!--      <td width="15%" class="t_name">정가</td>
                <td width="35%" class="t_value"><input name="conprice" type="text" value="" class="input"><br>* <s>5,000</s>로 표기됨, 0 입력시 표기안됨 </td> -->
              </tr>
              <tr>
                <td class="t_name">적립금<br><a href="">(판매가 10 %)</a></td>
                <td class="t_value"><input name="reserve" type="text" value="" class="input"></td>
                <td class="t_name">재고량</td>
                <td class="t_value">
                	수량
                	<input name="stock" type="text" size="5" value="100" class="input">개<br>
                	수량을 지정하면 재고가 없을시 판매중지
                </td>
              </tr>
              <tr>
              	<td class="t_name">가격대체문구</td>
                <td class="t_value" colspan="3">
                	<input name="strprice" type="text" value="" class="input">
                	가격대체문구를 입력하면 가격대신 입력한 문구가 보이며 구매가 불가능합니다.
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>


      <br>
      <table width="100%" border="0" cellspacing="0" cellpadding="2">
			  <tr>
			    <td class="tit_sub" width="15%"><img src="/images/ics_tit.gif"> 배송비</td>
			  </tr>
			</table>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>
            <table width="100%" border="0" cellspacing="1" cellpadding="2" class="t_style">
              <tr>
                <td width="15%" class="t_name">배송비</td>
                <td width="85%" class="t_value">
                	<input type="radio" name="del_type" value="DA" checked> 기본 배송정책
                	<input type="radio" name="del_type" value="DB" > 무료배송
                	<input type="radio" name="del_type" value="DC" > 상품별 배송비
                	<input name="del_price" type="text" value="" class="input" size="10">원
                	<input type="radio" name="del_type" value="DD" > 수신자부담(착불)
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>

      <br>
      <table width="100%" border="0" cellspacing="0" cellpadding="2">
			  <tr>
			    <td class="tit_sub" width="15%"><img src="/images/ics_tit.gif"> 상품옵션</td>
			  </tr>
			</table>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>

            <table width="100%" border="0" cellspacing="1" cellpadding="2" class="t_style">
              <tr>
                <td width="15%" class="t_name">일반 옵션1</td>
                <td width="85%" class="t_value" colspan="3">
                옵션명 : <input type="text" name="opttitle1" value="" size="12" class="input">
                &nbsp; 옵션 : <input type="text" name="optcode1" value="" size="40" class="input">
                <img src="/images/btn_valuecall.gif" style="cursor:hand"  align="absmiddle" onClick="openOption('opt5');"> 옵션은 컴마(,)로 구분
                </td>
              </tr>
              <tr>
                <td class="t_name">일반 옵션2</td>
                <td class="t_value" colspan="3">
                옵션명 : <input type="text" name="opttitle2" value="" size="12" class="input">
                &nbsp; 옵션 : <input type="text" name="optcode2" value="" size="40" class="input">
                <img src="/images/btn_valuecall.gif" style="cursor:hand"  align="absmiddle" onClick="openOption('opt6');"> ex(95,100,105...)
                </td>
              </tr>
              <tr>
                <td class="t_name">일반 옵션3</td>
                <td class="t_value" colspan="3">
                옵션명 : <input type="text" name="opttitle3" value="" size="12" class="input">
                &nbsp; 옵션 : <input type="text" name="optcode3" value="" size="40" class="input">
                <img src="/images/btn_valuecall.gif" style="cursor:hand"  align="absmiddle" onClick="openOption('opt7');">
                </td>
              </tr>
            </table>

            <table><tr><td></td></tr></table>
            <table width="100%" border="0" cellspacing="1" cellpadding="2" class="t_style">
              <tr>
                <td width="15%" class="t_name">가격추가 옵션1</td>
                <td width="85%" class="t_value" colspan="3">
	                옵션명 : <input type="text" name="opttitle3" value="" size="12" class="input">
	                <img src="/images/btn_valuecall.gif" style="cursor:hand"  align="absmiddle" onClick="openOption('opt3');">
	                <a href="javascript:addopt('opt3')">[항목추가]</a>
	             	  <a href="javascript:delopt('opt3')">[항목삭제]</a>
	                <br>
	                <table width="100%" border="0" cellspacing="0" cellpadding="0" id="opt3">
	                	<tr>
	                		<td></td>
	                	</tr>
														          </table>
                </td>
              </tr>
              <tr>
                <td class="t_name">가격추가 옵션2</td>
                <td class="t_value" colspan="3">
	                옵션명 : <input type="text" name="opttitle4" value="" size="12" class="input">
	                <img src="/images/btn_valuecall.gif" style="cursor:hand"  align="absmiddle" onClick="openOption('opt4');">
	                <a href="javascript:addopt('opt4')">[항목추가]</a>
	             	  <a href="javascript:delopt('opt4')">[항목삭제]</a>
	                <br>
	                <table width="100%" border="0" cellspacing="0" cellpadding="0" id="opt4">
	                	<tr>
	                		<td></td>
	                	</tr>
														          </table>
                </td>
              </tr>
            </table>

            <table><tr><td></td></tr></table>
            <table width="100%" border="0" cellspacing="1" cellpadding="2" class="t_style">
         <!--      <tr>
                <td width="15%" class="t_name">가격/재고 옵션</td>
                <td width="85%" class="t_value" colspan="3">
                하나 또는 두개의 옵션을 조합하여 가격/적립금추가,재고관리가 가능합니다.
                <input type="checkbox" name="opt_use" value="Y" onClick="if(this.checked==true) prdopt.style.display=''; else prdopt.style.display='none';"><font color="red">설정하기</font><br>
                <div id="prdopt" style="display:none">

	           	    <table border="0" cellpadding="0" cellspacing="0">
	             	    <tr height="30">
	             	    	<td>
	             	    		옵션 1 : <input type="text" name="opttitle" value="" size="12" class="input">
	             	    		<a href="javascript:addopt('opt1')">[항목추가]</a>
	             	    		<a href="javascript:delopt('opt1')">[항목삭제]</a>
	             	    	</td>
	             	    	<td width="5"></td>
		             	    <td>
		             	    	옵션 2 : <input type="text" name="opttitle2" value="" size="12" class="input">
		             	    	<a href="javascript:addopt('opt2')">[항목추가]</a>
	             	    		<a href="javascript:delopt('opt2')">[항목삭제]</a>
		             	    </td>
	             	  	</tr>
	             	  </table>
	           	    <table border="0" cellpadding="0" cellspacing="0">
	             	    <tr height="30">
	             	    	<td>입력형식 : <input type="text" size="9" class="input" value="추가금액" readonly>:<input type="text" size="10" class="input" value="추가적립금" readonly>:<input type="text" size="8" class="input" value="재고" readonly>
	             	    	</td>
	             	  	</tr>
	             	  </table>
										           	    <table id="opt" border="1" bordercolor="#cccccc" style="border-collapse:.">
										<tr align="center">
											<td></td>
											<td id="opt2_1"><input type="text" name="tmp_optcode2[]" class="input" value="" style="width:100%"></td>
																					</tr>
										<tr id="opt1">
											<td nowrap><input type="text" name="tmp_optcode[]" value="" size="10" class="input" ></td>
											<td>
												<input type="text" name="tmp_opt[sellprice][0]" value="" size="7" class="input">:<input type="text" name="tmp_opt[reserve][0]" value="" size="7" class="input">:<input type="text" name="tmp_opt[stock][0]" value="" size="7" class="input">
											</td>
																					</tr>
																			</table>
                 </div>

                </td>
              </tr> -->
            </table>

          </td>
        </tr>
      </table>

			<br>
      <!--<table width="100%" border="0" cellspacing="0" cellpadding="2">
			  <tr>
			    <td class="tit_sub" width="15%"><img src="/images/ics_tit.gif"> 상품사진</td>
			    <td>
            <input type="checkbox" name="prdlay_check2" onClick="if(this.checked==true) prdlay2.style.display=''; else prdlay2.style.display='none';"><font color="red">이미지추가2</font>
            <input type="checkbox" name="prdlay_check3" onClick="if(this.checked==true) prdlay3.style.display=''; else prdlay3.style.display='none';"><font color="red">이미지추가3</font>
            <input type="checkbox" name="prdlay_check4" onClick="if(this.checked==true) prdlay4.style.display=''; else prdlay4.style.display='none';"><font color="red">이미지추가4</font>
            <input type="checkbox" name="prdlay_check5" onClick="if(this.checked==true) prdlay5.style.display=''; else prdlay5.style.display='none';"><font color="red">이미지추가5</font> &nbsp; &nbsp;
            <a href="javascript:setImgsize();"><img src="/images/btn_imgsize.gif" align="absmiddle" border="0"></a>
          </td>
			  </tr>
			</table>-->
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="75%">
            <table width="100%" border="0" cellspacing="1" cellpadding="2" class="t_style">
              <tr>
                <td width="20%" class="t_name">원본 이미지</td>
                <td width="80%" class="t_value" colspan="3"><input type="file" name="realimg" class="input"> [GIF, JPG, PNG]<br>원본이미지를 등록하면 나머지 이미지가 자동생성 됩니다.</td>
              </tr>
              <!--<tr>
                <td height="40" class="t_name">
                  상품목록 이미지 <font color="red">*</font><br>
                  &nbsp;&nbsp;⇒ 크기 : 140 x 140</td>
                <td class="t_value" colspan="3">
                <input type="file" name="prdimg_R" class="input">

                
                </td>
              </tr>
              <tr>
                <td height="40" class="t_name">
                  축소이미지 이미지1<br>
                  &nbsp;&nbsp;⇒ 크기 : 50 x 50</td>
                <td class="t_value" colspan="3">
                <input type="file" name="prdimg_S1" class="input">

                
                </td>
              </tr>
              <tr>
                <td height="40" class="t_name">
                  제품상세 이미지1 <font color="red">*</font><br>
                  &nbsp;&nbsp;⇒ 크기 : 360 x 360</td>
                <td class="t_value" colspan="3">
                <input type="file" name="prdimg_M1" class="input">

                
                </td>
              </tr>
              <tr>
                <td height="40" class="t_name">
                  확대 이미지1 <font color="red">*</font><br>
                  &nbsp;&nbsp;⇒ 크기 : 500 x 500</td>
                <td class="t_value" colspan="3">
                <input type="file" name="prdimg_L1" class="input">

                
                </td>
              </tr>-->
            </table>
          </td>
          <td width="25%" height="100%">
<!--            <table width="100%" height="100%" cellspacing="1" cellpadding="2" class="t_style">
              <tr>
                <td align="center" bgcolor="#ffffff">
                No<br>Image                </td>
              </tr>
            </table>-->
          </td>
        </tr>
      </table>
      <div id="prdlay2" style="display:none">
      <table width="100%" height="10" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td></td>
        </tr>
      </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="75%">
            <table width="100%" border="0" cellspacing="1" cellpadding="2" class="t_style">
              <tr>
                <td width="20%" class="t_name">원본 이미지</td>
                <td width="80%" class="t_value" colspan="3"><input type="file" name="realimg2" class="input"></td>
              </tr>
              <tr>
                <td class="t_name">
                  축소 이미지2</td>
                <td class="t_value" colspan="3">
                <input type="file" name="prdimg_S2" class="input">

                
                </td>
              </tr>
              <tr>
                <td class="t_name">
                  상세 이미지2</td>
                <td class="t_value" colspan="3">
                <input type="file" name="prdimg_M2" class="input">

                
                </td>
              </tr>
              <tr>
                <td class="t_name">
                  확대 이미지2</td>
                <td class="t_value" colspan="3">
                <input type="file" name="prdimg_L2" class="input">

                
                </td>
              </tr>
            </table>
          </td>
          <td width="25%" height="100%">
            <table width="100%" height="100%" cellspacing="1" cellpadding="2" class="t_style">
              <tr>
                <td align="center" bgcolor="#ffffff">
                No<br>Image					 </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
      </div>
      <div id="prdlay3" style=display:none>
      <table width="100%" height="10" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td></td>
        </tr>
      </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="75%">
            <table width="100%" border="0" cellspacing="1" cellpadding="2" class="t_style">
              <tr>
                <td width="20%" class="t_name">원본 이미지</td>
                <td width="80%" class="t_value" colspan="3"><input type="file" name="realimg3" class="input"></td>
              </tr>
              <tr>
                <td class="t_name">
                  축소 이미지3</td>
                <td class="t_value" colspan="3">
                <input type="file" name="prdimg_S3" class="input">

                
                </td>
              </tr>
              <tr>
                <td class="t_name">
                  상세 이미지3</td>
                <td class="t_value" colspan="3">
                <input type="file" name="prdimg_M3" class="input">

                
                </td>
              </tr>
              <tr>
                <td class="t_name">
                  확대 이미지3</td>
                <td class="t_value" colspan="3">
                <input type="file" name="prdimg_L3" class="input">

                
                </td>
              </tr>
            </table>
          </td>
          <td width="25%" height="100%">
            <table width="100%" height="100%" cellspacing="1" cellpadding="2" class="t_style">
              <tr>
                <td align="center" bgcolor="#ffffff">
                No<br>Image					 </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
      </div>
      <div id="prdlay4" style=display:none>
      <table width="100%" height="10" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td></td>
        </tr>
      </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="75%">
            <table width="100%" border="0" cellspacing="1" cellpadding="2" class="t_style">
              <tr>
                <td width="20%" class="t_name">원본 이미지</td>
                <td width="80%" class="t_value" colspan="3"><input type="file" name="realimg4" class="input"></td>
              </tr>
              <tr>
                <td class="t_name">
                  축소 이미지4</td>
                <td class="t_value" colspan="3">
                <input type="file" name="prdimg_S4" class="input">

                
                </td>
              </tr>
              <tr>
                <td class="t_name">
                  상세 이미지4</td>
                <td class="t_value" colspan="3">
                <input type="file" name="prdimg_M4" class="input">

                
                </td>
              </tr>
              <tr>
                <td class="t_name">
                  확대 이미지4</td>
                <td class="t_value" colspan="3">
                <input type="file" name="prdimg_L4" class="input">

                
                </td>
              </tr>
            </table>
          </td>
          <td width="25%" height="100%">
            <table width="100%" height="100%" cellspacing="1" cellpadding="2" class="t_style">
              <tr>
                <td align="center" bgcolor="#ffffff">
                No<br>Image					 </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
      </div>
      <div id="prdlay5" style=display:none>
      <table width="100%" height="10" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td></td>
        </tr>
      </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="75%">
            <table width="100%" border="0" cellspacing="1" cellpadding="2" class="t_style">
              <tr>
                <td width="20%" class="t_name">원본 이미지</td>
                <td width="80%" class="t_value" colspan="3"><input type="file" name="realimg5" class="input"></td>
              </tr>
              <tr>
                <td class="t_name">
                  축소 이미지5</td>
                <td class="t_value" colspan="3">
                <input type="file" name="prdimg_S5" class="input">

                
                </td>
              </tr>
              <tr>
                <td class="t_name">
                  상세 이미지5</td>
                <td class="t_value" colspan="3">
                <input type="file" name="prdimg_M5" class="input">

                
                </td>
              </tr>
              <tr>
                <td class="t_name">
                  확대 이미지5</td>
                <td class="t_value" colspan="3">
                <input type="file" name="prdimg_L5" class="input">

                
                </td>
              </tr>
            </table>
          </td>
          <td width="25%" height="100%">
            <table width="100%" height="100%" cellspacing="1" cellpadding="2" class="t_style">
              <tr>
                <td align="center" bgcolor="#ffffff">
                No<br>Image					 </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
      </div>
      <br>
      <table width="100%" border="0" cellspacing="0" cellpadding="2">
			  <tr>
			    <td class="tit_sub" width="15%"><img src="/images/ics_tit.gif"> 상품설명</td>
			  </tr>
			</table>

      <table width="100%" height="10" border="0" cellpadding="0" cellspacing="0">
        								<tr>
								
								<td >
								<textarea id="content"  name="content" rows="10" cols ="20">${bbs.content}</textarea>
								</td>
								</tr>
      </table>


<!--      <div id='floater' style='Z-INDEX:1;POSITION:absolute;LEFT:expression(document.body.clientWidth-80);TOP:200'>
      <table>
      <tr><td><input type="image" src="/images/btn_prdsave.gif"></td></tr>
      <tr><td><a href='prd_list.php?dep_code=&dep2_code=&dep3_code=&special=&display=&searchopt=&searchkey=&page=&shortpage='><img src="/images/btn_prdlist.gif" border="0"></a></td></tr>
      </table>
      </div>-->
      <script language="JavaScript" type="text/javascript">
		<!--
		self.onError=null;
			currentX = currentY = 0;
			whichIt = null;
			lastScrollX = 0; lastScrollY = 0;
			NS = (document.layers) ? 1 : 0;
			IE = (document.all) ? 1: 0;

			function heartBeat() {
				if(IE) {
					diffY = document.body.scrollTop;
					diffX = 0;
				}
				if(NS) { diffY = self.pageYOffset; diffX = self.pageXOffset; }
				if(diffY != lastScrollY) {
					percent = .05 * (diffY - lastScrollY);
					if(percent > 0) percent = Math.ceil(percent);
					else percent = Math.floor(percent);
					if(IE) document.all.floater.style.pixelTop += percent;
					if(NS) document.floater.top += percent;
					lastScrollY = lastScrollY + percent;
				}
				if(diffX != lastScrollX) {
					percent = .05 * (diffX - lastScrollX);
					if(percent > 0) percent = Math.ceil(percent);
					else percent = Math.floor(percent);
					if(IE) document.all.floater.style.pixelLeft += percent;
					if(NS) document.floater.top += percent;
					lastScrollY = lastScrollY + percent;
				}
			}
			if(NS || IE) action = window.setInterval("heartBeat()",1);
		//-->
		</script>

      <br>
      <table align="center" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>
          	<input type="image" src="/images/btn_confirm_l.gif"> &nbsp;
          	<img src="/images/btn_list_l.gif" style="cursor:hand" onclick="">
          </td>
        </tr>
      </table>
      
      </form>
</div>
<script>setClass01();setCategory();prdlayCheck();lodingComplete();</script>

        </td>
        <td width="25"></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="50">&nbsp;</td>
  </tr>
  <tr>
    <td valign="bottom" align="right" class="s11" style="padding-right:25px;">
    	<table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="f6f6f6">
      <tr>
      	<td width="69%" ></td>
        <td width="1%" bgcolor="7c7c7c">&nbsp;</td>
        <td width="30%" height="21" bgcolor="000000" style="padding-left:10px;padding-right:10px;font-size:11px"><font color="#ffffff">Copyright ⓒ 2009 사이트명 All rights reserved.</font></td>
      </tr>
    </table>
    </td>
  </tr>
  <tr>
    <td height="5"></td>
  </tr>
</table>

</body>
</html>

	