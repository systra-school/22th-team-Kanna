<!-- kinmuJissekiNyuryokuKakunin.jsp -->
<%@page import="constant.CommonConstant.DayOfWeek"%>
<%
/**
 * ファイル名：kinmuJissekiNyuryokuKakunin.jsp
 *
 * 変更履歴
 * 1.0  2010/09/13 Kazuya.Naraki
 */
%>
<%@page contentType="text/html; charset=Shift_JIS" pageEncoding="Shift_JIS"%>
<%@ page import="constant.RequestSessionNameConstant"%>
<%@ page import="constant.CommonConstant"%>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<bean:define id="color" value="" type="java.lang.String"/>
<bean:size id="dateBeanListSize" name="kinmuJissekiNyuryokuKakuninForm"  property="dateBeanList"/>
<bean:define id="pageTitle" value="勤務実績入力" type="java.lang.String"/>
<bean:define id="pageName" value="kinmuzisseki" type="java.lang.String"/>
<bean:size id="beanListSize" name="kinmuJissekiNyuryokuKakuninForm" property="kinmuJissekiNyuryokuKakuninList" />

<%@ include file="../header.jsp" %>
<%-- ヘッダーの読込 --%>

	<main class="formStyle kinmuzisseki_nyuuryoku">
		<html:form action="/kinmuJissekiNyuryokuKakuninRegist">
		<div class="ctrl_area">
			<div class="paging">
				<span class="moziColor">表示年月：</span>
				<html:select name="kinmuJissekiNyuryokuKakuninForm" property="yearMonth" onchange="submitSearch()">
				<html:optionsCollection name="kinmuJissekiNyuryokuKakuninForm"
				                        property="yearMonthCmbMap"
				                        value="key"
				                        label="value"/>
				</html:select>
			</div><%-- paging --%>
			
			<div class="member moziColor">
				社員ID&nbsp;<bean:write name="kinmuJissekiNyuryokuKakuninForm" property="shainId"/>
				：社員名&nbsp;<bean:write name="kinmuJissekiNyuryokuKakuninForm" property="shainName"/>
			</div><%-- member --%>
		</div><%-- ctrl_area --%>
		
		
		<table>
			<thead class="tblHeader">
				<tr>
					<th class="w50">日付</th>
					<th class="w30">曜</th>
					<th class="w50">シフト</th>
					<th class="w100">開始時刻</th>
					<th class="w100">終了時刻</th>
					<th class="w100">休憩</th>
					<th class="w100">実働時間</th>
					<th class="w100">時間外</th>
					<th class="w100">休日</th>
					<th class="w150">備考</th>
				</tr>
			</thead>
			<tbody class="tblBody">
			<%-- widthを微調整 --%>
			<logic:iterate id="kinmuJissekiNyuryokuKakuninList" name="kinmuJissekiNyuryokuKakuninForm" property="kinmuJissekiNyuryokuKakuninList" indexId="idx">
				<tr>
					<html:hidden name="kinmuJissekiNyuryokuKakuninList" property="shainId" />
					<td class="w50"><bean:write name="kinmuJissekiNyuryokuKakuninList" property="kadouDayDisp" /></td>
					
					<bean:define id="youbi" name="kinmuJissekiNyuryokuKakuninList" property="youbi"/>
					<%
					if (DayOfWeek.SATURDAY.getRyaku().equals(youbi)) {
						color = "fontBlue";
					} else if (DayOfWeek.SUNDAY.getRyaku().equals(youbi)) {
						color = "fontRed";
					} else {
						color = "fontBlack";
					}
					%>
					<td class="w30" class="<%=color %>"><bean:write name="kinmuJissekiNyuryokuKakuninList" property="youbi" /></td>
					<td class="w50"><bean:write name="kinmuJissekiNyuryokuKakuninList" property="symbol" /></td>
					<td class="w100">
						<%-- レイアウト修正(sizeの値を修正) --%>
						<html:text style="text-align:center" size="5" maxlength="5" name="kinmuJissekiNyuryokuKakuninList" property="startTime" indexed="true"></html:text><br>
						<%-- <html:text style="text-align:center" size="10" maxlength="5" name="kinmuJissekiNyuryokuKakuninList" property="startTime" indexed="true"></html:text><br> --%>
					</td>
					<td class="w100">
						<%-- レイアウト修正(sizeの値を修正) --%>
						<html:text style="text-align:center" size="5" maxlength="5" name="kinmuJissekiNyuryokuKakuninList" property="endTime" indexed="true"></html:text><br>
						<%-- <html:text style="text-align:center" size="10" maxlength="5" name="kinmuJissekiNyuryokuKakuninList" property="endTime" indexed="true"></html:text><br> --%>
					</td>
					<td class="w100">
						<%-- レイアウト修正(sizeの値を修正) --%>
						<html:text style="text-align:center" size="5" maxlength="5" name="kinmuJissekiNyuryokuKakuninList" property="breakTime" indexed="true"></html:text><br>
						<%-- <html:text style="text-align:center" size="10" maxlength="5" name="kinmuJissekiNyuryokuKakuninList" property="breakTime" indexed="true"></html:text><br> --%>
					</td>
					<td class="w100"><bean:write name="kinmuJissekiNyuryokuKakuninList" property="jitsudouTime" /></td>
					<td class="w100"><bean:write name="kinmuJissekiNyuryokuKakuninList" property="jikangaiTime" /></td>
					<td class="w100"><bean:write name="kinmuJissekiNyuryokuKakuninList" property="kyuujitsuTime" /></td>
					<%-- alignをleftからcenterに --%>
					<td class="w150" align="center">
						<%-- レイアウト修正(sizeの値を修正) --%>
						<html:text style="text-align:left" name="kinmuJissekiNyuryokuKakuninList" property="bikou" indexed="true"></html:text><br>
						<%-- <html:text style="text-align:left" size="40" name="kinmuJissekiNyuryokuKakuninList" property="bikou" indexed="true"></html:text><br> --%>
					</td>
				</tr>
				</logic:iterate>
			</tbody>
		</table>
		</html:form>
	</main>

	<footer class="footer">
		<div class="footer_btn footer_btn__right">
			<input value="登録"  type="button" class="smlButton"  onclick="regist()" />
		</div>
	</footer><%-- footer --%>

</div><%-- wrapper --%>

<script type="text/javascript">
<!--

/**
 * 登録へ
 */
 function regist() {
	 // 一覧のサイズ
    var listSize = <%= beanListSize %>;
    // 開始時間エラーメッセージ
    var startTimeErrMsg = '';
    // 終了時間エラーメッセージ
    var endTimeErrMsg = '';
    // 休憩時間エラーメッセージ
    var breakTimeErrMsg = '';
    // From - To エラーメッセージ
    var fromToErrMsg = '';
    // エラーメッセージ
    var errorMsg = '';
    with(document.forms[0].elements) {
        for (var i = 0; i < listSize; i++) {
            // 開始時間を取得する。
            var startTime = namedItem('kinmuJissekiNyuryokuKakuninList['+ i +'].startTime').value;
            // 終了時間を取得する。
            var endTime = namedItem('kinmuJissekiNyuryokuKakuninList['+ i +'].endTime').value;
            // 休憩時間を取得する。
            var breakTime = namedItem('kinmuJissekiNyuryokuKakuninList['+ i +'].breakTime').value;
            // 背景色をクリアする
            namedItem('kinmuJissekiNyuryokuKakuninList['+ i +'].startTime').style.backgroundColor = 'white';
            namedItem('kinmuJissekiNyuryokuKakuninList['+ i +'].endTime').style.backgroundColor = 'white';
            namedItem('kinmuJissekiNyuryokuKakuninList['+ i +'].breakTime').style.backgroundColor = 'white';
            // 入力されてない場合にスキップ
            if(startTime === '' || endTime === '' || breakTime === ''){
            	continue;
            }
            // 時間チェック
            if (!startTimeErrMsg) {
                if (!checkTime(startTime)) {
                    var strArr = ['開始時間'];
                    startTimeErrMsg = getMessage('E-MSG-000004', strArr);
                    namedItem('kinmuJissekiNyuryokuKakuninList['+ i +'].startTime').style.backgroundColor = 'red';
                }
            }
            if (!endTimeErrMsg) {
                if (!checkTime(endTime)) {
                    var strArr = ['終了時間'];
                    endTimeErrMsg = getMessage('E-MSG-000004', strArr);
                    namedItem('kinmuJissekiNyuryokuKakuninList['+ i +'].endTime').style.backgroundColor = 'red';
                }
            }
            if (!breakTimeErrMsg) {
                if (!checkTime(breakTime)) {
                    var strArr = ['休憩時間'];
                    breakTimeErrMsg = getMessage('E-MSG-000004', strArr);
                    namedItem('kinmuJissekiNyuryokuKakuninList['+ i +'].breakTime').style.backgroundColor = 'red';
                }
            }
            // from - to のチェック
            if (!checkTimeCompare(startTime, endTime)) {
              if (checkTime(startTime) && checkTime(endTime)) {
                  fromToErrMsg = getMessageCodeOnly('E-MSG-000005');
                  namedItem('kinmuJissekiNyuryokuKakuninList['+ i +'].startTime').style.backgroundColor = 'red';
                  namedItem('kinmuJissekiNyuryokuKakuninList['+ i +'].endTime').style.backgroundColor = 'red';
              }
            }
        }
    }
    // エラーメッセージ
    errorMsg = startTimeErrMsg + endTimeErrMsg + breakTimeErrMsg + fromToErrMsg;
    if (errorMsg) {
        alert(errorMsg);
        // エラー
        return false;
    }
    document.forms[0].submit();
}
/**
 * 検索
 */
function submitSearch() {
    doSubmit('/kikin/kinmuJissekiNyuryokuKakuninSearch.do');
}
-->
//# sourceURL = asdf.js
</script>
</body>
</html>