<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <meta charset="utf-8">
    <link href="css/order.css" rel="stylesheet" media="screen"/>
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
    <script src="http://code.jquery.com/jquery-1.10.2.js"></script>
    <script src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
    <script type="text/javascript">
        function change(num)
        {
            var x  = document.frmCart;
            var y = Number(x.count.value) + num;
            if(y < 1) y = 1;
            x.count.value = y;
        }
    </script>
    <script>
        $(function(){
            // 소트를 설정
            var sortOrder = 1; // 1:ASC -1:DESC

            // 열을 클릭하면
            $(".dothesort").click(function(){
                var type = $(this).data('type'); // string, integer
                var col = $(this).index(); // 0, 1, ...

                // 행 전체를 취득
                var $rows = $('tbody>tr');

                // 행을 소트
                //https://developer.mozilla.org/ja/docs/Web/JavaScript/Reference/Global_Objects/Array/sort
                //array.sort(compareFunction);
                $rows.sort(function(a, b){
                    return compare(a, b, type, col) * sortOrder;
                });

                // tbody를 소트된 행 전체로 바꾸기
                $('tbody').empty().append($rows);
                var arrow = sortOrder === 1 ? "▲":"▼";
                $('.dothesort > span').text('');
                $(this).find('span').text(arrow);

                // 소트 순서를 반전
                sortOrder *= -1;
            });

            function compare(a, b, type, col){
                var _a = $(a).find('td').eq(col).text(); // eq(index)
                var _b = $(b).find('td').eq(col).text();

                if(type == "string"){
                    if(_a < _b) return -1;
                    if(_a > _b) return 1;
                    return 0;
                } else{
                    _a *= 1; _b *= 1; // a, b를 숫자로 만든다.
                    return _a - _b;
                }
            }
        });


        $(document).ready(function(){
            /*-----------------------------------------------------------------
             * 키값 rowTag로 테이블의 기본 row 값의 Html태그 저장
             -----------------------------------------------------------------*/
            var rowTag = $("table tbody").html();
            $(".tbtd_caption").data("rowTag", rowTag);  //키값 rowTag로 테이블의 기본 row 값의 Html태그 저장
        });

        /* ********************************************************
         * 행추가 기능
         ******************************************************** */
        function rowAdd(){
            $("table tbody").append($(".tbtd_caption").data("rowTag")); //rowTag의 키값으로 저장된 Html값 호출하여 테이블에 추가
        }

        /* ********************************************************
         * 현재행 삭제 기능
         ******************************************************** */
        function rowDelete(obj){
            $(obj).parent().parent().remove();
        }


        /* ********************************************************
         * 체크박스 선택행 삭제 기능
         ******************************************************** */
        function rowCheDel(){
            var $obj = $("input[name='chk']");
            var checkCount = $obj.size();
            for (var i=0; i<checkCount; i++){
                if($obj.eq(i).is(":checked")){
                    $obj.eq(i).parent().parent().remove();
                }
            }
        }

        /* ********************************************************
         * 체크박스 전체선택/해제 기능
         ******************************************************** */
        function selectAll(){
            if($("#chk_list").is(":checked")){


                //  $("input[name=chk]").attr("checked",true);
                $("input[name=chk]").prop("checked",true);
            }
            else{
                $("input[name=chk]").prop("checked",false);
            }
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
                        <h2>Cart</h2>
                        <p>장바구니</p>
                    </div>
                </div>
            </div>
            <table width=947 height=100% cellpadding=0 cellspacing=0 border=0 class="outline_both" bgcolor="#ffffff" style="padding:0 0 0 0; margin:0 auto;">
                <tr>
                    <td valign="top" width=100% height=100% background="" style="padding:0 0 0 0" class=outline_side>
                        <div style="height:30"><font color="#a0c5be"><h3>장바구니</h3></font></div>
                        <div class="indiv"><!-- Start indiv -->
                            <form name=frmCart method=post>

                                <input type=hidden name=mode value=modItem>
                                <br>
                                <table width=100% cellpadding=0 cellspacing=0 border=0>
                                    <tr bgcolor=#f4f4f4 height="30" class="input_txt">
                                        <th><input type="checkbox" id="chk_list" name="chk_list" value="" onClick="selectAll()" ></th>
                                        <td align="center" colspan=2>상품정보</td>
                                        <td align="center">적립금</td>
                                        <td align="center">판매가</td>
                                        <td align="center">수량</td>
                                        <td align="center">합계</td>
                                        <td width=20 align="center">삭제</td>
                                    </tr>
                                    <col width=60><col><col width=60>
                                    <col width=80><col width=50>
                                    <col width=80><col width=50>
                                    <c:forEach items="${cart}" var="cart">
                                        <tr height=70>
                                            <td width=20 align=center><input type="checkbox" id="chk" name="chk"/></td>
                                            <td width=20 align=center>
                                                <a href=""><img src="${cart.filepath }" width="70" height="70"/></a>
                                            </td>
                                            <td align=center width=200>
                                                <div>${cart.prdName }</div>
                                            </td>
                                            <td align=center>${cart.reserve}원</td>
                                            <td width=60 align=right style="padding-right:10">${cart.sellPrice }원</td>
                                            <td align=center>
                                                <table cellpadding=0 cellspacing=0 border=0>
                                                    <tr class="num">
                                                        <div name="form">
                                                            <td>${cart.count}</td>
                                                                <%--  <td><input id="quantity" type=text name='count' size=2 value="${cart.count}" class=line style="text-align:right;" onkeydown="onlynumber()"></td> --%>
                                                            <!--  <td>
                                                                 <div style="padding-bottom:2px">
                                                                     <img src="images/btn_plus.gif" onClick="javascript_:change(1);" style="cursor:pointer">
                                                                 </div>
                                                                 <img src="images/btn_minus.gif" onClick="javascript_:change(-1);" style="cursor:pointer">
                                                             </td> -->

                                                        </div>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td id =width=60 align=right style="padding-right:10" >${cart.count*cart.sellPrice}원</td>
                                            <td width=20 align=center >
                                                <a href="/cartDel?id=${cart.itemId}"> <input type="button" id="img_button" onClick="rowDelete(this)" /></a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    <tr><td colspan=10 height=1 bgcolor=#DEDEDE></td></tr>
                                    <tr>
                                        <td colspan=10 height=60 bgcolor=#f7f7f7 align=right>

                                            <table>
                                                <tr>
                                                    <td align=right width=80 nowrap>상품합계금액</td>
                                                    <td id="totalPrice"align=right style="font-weight:bold;padding-left:25px" class=red>${totalPrice}원&nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <input type="button" value="선택행 삭제" onClick="rowCheDel();" />
                                                    <td align=right>받으실적립금</td>
                                                    <td align=right style="font-weight:bold;padding-left:25px">${totalReserve}원&nbsp;</td>
                                                </tr>
                                            </table>

                                        </td>
                                    </tr>
                                    <tr><td colspan=10 height=1 bgcolor=#efefef></td></tr>
                                </table>
                            </form>
                            <br>
                            <table width=100% cellpadding=0 cellspacing=0 border=0>
                                <tr>
                                    <td align=center>
                                        <a href="" onFocus="blur()"><img src="images/btn_order.gif" border=0></a>
                                        <a href="javascript:history.go(-1)"  onFocus="blur()"><img src="images/btn_back.gif" border=0></a>

                                    </td>
                                </tr>
                            </table>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</div>
</body>
</html>