<!-- menu.jsp -->
<%@page contentType="text/html; charset=Shift_JIS" pageEncoding="Shift_JIS"%>
<%@ page import="constant.RequestSessionNameConstant"%>
<%@ page import="constant.CommonConstant"%>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html"%>

<bean:define id="pageTitle" value="���j���[" type="java.lang.String"/>
<bean:define id="pageName" value="menu" type="java.lang.String"/>

<logic:equal name="<%=RequestSessionNameConstant.SESSION_CMN_LOGIN_USER_INFO %>"
	property="kengenId"
	value="<%=CommonConstant.Kengen.KANRISYA.getId() %>">
	<bean:define id="role" value="�Ǘ���" type="java.lang.String"/>
</logic:equal>

<logic:equal name="<%=RequestSessionNameConstant.SESSION_CMN_LOGIN_USER_INFO %>"
	property="kengenId"
	value="<%=CommonConstant.Kengen.IPPAN.getId() %>">
	<bean:define id="role" value="���" type="java.lang.String"/>
</logic:equal>

<%@ include file="../header.jsp" %>
<%-- �w�b�_�[�̓Ǎ� --%>
<main class="formStyle">
	<div class="menu_wrapper">
        <logic:equal name="<%=RequestSessionNameConstant.SESSION_CMN_LOGIN_USER_INFO %>"
                     property="kengenId"
                     value="<%=CommonConstant.Kengen.KANRISYA.getId() %>">
          <div class="menuBlock">
            <html:form action="/tsukibetsuShiftKakuninInit">
            <span><input type="submit" value="���ʃV�t�g�m�F" class="bigButton" /></span>
            </html:form>
            <html:form action="/hibetsuShiftInit">
              <span><input type="submit" value="���ʃV�t�g�m�F" class="bigButton" /></span>
            </html:form>
          </div>

          <div class="menuBlock">
            <html:form action="/kinmuJissekiKakuninInit">
              <span><input type="submit" value="�Ζ����ъm�F" class="bigButton" /></span>
            </html:form>
            <html:form action="/kinmuJissekiNyuryokuKakuninInit">
              <span><input type="submit" value="�Ζ����ѓ���" class="bigButton" /></span>
            </html:form>
          </div>

          <div class="menuBlock">
            <html:form action="/shukkinKibouKakuninInit">
              <span><input type="submit" value="�o�Ί�]���m�F" class="bigButton" /></span>
            </html:form>
            <html:form action="/tsukibetsuShiftNyuuryokuInit">
              <span><input type="submit" value="���ʃV�t�g����" class="bigButton" /></span>
            </html:form>
          </div>


          <div class="menuBlock">
            <html:form action="/shainMstMnt">
              <span><input type="submit" value="�Ј��}�X�^�����e�i���X" class="bigButton" /></span>
            </html:form>
            <html:form action="/shiftMstMnt">
              <span><input type="submit" value="�V�t�g�}�X�^�����e�i���X" class="bigButton" /></span>
            </html:form>
            <html:form action="/kihonShiftInit">
              <span><input type="submit" value="��{�V�t�g�o�^" class="bigButton" /></span>
            </html:form>
           
          </div>

        </logic:equal>

        <logic:equal name="<%=RequestSessionNameConstant.SESSION_CMN_LOGIN_USER_INFO %>"
                     property="kengenId"
                     value="<%=CommonConstant.Kengen.IPPAN.getId() %>">
          <div class="menuBlock">
            <html:form action="/tsukibetsuShiftKakuninInit">
              <span><input type="submit" value="���ʃV�t�g�m�F" class="bigButton" /></span>
            </html:form>
            <html:form action="/hibetsuShiftInit">
              <span><input type="submit" value="���ʃV�t�g�m�F" class="bigButton" /></span>
            </html:form>
          </div>
          <div class="menuBlock">
            <html:form action="/kinmuJissekiNyuryokuKakuninInit">
              <span><input type="submit" value="�Ζ����ѓ���" class="bigButton" /></span>
            </html:form>
          </div>

          <div class="menuBlock">
			 <html:form action="/shukkinKibouNyuuryokuInit">
           	  <span><input type="submit" value="��]�o�Γ�����" class="bigButton" /></span>
            </html:form>
          </div>

          <div class="menuBlock">
            <html:form action="/kihonShiftKakuninInit">
              <span><input type="submit" value="��{�V�t�g�m�F" class="bigButton" /></span>
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