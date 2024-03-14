<!-- hibetsuShift.jsp -->
<%@page import="business.logic.utils.CheckUtils"%>
<%@page import="form.common.DateBean"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="form.shk.ShukkinKibouKakuninForm"%>
<%
/**
 * ファイル名：hibetsuShift.jsp
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

<bean:size id="hibetsuShiftBeanListSize" name="hibetsuShiftForm"  property="hibetsuShiftBeanList"/>
<bean:define id="pageTitle" value="日別シフト確認" type="java.lang.String"/>
<bean:define id="pageName" value="hibetsu" type="java.lang.String"/>

<%
    int bodyRightDivWidth = 0;
    int bodyRightDivHeight = 0;
    int bodyLeftDivHeight = 0;
    // ボディテーブルの td の幅
    int tdWidth = 200;
    // ボディテーブルの tr の縦
    int trHeight = 50;
    // 縦スクロールバーの幅
    int scrollBarSize = 20;
    if (hibetsuShiftBeanListSize < 6) {
        bodyRightDivWidth = hibetsuShiftBeanListSize * tdWidth + scrollBarSize;
        bodyRightDivHeight = 402;
        bodyLeftDivHeight = 402;
    } else {
        bodyRightDivWidth = 918;
        bodyRightDivHeight = 418;
        bodyLeftDivHeight = 402;
    }

    // 本日の日付を取得
    Date dateToday = new Date();
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
    String today = dateFormat.format(dateToday);
    
    // 月末を取得
    Calendar cal = Calendar.getInstance();
    int thisYear = cal.get(Calendar.YEAR);
    int thisMonth = cal.get(Calendar.MONTH);
    int threeMonthLater = thisMonth + 3;
    cal.set(Calendar.YEAR, thisYear);
    cal.set(Calendar.MONTH, threeMonthLater);
    int lastDay = cal.getActualMaximum(Calendar.DATE);
    String lastDayStr = "";
    if((threeMonthLater + 1) < 10){
    	lastDayStr = thisYear + "/0" + (threeMonthLater + 1) + "/" + lastDay;
    }else{
    	lastDayStr = thisYear + "/" + (threeMonthLater + 1) + "/" + lastDay;
    }
    System.out.println(lastDayStr);
%>

<%@ include file="../header.jsp" %>
<%-- ヘッダーの読込 --%>

<main class="formStyle">
	<html:form>
		<div class="paging">
		表示年月：
		<div class="paging_pre_next">
			<logic:notEqual name="hibetsuShiftForm" property="yearMonthDayDisp" value="<%= today %>">
				<span class="pre"><html:link href="/kikin/hibetsuShiftPage.do?paging=back">前日</html:link></span>
			</logic:notEqual>
			<bean:write name="hibetsuShiftForm" property="yearMonthDayDisp"/>
			<logic:notEqual name="hibetsuShiftForm" property="yearMonthDayDisp" value="<%= lastDayStr %>">
				<span class="next"><html:link href="/kikin/hibetsuShiftPage.do?paging=next">翌日</html:link></span>
			</logic:notEqual>
		</div>
		</div><%-- paging --%>
		
		<table class="colHead">
			<tr>
				<td>
					<div id="headLeftTbl">
						<table class="tblHeader"><tr><th style="border-left: 1px solid #252525;">時間</th></tr></table>
					</div>
				</td>
				
				<td width="100%" valign="top">
					<div id="headRightTbl" onScroll="onScroll();">
						<table class="tblHeader">
							<tr>
								<logic:iterate id="hibetsuShiftBean" name="hibetsuShiftForm" property="hibetsuShiftBeanList">
								<th><bean:write name="hibetsuShiftBean" property="shainName"/></th>
								</logic:iterate>
							</tr>
						</table>
					</div>
				</td>
			</tr>
		</table><%-- 列タイトル --%>
		
		<table>
			<tr height="100%">
				<td valign="top" width="154px">
					<div id="bodyLeftTbl" style="height:<%=bodyLeftDivHeight %>px;">
						<table class="tblBody" >
							<c:forEach var="i" begin="0" end="8">
							<tr><th>0${i}:00&#xFF5E;0${i + 1}:00</th></tr>
							</c:forEach>
							<tr><th>09:00&#xFF5E;10:00</th></tr>
							<c:forEach var="i" begin="10" end="23">
							<tr><th>${i}:00&#xFF5E;${i + 1}:00</th></tr>
							</c:forEach>
						</table>
					</div>
				</td><%-- 行タイトル --%>
				
				<td width="100%" valign="top">
					<div id="bodyRightTbl"  style="height:<%=bodyRightDivHeight %>px;" onScroll="onScroll();">
						<table class="tblBody">
						
							<%-- boolTime00~08 --%>
							<c:forEach var="i" begin="0" end="8">
							<tr>
								<logic:iterate id="hibetsuShiftBean" name="hibetsuShiftForm" property="hibetsuShiftBeanList">
								<logic:equal value="true" name="hibetsuShiftBean" property="boolTime0${i}">
								<% // 出勤予定の時間帯 %>
								<td bgcolor="LightPink">
									<logic:empty name="hibetsuShiftBean" property="strTime0${i}" ><br></logic:empty>
									<logic:notEmpty name="hibetsuShiftBean" property="strTime0${i}" >
									<div>
										<bean:write name="hibetsuShiftBean" property="strTime0${i}"/>：
										<logic:equal value="出勤" name="hibetsuShiftBean" property="strTime0${i}">
										<bean:write name="hibetsuShiftBean" property="startTime"/>
										&#xFF5E;
										<bean:write name="hibetsuShiftBean" property="endTime"/>
										<br>
										<bean:write name="hibetsuShiftBean" property="breakTime"/>
										</logic:equal>
									</div>
									</logic:notEmpty>
								</td>
								</logic:equal>
								
								<logic:equal value="false" name="hibetsuShiftBean" property="boolTime0${i}">
								<% // 出勤予定外の時間帯 %>
								<td>
									<logic:empty name="hibetsuShiftBean" property="strTime0${i}" ><br></logic:empty>
									<logic:notEmpty name="hibetsuShiftBean" property="strTime0${i}" >
									<bean:write name="hibetsuShiftBean" property="strTime0${i}"/>
									</logic:notEmpty>
								</td>
								</logic:equal>
								</logic:iterate>
							</tr>
							</c:forEach>
							
							<%-- boolTime09 --%>
							<tr>
								<logic:iterate id="hibetsuShiftBean" name="hibetsuShiftForm" property="hibetsuShiftBeanList">
								<logic:equal value="true" name="hibetsuShiftBean" property="boolTime09">
								<% // 出勤予定の時間帯 %>
								<td bgcolor="LightPink">
									<logic:empty name="hibetsuShiftBean" property="strTime09" ><br></logic:empty>
									<logic:notEmpty name="hibetsuShiftBean" property="strTime09" >
									<div>
										<bean:write name="hibetsuShiftBean" property="strTime09"/>：
										<logic:equal value="出勤" name="hibetsuShiftBean" property="strTime09">
										<bean:write name="hibetsuShiftBean" property="startTime"/>
										&#xFF5E;
										<bean:write name="hibetsuShiftBean" property="endTime"/>
										<br>
										<bean:write name="hibetsuShiftBean" property="breakTime"/>
										</logic:equal>
									</div>
									</logic:notEmpty>
								</td>
								</logic:equal>
								
								<logic:equal value="false" name="hibetsuShiftBean" property="boolTime09">
								<% // 出勤予定外の時間帯 %>
								<td>
									<logic:empty name="hibetsuShiftBean" property="strTime09" ><br></logic:empty>
									<logic:notEmpty name="hibetsuShiftBean" property="strTime09" >
									<bean:write name="hibetsuShiftBean" property="strTime09"/>
									</logic:notEmpty>
								</td>
								</logic:equal>
								</logic:iterate>
							</tr>
							
							<%-- boolTime10~23 --%>
							<c:forEach var="i" begin="10" end="23">
							<tr>
								<logic:iterate id="hibetsuShiftBean" name="hibetsuShiftForm" property="hibetsuShiftBeanList">
								<logic:equal value="true" name="hibetsuShiftBean" property="boolTime${i}">
								<% // 出勤予定の時間帯 %>
								<td bgcolor="LightPink">
									<logic:empty name="hibetsuShiftBean" property="strTime${i}" ><br></logic:empty>
									<logic:notEmpty name="hibetsuShiftBean" property="strTime${i}" >
									<div>
										<bean:write name="hibetsuShiftBean" property="strTime${i}"/>：
										<logic:equal value="出勤" name="hibetsuShiftBean" property="strTime${i}">
										<bean:write name="hibetsuShiftBean" property="startTime"/>
										&#xFF5E;
										<bean:write name="hibetsuShiftBean" property="endTime"/>
										<br>
										<bean:write name="hibetsuShiftBean" property="breakTime"/>
										</logic:equal>
									</div>
									</logic:notEmpty>
								</td>
								</logic:equal>
								
								<logic:equal value="false" name="hibetsuShiftBean" property="boolTime${i}">
								<% // 出勤予定外の時間帯 %>
								<td>
									<logic:empty name="hibetsuShiftBean" property="strTime${i}" ><br></logic:empty>
									<logic:notEmpty name="hibetsuShiftBean" property="strTime${i}" >
									<bean:write name="hibetsuShiftBean" property="strTime${i}"/>
									</logic:notEmpty>
								</td>
								</logic:equal>
								</logic:iterate>
							</tr>
							</c:forEach>
						</table>
					</div>
				</td>
			</tr>
		</table>
	</html:form>
</main>
</div><%-- wrapper --%>

<div class="container">
	<div class="drops">
		<div></div><div></div><div></div><div></div><div></div>
		<div></div><div></div><div></div><div></div><div></div>
	</div>
	<div class="bar1"></div>
	<div class="bar2"></div>
</div>
    
<script type="text/javascript">
<!--

/**
 * 検索
 */
function submitSearch() {
    doSubmit('/kikin/shukkinKibouKakuninShow.do');
}

/**
 * スクロールを同期させる
 */
function onScroll() {
    headRightTbl.scrollLeft = bodyRightTbl.scrollLeft;
    bodyLeftTbl.scrollTop = bodyRightTbl.scrollTop;
}

function resizeWindow(){
	let windowSize = window.innerWidth;
	let tableSize = (windowSize / 100 * 90) - 200;
    //console.log(tableSize);
    
    let target1 = document.getElementById('headRightTbl');
    let target2 = document.getElementById('bodyRightTbl');
    target1.style.width = tableSize;
    target2.style.width = tableSize;
}
window.addEventListener('load', resizeWindow);
window.addEventListener('resize', resizeWindow);

-->
</script>

</body>
</html>