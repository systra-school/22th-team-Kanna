<!-- tsukibetsuShiftKakunin.jsp -->
<%@page import="constant.CommonConstant.DayOfWeek"%>
<%@page import="business.logic.utils.CheckUtils"%>
<%@page import="form.common.DateBean"%>
<%@page import="java.util.List"%>
<%@page import="form.mth.TsukibetsuShiftKakuninForm"%>
<%
/**
 * �t�@�C�����FtsukibetsuShiftKakunin.jsp
 *
 * �ύX����
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
<bean:define id="pageTitle" value="���ʃV�t�g�m�F" type="java.lang.String"/>
<bean:define id="pageName" value="tsukibetsu" type="java.lang.String"/>

<%
final int heightSize = 22;

int intShowLength = Integer.parseInt(showLength);

// �\�����Ă��郊�X�g�T�C�Y�̒���
if (cntPage.intValue() == maxPage.intValue()) {
    listSize = listSize % intShowLength;
}

if (listSize > intShowLength) {
    listSize = intShowLength;
}

int dateCount = dateBeanListSize + 1;

%>
<%@ include file="../header.jsp" %>
<%-- �w�b�_�[�̓Ǎ� --%>
		
		<main class="formStyle">
			<html:form action="/shukkinKibouKakuninInit" >
				<div class="paging">
					�\���N���F
					<bean:define id="sessionYearMonth" name="tsukibetsuShiftKakuninForm" property="yearMonth" type="String"/>
					<html:select property="yearMonth" name="tsukibetsuShiftKakuninForm"  onchange="submitSearch()">
					<html:optionsCollection name="tsukibetsuShiftKakuninForm"
												property="yearMonthCmbMap"
						                        value="key"
						                        label="value"/>
					</html:select>
					<div class="paging_pre_next">
						<logic:notEqual name="tsukibetsuShiftKakuninForm" property="cntPage" value="1">
							<span class="pre"><html:link href="/kikin/tsukibetsuShiftKakuninPage.do?paging=back">�O��</html:link></span>
						</logic:notEqual>
						<logic:notEqual name="tsukibetsuShiftKakuninForm" property="cntPage" value="<%= maxPage.toString() %>">
							<span class="next"><html:link href="/kikin/tsukibetsuShiftKakuninPage.do?paging=next">����</html:link></span>
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
						<tr class="tblHeader"><th>�Ј���</th></tr>
						<logic:iterate offset="offset" length="<%=showLength %>" id="tsukibetsuShiftKakuninBeanList" name="tsukibetsuShiftKakuninForm" property="tsukibetsuShiftKakuninBeanList">
						<tr class="tblBody">
							<th><bean:write property="shainName" name="tsukibetsuShiftKakuninBeanList"/></th>
						</tr>
						</logic:iterate>
					</thead>
					
					<tbody>
						<%-- ���t --%>
						<tr class="tblHeader">
							<c:forEach var="i" begin="1" end="<%= dateBeanListSize %>">
							<th>${i}</th>
							</c:forEach>
						</tr>
						
						<%-- �j�� --%>
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
							<%-- �j���̗j����ԐF�ɂ���i20247/02/29�@���c�j --%>
							<logic:equal name="dateBeanList" property="shukujitsuFlg" value="true">
							<% color = "fontRed"; %>
							</logic:equal>
							<th class="<%=color %>"><bean:write property="youbi" name="dateBeanList"/></th>
							</logic:iterate>
						</tr>
						
						<%-- �V���{�� --%>
						<logic:iterate offset="offset" length="<%=showLength %>" id="tsukibetsuShiftKakuninBeanList" name="tsukibetsuShiftKakuninForm" property="tsukibetsuShiftKakuninBeanList">
						<html:hidden name="tsukibetsuShiftKakuninBeanList" property="registFlg" value="true" indexed="true"/>
						<tr class="tblBody">
							<c:forEach var="i" begin="1" end="9">
							<td><bean:write name="tsukibetsuShiftKakuninBeanList" property="symbol0${i}"/></td>
							</c:forEach>
							<c:forEach var="i" begin="10" end="${dateBeanListSize}">
							<td><bean:write name="tsukibetsuShiftKakuninBeanList" property="symbol${i}"/></td>
							</c:forEach>
						</tr>
						</logic:iterate>
					</tbody>
				</table><%-- table --%>
	        </html:form>
	        
			<div class="btn btn__bonrei">
				<input value="�}��\��" type="button" class="lngButton"  onclick="openWindow()" />
			</div>
		</main><%-- main --%>
		
		<footer class="footer">
			<div class="footer_btn footer_btn__left">
				<input value="���" type="button" class="smlButton"  onclick="submitPrint()" />
			</div>
		</footer><%-- footer --%>
		<p class="copy">&copy; TEAM KANNA</p>
		
	</div><%-- wrapper --%>
	
	<script type="text/javascript">
	<!--
	/**
	 * �o�^
	 */
	function submitPrint() {
	    // �T�u�~�b�g
	    doSubmit('/kikin/tsukibetsuShiftKakuninPrint.do');
	}
	
	/**
	 * ����
	 */
	function submitSearch() {
	    doSubmit('/kikin/tsukibetsuShiftKakuninSearch.do');
	}
	
	/**
	 * �T�u�E�B���h�E���J��
	 */
	function openWindow(){
	    window.open("/kikin/shiftHanrei.do?param=", null, "menubar=no, toolbar=no, scrollbars=auto, resizable=yes, width=520px, height=650px");
	}
	-->
	</script>
</body>
</html>