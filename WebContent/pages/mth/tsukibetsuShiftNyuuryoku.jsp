<!-- tsukibetsuShiftNyuuryoku.jsp -->
<%@page import="constant.CommonConstant.DayOfWeek"%>
<%@page import="business.logic.utils.CheckUtils"%>
<%@page import="form.common.DateBean"%>
<%@page import="java.util.List"%>
<%@page import="form.mth.TsukibetsuShiftNyuuryokuForm"%>
<%
/**
 * ファイル名：tsukibetsuShiftNyuuryoku.jsp
 *
 * 変更履歴
 * 1.0  2010/09/13 Kazuya.Naraki
 */
%>
<%@page contentType="text/html; charset=Shift_JIS"
	pageEncoding="Shift_JIS"%>
<%@ page import="constant.RequestSessionNameConstant"%>
<%@ page import="constant.CommonConstant"%>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<bean:size id="dateBeanListSize" name="tsukibetsuShiftNyuuryokuForm"
	property="dateBeanList" />
<bean:size id="listSize" name="tsukibetsuShiftNyuuryokuForm"
	property="tsukibetsuShiftNyuuryokuBeanList" />
<bean:define id="showLength" value="16" type="java.lang.String" />
<bean:define id="offset" name="tsukibetsuShiftNyuuryokuForm"
	property="offset" />
<bean:define id="color" value="" type="java.lang.String" />
<bean:define id="cntPage" name="tsukibetsuShiftNyuuryokuForm"
	property="cntPage" type="java.lang.Integer" />
<bean:define id="maxPage" name="tsukibetsuShiftNyuuryokuForm"
	property="maxPage" type="java.lang.Integer" />
<bean:define id="pageTitle" value="月別シフト入力" type="java.lang.String" />
<bean:define id="pageName" value="tsukibetsu" type="java.lang.String" />

<!-- 馬場玲奈 -->
<bean:define id="haikei" value="bcColor" type="java.lang.String" />

<%
final int heightSize = 22;

int intShowLength = Integer.parseInt(showLength);

// 表示しているリストサイズの調整
if (cntPage.intValue() == maxPage.intValue()) {
	listSize = listSize % intShowLength;
}

if (listSize > intShowLength) {
	listSize = intShowLength;
}
%>
<%@ include file="../header.jsp"%>
<%-- ヘッダーの読込 --%>

<main class="formStyle">
	<%-- 画面遷移エラーを修正（formのactionの値を変更）2024/02/23　太田 --%>
	<html:form action="/tsukibetsuShiftNyuuryokuInit">
		<div class="paging">
			表示年月：
			<bean:define id="sessionYearMonth"
				name="tsukibetsuShiftNyuuryokuForm" property="yearMonth"
				type="String" />
			<html:select property="yearMonth" name="tsukibetsuShiftNyuuryokuForm"
				onchange="submitSearch()">
				<html:optionsCollection name="tsukibetsuShiftNyuuryokuForm"
					property="yearMonthCmbMap" value="key" label="value" />
			</html:select>
			<div class="paging_pre_next">
				<logic:notEqual name="tsukibetsuShiftNyuuryokuForm"
					property="cntPage" value="1">
					<span class="pre"><html:link
							href="/kikin/tsukibetsuShiftNyuuryokuPage.do?paging=back"
							style="color: #fff;">前へ</html:link></span>
				</logic:notEqual>
				<logic:notEqual name="tsukibetsuShiftNyuuryokuForm"
					property="cntPage" value="<%=maxPage.toString()%>">
					<span class="next"><html:link
							href="/kikin/tsukibetsuShiftNyuuryokuPage.do?paging=next"
							style="color: #fff;">次へ</html:link></span>
				</logic:notEqual>
			</div>
			<div class="paging_num">
				<bean:write name="tsukibetsuShiftNyuuryokuForm" property="cntPage" />
				/
				<bean:write name="tsukibetsuShiftNyuuryokuForm" property="maxPage" />
			</div>
		</div>
		<%-- paging --%>

		<table class="table tsukibetsu_nyuuryoku">
			<thead>
				<tr class="tblHeader">
					<th>&nbsp;</th>
				</tr>
				<tr class="tblHeader">
					<th>社員名</th>
				</tr>
				<logic:iterate offset="offset" length="<%=showLength %>"
					id="tsukibetsuShiftNyuuryokuBeanList"
					name="tsukibetsuShiftNyuuryokuForm"
					property="tsukibetsuShiftNyuuryokuBeanList">
					<tr class="tblBody">
						<th><bean:write property="shainName"
								name="tsukibetsuShiftNyuuryokuBeanList" /></th>
					</tr>
				</logic:iterate>
			</thead>

			<tbody>
				<%-- 日付 --%>
				<tr class="tblHeader">
					<c:forEach var="i" begin="1" end="<%=dateBeanListSize%>">
						<th>${i}</th>
					</c:forEach>
				</tr>

				<%-- 曜日 --%>
				<tr class="tblHeader">
					<logic:iterate id="dateBeanList"
						name="tsukibetsuShiftNyuuryokuForm" property="dateBeanList">
						<bean:define id="youbi" name="dateBeanList" property="youbi" />
						<%
						if (DayOfWeek.SATURDAY.getRyaku().equals(youbi)) {
							color = "fontBlue";
						} else if (DayOfWeek.SUNDAY.getRyaku().equals(youbi)) {
							color = "fontRed";
						} else {
							color = "fontBlack";
						}
						%>
						<%-- 祝日の曜日を赤色にする（20247/02/29　太田） --%>
						<logic:equal name="dateBeanList" property="shukujitsuFlg"
							value="true">
							<%
							color = "fontRed";
							%>
						</logic:equal>
						<th class="<%=color%>"><bean:write property="youbi"
								name="dateBeanList" /></th>
					</logic:iterate>
				</tr>

				<logic:iterate offset="offset" length="<%=showLength %>"
					id="tsukibetsuShiftNyuuryokuBeanList"
					name="tsukibetsuShiftNyuuryokuForm"
					property="tsukibetsuShiftNyuuryokuBeanList">
					<html:hidden name="tsukibetsuShiftNyuuryokuBeanList"
						property="registFlg" value="true" indexed="true" />
					<%!int a = 0;%>

					<!--馬場玲奈  -->
					<bean:define id="backColor" property="backColor"
						name="tsukibetsuShiftNyuuryokuBeanList" />
					<%
					List<Boolean> backGroundColor = (List<Boolean>) backColor;
					%>

					<tr class="tblBody">
						<c:forEach var="i" begin="1" end="9">
							<td <%if((backGroundColor!=null)&&(backGroundColor.get(a)==true)){ %>class="<%=haikei%>" <%} %>>
							<html:select property="shiftId0${i}"
									name="tsukibetsuShiftNyuuryokuBeanList" indexed="true" >
									<html:optionsCollection name="tsukibetsuShiftNyuuryokuForm"
										property="shiftCmbMap" value="key" label="value" />
								</html:select>
								</td>
							<%
							a++;
							%>
						</c:forEach>
						<c:forEach var="i" begin="10" end="${dateBeanListSize}">
							<td>
							<html:select property="shiftId${i}"
									name="tsukibetsuShiftNyuuryokuBeanList" indexed="true">
									<html:optionsCollection name="tsukibetsuShiftNyuuryokuForm"
										property="shiftCmbMap" value="key" label="value" />
								</html:select></td>
							<%
							a++;
							%>
						</c:forEach>
					</tr>
					<%
					a = 0;
					%>
				</logic:iterate>
			</tbody>
		</table>
	</html:form>
	<div class="btn btn__bonrei">
		<input value="凡例表示" type="button" class="lngButton"
			onclick="openWindow()" style="height: 37px;" /> <input
			value="基本シフト反映" type="button" class="lngButton"
			onclick="submitKihonShift()" style="height: 37px;" />
		<%-- onclick属性を追加（2024/02/23　太田） --%>
		<input value="出勤希望日反映" type="button" class="lngButton"
			onclick="submitShukkinKibou()" style="height: 37px;" />
	</div>
</main>

<footer class="footer">
	<div class="footer_btn footer_btn__right">
		<input value="登録" type="button" class="smlButton"
			onclick="submitRegist()" />
	</div>
</footer>
<%-- footer --%>

</div>
<%-- wrapper --%>

<script type="text/javascript">
<!--
	/**
	 *基本シフト反映（追加　2024/02/23　太田）
	 */
	function submitKihonShift() {
		// サブミット
		doSubmit('/kikin/tsukibetsuShiftNyuuryokuKihonShift.do');
	}

	/**
	 * 出勤希望反映
	 */
	function submitShukkinKibou() {
		// サブミット
		doSubmit('/kikin/tsukibetsuShiftNyuuryokuShukkinKibou.do');
	}

	/**
	 * 登録
	 */
	function submitRegist() {
		// サブミット
		doSubmit('/kikin/tsukibetsuShiftNyuuryokuRegist.do');
	}

	/**
	 * 検索
	 */
	function submitSearch() {
		doSubmit('/kikin/tsukibetsuShiftNyuuryokuSearch.do');
	}

	/**
	 * サブウィンドウを開く
	 */
	function openWindow() {
		window
				.open(
						"/kikin/shiftHanrei.do?param=",
						null,
						"menubar=no, toolbar=no, scrollbars=auto, resizable=yes, width=520px, height=650px");
	}
	-->
</script>
</body>
</html>