<!-- menu.jsp -->
<%@page contentType="text/html; charset=Shift_JIS" pageEncoding="Shift_JIS"%>
<%@ page import="constant.RequestSessionNameConstant"%>
<%@ page import="constant.CommonConstant"%>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html"%>

<bean:define id="pageTitle" value="メニュー" type="java.lang.String"/>
<bean:define id="pageName" value="menu" type="java.lang.String"/>

<logic:equal name="<%=RequestSessionNameConstant.SESSION_CMN_LOGIN_USER_INFO %>"
	property="kengenId"
	value="<%=CommonConstant.Kengen.KANRISYA.getId() %>">
	<bean:define id="role" value="管理者" type="java.lang.String"/>
</logic:equal>

<logic:equal name="<%=RequestSessionNameConstant.SESSION_CMN_LOGIN_USER_INFO %>"
	property="kengenId"
	value="<%=CommonConstant.Kengen.IPPAN.getId() %>">
	<bean:define id="role" value="一般" type="java.lang.String"/>
</logic:equal>

<%@ include file="../header.jsp" %>
<%-- ヘッダーの読込 --%>
<main class="formStyle">
	<div class="menu_wrapper">
        <logic:equal name="<%=RequestSessionNameConstant.SESSION_CMN_LOGIN_USER_INFO %>"
                     property="kengenId"
                     value="<%=CommonConstant.Kengen.KANRISYA.getId() %>">
          <div class="menuBlock">
            <html:form action="/tsukibetsuShiftKakuninInit">
            <span><input type="submit" value="月別シフト確認" class="bigButton" /></span>
            </html:form>
            <html:form action="/hibetsuShiftInit">
              <span><input type="submit" value="日別シフト確認" class="bigButton" /></span>
            </html:form>
          </div>

          <div class="menuBlock">
            <html:form action="/kinmuJissekiKakuninInit">
              <span><input type="submit" value="勤務実績確認" class="bigButton" /></span>
            </html:form>
            <html:form action="/kinmuJissekiNyuryokuKakuninInit">
              <span><input type="submit" value="勤務実績入力" class="bigButton" /></span>
            </html:form>
          </div>

          <div class="menuBlock">
            <html:form action="/shukkinKibouKakuninInit">
              <span><input type="submit" value="出勤希望日確認" class="bigButton" /></span>
            </html:form>
            <html:form action="/tsukibetsuShiftNyuuryokuInit">
              <span><input type="submit" value="月別シフト入力" class="bigButton" /></span>
            </html:form>
          </div>


          <div class="menuBlock">
            <html:form action="/shainMstMnt">
              <span><input type="submit" value="社員マスタメンテナンス" class="bigButton" /></span>
            </html:form>
            <html:form action="/shiftMstMnt">
              <span><input type="submit" value="シフトマスタメンテナンス" class="bigButton" /></span>
            </html:form>
            <html:form action="/kihonShiftInit">
              <span><input type="submit" value="基本シフト登録" class="bigButton" /></span>
            </html:form>
           
          </div>

        </logic:equal>

        <logic:equal name="<%=RequestSessionNameConstant.SESSION_CMN_LOGIN_USER_INFO %>"
                     property="kengenId"
                     value="<%=CommonConstant.Kengen.IPPAN.getId() %>">
          <div class="menuBlock">
            <html:form action="/tsukibetsuShiftKakuninInit">
              <span><input type="submit" value="月別シフト確認" class="bigButton" /></span>
            </html:form>
            <html:form action="/hibetsuShiftInit">
              <span><input type="submit" value="日別シフト確認" class="bigButton" /></span>
            </html:form>
          </div>
          <div class="menuBlock">
            <html:form action="/kinmuJissekiNyuryokuKakuninInit">
              <span><input type="submit" value="勤務実績入力" class="bigButton" /></span>
            </html:form>
          </div>

          <div class="menuBlock">
			 <html:form action="/shukkinKibouNyuuryokuInit">
           	  <span><input type="submit" value="希望出勤日入力" class="bigButton" /></span>
            </html:form>
          </div>

          <div class="menuBlock">
            <html:form action="/kihonShiftKakuninInit">
              <span><input type="submit" value="基本シフト確認" class="bigButton" /></span>
            </html:form>
          </div>

        </logic:equal>
	</div>
</main>
       <div class="menuBlock3">
          <div class="fuwafuwa">
              <img src="pages/cmn/img/kairyu2.png">
              </div>
          </div>
</div><%-- wrapper --%>

<html:javascript formName="loginForm" />
</body>
</html>