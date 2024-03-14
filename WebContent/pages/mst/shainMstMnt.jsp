<!-- shainMstMnt.jsp -->
<%
/**
 * �t�@�C�����FshainMstMnt.jsp
 *
 * �ύX����
 * 1.0  2010/09/13 Kazuya.Naraki
 * 2/22 �I������ǉ� mizobe�@
 * 2/28 �s�v�R�[�h���폜 mizobe
 */
%>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@page import="business.logic.utils.CheckUtils"%>
<%@page import="form.mst.ShainMstMntForm"%>
<%@page import="java.util.List"%>
<%@page import="form.mst.ShainMstMntBean"%>
<%@page contentType="text/html; charset=Shift_JIS" pageEncoding="Shift_JIS"%>
<%@ page import="constant.RequestSessionNameConstant"%>
<%@ page import="constant.CommonConstant"%>

<bean:size id="shainMstMntBeanListSize" name="shainMstMntForm" property="shainMstMntBeanList"/>
<bean:define id="pageTitle" value="�Ј��}�X�^�����e�i���X" type="java.lang.String"/>
<bean:define id="pageName" value="shift" type="java.lang.String"/>

<%@ include file="../header.jsp" %>
<%-- �w�b�_�[�̓Ǎ� --%>
<main class="formStyle">
	<html:form action="/shainMstMntUpdate">
	<table class="tblHeader">
		<thead>
			<tr>
				<th class="w_id">�Ј��h�c</th>
				<th class="w_pass">�p�X���[�h</th>
				<th class="w_name">�Ј���</th>
				<th class="w_name">�Ј����J�i</th>
				<th class="w_role">����</th>
				<th class="w_del">�폜</th>
			</tr>
		</thead>
		<tbody>
			<logic:iterate indexId="idx" id="shainMstMntBeanList"
				name="shainMstMntForm" property="shainMstMntBeanList">
			<bean:define id="shainId" name="shainMstMntBeanList"
				property="shainId" type="java.lang.String" />
			<bean:define id="selectKengenId" name="shainMstMntBeanList"
				property="kengenId" type="java.lang.String" />
			<tr>
				<td class="w_id">
					<bean:write property="shainId" name="shainMstMntBeanList" />
					<html:hidden property="shainId" name="shainMstMntBeanList" indexed="true" />
				</td>
				<td class="w_pass"><html:password property="password" name="shainMstMntBeanList" maxlength="6" indexed="true" /></td>
				<td class="w_name"><html:text property="shainName" name="shainMstMntBeanList" maxlength="10" indexed="true" /></td>
				<td class="w_name"><html:text property="shainNameKana" name="shainMstMntBeanList" maxlength="10" indexed="true" /></td>
				<td class="w_role">
					<html:select property="kengenId" name="shainMstMntBeanList" value="<%=selectKengenId%>" indexed="true">
						<html:optionsCollection name="shainMstMntForm" property="kengenCmbMap" value="key" label="value" />
					</html:select>
				</td>
				<td class="w_del">
					<html:checkbox property="deleteShainId" name="shainMstMntBeanList" value="<%=shainId%>" onchange='<%="checkDeleteFlg(" + idx + ")"%>'></html:checkbox>
					<html:hidden property="deleteFlg" name="shainMstMntBeanList" value="false" indexed="true" />
				</td>
			</tr>
			</logic:iterate>
		</tbody>
	</table>
	</html:form>
</main>
<footer class="footer">
	<div class="footer_btn footer_btn__right">
		<input value="�V�K�o�^" type="button" class="smlButton1"  onclick="shainMstMntRegistInit()" />
         		<input value="�X�V" type="button" class="smlButton1"  onclick="shainMstMntUpdate()" />
	</div>
</footer><%-- footer --%>

</div><%-- wrapper --%>

<div class="snow">��</div>
<div class="snow snow2nd">��</div>
<script type="text/javascript">
    <!--
    /**
     * �`�F�b�N�{�b�N�X���`�F�b�N���ꂽ�� true�A����Ă��Ȃ���� false
     * param index �Ώۍs�ԍ�
     */
    function checkDeleteFlg(index) {
        var deleteShainId = document.forms[0].elements.deleteShainId;
        var isCheck = false;

        if (deleteShainId.length > 1) {
            isCheck = document.forms[0].elements.deleteShainId[index].checked;
        } else {
            isCheck = deleteShainId.checked;
        }

        document.forms[0].elements.namedItem('shainMstMntBeanList['+ index +'].deleteFlg').value = isCheck;
    }

    /**
     * �V�K�o�^��ʂ�
     */
    function shainMstMntRegistInit() {
        document.forms[0].action = "/kikin/shainMstMntRegistInit.do";
        document.forms[0].submit();
    }

    /**
     * �X�V�������s��
     */
    function shainMstMntUpdate() {
        // �ꗗ�̃T�C�Y
        var listSize = <%= shainMstMntBeanListSize %>;

        // �p�X���[�h�G���[���b�Z�[�W
        var passwordErrorMsg = '';
        // �Ј����J�i�G���[���b�Z�[�W
        var shainmeiKanaErrorMsg = '';
        var errorMsg = '';

        with(document.forms[0].elements) {
            for (var i = 0; i < listSize; i++) {
                // �p�X���[�h���擾����B
                var password = namedItem('shainMstMntBeanList['+ i +'].password').value;
                // �Ј����J�i���擾����B
                var shainNameKana = namedItem('shainMstMntBeanList['+ i +'].shainNameKana').value;

                // �w�i�F���N���A����
                namedItem('shainMstMntBeanList['+ i +'].password').style.backgroundColor = 'white';
                namedItem('shainMstMntBeanList['+ i +'].shainNameKana').style.backgroundColor = 'white';

                // �p�X���[�h�`�F�b�N
                if (!passwordErrorMsg) {
                    if (!checkRequired(password)) {
                        var strArr = ['�p�X���[�h'];
                        passwordErrorMsg = getMessage('E-MSG-000001', strArr);
                        namedItem('shainMstMntBeanList['+ i +'].password').style.backgroundColor = 'red';
                    }
                }
                // �Ј����J�i�`�F�b�N
                if (!shainmeiKanaErrorMsg) {
                    if (!checkHankakuKana(shainNameKana)) {
                        var strArr = ['�Ј����J�i'];
                        shainmeiKanaErrorMsg = getMessage('E-MSG-000003', strArr);
                        namedItem('shainMstMntBeanList['+ i +'].shainNameKana').style.backgroundColor = 'red';
                    }
                }

                if (passwordErrorMsg && shainmeiKanaErrorMsg) {
                    // �p�X���[�h �A�Ј����J�i�����ɃG���[�̏ꍇ
                    break;
                }
            }
        }
        // �G���[���b�Z�[�W
        errorMsg = passwordErrorMsg + shainmeiKanaErrorMsg;

        if (errorMsg) {
            alert(errorMsg);
            // �G���[
            return false;
        }

        document.forms[0].submit();
    }

    -->
    </script>
</body>
</html>