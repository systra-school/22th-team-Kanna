<!-- tsukibetsuShiftKakunin.jsp -->
<%@page import="constant.CommonConstant.DayOfWeek"%>
<%@page import="business.logic.utils.CheckUtils"%>
<%@page import="form.common.DateBean"%>
<%@page import="java.util.List"%>
<%@page import="form.mth.TsukibetsuShiftKakuninForm"%>
<%
/**
 * ファイル名：tsukibetsuShiftKakunin.jsp
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
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<bean:size id="dateBeanListSize" name="tsukibetsuShiftKakuninForm" property="dateBeanList"/>
<bean:size id="listSize" name="tsukibetsuShiftKakuninForm" property="tsukibetsuShiftKakuninBeanList"/>
<bean:define id="showLength" value="16" type="java.lang.String"/>
<bean:define id="offset" name="tsukibetsuShiftKakuninForm" property="offset" />
<bean:define id="color" value="" type="java.lang.String"/>
<bean:define id="cntPage" name="tsukibetsuShiftKakuninForm" property="cntPage" type="java.lang.Integer"/>
<bean:define id="maxPage" name="tsukibetsuShiftKakuninForm" property="maxPage" type="java.lang.Integer"/>
<bean:define id="pageTitle" value="月別シフト確認画面" type="java.lang.String"/>
<bean:define id="pageName" value="tsukibetsu" type="java.lang.String"/>

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

int dateCount = dateBeanListSize + 1;

%>
<%@ include file="../header.jsp" %>
<%-- ヘッダーの読込 --%>
		
		<main class="formStyle tsukibetsu">
			<html:form action="/shukkinKibouKakuninInit" >
				<div class="paging">
					表示年月：
					<bean:define id="sessionYearMonth" name="tsukibetsuShiftKakuninForm" property="yearMonth" type="String"/>
					<html:select property="yearMonth" name="tsukibetsuShiftKakuninForm"  onchange="submitSearch()">
					<html:optionsCollection name="tsukibetsuShiftKakuninForm"
												property="yearMonthCmbMap"
						                        value="key"
						                        label="value"/>
					</html:select>
					<div class="paging_pre_next">
						<logic:notEqual name="tsukibetsuShiftKakuninForm" property="cntPage" value="1">
							<span class="pre"><html:link href="/kikin/tsukibetsuShiftKakuninPage.do?paging=back">前へ</html:link></span>
						</logic:notEqual>
						<logic:notEqual name="tsukibetsuShiftKakuninForm" property="cntPage" value="<%= maxPage.toString() %>">
							<span class="next"><html:link href="/kikin/tsukibetsuShiftKakuninPage.do?paging=next">次へ</html:link></span>
						</logic:notEqual>
					</div>
					<div class="paging_num">
						<bean:write name="tsukibetsuShiftKakuninForm" property="cntPage"/>/
						<bean:write name="tsukibetsuShiftKakuninForm" property="maxPage"/>
					</div>
				</div><%-- paging --%>
				
				<table class="table">
					<thead>
						<tr class="tblHeader"><th>&nbsp;</th></tr>
						<tr class="tblHeader"><th>社員名</th></tr>
						<logic:iterate offset="offset" length="<%=showLength %>" id="tsukibetsuShiftKakuninBeanList" name="tsukibetsuShiftKakuninForm" property="tsukibetsuShiftKakuninBeanList">
						<tr class="tblBody">
							<th><bean:write property="shainName" name="tsukibetsuShiftKakuninBeanList"/></th>
						</tr>
						</logic:iterate>
					</thead>
					
					<tbody>
						<%-- 日付 --%>
						<tr class="tblHeader">
							<c:forEach var="i" begin="1" end="<%= dateBeanListSize %>">
							<th>${i}</th>
							</c:forEach>
						</tr>
						
						<%-- 曜日 --%>
						<tr class="tblHeader">
							<logic:iterate id="dateBeanList" name="tsukibetsuShiftKakuninForm" property="dateBeanList">
							<bean:define id="youbi" name="dateBeanList" property="youbi"/>
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
							<logic:equal name="dateBeanList" property="shukujitsuFlg" value="true">
							<% color = "fontRed"; %>
							</logic:equal>
							<th class="<%=color %>"><bean:write property="youbi" name="dateBeanList"/></th>
							</logic:iterate>
						</tr>
						
						<%-- シンボル --%>
						<logic:iterate offset="offset" length="<%=showLength %>" id="tsukibetsuShiftKakuninBeanList" name="tsukibetsuShiftKakuninForm" property="tsukibetsuShiftKakuninBeanList">
						<html:hidden name="tsukibetsuShiftKakuninBeanList" property="registFlg" value="true" indexed="true"/>
						<tr class="tblBody">
						<td><bean:write name="tsukibetsuShiftKakuninBeanList" property="symbol01"/>&nbsp;</td>
						<td><bean:write name="tsukibetsuShiftKakuninBeanList" property="symbol02"/></td>
						<td><bean:write name="tsukibetsuShiftKakuninBeanList" property="symbol03"/></td>
						<td><bean:write name="tsukibetsuShiftKakuninBeanList" property="symbol04"/></td>
						<td><bean:write name="tsukibetsuShiftKakuninBeanList" property="symbol05"/></td>
						<td><bean:write name="tsukibetsuShiftKakuninBeanList" property="symbol05"/></td>
						<td><bean:write name="tsukibetsuShiftKakuninBeanList" property="symbol06"/></td>
						<td><bean:write name="tsukibetsuShiftKakuninBeanList" property="symbol07"/></td>
						<td><bean:write name="tsukibetsuShiftKakuninBeanList" property="symbol08"/></td>
						<td><bean:write name="tsukibetsuShiftKakuninBeanList" property="symbol09"/></td>
						<td><bean:write name="tsukibetsuShiftKakuninBeanList" property="symbol11"/></td>
						<td><bean:write name="tsukibetsuShiftKakuninBeanList" property="symbol12"/></td>
						<td><bean:write name="tsukibetsuShiftKakuninBeanList" property="symbol13"/></td>
						<td><bean:write name="tsukibetsuShiftKakuninBeanList" property="symbol14"/></td>
						<td><bean:write name="tsukibetsuShiftKakuninBeanList" property="symbol15"/></td>
						<td><bean:write name="tsukibetsuShiftKakuninBeanList" property="symbol16"/></td>
						<td><bean:write name="tsukibetsuShiftKakuninBeanList" property="symbol17"/></td>
						<td><bean:write name="tsukibetsuShiftKakuninBeanList" property="symbol18"/></td>
						<td><bean:write name="tsukibetsuShiftKakuninBeanList" property="symbol19"/></td>
						<td><bean:write name="tsukibetsuShiftKakuninBeanList" property="symbol20"/></td>
						<td><bean:write name="tsukibetsuShiftKakuninBeanList" property="symbol21"/></td>
						<td><bean:write name="tsukibetsuShiftKakuninBeanList" property="symbol22"/></td>
						<td><bean:write name="tsukibetsuShiftKakuninBeanList" property="symbol23"/></td>
						<td><bean:write name="tsukibetsuShiftKakuninBeanList" property="symbol24"/></td>
						<td><bean:write name="tsukibetsuShiftKakuninBeanList" property="symbol25"/></td>
						<td><bean:write name="tsukibetsuShiftKakuninBeanList" property="symbol26"/></td>
						<td><bean:write name="tsukibetsuShiftKakuninBeanList" property="symbol27"/></td>
						<% if (dateBeanListSize >= 28) { %>
						<td><bean:write name="tsukibetsuShiftKakuninBeanList" property="symbol28"/></td>
						<% } %>
						<% if (dateBeanListSize >= 29) { %>
						<td><bean:write name="tsukibetsuShiftKakuninBeanList" property="symbol29"/></td>
						<% } %>
						<% if (dateBeanListSize >= 30) { %>
						<td><bean:write name="tsukibetsuShiftKakuninBeanList" property="symbol30"/></td>
						<% } %>
						<% if (dateBeanListSize >= 31) { %>
						<td><bean:write name="tsukibetsuShiftKakuninBeanList" property="symbol31"/></td>
						<% } %>
						</tr>
						</logic:iterate>
					</tbody>
				</table><%-- table --%>
	        </html:form>
	        
			<div class="btn btn__bonrei">
				<input value="凡例表示" type="button" class="lngButton"  onclick="openWindow()" />
			</div>
		</main><%-- main --%>
		
		<footer class="footer">
			<div class="footer_btn footer_btn__left">
				<input value="印刷" type="button" class="smlButton"  onclick="submitPrint()" />
			</div>
		</footer><%-- footer --%>
		<p class="copy">&copy; TEAM KANNA</p>
		
	</div><%-- wrapper --%>
	
	<script type="text/javascript">
	<!--
	/**
	 * 登録
	 */
	function submitPrint() {
	    // サブミット
	    doSubmit('/kikin/tsukibetsuShiftKakuninPrint.do');
	}
	
	/**
	 * 検索
	 */
	function submitSearch() {
	    doSubmit('/kikin/tsukibetsuShiftKakuninSearch.do');
	}
	
	/**
	 * サブウィンドウを開く
	 */
	function openWindow(){
	    window.open("/kikin/shiftHanrei.do?param=", null, "menubar=no, toolbar=no, scrollbars=auto, resizable=yes, width=520px, height=650px");
	}
	-->
	</script>
</body>
</html>