<!-- tsukibetsuShiftNyuuryoku.jsp -->
<%@page import="constant.CommonConstant.DayOfWeek"%>
<%@page import="business.logic.utils.CheckUtils"%>
<%@page import="form.common.DateBean"%>
<%@page import="java.util.List"%>
<%@page import="form.mth.TsukibetsuShiftNyuuryokuForm"%>
<%
/**
 * �t�@�C�����FtsukibetsuShiftNyuuryoku.jsp
 *
 * �ύX����
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
<bean:define id="pageTitle" value="���ʃV�t�g����" type="java.lang.String" />
<bean:define id="pageName" value="tsukibetsu" type="java.lang.String" />

<!-- �n���� -->
<bean:define id="haikei" value="bcColor" type="java.lang.String" />

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
%>
<%@ include file="../header.jsp"%>
<%-- �w�b�_�[�̓Ǎ� --%>

<main class="formStyle">
	<%-- ��ʑJ�ڃG���[���C���iform��action�̒l��ύX�j2024/02/23�@���c --%>
	<html:form action="/tsukibetsuShiftNyuuryokuInit">
		<div class="paging">
			�\���N���F
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
							style="color: #fff;">�O��</html:link></span>
				</logic:notEqual>
				<logic:notEqual name="tsukibetsuShiftNyuuryokuForm"
					property="cntPage" value="<%=maxPage.toString()%>">
					<span class="next"><html:link
							href="/kikin/tsukibetsuShiftNyuuryokuPage.do?paging=next"
							style="color: #fff;">����</html:link></span>
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
					<th>�Ј���</th>
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
				<%-- ���t --%>
				<tr class="tblHeader">
					<c:forEach var="i" begin="1" end="<%=dateBeanListSize%>">
						<th>${i}</th>
					</c:forEach>
				</tr>

				<%-- �j�� --%>
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
						<%-- �j���̗j����ԐF�ɂ���i20247/02/29�@���c�j --%>
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

					<!--�n����  -->
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
		<input value="�}��\��" type="button" class="lngButton"
			onclick="openWindow()" style="height: 37px;" /> <input
			value="��{�V�t�g���f" type="button" class="lngButton"
			onclick="submitKihonShift()" style="height: 37px;" />
		<%-- onclick������ǉ��i2024/02/23�@���c�j --%>
		<input value="�o�Ί�]�����f" type="button" class="lngButton"
			onclick="submitShukkinKibou()" style="height: 37px;" />
	</div>
</main>

<footer class="footer">
	<div class="footer_btn footer_btn__right">
		<input value="�o�^" type="button" class="smlButton"
			onclick="submitRegist()" />
	</div>
</footer>
<%-- footer --%>

</div>
<%-- wrapper --%>

<script type="text/javascript">
<!--
	/**
	 *��{�V�t�g���f�i�ǉ��@2024/02/23�@���c�j
	 */
	function submitKihonShift() {
		// �T�u�~�b�g
		doSubmit('/kikin/tsukibetsuShiftNyuuryokuKihonShift.do');
	}

	/**
	 * �o�Ί�]���f
	 */
	function submitShukkinKibou() {
		// �T�u�~�b�g
		doSubmit('/kikin/tsukibetsuShiftNyuuryokuShukkinKibou.do');
	}

	/**
	 * �o�^
	 */
	function submitRegist() {
		// �T�u�~�b�g
		doSubmit('/kikin/tsukibetsuShiftNyuuryokuRegist.do');
	}

	/**
	 * ����
	 */
	function submitSearch() {
		doSubmit('/kikin/tsukibetsuShiftNyuuryokuSearch.do');
	}

	/**
	 * �T�u�E�B���h�E���J��
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