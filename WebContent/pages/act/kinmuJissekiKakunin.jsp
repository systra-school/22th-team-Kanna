<!-- kinmuJissekiKakunin.jsp -->
<%@page import="constant.CommonConstant.DayOfWeek"%>
<%
/**
 * t@CผFkinmuJissekiNyuryokuKakunin.jsp
 *
 * ฯX๐
 * 1.0  2010/09/13 Kazuya.Naraki
 */
%>
<%@page contentType="text/html; charset=Shift_JIS" pageEncoding="Shift_JIS"%>
<%@ page import="constant.RequestSessionNameConstant"%>
<%@ page import="constant.CommonConstant"%>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<link href="/kikin/pages/css/kinmuzisseki.css" rel="stylesheet"
	type="text/css" />
<bean:define id="pageTitle" value="ฮฑภัmF" type="java.lang.String"/>
<bean:define id="pageName" value="kinmuzisseki" type="java.lang.String"/>

<%
String color = "";
%>

<%@ include file="../header.jsp" %>
<%-- wb_[ฬว --%>

<main class="formStyle kinmuzisseki_kakunin">
	<html:form action="/shainMstMntRegist" >
	<ul class="leaf">
  <li></li>
  <li></li>
  <li></li>
  <li></li>
  <li></li>
  <li></li>
  <li></li>
  <li></li>
  <li></li>
</ul>
	<div class="ctrl_area">
		<div class="paging">
			<span class="moziColor">\ฆNF</span>
			<html:select name="kinmuJissekiKakuninForm" property="yearMonth" onchange="submitSearch()">
			<html:optionsCollection name="kinmuJissekiKakuninForm"
			                        property="yearMonthCmbMap"
			                        value="key"
			                        label="value"/>
			</html:select>
		</div><%-- paging --%>
		
		<div class="member">
			<span class="moziColor">ะ๕ผF</span>
			<html:select name="kinmuJissekiKakuninForm" property="shainId" onchange="submitSearch()">
			<html:optionsCollection name="kinmuJissekiKakuninForm"
			                        property="shainCmbMap"
			                        value="key"
			                        label="value"/>
			</html:select>
		</div><%-- member --%>
	</div> <%-- ctrl_area --%>
	
<table>
	<thead class="tblHeader">
		<tr>
			<th class="w50">๚t</th>
			<th class="w30">j</th>
			<th class="w50">Vtg</th>
			<th class="w100">Jn</th>
			<th class="w100">Iน</th>
			<th class="w100">xe</th>
			<th class="w100">ภญิ</th>
			<th class="w100">ิO</th>
			<th class="w100">x๚</th>
			<th class="w150">๕l</th>
		</tr>
	</thead>
	<tbody class="tblBody">
		<logic:iterate id="kinmuJissekiNyuryokuKakuninList" name="kinmuJissekiKakuninForm" property="kinmuJissekiNyuryokuKakuninList" indexId="idx">
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
			<logic:equal name="kinmuJissekiNyuryokuKakuninList" property="shukujitsuFlg" value="true">
			<% color = "fontRed"; %>
			</logic:equal>
			<td class="w30" class="<%=color %>"><bean:write name="kinmuJissekiNyuryokuKakuninList" property="youbi" /></td>
			
			<td class="w50"><bean:write name="kinmuJissekiNyuryokuKakuninList" property="symbol" /></td>
			<td class="w100"><bean:write name="kinmuJissekiNyuryokuKakuninList" property="startTime" /></td>
			<td class="w100"><bean:write name="kinmuJissekiNyuryokuKakuninList" property="endTime" /></td>
			<td class="w100"><bean:write name="kinmuJissekiNyuryokuKakuninList" property="breakTime" /></td>
			<td class="w100"><bean:write name="kinmuJissekiNyuryokuKakuninList" property="jitsudouTime" /></td>
			<td class="w100"><bean:write name="kinmuJissekiNyuryokuKakuninList" property="jikangaiTime" /></td>
			<td class="w100"><bean:write name="kinmuJissekiNyuryokuKakuninList" property="kyuujitsuTime" /></td>
			<td class="w150"><bean:write name="kinmuJissekiNyuryokuKakuninList" property="bikou" /></td>
		</tr>
		</logic:iterate>
	</tbody>
</table>
</html:form>
</main>
</div><%-- wrapper --%>
</body>
</html>