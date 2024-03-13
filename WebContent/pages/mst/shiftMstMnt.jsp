<!-- shiftMstMnt.jsp -->
<%@page import="business.logic.utils.CheckUtils"%>
<%@page import="form.mst.ShiftMstMntBean"%>
<%@page import="java.util.List"%>
<%@page import="form.mst.ShiftMstMntForm"%>
<%
/**
 * �t�@�C�����FshiftMstMnt.jsp
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
<bean:size id="beanListSize" name="shiftMstMntForm"
	property="shiftMstMntBeanList" />
<html>
<head>
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="Thu, 01 Dec 1994 16:00:00 GMT">
<script type="text/javascript" src="/kikin/pages/js/common.js"></script>
<script type="text/javascript" src="/kikin/pages/js/checkCommon.js"></script>
<script type="text/javascript" src="/kikin/pages/js/message.js"></script>
<script type="text/javascript" language="Javascript1.1">
    <!--
    /**
     * �`�F�b�N�{�b�N�X���`�F�b�N���ꂽ�� true�A����Ă��Ȃ���� false
     * param index �Ώۍs�ԍ�
     */
     function checkDeleteFlg(index) {
         var deleteShiftId = document.forms[0].elements.deleteShiftId;
         var isCheck = false;
         if (deleteShiftId.length > 1) {
             isCheck = document.forms[0].elements.deleteShiftId[index].checked;
         } else {
             isCheck = deleteShiftId.checked;
         }
         document.forms[0].elements.namedItem('shiftMstMntBeanList['+ index +'].deleteFlg').value = isCheck;
     }
    /**
     * �V�K�o�^��ʂ�
     */
    function shiftMstMntRegistInit() {
        document.forms[0].action = "/kikin/shiftMstMntRegistInit.do";
        document.forms[0].submit();
    }
    /**
     * �X�V�������s��
     */
    function shiftMstMntUpdate() {
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
                var startTime = namedItem('shiftMstMntBeanList['+ i +'].startTime').value;
                // �I�����Ԃ��擾����B
                var endTime = namedItem('shiftMstMntBeanList['+ i +'].endTime').value;
                // �x�e���Ԃ��擾����B
                var breakTime = namedItem('shiftMstMntBeanList['+ i +'].breakTime').value;
                // �w�i�F���N���A����
                namedItem('shiftMstMntBeanList['+ i +'].startTime').style.backgroundColor = 'white';
                namedItem('shiftMstMntBeanList['+ i +'].endTime').style.backgroundColor = 'white';
                namedItem('shiftMstMntBeanList['+ i +'].breakTime').style.backgroundColor = 'white';
                // ���ԃ`�F�b�N
                if (!startTimeErrMsg) {
                    if (!checkTime(startTime)) {
                        var strArr = ['�J�n����'];
                        startTimeErrMsg = getMessage('E-MSG-000004', strArr);
                        namedItem('shiftMstMntBeanList['+ i +'].startTime').style.backgroundColor = 'red';
                    }
                }
                if (!endTimeErrMsg) {
                    if (!checkTime(endTime)) {
                        var strArr = ['�I������'];
                        endTimeErrMsg = getMessage('E-MSG-000004', strArr);
                        namedItem('shiftMstMntBeanList['+ i +'].endTime').style.backgroundColor = 'red';
                    }
                }
                if (!breakTimeErrMsg) {
                    if (!checkTime(breakTime)) {
                        var strArr = ['�x�e����'];
                        breakTimeErrMsg = getMessage('E-MSG-000004', strArr);
                        namedItem('shiftMstMntBeanList['+ i +'].breakTime').style.backgroundColor = 'red';
                    }
                }
                // from - to �̃`�F�b�N
                if (!checkTimeCompare(startTime, endTime)) {
                  if (checkTime(startTime) && checkTime(endTime)) {
                      fromToErrMsg = getMessageCodeOnly('E-MSG-000005');
                      namedItem('shiftMstMntBeanList['+ i +'].startTime').style.backgroundColor = 'red';
                      namedItem('shiftMstMntBeanList['+ i +'].endTime').style.backgroundColor = 'red';
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
    -->
    </script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>�V�t�g�}�X�^�����e�i���X���</title>
<link href="/kikin/pages/css/shift.css" rel="stylesheet"type="text/css" />
</head>
<body>
	<div id="wrapper">
		<div id="header">
			<table>
				<tr>
					<td id="headLeft"><input value="�߂�" type="button"
						class="smlButton1" onclick="doSubmit('/kikin/shiftMstMntBack.do')" />
					</td>
					<td id="headCenter">�V�t�g�}�X�^�����e�i���X</td>
					<td id="headRight"><input value="���O�A�E�g" type="button"
						class="smlButton1" onclick="logout()" /></td>
				</tr>
			</table>
		</div>
		<div id="gymBody">
			<html:form action="/shiftMstMntUpdate">
			<table border="1" cellpadding="0" cellspacing="0" align ="center">
				<div  style="overflow: auto">
						<tr class="tblHeader">
							<td width="106.5px" align="center">�V�t�g��</td>
							<td width="67.5px" align="center">�V���{��</td>
							<td width="244.5px" align="center">����</td>
							<td width="105px" align="center">�x�e</td>
							<td width="64px" align="center">�폜</td>
						</tr>
					<logic:iterate indexId="idx" id="shiftMstMntBeanList"
						name="shiftMstMntForm" property="shiftMstMntBeanList">
						<bean:define id="shiftId" name="shiftMstMntBeanList"
							property="shiftId" type="java.lang.String" />
						<tr class="tblBody">
							<td width="100px" align="center"><html:text
									property="shiftName" name="shiftMstMntBeanList" size="8"
									maxlength="10" indexed="true" /> <html:hidden
									property="shiftId" name="shiftMstMntBeanList" indexed="true" />
							</td>
							<td width="70px" align="center"><html:text property="symbol"
									name="shiftMstMntBeanList" size="2" maxlength="2"
									indexed="true" />
							</td>
							<td width="230px" align="center">
								<table width="100%">
									<tr>
										<td align="center"><html:text property="startTime"
												name="shiftMstMntBeanList" size="5" maxlength="5"
												indexed="true" />
										</td>
										<td align="center">&#xFF5E;</td>
										<td align="center"><html:text property="endTime"
												name="shiftMstMntBeanList" size="5" maxlength="5"
												indexed="true" />
										</td>
									</tr>
								</table>
							</td>
							<td width="100px" align="center"><html:text
									property="breakTime" name="shiftMstMntBeanList" size="5"
									maxlength="5" indexed="true" />
							</td>
							<td width="70px" align="center"><html:checkbox
									property="deleteShiftId" name="shiftMstMntBeanList"
									value="<%= shiftId %>"
									onchange='<%="checkDeleteFlg(" + idx + ")" %>'></html:checkbox>
								<html:hidden property="deleteFlg" name="shiftMstMntBeanList"
									value="false" indexed="true" />
							</td>
						</tr>
					</logic:iterate>
				</div>
			</table>
			</html:form>
		</div>
		<div id="footer">
			<table>
				<tr>
					<td id="footLeft"></td>
					<td id="footCenter"></td>
					<td id="footRight"><input value="�V�K�o�^" type="button"
						class="smlButton1" onclick="shiftMstMntRegistInit()" /> <input
						value="�X�V" type="button" class="smlButton1"
						onclick="shiftMstMntUpdate()" /></t	d>
				</tr>
			</table>
		</div>
	</div>
	<div class="snow">��</div>
<div class="snow snow2nd">��</div>
</body>
</html>