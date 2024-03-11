<!-- menu.jsp -->
<%@page contentType="text/html; charset=Shift_JIS" pageEncoding="Shift_JIS"%>
<%@ page import="constant.RequestSessionNameConstant"%>
<%@ page import="constant.CommonConstant"%>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html"%>


<html>
  <head>
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-Control" content="no-cache">
    <meta http-equiv="Expires" content="Thu, 01 Dec 1994 16:00:00 GMT">
    <html:javascript formName="loginForm" />
    <script type="text/javascript" src="/kikin/pages/js/common.js"></script>
    <script type="text/javascript" src="/kikin/pages/js/checkCommon.js"></script>
    <script type="text/javascript" src="/kikin/pages/js/message.js"></script>

    <title>���j���[���</title>
    <link href="/kikin/pages/css/common.css" rel="stylesheet" type="text/css" />
  </head>
  <body>
    <div id="wrapper1">
      <div id="header">
        <table>
          <tr>
            <td id="headLeft">
              �@
            </td>
            <td id="headCenter1">
            <logic:equal name="<%=RequestSessionNameConstant.SESSION_CMN_LOGIN_USER_INFO %>"
                         property="kengenId"
                         value="<%=CommonConstant.Kengen.KANRISYA.getId() %>">
                ���j���[(�Ǘ���)
            </logic:equal>

            <logic:equal name="<%=RequestSessionNameConstant.SESSION_CMN_LOGIN_USER_INFO %>"
                         property="kengenId"
                         value="<%=CommonConstant.Kengen.IPPAN.getId() %>">
                ���j���[(���)
            </logic:equal>
            </td>
            <td id="headRight">
              <input value="���O�A�E�g" type="button" class="smlButton ui-btn"  onclick="logout()" />
            </td>
          </tr>
        </table>
      </div>
      <div id="gymBodyMenu">
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
       <div class="menuBlock3">
          <div class="fuwafuwa">
              <img src="pages/cmn/img/kairyu2.png">
              </div>
          </div>
      <div id="footer">
        <table>
          <tr>
            <td id="footLeft">
              �@
            </td>
            <td id="footCenter">
              �@
            </td>
            <td id="footRight">
              �@
            </td>
          </tr>
        </table>
      </div>
    </div>
  </body>
</html>