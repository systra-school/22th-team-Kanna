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

<%@ include file="../header.jsp" %>
<%-- ヘッダーの読込 --%>

	<main class="formStyle kinmuzisseki_nyuuryoku">
		<html:form action="/shainMstMntRegist">
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
    // サブミット
    doSubmit('/kikin/kinmuJissekiNyuryokuKakuninRegist.do');
}
/**
 * 検索
 */
function submitSearch() {
    doSubmit('/kikin/kinmuJissekiNyuryokuKakuninSearch.do');
}
-->
</script>
</body>
</html>