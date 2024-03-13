<!-- kinmuJissekiNyuryokuKakunin.jsp -->
<%@page import="constant.CommonConstant.DayOfWeek"%>
<%
/**
 * �t�@�C�����FkinmuJissekiNyuryokuKakunin.jsp
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
<bean:define id="color" value="" type="java.lang.String"/>
<bean:size id="dateBeanListSize" name="kinmuJissekiNyuryokuKakuninForm"  property="dateBeanList"/>
<bean:define id="pageTitle" value="�Ζ����ѓ���" type="java.lang.String"/>
<bean:define id="pageName" value="kinmuzisseki" type="java.lang.String"/>
<bean:size id="beanListSize" name="kinmuJissekiNyuryokuKakuninForm" property="kinmuJissekiNyuryokuKakuninList" />

<%@ include file="../header.jsp" %>
<%-- �w�b�_�[�̓Ǎ� --%>

	<main class="formStyle kinmuzisseki_nyuuryoku">
		<html:form action="/kinmuJissekiNyuryokuKakuninRegist">
		<div class="ctrl_area">
			<div class="paging">
				<span class="moziColor">�\���N���F</span>
				<html:select name="kinmuJissekiNyuryokuKakuninForm" property="yearMonth" onchange="submitSearch()">
				<html:optionsCollection name="kinmuJissekiNyuryokuKakuninForm"
				                        property="yearMonthCmbMap"
				                        value="key"
				                        label="value"/>
				</html:select>
			</div><%-- paging --%>
			
			<div class="member moziColor">
				�Ј�ID&nbsp;<bean:write name="kinmuJissekiNyuryokuKakuninForm" property="shainId"/>
				�F�Ј���&nbsp;<bean:write name="kinmuJissekiNyuryokuKakuninForm" property="shainName"/>
			</div><%-- member --%>
		</div><%-- ctrl_area --%>
		
		
		<table>
			<thead class="tblHeader">
				<tr>
					<th class="w50">���t</th>
					<th class="w30">�j</th>
					<th class="w50">�V�t�g</th>
					<th class="w100">�J�n����</th>
					<th class="w100">�I������</th>
					<th class="w100">�x�e</th>
					<th class="w100">��������</th>
					<th class="w100">���ԊO</th>
					<th class="w100">�x��</th>
					<th class="w150">���l</th>
				</tr>
			</thead>
			<tbody class="tblBody">
			<%-- width������� --%>
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
						<%-- ���C�A�E�g�C��(size�̒l���C��) --%>
						<html:text style="text-align:center" size="5" maxlength="5" name="kinmuJissekiNyuryokuKakuninList" property="startTime" indexed="true"></html:text><br>
						<%-- <html:text style="text-align:center" size="10" maxlength="5" name="kinmuJissekiNyuryokuKakuninList" property="startTime" indexed="true"></html:text><br> --%>
					</td>
					<td class="w100">
						<%-- ���C�A�E�g�C��(size�̒l���C��) --%>
						<html:text style="text-align:center" size="5" maxlength="5" name="kinmuJissekiNyuryokuKakuninList" property="endTime" indexed="true"></html:text><br>
						<%-- <html:text style="text-align:center" size="10" maxlength="5" name="kinmuJissekiNyuryokuKakuninList" property="endTime" indexed="true"></html:text><br> --%>
					</td>
					<td class="w100">
						<%-- ���C�A�E�g�C��(size�̒l���C��) --%>
						<html:text style="text-align:center" size="5" maxlength="5" name="kinmuJissekiNyuryokuKakuninList" property="breakTime" indexed="true"></html:text><br>
						<%-- <html:text style="text-align:center" size="10" maxlength="5" name="kinmuJissekiNyuryokuKakuninList" property="breakTime" indexed="true"></html:text><br> --%>
					</td>
					<td class="w100"><bean:write name="kinmuJissekiNyuryokuKakuninList" property="jitsudouTime" /></td>
					<td class="w100"><bean:write name="kinmuJissekiNyuryokuKakuninList" property="jikangaiTime" /></td>
					<td class="w100"><bean:write name="kinmuJissekiNyuryokuKakuninList" property="kyuujitsuTime" /></td>
					<%-- align��left����center�� --%>
					<td class="w150" align="center">
						<%-- ���C�A�E�g�C��(size�̒l���C��) --%>
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
			<input value="�o�^"  type="button" class="smlButton"  onclick="regist()" />
		</div>
	</footer><%-- footer --%>

</div><%-- wrapper --%>

<script type="text/javascript">
<!--

/**
 * �o�^��
 */
 function regist() {
	 // �ꗗ�̃T�C�Y
    var listSize = <%= beanListSize %>;
    // �J�n���ԃG���[���b�Z�[�W
    var startTimeErrMsg = '';
    // �I�����ԃG���[���b�Z�[�W
    var endTimeErrMsg = '';
    // �x�e���ԃG���[���b�Z�[�W
    var breakTimeErrMsg = '';
    // From - To �G���[���b�Z�[�W
    var fromToErrMsg = '';
    // �G���[���b�Z�[�W
    var errorMsg = '';
    with(document.forms[0].elements) {
        for (var i = 0; i < listSize; i++) {
            // �J�n���Ԃ��擾����B
            var startTime = namedItem('kinmuJissekiNyuryokuKakuninList['+ i +'].startTime').value;
            // �I�����Ԃ��擾����B
            var endTime = namedItem('kinmuJissekiNyuryokuKakuninList['+ i +'].endTime').value;
            // �x�e���Ԃ��擾����B
            var breakTime = namedItem('kinmuJissekiNyuryokuKakuninList['+ i +'].breakTime').value;
            // �w�i�F���N���A����
            namedItem('kinmuJissekiNyuryokuKakuninList['+ i +'].startTime').style.backgroundColor = 'white';
            namedItem('kinmuJissekiNyuryokuKakuninList['+ i +'].endTime').style.backgroundColor = 'white';
            namedItem('kinmuJissekiNyuryokuKakuninList['+ i +'].breakTime').style.backgroundColor = 'white';
            // ���͂���ĂȂ��ꍇ�ɃX�L�b�v
            if(startTime === '' || endTime === '' || breakTime === ''){
            	continue;
            }
            // ���ԃ`�F�b�N
            if (!startTimeErrMsg) {
                if (!checkTime(startTime)) {
                    var strArr = ['�J�n����'];
                    startTimeErrMsg = getMessage('E-MSG-000004', strArr);
                    namedItem('kinmuJissekiNyuryokuKakuninList['+ i +'].startTime').style.backgroundColor = 'red';
                }
            }
            if (!endTimeErrMsg) {
                if (!checkTime(endTime)) {
                    var strArr = ['�I������'];
                    endTimeErrMsg = getMessage('E-MSG-000004', strArr);
                    namedItem('kinmuJissekiNyuryokuKakuninList['+ i +'].endTime').style.backgroundColor = 'red';
                }
            }
            if (!breakTimeErrMsg) {
                if (!checkTime(breakTime)) {
                    var strArr = ['�x�e����'];
                    breakTimeErrMsg = getMessage('E-MSG-000004', strArr);
                    namedItem('kinmuJissekiNyuryokuKakuninList['+ i +'].breakTime').style.backgroundColor = 'red';
                }
            }
            // from - to �̃`�F�b�N
            if (!checkTimeCompare(startTime, endTime)) {
              if (checkTime(startTime) && checkTime(endTime)) {
                  fromToErrMsg = getMessageCodeOnly('E-MSG-000005');
                  namedItem('kinmuJissekiNyuryokuKakuninList['+ i +'].startTime').style.backgroundColor = 'red';
                  namedItem('kinmuJissekiNyuryokuKakuninList['+ i +'].endTime').style.backgroundColor = 'red';
              }
            }
        }
    }
    // �G���[���b�Z�[�W
    errorMsg = startTimeErrMsg + endTimeErrMsg + breakTimeErrMsg + fromToErrMsg;
    if (errorMsg) {
        alert(errorMsg);
        // �G���[
        return false;
    }
    document.forms[0].submit();
}
/**
 * ����
 */
function submitSearch() {
    doSubmit('/kikin/kinmuJissekiNyuryokuKakuninSearch.do');
}
-->
//# sourceURL = asdf.js
</script>
</body>
</html>