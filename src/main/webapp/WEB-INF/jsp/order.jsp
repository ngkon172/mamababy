<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <meta charset="utf-8">
  <link href="css/order.css" rel="stylesheet" media="screen"/>
  <script src="js/order.js" type="text/javascript"></script>
  <script src="http://dmaps.daum.net/map_js_init/postcode.js"></script>
  <script>
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
  </script>
</head>
<body>
<style type="text/css">
  .outline_both {
    border-left-style:solid;
    border-right-style:solid;
    border-left-width:0;
    border-right-width:0;
    border-left-color:#FFFFFF;
    border-right-color:#FFFFFF;
  }

</style>

<style type="text/css" media="screen">
  object { outline:none; }
  embed { outline:none; }
</style>
<div id="container">
  <div id="contents">
    <div class="detail_page">
      <div class="element- board board-readpackage-4 board-readpackage board-4 ">
        <div class="element- board board-title-4 board-title board-4 ">
          <div class="titleArea">
            <h2>Order</h2>
            <p>주문하기</p>
          </div>
        </div>
      </div>
      <table width=947 height=100% cellpadding=0 cellspacing=0 border=0 class="outline_both" bgcolor="#ffffff" style="padding:0 0 0 0; margin:0 auto;">
        <tr>
          <td valign="top" width=100% height=100% background="" style="padding:0 0 0 0" class=outline_side>
            <div style="height:30"><font color="#a0c5be"><h3>주문 상세내역</h3></font></div>
            <table width=100% cellpadding=0 cellspacing=0 border=0>
              <tr bgcolor=#f4f4f4 height="30" class="input_txt">
                <td align="center" colspan=2>상품정보</td>
                <td align="center">적립금</td>
                <td align="center">판매가</td>
                <td align="center">수량</td>
                <td align="center">합계</td>
              </tr>

              <col width=60><col><col width=60>
              <col width=80><col width=50>
              <col width=80>
              <c:forEach var="order" items="${orderList}" varStatus="status">
                <tr>
                  <td height=60 align=center>
                    <a href=""><img src='${order.filepath}' width=40/></a>
                  </td>
                  <td align=center>
                    <div>${order.prdName}</div>
                  </td>
                  <td align=center>${order.reserve}</td>
                  <td align=right style="padding-right:10">${order.sellPrice}원</td>
                  <td align=center>
                      ${order.count}개
                  </td>
                  <td align=right style="padding-right:10">총금액 ${order.sellPrice*order.count}원</td>
                </tr>
              </c:forEach>
              <tr><td colspan=10 height=1 bgcolor=#DEDEDE></td></tr>
              <tr>
                <td colspan=10 height=60 bgcolor=#f7f7f7 align=right>

                  <table>
                    <tr>
                      <td align=right width=80 nowrap>상품합계금액</td>
                      <td align=right style="font-weight:bold;padding-left:25px" class=red>${totalPrice}원&nbsp;</td>
                    </tr>
                    <tr>
                      <td align=right>받으실적립금</td>
                      <td align=right style="font-weight:bold;padding-left:25px"> ${totalReserve}원 &nbsp;</td>
                    </tr>
                  </table>

                </td>
              </tr>
              <tr><td colspan=10 height=1 bgcolor=#efefef></td></tr>
            </table>
            <div style="margin-top:20; height:30"><font color="#a0c5be"><h3>주문서 작성</h3></font></div>
            <form id=form name=frmOrder action="/shop/order/settle.php?&" method=post onsubmit="return chkForm2(this)">
              <input type=hidden name=ordno value="1417400619737">
              <input type=hidden name=item_apply_coupon[]>

              <div id=apply_coupon></div>

              <!-- 01 주문자정보 -->
              <table width=100% style="border:2px solid #f4f4f4" cellpadding=0 cellspacing=0>
                <tr>
                  <td width=150 align="center" valign="middle" bgcolor="#f4f4f4"><font color="#777777">주문자정보</font></td>
                  <td style="padding:10px">

                    <table>
                      <col width=100>
                      <tr>
                        <td>주문하시는분</td>
                        <td><input type=text name=nameOrder value="${user.user}" style="font-weight:bold" readonly style='border:0' required msgR="주문하시는분의 이름을 적어주세요"></td>
                      </tr>
                      <tr>
                        <td>주소</td>
                        <td>${user.addr1}  ${user.addr2}</td>
                      </tr>

                      <tr>
                        <td>핸드폰번호</td>
                        <td>
                          <input type=text name=mobileOrder[] value="${user.mobile1}" size=3 maxlength=3 required> -
                          <input type=text name=mobileOrder[] value="${user.mobile2}" size=4 maxlength=4 required> -
                          <input type=text name=mobileOrder[] value="${user.mobile3}" size=4 maxlength=4 required>
                        </td>
                      </tr>
                      <tr>
                        <td>이메일</td>
                        <td><input type=text name=email value="${user.email1}@${user.email2}" required option=regEmail></td>
                      </tr>
                    </table>

                  </td>
                </tr>
              </table><div style="font-size:0;height:5px"></div>

              <!-- 02 배송정보 -->
              <table width=100% style="border:2px solid #f4f4f4" cellpadding=0 cellspacing=0>
                <tr>
                  <td width=150 valign="middle" align="center" bgcolor="#f4f4f4"><font color="#777777">배송정보</font></td>
                  <td style="padding:10px">

                    <table>
                      <col width=100>
                      <tr>
                        <td>배송지 확인</td>
                        <td class=noline>
                          <input type=checkbox onclick="ctrl_field(this.checked)" > 주문고객 정보와 동일합니다
                        </td>
                      </tr>
                      <tr>
                        <td>받으실분</td>
                        <td><input type=text name=nameReceiver value="" required></td>
                      </tr>
                      <tr>
                        <td>받으실곳</td>
                        <td>
                          <input type=text name=zipcode[] id="postcode1" size=3 class=line readonly value="" required> -
                          <input type=text name=zipcode[] id="postcode2" size=3 class=line readonly value="" required>
                          <a id="postBtn" onclick="openDaumPostcode()"><img src="images/btn_zipcode.gif" align=absmiddle></a>
                        </td>
                      </tr>
                      <tr>
                        <td></td>
                        <td><input id="addr1" type=text name=address class=lineBig readonly value="" required></td>
                      </tr>
                      <tr>
                        <td></td>
                        <td><input id="addr2" type=text name=address_sub class=lineBig value="" required label="세부주소"></td>
                      </tr>
                      <tr>
                        <td>전화번호</td>
                        <td>
                          <input type=text name=phoneReceiver[] value="" size=3 maxlengtd=3> -
                          <input type=text name=phoneReceiver[] value="" size=4 maxlengtd=4> -
                          <input type=text name=phoneReceiver[] value="" size=4 maxlengtd=4>
                        </td>
                      </tr>
                      <tr>
                        <td>핸드폰번호</td>
                        <td>
                          <input type=text name=mobileReceiver[] value="" size=3 maxlengtd=3 required> -
                          <input type=text name=mobileReceiver[] value="" size=4 maxlengtd=4 required> -
                          <input type=text name=mobileReceiver[] value="" size=4 maxlengtd=4 required>
                        </td>
                      </tr>
                      <tr>
                        <td>남기실 말씀</td>
                        <td><input type=text name=memo style="width:100%"></td>
                      </tr>
                      <tr><td colspan=2>&nbsp;</td></tr>
                      <tr id="paper_delivery_menu">
                        <td>배송선택</td>
                        <td class="noline">

                          <div style='float:left'><input type="radio" name="deliPoli" value="0" checked onclick="getDelivery()" onblur="chk_emoney(document.frmOrder.emoney)"> 기본배송</div>
                        </td>
                      </tr>
                    </table>

                  </td>
                </tr>
              </table><div style="font-size:0;height:5px"></div>

              <!-- 03 결제금액 -->
              <table width=100% style="border:2px solid #f4f4f4" cellpadding=0 cellspacing=0>
                <tr>
                  <td width=150 valign="middle" align="center" bgcolor="#f4f4f4"><font color="#777777">결제금액</font></td>
                  <td style="padding:10px">

                    <table>
                      <col width=100>
                      <tr>
                        <td>상품합계금액</td>
                        <td><p id="paper_goodsprice" style="width:146px;text-align:right;font-weight:bold;float:left;margin:0">${totalPrice}</p> 원</td>
                      </tr>
                      <tr>
                        <td>배송비</td>
                        <td>
                          <div id="paper_delivery_msg1"><div id="paper_delivery" style="width:146px;text-align:right;font-weight:bold;float:left;margin:0">0</div>원</div>
                          <div id="paper_delivery_msg2" style="width:160;text-align:right"></div>
                        </td>
                      </tr>
                      <tr>
                        <td>회원할인</td>
                        <td><span id='memberdc' style="width:145;text-align:right">0</span> 원</td>
                      </tr>
                      <tr>
                        <td></td>
                        <td>

                          <table cellpadding=0 cellspacing=0>
                            <tr>
                              <td width=60 align=right>할인 :</td>
                              <td style="padding-left:3px">
                                <input type=text name=coupon size=12 style="text-align:right" value=0 readonly> 원
                                <a href=""></a>
                              </td>
                            </tr>
                            <tr>
                              <td width=60 align=right>적립 :</td>
                              <td style="padding-left:3px">
                                <input type=text name=coupon_emoney size=12 style="text-align:right" value=0 readonly> 원
                              </td>
                            </tr>
                          </table>

                        </td>
                      </tr>

                      <tr>
                        <td valign=top style="padding-top:4px">적립금 적용</td>
                        <td>

                          <table cellpadding=0 cellspacing=0>
                            <div style="display:block;}">
                              <tr>
                                <td width=60 align=right>적립금 :</td>
                                <td style="padding-left:3px">
                                  <input type=text name="emoney" size="12" style="text-align:right" value="0" onblur="chk_emoney(this);" onkeyup="calcu_settle();" onkeydown="if (event.keyCode == 13) {return false;}"> 원
                                  (보유적립금 : ${user.point}원)
                                </td>
                              </tr>
                            </div>
                            <tr>
                              <td colspan=2 class="small red">
                                <div>보유적립금이 1,000원이상 일 경우 사용하실 수 있습니다.</div>
                                <input type=hidden name=emoney_max value="1000000">
                              </td>
                            </tr>
                          </table>

                        </td>
                      </tr>


                      <tr>
                        <td>총 결제금액</td>
                        <td><span id=paper_settlement style="width:146px;text-align:right;font:bold; color:#a0c5be;"></span> 원</td>
                      </tr>
                    </table>

                  </td>
                </tr>
              </table><div style="font-size:0;height:5px"></div>
              <!-- 구매안전표시 start --><!-- 구매안전표시 end -->
              <!-- 04 결제수단 -->
              <table width=100% style="border:2px solid #f4f4f4" cellpadding=0 cellspacing=0>
                <tr>
                  <td width=150 valign="middle" align="center" bgcolor="#f4f4f4"><font color="#777777">결제수단</font></td>
                  <td style="padding:10px">

                    <input type=hidden name=escrow value="N">
                    <table>
                      <col width=100>
                      <tr>
                        <td>일반결제</td>
                        <td class=noline>
                          <input type=radio name=settlekind value="a" onclick="input_escrow(this,'N')"> 무통장입금
                          <input type=radio name=settlekind value="c" onclick="input_escrow(this,'N')"> 신용카드
                        </td>
                      </tr>
                      <tr>
                        <th></th>
                        <td class="small red">&nbsp;(무통장입금의 경우 입금확인 후부터 배송단계가 진행됩니다)</td>
                      </tr>
                    </table>
                  </td>
                </tr>
              </table><div style="font-size:0;height:5px"></div>

              <div style="padding:20px" align=center class="noline">
                <input type="image" src="images/btn_payment.gif">
                <img src="images/btn_cancel.gif" onclick="history.back()" style="cursor:pointer">
              </div>
            </form>
            <div id=dynamic></div>
          </td>
        </tr>
      </table>
    </div>
  </div>
</div>
<script>
  var emoney_max = 1000000;
  function chkForm2(fm)
  {
    if (typeof(fm.settlekind)=="undefined"){
      alert("결제수단이 활성화가 안 되었습니다. 관리자에게 문의하세요.");
      return false;
    }

    var obj = document.getElementsByName('settlekind');
    if (obj[0].getAttribute('required') == undefined){
      obj[0].setAttribute('required', '');
      obj[0].setAttribute('label', '결제수단');
    }

    return chkForm(fm);
  }
  function input_escrow(obj,val)
  {
    obj.form.escrow.value = val;
    if (typeof(egg_required) == 'function') egg_required();
    if (typeof(cash_required) == 'function') cash_required();
  }
  /*주소 같은부분*/
  function ctrl_field(val)
  {
    if (val) copy_field();
    else clear_field();
  }
  function copy_field()
  {
    var form = document.frmOrder;
    form.nameReceiver.value = form.nameOrder.value;
    form['zipcode[]'][0].value = "<c:out value="${user.postcode1}"/>";
    form['zipcode[]'][1].value = "<c:out value="${user.postcode2}"/>";
    form.address.value = "<c:out value="${user.addr1}"/>";
    form.address_sub.value = "<c:out value="${user.addr2}"/>";
    form['phoneReceiver[]'][0].value = form['phoneOrder[]'][0].value;
    form['phoneReceiver[]'][1].value = form['phoneOrder[]'][1].value;
    form['phoneReceiver[]'][2].value = form['phoneOrder[]'][2].value;
    form['mobileReceiver[]'][0].value = form['mobileOrder[]'][0].value;
    form['mobileReceiver[]'][1].value = form['mobileOrder[]'][1].value;
    form['mobileReceiver[]'][2].value = form['mobileOrder[]'][2].value;

    getDelivery();
  }
  function clear_field()
  {
    var form = document.frmOrder;
    form.nameReceiver.value = "";
    form['zipcode[]'][0].value = "";
    form['zipcode[]'][1].value = "";
    form.address.value = "";
    form.address_sub.value = "";
    form['phoneReceiver[]'][0].value = "";
    form['phoneReceiver[]'][1].value = "";
    form['phoneReceiver[]'][2].value = "";
    form['mobileReceiver[]'][0].value = "";
    form['mobileReceiver[]'][1].value = "";
    form['mobileReceiver[]'][2].value = "";
  }
  function cutting(emoney)
  {
    var chk_emoney = new String(emoney);
    reg = /(0)$/g;
    if (emoney && !chk_emoney.match(reg)){
      emoney = Math.floor(emoney/10) * 10;
    }
    return emoney;
  }
  function chk_emoney(obj)
  {
    var form = document.frmOrder;
    //이부분에 그 포인트가 드가야됨
    var my_emoney = "<c:out value="${user.point}"/>";
    var max = '1000000';
    var min = '2000';
    var hold = '1000';

    var delivery	= uncomma(document.getElementById('paper_delivery').innerHTML);
    var goodsprice = uncomma(document.getElementById('paper_goodsprice').innerText);
    var erangeprice = goodsprice;
    var max_base = erangeprice - uncomma(_ID('memberdc').innerHTML) - uncomma(document.getElementsByName('coupon')[0].value);
    if( form.coupon ){
      var coupon = uncomma(form.coupon.value);
    }
    max = getDcprice(max_base,max,10);
    min = parseInt(min);

    if (max > max_base)  max = max_base;
    if( _ID('print_emoney_max') && _ID('print_emoney_max').innerHTML != comma(max)  )_ID('print_emoney_max').innerHTML = comma(max);

    var emoney = uncomma(obj.value);
    if (emoney>my_emoney) emoney = my_emoney;

    if(my_emoney > 0 && emoney > 0 && my_emoney < hold){
      alert("보유적립금이 "+ comma(hold) + "원 이상 일 경우에만 사용하실 수 있습니다.");
      emoney = 0;
    }
    if (min && emoney > 0 && emoney < min){
      alert("적립금은 " + comma(min) + "원 부터 " + comma(max) + "원 까지만 사용이 가능합니다");
      emoney = 0;
    } else if (max && emoney > max && emoney > 0){
      if(emoney_max < min){
        alert("주문 상품 금액이 최소 사용 적립금 " + comma(min) + "원 보다  작습니다.");
        emoney = 0;
      }else{
        alert("적립금은 " + comma(min) + "원 부터 " + comma(max) + "원 까지만 사용이 가능합니다");
        emoney = max;
      }
    }

    obj.value = comma(cutting(emoney));
    calcu_settle();
  }
  function calcu_settle()
  {
    var dc=0;
    var coupon = settleprice = 0;
    var goodsprice	= uncomma(document.getElementById('paper_goodsprice').innerHTML);
    var delivery	= uncomma(document.getElementById('paper_delivery').innerHTML);
    if(_ID('memberdc')) dc = uncomma(_ID('memberdc').innerHTML);
    var emoney = (document.frmOrder.emoney) ? uncomma(document.frmOrder.emoney.value) : 0;
    if (document.frmOrder.coupon){
      coupon = uncomma(document.frmOrder.coupon.value);
      if (goodsprice + delivery - dc - coupon - emoney < 0){
        emoney = goodsprice - dc - coupon;
        document.frmOrder.emoney.value = comma(cutting(emoney));
      }
      dc += coupon + emoney;
    }
    var settlement = (goodsprice + delivery - dc);
    settlement += calcu_eggFee(settlement);
    document.getElementById('paper_settlement').innerHTML = comma(settlement);
  }
  function egg_required()
  {
    egg_display();
    calcu_settle();
  }
  function calcu_eggFee(settlement)
  {
    egg_display(settlement);
    var eggFee = 0;
    if (typeof(document.getElementsByName('eggFee')[0]) != "undefined"){
      if (document.getElementsByName('eggFee')[0].disabled == false) eggFee = parseInt(settlement * 0.005);
      document.getElementsByName('eggFee')[0].value = eggFee;
    }
    if (_ID('paper_eggFee') != null) _ID('paper_eggFee').innerHTML = comma(eggFee);
    if (_ID('infor_eggFee') != null){
      _ID('infor_eggFee').innerHTML = '<b>' + comma(eggFee) + '</b> 원';
      if (eggFee) _ID('infor_eggFee').innerHTML += ' (총 결제금액에 포함되었습니다.)';
    }
    return eggFee;
  }
  function egg_display(settlement)
  {
    var min = parseInt('0');
    var display = 'block';
    if (_ID('egg') == null) return;
    if (typeof(settlement) != "undefined"){
      if (settlement < min && typeof(document.getElementsByName('eggIssue')[0]) != "undefined") display = 'none';
      else if (settlement <= 0) display = 'none';
      else if (_ID('egg').style.display != 'none') return;
    }
    if (display != 'none'){
      var obj = document.getElementsByName('settlekind');
      for (var i = 0; i < obj.length; i++){
        if (obj[i].checked != true) continue;
        var settlekind = obj[i];
        break;
      }
      if (settlekind == null) display = 'none';
      else if (settlekind.value == 'h') display = 'none';
      else if (document.getElementsByName('escrow')[0].value == 'Y') display = 'none';
      else if (typeof(document.getElementsByName('eggIssue')[0]) != "undefined"){
        if (settlekind.value != 'a') display = 'none';
        else if(typeof(settlement) == "undefined"){
          settlement = uncomma(_ID('paper_settlement').innerHTML);
          if (typeof(document.getElementsByName('eggFee')[0]) != "undefined") settlement -= document.getElementsByName('eggFee')[0].value;
          if (settlement < min) display = 'none';
        }
      }
    }
    if (_ID('egg').style.display == display && display =='none') return;
    _ID('egg').style.display = display;

    items = new Array();
    items.push( {name : "eggIssue", label : "전자보증보험 발급여부", msgR : ""} );
    items.push( {name : "resno[]", label : "주민등록번호", msgR : "전자보증보험을 발급받으시려면, 주민번호를 입력하셔야 결제가 가능합니다."} );
    items.push( {name : "eggAgree", label : "개인정보 이용동의", msgR : "전자보증보험을 발급받으시려면, 개인정보 이용동의가 필요합니다."} );
    items.push( {name : "eggFee", label : "발급수수료", msgR : ""} );
    for (var i = 0; i < items.length; i++){
      var obj = document.getElementsByName(items[i].name);
      if (display == 'block' && items[i].name != 'eggIssue' && typeof(document.getElementsByName('eggIssue')[0]) != "undefined")
        state = (document.getElementsByName('eggIssue')[0].checked ? 'block' : 'none');
      else state = display;
      for (var j = 0; j < obj.length; j++){
        if (state == 'block'){
          obj[j].setAttribute('required', '');
          obj[j].setAttribute('label', items[i].label);
          obj[j].setAttribute('msgR', items[i].msgR);
          obj[j].disabled = false;
        }
        else {
          obj[j].removeAttribute('required');
          obj[j].removeAttribute('label');
          obj[j].removeAttribute('msgR');
          obj[j].disabled = true;
        }
      }
    }
  }

  function getDelivery(){
    var form = document.frmOrder;
    var obj = form.deliPoli;
    var coupon = 0;
    var emoney = 0;

    var deliPoli = 0;
    for(var i=0;i<obj.length;i++){
      if(obj[i].checked){
        deliPoli = i;
      }
    }
    if( form.coupon ) coupon = form.coupon.value;
    if( form.emoney ) emoney = form.emoney.value;
    var zipcode = form['zipcode[]'][0].value + '-' + form['zipcode[]'][1].value;
    var mode = 'order';
    delivery.src = ""+zipcode+"&deliPoli="+deliPoli+"&coupon="+coupon+"&emoney="+emoney+"&mode="+mode;
  }
</script>
</body>
</html>