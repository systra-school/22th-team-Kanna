<!-- ShukkinKibouNyuuryoku.jsp -->
<%@page import="constant.CommonConstant.DayOfWeek"%>
<%@page import="business.logic.utils.CheckUtils"%>
<%@page import="form.common.DateBean"%>
<%@page import="java.util.List"%>
<%@page import="form.shk.ShukkinKibouNyuuryokuForm"%>
<%
/**
 * ファイル名：ShukkinKibouNyuuryoku.jsp
 *
 * 制作日
 * 1.0  2024/02/28　Reina.Baba
 */
%>
<%@page contentType="text/html; charset=Shift_JIS" pageEncoding="Shift_JIS"%>
<%@ page import="constant.RequestSessionNameConstant"%>
<%@ page import="constant.CommonConstant"%>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html"%>

<bean:size id="dateBeanListSize" name="shukkinKibouNyuuryokuForm" property="dateBeanList"/>
<bean:size id="listSize" name="shukkinKibouNyuuryokuForm" property="dateBeanList"/>
<bean:define id="color" value="" type="java.lang.String"/>
<bean:define id="showLength" value="18" type="java.lang.String"/>
<bean:define id="offset" name="shukkinKibouNyuuryokuForm" property="offset" />
<bean:define id="color" value="" type="java.lang.String"/>
<bean:define id="cntPage" name="shukkinKibouNyuuryokuForm" property="cntPage" type="java.lang.Integer"/>
<bean:define id="maxPage" name="shukkinKibouNyuuryokuForm" property="maxPage" type="java.lang.Integer"/>
<%
final int heightSize = 22;

int intShowLength = Integer.parseInt(showLength);

// 表示しているリストサイズの調整
if (cntPage.intValue() == maxPage.intValue()) {
    listSize = listSize % intShowLength;
}

if (listSize > intShowLength) {
    listSize = intShowLength;
}

%>
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
     * 登録
     */
    function submitRegist() {
        // サブミット
        doSubmit('/kikin/shukkinKibouNyuuryokuRegist.do');
    }

    /**
     * サブウィンドウを開く
     */
    function openWindow(){
        window.open("/kikin/shiftHanrei.do?param=", null, "menubar=no, toolbar=no, scrollbars=auto, resizable=yes, width=520px, height=650px");
    }
    /**
    * 出勤希望日参照(サブウィンドウで開く)
    */
    function view(){
    	window.open("/")
    }
    --> 
    </script>
    <title>出勤希望入力画面</title>

    <link href="/kikin/pages/css/common.css" rel="stylesheet" type="text/css" />
  </head>
  <body>
    <div id="wrapper">
      <div id="header">
        <table>
          <tr>
            <td id="headLeft">
              <input value="戻る" type="button" class="smlButton"  onclick="doSubmit('/kikin/shukkinKibouNyuuryokuBack.do')" />
            </td>
            <td id="headCenter">
              出勤希望入力
            </td>
            <td id="headRight">
              <input value="ログアウト" type="button" class="smlButton"  onclick="logout()" />
            </td>
          </tr>
        </table>
      </div>
      <div id="gymBody" style="overflow: hidden;">
       <div style="margin-left:10px;">
        <html:form action="/shukkinKibouNyuuryokuInit" >
              表示年月：
              <bean:define id="sessionYearMonth" name="shukkinKibouNyuuryokuForm" property="yearMonth" type="String"/>
              <html:select property="yearMonth" name="shukkinKibouNyuuryokuForm"  onchange="submitSearch()">
              <html:optionsCollection name="shukkinKibouNyuuryokuForm"
                                      property="yearMonthCmbMap"
                                      value="key"
                                      label="value"/>
              </html:select>
              <bean:write name="shukkinKibouNyuuryokuForm" property="cntPage"/>/
              <bean:write name="shukkinKibouNyuuryokuForm" property="maxPage"/>
            </div>
            <table width="1100px" cellpadding="0" cellspacing="0">
              <tr>
                <td width="150px" valign="top">
                   <table border="1" cellpadding="0" cellspacing="0">
                    <tr height="<%=heightSize %>px">
                      <td width="150px" align="center">
                        &nbsp;
                      </td>
                    </tr>
                    <tr height="<%=heightSize %>px">
                      <td width="150px" align="center">
                      社員名
                      </td>
                    </tr>
                      <td width="150px" align="center">
            			<logic:iterate offset="offset" length="<%=showLength %>"  id="shukkinKibouNyuuryokuBeanList" name="shukkinKibouNyuuryokuForm" property="shukkinKibouNyuuryokuBeanList">
                      <tr height="<%=heightSize %>px">
                               <bean:write property="shainName" name="shukkinKibouNyuuryokuBeanList"/><br>
                      </tr>
          			   </logic:iterate>
                      </td>
                  </table>
                </td>
                <td>
                    <div style="overflow-x: auto;overflow-y: hidden; width:100%;height: 100%; text-align:center;">
                    <table class="tblHeader" border="1" cellpadding="0" cellspacing="0">
                       <tr class="tblHeader">
                        <td width="40px" align="center">
                          1
                        </td>
                        <td width="40px" align="center">
                          2
                        </td>
                        <td width="40px" align="center">
                          3
                        </td>
                        <td width="40px" align="center">
                          4
                        </td>
                        <td width="40px" align="center">
                          5
                        </td>
                        <td width="40px" align="center">
                          6
                        </td>
                        <td width="40px" align="center">
                          7
                        </td>
                        <td width="40px" align="center">
                          8
                        </td>
                        <td width="40px" align="center">
                          9
                        </td>
                        <td width="40px" align="center">
                          10
                        </td>
                        <td width="40px" align="center">
                          11
                        </td>
                        <td width="40px" align="center">
                          12
                        </td>
                        <td width="40px" align="center">
                          13
                        </td>
                        <td width="40px" align="center">
                          14
                        </td>
                        <td width="40px" align="center">
                          15
                        </td>
                        <td width="40px" align="center">
                          16
                        </td>
                        <td width="40px" align="center">
                          17
                        </td>
                        <td width="40px" align="center">
                          18
                        </td>
                        <td width="40px" align="center">
                          19
                        </td>
                        <td width="40px" align="center">
                          20
                        </td>
                        <td width="40px" align="center">
                          21
                        </td>
                        <td width="40px" align="center">
                          22
                        </td>
                        <td width="40px" align="center">
                          23
                        </td>
                        <td width="40px" align="center">
                          24
                        </td>
                        <td width="40px" align="center">
                          25
                        </td>
                        <td width="40px" align="center">
                          26
                        </td>
                        <td width="40px" align="center">
                          27
                        </td>
                        <% if (dateBeanListSize >= 28) { %>
                        <td width="40px" align="center">
                          28
                        </td>
                        <% } %>
                        <% if (dateBeanListSize >= 29) { %>
                        <td width="40px" align="center">
                          29
                        </td>
                        <% } %>
                        <% if (dateBeanListSize >= 30) { %>
                        <td width="40px" align="center">
                          30
                        </td>
                        <% } %>
                        <% if (dateBeanListSize == 31) { %>
                        <td width="40px" align="center">
                          31
                        </td>
                        <% } %>
                      </tr>
                      <tr height="<%=heightSize %>px">
                        <logic:iterate id="dateBeanList" name="shukkinKibouNyuuryokuForm" property="dateBeanList">
                          <bean:define id="youbiEnum" name="dateBeanList" property="youbiEnum"/>
                            <%
                            if (DayOfWeek.SATURDAY.getRyaku().equals(youbiEnum)) {
                                color = "fontBlue";
                            } else if (DayOfWeek.SUNDAY.getRyaku().equals(youbiEnum)) {
                                color = "fontRed";
                            } else {
                                color = "fontBlack";
                            }
                            %>

                            <td width="40px" align="center" valign="middle" class="<%=color %>">
                              <bean:write property="youbi" name="dateBeanList"/>
                            </td>
                        </logic:iterate>
                      </tr>
                      <logic:iterate offset="offset" length="<%=showLength %>" id="shukkinKibouNyuuryokuBeanList" name="shukkinKibouNyuuryokuForm" property="shukkinKibouNyuuryokuBeanList">
                        <html:hidden name="shukkinKibouNyuuryokuBeanList" property="registFlg" value="true" indexed="true"/>
                        <tr height="<%=heightSize %>px">
                          <td width="40px" align="center" valign="middle">
                            <html:select property="shiftId01" name="shukkinKibouNyuuryokuBeanList" indexed="true">
                            <html:optionsCollection name="shukkinKibouNyuuryokuForm"
                                                    property="shiftCmbMap"
                                                    value="key"
                                                    label="value"/>
                            </html:select>
                          </td>
                          <td width="40px" align="center" valign="middle">
                            <html:select property="shiftId02" name="shukkinKibouNyuuryokuBeanList" indexed="true">
                            <html:optionsCollection name="shukkinKibouNyuuryokuForm"
                                                    property="shiftCmbMap"
                                                    value="key"
                                                    label="value"/>
                            </html:select>
                          </td>
                          <td width="40px" align="center" valign="middle">
                            <html:select property="shiftId03" name="shukkinKibouNyuuryokuBeanList" indexed="true">
                            <html:optionsCollection name="shukkinKibouNyuuryokuForm"
                                                    property="shiftCmbMap"
                                                    value="key"
                                                    label="value"/>
                            </html:select>
                          </td>
                          <td width="40px" align="center" valign="middle">
                            <html:select property="shiftId04" name="shukkinKibouNyuuryokuBeanList" indexed="true">
                            <html:optionsCollection name="shukkinKibouNyuuryokuForm"
                                                    property="shiftCmbMap"
                                                    value="key"
                                                    label="value"/>
                            </html:select>
                          </td>
                          <td width="40px" align="center" valign="middle">
                            <html:select property="shiftId05" name="shukkinKibouNyuuryokuBeanList" indexed="true">
                            <html:optionsCollection name="shukkinKibouNyuuryokuForm"
                                                    property="shiftCmbMap"
                                                    value="key"
                                                    label="value"/>
                            </html:select>
                          </td>
                          <td width="40px" align="center" valign="middle">
                            <html:select property="shiftId06" name="shukkinKibouNyuuryokuBeanList" indexed="true">
                            <html:optionsCollection name="shukkinKibouNyuuryokuForm"
                                                    property="shiftCmbMap"
                                                    value="key"
                                                    label="value"/>
                            </html:select>
                          </td>
                          <td width="40px" align="center" valign="middle">
                            <html:select property="shiftId07" name="shukkinKibouNyuuryokuBeanList" indexed="true">
                            <html:optionsCollection name="shukkinKibouNyuuryokuForm"
                                                    property="shiftCmbMap"
                                                    value="key"
                                                    label="value"/>
                            </html:select>
                          </td>
                          <td width="40px" align="center" valign="middle">
                            <html:select property="shiftId08" name="shukkinKibouNyuuryokuBeanList" indexed="true">
                            <html:optionsCollection name="shukkinKibouNyuuryokuForm"
                                                    property="shiftCmbMap"
                                                    value="key"
                                                    label="value"/>
                            </html:select>
                          </td>
                          <td width="40px" align="center" valign="middle">
                            <html:select property="shiftId09" name="shukkinKibouNyuuryokuBeanList" indexed="true">
                            <html:optionsCollection name="shukkinKibouNyuuryokuForm"
                                                    property="shiftCmbMap"
                                                    value="key"
                                                    label="value"/>
                            </html:select>
                          </td>
                          <td width="40px" align="center" valign="middle">
                            <html:select property="shiftId10" name="shukkinKibouNyuuryokuBeanList" indexed="true">
                            <html:optionsCollection name="shukkinKibouNyuuryokuForm"
                                                    property="shiftCmbMap"
                                                    value="key"
                                                    label="value"/>
                            </html:select>
                          </td>
                          <td width="40px" align="center" valign="middle">
                            <html:select property="shiftId11" name="shukkinKibouNyuuryokuBeanList" indexed="true">
                            <html:optionsCollection name="shukkinKibouNyuuryokuForm"
                                                    property="shiftCmbMap"
                                                    value="key"
                                                    label="value"/>
                            </html:select>
                          </td>
                          <td width="40px" align="center" valign="middle">
                            <html:select property="shiftId12" name="shukkinKibouNyuuryokuBeanList" indexed="true">
                            <html:optionsCollection name="shukkinKibouNyuuryokuForm"
                                                    property="shiftCmbMap"
                                                    value="key"
                                                    label="value"/>
                            </html:select>
                          </td>
                          <td width="40px" align="center" valign="middle">
                            <html:select property="shiftId13" name="shukkinKibouNyuuryokuBeanList" indexed="true">
                            <html:optionsCollection name="shukkinKibouNyuuryokuForm"
                                                    property="shiftCmbMap"
                                                    value="key"
                                                    label="value"/>
                            </html:select>
                          </td>
                          <td width="40px" align="center" valign="middle">
                            <html:select property="shiftId14" name="shukkinKibouNyuuryokuBeanList" indexed="true">
                            <html:optionsCollection name="shukkinKibouNyuuryokuForm"
                                                    property="shiftCmbMap"
                                                    value="key"
                                                    label="value"/>
                            </html:select>
                          </td>
                          <td width="40px" align="center" valign="middle">
                            <html:select property="shiftId15" name="shukkinKibouNyuuryokuBeanList" indexed="true">
                            <html:optionsCollection name="shukkinKibouNyuuryokuForm"
                                                    property="shiftCmbMap"
                                                    value="key"
                                                    label="value"/>
                            </html:select>
                          </td>
                          <td width="40px" align="center" valign="middle">
                            <html:select property="shiftId16" name="shukkinKibouNyuuryokuBeanList" indexed="true">
                            <html:optionsCollection name="shukkinKibouNyuuryokuForm"
                                                    property="shiftCmbMap"
                                                    value="key"
                                                    label="value"/>
                            </html:select>
                          </td>
                          <td width="40px" align="center" valign="middle">
                            <html:select property="shiftId17" name="shukkinKibouNyuuryokuBeanList" indexed="true">
                            <html:optionsCollection name="shukkinKibouNyuuryokuForm"
                                                    property="shiftCmbMap"
                                                    value="key"
                                                    label="value"/>
                            </html:select>
                          </td>
                          <td width="40px" align="center" valign="middle">
                            <html:select property="shiftId18" name="shukkinKibouNyuuryokuBeanList" indexed="true">
                            <html:optionsCollection name="shukkinKibouNyuuryokuForm"
                                                    property="shiftCmbMap"
                                                    value="key"
                                                    label="value"/>
                            </html:select>
                          </td>
                          <td width="40px" align="center" valign="middle">
                            <html:select property="shiftId19" name="shukkinKibouNyuuryokuBeanList" indexed="true">
                            <html:optionsCollection name="shukkinKibouNyuuryokuForm"
                                                    property="shiftCmbMap"
                                                    value="key"
                                                    label="value"/>
                            </html:select>
                          </td>
                          <td width="40px" align="center" valign="middle">
                            <html:select property="shiftId20" name="shukkinKibouNyuuryokuBeanList" indexed="true">
                            <html:optionsCollection name="shukkinKibouNyuuryokuForm"
                                                    property="shiftCmbMap"
                                                    value="key"
                                                    label="value"/>
                            </html:select>
                          </td>
                          <td width="40px" align="center" valign="middle">
                            <html:select property="shiftId21" name="shukkinKibouNyuuryokuBeanList" indexed="true">
                            <html:optionsCollection name="shukkinKibouNyuuryokuForm"
                                                    property="shiftCmbMap"
                                                    value="key"
                                                    label="value"/>
                            </html:select>
                          </td>
                          <td width="40px" align="center" valign="middle">
                            <html:select property="shiftId22" name="shukkinKibouNyuuryokuBeanList" indexed="true">
                            <html:optionsCollection name="shukkinKibouNyuuryokuForm"
                                                    property="shiftCmbMap"
                                                    value="key"
                                                    label="value"/>
                            </html:select>
                          </td>
                          <td width="40px" align="center" valign="middle">
                            <html:select property="shiftId23" name="shukkinKibouNyuuryokuBeanList" indexed="true">
                            <html:optionsCollection name="shukkinKibouNyuuryokuForm"
                                                    property="shiftCmbMap"
                                                    value="key"
                                                    label="value"/>
                            </html:select>
                          </td>
                          <td width="40px" align="center" valign="middle">
                            <html:select property="shiftId24" name="shukkinKibouNyuuryokuBeanList" indexed="true">
                            <html:optionsCollection name="shukkinKibouNyuuryokuForm"
                                                    property="shiftCmbMap"
                                                    value="key"
                                                    label="value"/>
                            </html:select>
                          </td>
                          <td width="40px" align="center" valign="middle">
                            <html:select property="shiftId25" name="shukkinKibouNyuuryokuBeanList" indexed="true">
                            <html:optionsCollection name="shukkinKibouNyuuryokuForm"
                                                    property="shiftCmbMap"
                                                    value="key"
                                                    label="value"/>
                            </html:select>
                          </td>
                          <td width="40px" align="center" valign="middle">
                            <html:select property="shiftId26" name="shukkinKibouNyuuryokuBeanList" indexed="true">
                            <html:optionsCollection name="shukkinKibouNyuuryokuForm"
                                                    property="shiftCmbMap"
                                                    value="key"
                                                    label="value"/>
                            </html:select>
                          </td>
                          <td width="40px" align="center" valign="middle">
                            <html:select property="shiftId27" name="shukkinKibouNyuuryokuBeanList" indexed="true">
                            <html:optionsCollection name="shukkinKibouNyuuryokuForm"
                                                    property="shiftCmbMap"
                                                    value="key"
                                                    label="value"/>
                            </html:select>
                          </td>
                          <% if (dateBeanListSize >= 28) { %>
                          <td width="40px" align="center" valign="middle">
                            <html:select property="shiftId28" name="shukkinKibouNyuuryokuBeanList" indexed="true">
                            <html:optionsCollection name="shukkinKibouNyuuryokuForm"
                                                    property="shiftCmbMap"
                                                    value="key"
                                                    label="value"/>
                            </html:select>
                          </td>
                          <% } %>
                          <% if (dateBeanListSize >= 29) { %>
                          <td width="40px" align="center" valign="middle">
                            <html:select property="shiftId29" name="shukkinKibouNyuuryokuBeanList" indexed="true">
                            <html:optionsCollection name="shukkinKibouNyuuryokuForm"
                                                    property="shiftCmbMap"
                                                    value="key"
                                                    label="value"/>
                            </html:select>
                          </td>
                          <% } %>
                          <% if (dateBeanListSize >= 30) { %>
                          <td width="40px" align="center" valign="middle">
                            <html:select property="shiftId30" name="shukkinKibouNyuuryokuBeanList" indexed="true">
                            <html:optionsCollection name="shukkinKibouNyuuryokuForm"
                                                    property="shiftCmbMap"
                                                    value="key"
                                                    label="value"/>
                            </html:select>
                          </td>
                          <% } %>
                          <% if (dateBeanListSize >= 31) { %>
                          <td width="40px" align="center" valign="middle">
                            <html:select property="shiftId31" name="shukkinKibouNyuuryokuBeanList" indexed="true">
                            <html:optionsCollection name="shukkinKibouNyuuryokuForm"
                                                    property="shiftCmbMap"
                                                    value="key"
                                                    label="value"/>
                            </html:select>
                          </td>
                          <% } %>
                        </tr>
                      </logic:iterate>
                    </table>
                  </div>
                </td>
              </tr>
            </table>
          </div>
        </html:form>
        <div style="margin-left:50px;">
          <input value="凡例表示" type="button" class="lngButton"  onclick="openWindow()" />
        </div>
      </div>
      <div id="footer">
        <table>
          <tr>
            <td id="footLeft">
            </td>
            <td id="footCenter" style="text-align: right;">

            </td>
            <td id="footRight">
            	<input value="出勤希望日参照" type="button" class="smlButton" onclick="view()" />
              <input value="登録" type="button" class="smlButton"  onclick="submitRegist()" />
            </td>
          </tr>
        </table>
      </div>
  </body>
</html>