<!-- shainMstMnt.jsp -->
<%
/**
 * ファイル名：shainMstMnt.jsp
 *
 * 変更履歴
 * 1.0  2010/09/13 Kazuya.Naraki
 * 2/22 選択肢を追加 mizobe　
 * 2/28 不要コードを削除 mizobe
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
<bean:define id="pageTitle" value="社員マスタメンテナンス" type="java.lang.String"/>
<bean:define id="pageName" value="shift" type="java.lang.String"/>

<%@ include file="../header.jsp" %>
<%-- ヘッダーの読込 --%>
<main class="formStyle">
	<html:form action="/shainMstMntUpdate">
	<table class="tblHeader">
		<thead>
			<tr>
				<th class="w_id">社員ＩＤ</th>
				<th class="w_pass">パスワード</th>
				<th class="w_name">社員名</th>
				<th class="w_name">社員名カナ</th>
				<th class="w_role">権限</th>
				<th class="w_del">削除</th>
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
		<input value="新規登録" type="button" class="smlButton1"  onclick="shainMstMntRegistInit()" />
         		<input value="更新" type="button" class="smlButton1"  onclick="shainMstMntUpdate()" />
	</div>
</footer><%-- footer --%>

</div><%-- wrapper --%>

<div class="snow">●</div>
<div class="snow snow2nd">●</div>
<script type="text/javascript">
    <!--
    /**
     * チェックボックスがチェックされたら true、されていなければ false
     * param index 対象行番号
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
     * 新規登録画面へ
     */
    function shainMstMntRegistInit() {
        document.forms[0].action = "/kikin/shainMstMntRegistInit.do";
        document.forms[0].submit();
    }

    /**
     * 更新処理を行う
     */
    function shainMstMntUpdate() {
        // 一覧のサイズ
        var listSize = <%= shainMstMntBeanListSize %>;

        // パスワードエラーメッセージ
        var passwordErrorMsg = '';
        // 社員名カナエラーメッセージ
        var shainmeiKanaErrorMsg = '';
        var errorMsg = '';

        with(document.forms[0].elements) {
            for (var i = 0; i < listSize; i++) {
                // パスワードを取得する。
                var password = namedItem('shainMstMntBeanList['+ i +'].password').value;
                // 社員名カナを取得する。
                var shainNameKana = namedItem('shainMstMntBeanList['+ i +'].shainNameKana').value;

                // 背景色をクリアする
                namedItem('shainMstMntBeanList['+ i +'].password').style.backgroundColor = 'white';
                namedItem('shainMstMntBeanList['+ i +'].shainNameKana').style.backgroundColor = 'white';

                // パスワードチェック
                if (!passwordErrorMsg) {
                    if (!checkRequired(password)) {
                        var strArr = ['パスワード'];
                        passwordErrorMsg = getMessage('E-MSG-000001', strArr);
                        namedItem('shainMstMntBeanList['+ i +'].password').style.backgroundColor = 'red';
                    }
                }
                // 社員名カナチェック
                if (!shainmeiKanaErrorMsg) {
                    if (!checkHankakuKana(shainNameKana)) {
                        var strArr = ['社員名カナ'];
                        shainmeiKanaErrorMsg = getMessage('E-MSG-000003', strArr);
                        namedItem('shainMstMntBeanList['+ i +'].shainNameKana').style.backgroundColor = 'red';
                    }
                }

                if (passwordErrorMsg && shainmeiKanaErrorMsg) {
                    // パスワード 、社員名カナが共にエラーの場合
                    break;
                }
            }
        }
        // エラーメッセージ
        errorMsg = passwordErrorMsg + shainmeiKanaErrorMsg;

        if (errorMsg) {
            alert(errorMsg);
            // エラー
            return false;
        }

        document.forms[0].submit();
    }

    -->
    </script>
</body>
</html>