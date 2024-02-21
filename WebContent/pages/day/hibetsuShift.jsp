<!-- hibetsuShift.jsp -->
<%@page import="business.logic.utils.CheckUtils"%>
<%@page import="form.common.DateBean"%>
<%@page import="java.util.List"%>
<%@page import="form.shk.ShukkinKibouKakuninForm"%>
<%
/**
 * ÉtÉ@ÉCÉãñºÅFhibetsuShift.jsp
 *
 * ïœçXóöó
 * 1.0  2010/09/13 Kazuya.Naraki
 */
%>
<%@page contentType="text/html; charset=Shift_JIS" pageEncoding="Shift_JIS"%>
<%@ page import="constant.RequestSessionNameConstant"%>
<%@ page import="constant.CommonConstant"%>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<bean:size id="hibetsuShiftBeanListSize" name="hibetsuShiftForm"  property="hibetsuShiftBeanList"/>
<%
    int bodyRightDivWidth = 0;
    int bodyRightDivHeight = 0;
    int bodyLeftDivHeight = 0;
    // É{ÉfÉBÉeÅ[ÉuÉãÇÃ td ÇÃïù
    int tdWidth = 150;
    // É{ÉfÉBÉeÅ[ÉuÉãÇÃ tr ÇÃèc
    int trHeight = 50;
    // ècÉXÉNÉçÅ[ÉãÉoÅ[ÇÃïù
    int scrollBarSize = 20;
    if (hibetsuShiftBeanListSize < 6) {
        bodyRightDivWidth = hibetsuShiftBeanListSize * tdWidth + scrollBarSize;
        bodyRightDivHeight = 402;
        bodyLeftDivHeight = 402;
    } else {
        bodyRightDivWidth = 918;
        bodyRightDivHeight = 418;
        bodyLeftDivHeight = 402;
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
     * åüçı
     */
    function submitSearch() {
        doSubmit('/kikin/shukkinKibouKakuninShow.do');
    }

    /**
     * ÉXÉNÉçÅ[ÉãÇìØä˙Ç≥ÇπÇÈ
     */
    function onScroll() {
        headRightTbl.scrollLeft = bodyRightTbl.scrollLeft;
        bodyLeftTbl.scrollTop = bodyRightTbl.scrollTop;
    }
    -->
    </script>
    <title>ì˙ï ÉVÉtÉgämîFâÊñ </title>

    <link href="/kikin/pages/css/common.css" rel="stylesheet" type="text/css" />
  </head>
  <body>
    <div id="wrapper">
      <div id="header">
        <table>
          <tr>
            <td id="headLeft">
              <input value="ñﬂÇÈ" type="button" class="smlButton"  onclick="doSubmit('/kikin/hibetsuShiftBack.do')" />
            </td>
            <td id="headCenter">
              ì˙ï ÉVÉtÉgämîFâÊñ 
            </td>
            <td id="headRight">
              <input value="ÉçÉOÉAÉEÉg" type="button" class="smlButton"  onclick="logout()" />
            </td>
          </tr>
        </table>
      </div>
      <div id="gymBody" style="overflow: hidden;">
        <div style="margin-left:80px;">
          <html:form>
            <div style="height: 20px">
              ï\é¶îNåéÅF
              <html:link href="/kikin/hibetsuShiftPage.do?paging=back">ëOì˙</html:link>
              <bean:write name="hibetsuShiftForm" property="yearMonthDayDisp"/>
              <html:link href="/kikin/hibetsuShiftPage.do?paging=next">óÇì˙</html:link>
            </div>
            <table border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td width="154px" >
                  <div id="headLeftTbl" style="overflow-x: hidden;overflow-y: hidden;width: 154px;">
                    <table border="1" cellpadding="0" cellspacing="0" class="tblHeader">
                      <tr>
                        <td width="<%=tdWidth %>px" nowrap="nowrap" align="center">
                        éûä‘
                        </td>
                      </tr>
                    </table>
                  </div>
                </td>
                <td width="100%" valign="top">
                  <div id="headRightTbl" style="overflow-y: scroll;overflow-x: hidden;width: <%=bodyRightDivWidth%>px; ">
                    <table border="1" cellpadding="0" cellspacing="0" class="tblHeader">
                      <tr>
                        <logic:iterate id="hibetsuShiftBean" name="hibetsuShiftForm" property="hibetsuShiftBeanList">
                          <td width="<%=tdWidth %>px" nowrap="nowrap" align="center">
                            <bean:write name="hibetsuShiftBean" property="shainName"/><br>
                          </td>
                        </logic:iterate>
                      </tr>
                    </table>
                  </div>
                </td>
              </tr>
            </table>
            <table border="0" cellpadding="0" cellspacing="0">
              <tr height="100%">
                <td valign="top">
                  <div id="bodyLeftTbl" style="overflow-x: auto;overflow-y: hidden;width: 154px;height:<%=bodyLeftDivHeight %>px; ">
                    <table border="1" cellpadding="0" cellspacing="0" class="tblBody">
                      <tr height="<%=trHeight %>px">
                        <td width="<%=tdWidth %>px" nowrap="nowrap" align="center">
                        ÇOÇOÅFÇOÇO&#xFF5E;ÇOÇPÅFÇOÇO
                        </td>
                      </tr>
                      <tr height="<%=trHeight %>px">
                        <td width="<%=tdWidth %>px" nowrap="nowrap" align="center">
                        ÇOÇPÅFÇOÇO&#xFF5E;ÇOÇQÅFÇOÇO
                        </td>
                      </tr>
                      <tr height="<%=trHeight %>px">
                        <td width="<%=tdWidth %>px" nowrap="nowrap" align="center">
                        ÇOÇQÅFÇOÇO&#xFF5E;ÇOÇRÅFÇOÇO
                        </td>
                      </tr>
                      <tr height="<%=trHeight %>px">
                        <td width="<%=tdWidth %>px" nowrap="nowrap" align="center">
                        ÇOÇRÅFÇOÇO&#xFF5E;ÇO<%=tdWidth %>ÇO
                        </td>
                      </tr>
                      <tr height="<%=trHeight %>px">
                        <td width="<%=tdWidth %>px" nowrap="nowrap" align="center">
                        ÇOÇSÅFÇOÇO&#xFF5E;ÇOÇTÅFÇOÇO
                        </td>
                      </tr>
                      <tr height="<%=trHeight %>px">
                        <td width="<%=tdWidth %>px" nowrap="nowrap" align="center">
                        ÇOÇTÅFÇOÇO&#xFF5E;ÇOÇUÅFÇOÇO
                        </td>
                      </tr>
                      <tr height="<%=trHeight %>px">
                        <td width="<%=tdWidth %>px" nowrap="nowrap" align="center">
                        ÇOÇUÅFÇOÇO&#xFF5E;ÇOÇVÅFÇOÇO
                        </td>
                      </tr>
                      <tr height="<%=trHeight %>px">
                        <td width="<%=tdWidth %>px" nowrap="nowrap" align="center">
                        ÇOÇVÅFÇOÇO&#xFF5E;ÇOÇWÅFÇOÇO
                        </td>
                      </tr>
                      <tr height="<%=trHeight %>px">
                        <td width="<%=tdWidth %>px" nowrap="nowrap" align="center">
                        ÇOÇWÅFÇOÇO&#xFF5E;ÇOÇXÅFÇOÇO
                        </td>
                      </tr>
                      <tr height="<%=trHeight %>px">
                        <td width="<%=tdWidth %>px" nowrap="nowrap" align="center">
                        ÇOÇXÅFÇOÇO&#xFF5E;ÇPÇOÅFÇOÇO
                        </td>
                      </tr>
                      <tr height="<%=trHeight %>px">
                        <td width="<%=tdWidth %>px" nowrap="nowrap" align="center">
                        ÇPÇOÅFÇOÇO&#xFF5E;ÇPÇPÅFÇOÇO
                        </td>
                      </tr>
                      <tr height="<%=trHeight %>px">
                        <td width="<%=tdWidth %>px" nowrap="nowrap" align="center">
                        ÇPÇPÅFÇOÇO&#xFF5E;ÇPÇQÅFÇOÇO
                        </td>
                      </tr>
                      <tr height="<%=trHeight %>px">
                        <td width="<%=tdWidth %>px" nowrap="nowrap" align="center">
                        ÇPÇQÅFÇOÇO&#xFF5E;ÇPÇRÅFÇOÇO
                        </td>
                      </tr>
                      <tr height="<%=trHeight %>px">
                        <td width="<%=tdWidth %>px" nowrap="nowrap" align="center">
                        ÇPÇRÅFÇOÇO&#xFF5E;ÇPÇSÅFÇOÇO
                        </td>
                      </tr>
                      <tr height="<%=trHeight %>px">
                        <td width="<%=tdWidth %>px" nowrap="nowrap" align="center">
                        ÇPÇSÅFÇOÇO&#xFF5E;ÇPÇTÅFÇOÇO
                        </td>
                      </tr>
                      <tr height="<%=trHeight %>px">
                        <td width="<%=tdWidth %>px" nowrap="nowrap" align="center">
                        ÇPÇTÅFÇOÇO&#xFF5E;ÇPÇUÅFÇOÇO
                        </td>
                      </tr>
                      <tr height="<%=trHeight %>px">
                        <td width="<%=tdWidth %>px" nowrap="nowrap" align="center">
                        ÇPÇUÅFÇOÇO&#xFF5E;ÇPÇVÅFÇOÇO
                        </td>
                      </tr>
                      <tr height="<%=trHeight %>px">
                        <td width="<%=tdWidth %>px" nowrap="nowrap" align="center">
                        ÇPÇVÅFÇOÇO&#xFF5E;ÇPÇWÅFÇOÇO
                        </td>
                      </tr>
                      <tr height="<%=trHeight %>px">
                        <td width="<%=tdWidth %>px" nowrap="nowrap" align="center">
                        ÇPÇWÅFÇOÇO&#xFF5E;ÇPÇXÅFÇOÇO
                        </td>
                      </tr>
                      <tr height="<%=trHeight %>px">
                        <td width="<%=tdWidth %>px" nowrap="nowrap" align="center">
                        ÇPÇXÅFÇOÇO&#xFF5E;ÇQÇOÅFÇOÇO
                        </td>
                      </tr>
                      <tr height="<%=trHeight %>px">
                        <td width="<%=tdWidth %>px" nowrap="nowrap" align="center">
                        ÇQÇOÅFÇOÇO&#xFF5E;ÇQÇPÅFÇOÇO
                        </td>
                      </tr>
                      <tr height="<%=trHeight %>px">
                        <td width="<%=tdWidth %>px" nowrap="nowrap" align="center">
                        ÇQÇPÅFÇOÇO&#xFF5E;ÇQÇQÅFÇOÇO
                        </td>
                      </tr>
                      <tr height="<%=trHeight %>px">
                        <td width="<%=tdWidth %>px" nowrap="nowrap" align="center">
                        ÇQÇQÅFÇOÇO&#xFF5E;ÇQÇRÅFÇOÇO
                        </td>
                      </tr>
                      <tr height="<%=trHeight %>px">
                        <td width="<%=tdWidth %>px" nowrap="nowrap" align="center">
                        ÇQÇRÅFÇOÇO&#xFF5E;ÇQÇSÅFÇOÇO
                        </td>
                      </tr>
                    </table>
                  </div>
                </td>
                <td width="100%" valign="top">
                  <div id="bodyRightTbl"  style="overflow-x: auto;overflow-y: auto;width: <%=bodyRightDivWidth %>px;height:<%=bodyRightDivHeight %>px;" onScroll="onScroll();">
                    <table border="1" cellpadding="0" cellspacing="0" class="tblBody">
                      <tr height="<%=trHeight %>px">
                        <logic:iterate id="hibetsuShiftBean" name="hibetsuShiftForm" property="hibetsuShiftBeanList">
                          <logic:equal value="true" name="hibetsuShiftBean" property="boolTime00">
                          <% // èoãŒó\íËÇÃéûä‘ë— %>
                            <td width="<%=tdWidth %>px" nowrap="nowrap" align="center" bgcolor="LightPink">
                              <logic:empty name="hibetsuShiftBean" property="strTime00" >
                                <br>
                              </logic:empty>
                              <logic:notEmpty name="hibetsuShiftBean" property="strTime00" >

                                <bean:write name="hibetsuShiftBean" property="strTime00"/>ÅF

                                <logic:equal value="èoãŒ" name="hibetsuShiftBean" property="strTime00">
                                  <bean:write name="hibetsuShiftBean" property="startTime"/>
                                  &#xFF5E;
                                  <bean:write name="hibetsuShiftBean" property="endTime"/>
                                  <br><bean:write name="hibetsuShiftBean" property="breakTime"/>
                                </logic:equal>
                              </logic:notEmpty>
                            </td>
                          </logic:equal>
                          <logic:equal value="false" name="hibetsuShiftBean" property="boolTime00">
                          <% // èoãŒó\íËäOÇÃéûä‘ë— %>
                            <td width="<%=tdWidth %>px" nowrap="nowrap" align="center">
                              <logic:empty name="hibetsuShiftBean" property="strTime00" >
                                <br>
                              </logic:empty>
                              <logic:notEmpty name="hibetsuShiftBean" property="strTime00" >
                                <bean:write name="hibetsuShiftBean" property="strTime00"/>
                              </logic:notEmpty>
                            </td>
                          </logic:equal>
                        </logic:iterate>
                      </tr>

                      <tr height="<%=trHeight %>px">
                        <logic:iterate id="hibetsuShiftBean" name="hibetsuShiftForm" property="hibetsuShiftBeanList">
                          <logic:equal value="true" name="hibetsuShiftBean" property="boolTime01">
                          <% // èoãŒó\íËÇÃéûä‘ë— %>
                            <td width="<%=tdWidth %>px" nowrap="nowrap" align="center" bgcolor="LightPink">
                              <logic:empty name="hibetsuShiftBean" property="strTime01" >
                                <br>
                              </logic:empty>
                              <logic:notEmpty name="hibetsuShiftBean" property="strTime01" >

                                <bean:write name="hibetsuShiftBean" property="strTime01"/>ÅF

                                <logic:equal value="èoãŒ" name="hibetsuShiftBean" property="strTime01">
                                  <bean:write name="hibetsuShiftBean" property="startTime"/>
                                  &#xFF5E;
                                  <bean:write name="hibetsuShiftBean" property="endTime"/>
                                  <br><bean:write name="hibetsuShiftBean" property="breakTime"/>
                                </logic:equal>
                              </logic:notEmpty>
                            </td>
                          </logic:equal>
                          <logic:equal value="false" name="hibetsuShiftBean" property="boolTime01">
                          <% // èoãŒó\íËäOÇÃéûä‘ë— %>
                            <td width="<%=tdWidth %>px" nowrap="nowrap" align="center">
                              <logic:empty name="hibetsuShiftBean" property="strTime01" >
                                <br>
                              </logic:empty>
                              <logic:notEmpty name="hibetsuShiftBean" property="strTime01" >
                                <bean:write name="hibetsuShiftBean" property="strTime01"/>
                              </logic:notEmpty>
                            </td>
                          </logic:equal>
                        </logic:iterate>
                      </tr>

                      <tr height="<%=trHeight %>px">
                        <logic:iterate id="hibetsuShiftBean" name="hibetsuShiftForm" property="hibetsuShiftBeanList">
                          <logic:equal value="true" name="hibetsuShiftBean" property="boolTime02">
                          <% // èoãŒó\íËÇÃéûä‘ë— %>
                            <td width="<%=tdWidth %>px" nowrap="nowrap" align="center" bgcolor="LightPink">
                              <logic:empty name="hibetsuShiftBean" property="strTime02" >
                                <br>
                              </logic:empty>
                              <logic:notEmpty name="hibetsuShiftBean" property="strTime02" >

                                <bean:write name="hibetsuShiftBean" property="strTime02"/>ÅF

                                <logic:equal value="èoãŒ" name="hibetsuShiftBean" property="strTime02">
                                  <bean:write name="hibetsuShiftBean" property="startTime"/>
                                  &#xFF5E;
                                  <bean:write name="hibetsuShiftBean" property="endTime"/>
                                  <br><bean:write name="hibetsuShiftBean" property="breakTime"/>
                                </logic:equal>
                              </logic:notEmpty>
                            </td>
                          </logic:equal>
                          <logic:equal value="false" name="hibetsuShiftBean" property="boolTime02">
                          <% // èoãŒó\íËäOÇÃéûä‘ë— %>
                            <td width="<%=tdWidth %>px" nowrap="nowrap" align="center">
                              <logic:empty name="hibetsuShiftBean" property="strTime02" >
                                <br>
                              </logic:empty>
                              <logic:notEmpty name="hibetsuShiftBean" property="strTime02" >
                                <bean:write name="hibetsuShiftBean" property="strTime02"/>
                              </logic:notEmpty>
                            </td>
                          </logic:equal>
                        </logic:iterate>
                      </tr>

                      <tr height="<%=trHeight %>px">
                        <logic:iterate id="hibetsuShiftBean" name="hibetsuShiftForm" property="hibetsuShiftBeanList">
                          <logic:equal value="true" name="hibetsuShiftBean" property="boolTime03">
                          <% // èoãŒó\íËÇÃéûä‘ë— %>
                            <td width="<%=tdWidth %>px" nowrap="nowrap" align="center" bgcolor="LightPink">
                              <logic:empty name="hibetsuShiftBean" property="strTime03" >
                                <br>
                              </logic:empty>
                              <logic:notEmpty name="hibetsuShiftBean" property="strTime03" >

                                <bean:write name="hibetsuShiftBean" property="strTime03"/>ÅF

                                <logic:equal value="èoãŒ" name="hibetsuShiftBean" property="strTime03">
                                  <bean:write name="hibetsuShiftBean" property="startTime"/>
                                  &#xFF5E;
                                  <bean:write name="hibetsuShiftBean" property="endTime"/>
                                  <br><bean:write name="hibetsuShiftBean" property="breakTime"/>
                                </logic:equal>
                              </logic:notEmpty>
                            </td>
                          </logic:equal>
                          <logic:equal value="false" name="hibetsuShiftBean" property="boolTime03">
                          <% // èoãŒó\íËäOÇÃéûä‘ë— %>
                            <td width="<%=tdWidth %>px" nowrap="nowrap" align="center">
                              <logic:empty name="hibetsuShiftBean" property="strTime03" >
                                <br>
                              </logic:empty>
                              <logic:notEmpty name="hibetsuShiftBean" property="strTime03" >
                                <bean:write name="hibetsuShiftBean" property="strTime03"/>
                              </logic:notEmpty>
                            </td>
                          </logic:equal>
                        </logic:iterate>
                      </tr>

                      <tr height="<%=trHeight %>px">
                        <logic:iterate id="hibetsuShiftBean" name="hibetsuShiftForm" property="hibetsuShiftBeanList">
                          <logic:equal value="true" name="hibetsuShiftBean" property="boolTime04">
                          <% // èoãŒó\íËÇÃéûä‘ë— %>
                            <td width="<%=tdWidth %>px" nowrap="nowrap" align="center" bgcolor="LightPink">
                              <logic:empty name="hibetsuShiftBean" property="strTime04" >
                                <br>
                              </logic:empty>
                              <logic:notEmpty name="hibetsuShiftBean" property="strTime04" >

                                <bean:write name="hibetsuShiftBean" property="strTime04"/>ÅF

                                <logic:equal value="èoãŒ" name="hibetsuShiftBean" property="strTime04">
                                  <bean:write name="hibetsuShiftBean" property="startTime"/>
                                  &#xFF5E;
                                  <bean:write name="hibetsuShiftBean" property="endTime"/>
                                  <br><bean:write name="hibetsuShiftBean" property="breakTime"/>
                                </logic:equal>
                              </logic:notEmpty>
                            </td>
                          </logic:equal>
                          <logic:equal value="false" name="hibetsuShiftBean" property="boolTime04">
                          <% // èoãŒó\íËäOÇÃéûä‘ë— %>
                            <td width="<%=tdWidth %>px" nowrap="nowrap" align="center">
                              <logic:empty name="hibetsuShiftBean" property="strTime04" >
                                <br>
                              </logic:empty>
                              <logic:notEmpty name="hibetsuShiftBean" property="strTime04" >
                                <bean:write name="hibetsuShiftBean" property="strTime04"/>
                              </logic:notEmpty>
                            </td>
                          </logic:equal>
                        </logic:iterate>
                      </tr>

                      <tr height="<%=trHeight %>px">
                        <logic:iterate id="hibetsuShiftBean" name="hibetsuShiftForm" property="hibetsuShiftBeanList">
                          <logic:equal value="true" name="hibetsuShiftBean" property="boolTime05">
                          <% // èoãŒó\íËÇÃéûä‘ë— %>
                            <td width="<%=tdWidth %>px" nowrap="nowrap" align="center" bgcolor="LightPink">
                              <logic:empty name="hibetsuShiftBean" property="strTime05" >
                                <br>
                              </logic:empty>
                              <logic:notEmpty name="hibetsuShiftBean" property="strTime05" >

                                <bean:write name="hibetsuShiftBean" property="strTime05"/>ÅF

                                <logic:equal value="èoãŒ" name="hibetsuShiftBean" property="strTime05">
                                  <bean:write name="hibetsuShiftBean" property="startTime"/>
                                  &#xFF5E;
                                  <bean:write name="hibetsuShiftBean" property="endTime"/>
                                  <br><bean:write name="hibetsuShiftBean" property="breakTime"/>
                                </logic:equal>
                              </logic:notEmpty>
                            </td>
                          </logic:equal>
                          <logic:equal value="false" name="hibetsuShiftBean" property="boolTime05">
                          <% // èoãŒó\íËäOÇÃéûä‘ë— %>
                            <td width="<%=tdWidth %>px" nowrap="nowrap" align="center">
                              <logic:empty name="hibetsuShiftBean" property="strTime05" >
                                <br>
                              </logic:empty>
                              <logic:notEmpty name="hibetsuShiftBean" property="strTime05" >
                                <bean:write name="hibetsuShiftBean" property="strTime05"/>
                              </logic:notEmpty>
                            </td>
                          </logic:equal>
                        </logic:iterate>
                      </tr>

                      <tr height="<%=trHeight %>px">
                        <logic:iterate id="hibetsuShiftBean" name="hibetsuShiftForm" property="hibetsuShiftBeanList">
                          <logic:equal value="true" name="hibetsuShiftBean" property="boolTime06">
                          <% // èoãŒó\íËÇÃéûä‘ë— %>
                            <td width="<%=tdWidth %>px" nowrap="nowrap" align="center" bgcolor="LightPink">
                              <logic:empty name="hibetsuShiftBean" property="strTime06" >
                                <br>
                              </logic:empty>
                              <logic:notEmpty name="hibetsuShiftBean" property="strTime06" >

                                <bean:write name="hibetsuShiftBean" property="strTime06"/>ÅF

                                <logic:equal value="èoãŒ" name="hibetsuShiftBean" property="strTime06">
                                  <bean:write name="hibetsuShiftBean" property="startTime"/>
                                  &#xFF5E;
                                  <bean:write name="hibetsuShiftBean" property="endTime"/>
                                  <br><bean:write name="hibetsuShiftBean" property="breakTime"/>
                                </logic:equal>
                              </logic:notEmpty>
                            </td>
                          </logic:equal>
                          <logic:equal value="false" name="hibetsuShiftBean" property="boolTime06">
                          <% // èoãŒó\íËäOÇÃéûä‘ë— %>
                            <td width="<%=tdWidth %>px" nowrap="nowrap" align="center">
                              <logic:empty name="hibetsuShiftBean" property="strTime06" >
                                <br>
                              </logic:empty>
                              <logic:notEmpty name="hibetsuShiftBean" property="strTime06" >
                                <bean:write name="hibetsuShiftBean" property="strTime06"/>
                              </logic:notEmpty>
                            </td>
                          </logic:equal>
                        </logic:iterate>
                      </tr>

                      <tr height="<%=trHeight %>px">
                        <logic:iterate id="hibetsuShiftBean" name="hibetsuShiftForm" property="hibetsuShiftBeanList">
                          <logic:equal value="true" name="hibetsuShiftBean" property="boolTime07">
                          <% // èoãŒó\íËÇÃéûä‘ë— %>
                            <td width="<%=tdWidth %>px" nowrap="nowrap" align="center" bgcolor="LightPink">
                              <logic:empty name="hibetsuShiftBean" property="strTime07" >
                                <br>
                              </logic:empty>
                              <logic:notEmpty name="hibetsuShiftBean" property="strTime07" >

                                <bean:write name="hibetsuShiftBean" property="strTime07"/>ÅF

                                <logic:equal value="èoãŒ" name="hibetsuShiftBean" property="strTime07">
                                  <bean:write name="hibetsuShiftBean" property="startTime"/>
                                  &#xFF5E;
                                  <bean:write name="hibetsuShiftBean" property="endTime"/>
                                  <br><bean:write name="hibetsuShiftBean" property="breakTime"/>
                                </logic:equal>
                              </logic:notEmpty>
                            </td>
                          </logic:equal>
                          <logic:equal value="false" name="hibetsuShiftBean" property="boolTime07">
                          <% // èoãŒó\íËäOÇÃéûä‘ë— %>
                            <td width="<%=tdWidth %>px" nowrap="nowrap" align="center">
                              <logic:empty name="hibetsuShiftBean" property="strTime07" >
                                <br>
                              </logic:empty>
                              <logic:notEmpty name="hibetsuShiftBean" property="strTime07" >
                                <bean:write name="hibetsuShiftBean" property="strTime07"/>
                              </logic:notEmpty>
                            </td>
                          </logic:equal>
                        </logic:iterate>
                      </tr>

                      <tr height="<%=trHeight %>px">
                        <logic:iterate id="hibetsuShiftBean" name="hibetsuShiftForm" property="hibetsuShiftBeanList">
                          <logic:equal value="true" name="hibetsuShiftBean" property="boolTime08">
                          <% // èoãŒó\íËÇÃéûä‘ë— %>
                            <td width="<%=tdWidth %>px" nowrap="nowrap" align="center" bgcolor="LightPink">
                              <logic:empty name="hibetsuShiftBean" property="strTime08" >
                                <br>
                              </logic:empty>
                              <logic:notEmpty name="hibetsuShiftBean" property="strTime08" >

                                <bean:write name="hibetsuShiftBean" property="strTime08"/>ÅF

                                <logic:equal value="èoãŒ" name="hibetsuShiftBean" property="strTime08">
                                  <bean:write name="hibetsuShiftBean" property="startTime"/>
                                  &#xFF5E;
                                  <bean:write name="hibetsuShiftBean" property="endTime"/>
                                  <br><bean:write name="hibetsuShiftBean" property="breakTime"/>
                                </logic:equal>
                              </logic:notEmpty>
                            </td>
                          </logic:equal>
                          <logic:equal value="false" name="hibetsuShiftBean" property="boolTime08">
                          <% // èoãŒó\íËäOÇÃéûä‘ë— %>
                            <td width="<%=tdWidth %>px" nowrap="nowrap" align="center">
                              <logic:empty name="hibetsuShiftBean" property="strTime08" >
                                <br>
                              </logic:empty>
                              <logic:notEmpty name="hibetsuShiftBean" property="strTime08" >
                                <bean:write name="hibetsuShiftBean" property="strTime08"/>
                              </logic:notEmpty>
                            </td>
                          </logic:equal>
                        </logic:iterate>
                      </tr>

                      <tr height="<%=trHeight %>px">
                        <logic:iterate id="hibetsuShiftBean" name="hibetsuShiftForm" property="hibetsuShiftBeanList">
                          <logic:equal value="true" name="hibetsuShiftBean" property="boolTime09">
                          <% // èoãŒó\íËÇÃéûä‘ë— %>
                            <td width="<%=tdWidth %>px" nowrap="nowrap" align="center" bgcolor="LightPink">
                              <logic:empty name="hibetsuShiftBean" property="strTime09" >
                                <br>
                              </logic:empty>
                              <logic:notEmpty name="hibetsuShiftBean" property="strTime09" >

                                <bean:write name="hibetsuShiftBean" property="strTime09"/>ÅF

                                <logic:equal value="èoãŒ" name="hibetsuShiftBean" property="strTime09">
                                  <bean:write name="hibetsuShiftBean" property="startTime"/>
                                  &#xFF5E;
                                  <bean:write name="hibetsuShiftBean" property="endTime"/>
                                  <br><bean:write name="hibetsuShiftBean" property="breakTime"/>
                                </logic:equal>
                              </logic:notEmpty>
                            </td>
                          </logic:equal>
                          <logic:equal value="false" name="hibetsuShiftBean" property="boolTime09">
                          <% // èoãŒó\íËäOÇÃéûä‘ë— %>
                            <td width="<%=tdWidth %>px" nowrap="nowrap" align="center">
                              <logic:empty name="hibetsuShiftBean" property="strTime09" >
                                <br>
                              </logic:empty>
                              <logic:notEmpty name="hibetsuShiftBean" property="strTime09" >
                                <bean:write name="hibetsuShiftBean" property="strTime09"/>
                              </logic:notEmpty>
                            </td>
                          </logic:equal>
                        </logic:iterate>
                      </tr>

                      <tr height="<%=trHeight %>px">
                        <logic:iterate id="hibetsuShiftBean" name="hibetsuShiftForm" property="hibetsuShiftBeanList">
                          <logic:equal value="true" name="hibetsuShiftBean" property="boolTime10">
                          <% // èoãŒó\íËÇÃéûä‘ë— %>
                            <td width="<%=tdWidth %>px" nowrap="nowrap" align="center" bgcolor="LightPink">
                              <logic:empty name="hibetsuShiftBean" property="strTime10" >
                                <br>
                              </logic:empty>
                              <logic:notEmpty name="hibetsuShiftBean" property="strTime10" >

                                <bean:write name="hibetsuShiftBean" property="strTime10"/>ÅF

                                <logic:equal value="èoãŒ" name="hibetsuShiftBean" property="strTime10">
                                  <bean:write name="hibetsuShiftBean" property="startTime"/>
                                  &#xFF5E;
                                  <bean:write name="hibetsuShiftBean" property="endTime"/>
                                  <br><bean:write name="hibetsuShiftBean" property="breakTime"/>
                                </logic:equal>
                              </logic:notEmpty>
                            </td>
                          </logic:equal>
                          <logic:equal value="false" name="hibetsuShiftBean" property="boolTime10">
                          <% // èoãŒó\íËäOÇÃéûä‘ë— %>
                            <td width="<%=tdWidth %>px" nowrap="nowrap" align="center">
                              <logic:empty name="hibetsuShiftBean" property="strTime10" >
                                <br>
                              </logic:empty>
                              <logic:notEmpty name="hibetsuShiftBean" property="strTime10" >
                                <bean:write name="hibetsuShiftBean" property="strTime10"/>
                              </logic:notEmpty>
                            </td>
                          </logic:equal>
                        </logic:iterate>
                      </tr>

                      <tr height="<%=trHeight %>px">
                        <logic:iterate id="hibetsuShiftBean" name="hibetsuShiftForm" property="hibetsuShiftBeanList">
                          <logic:equal value="true" name="hibetsuShiftBean" property="boolTime11">
                          <% // èoãŒó\íËÇÃéûä‘ë— %>
                            <td width="<%=tdWidth %>px" nowrap="nowrap" align="center" bgcolor="LightPink">
                              <logic:empty name="hibetsuShiftBean" property="strTime11" >
                                <br>
                              </logic:empty>
                              <logic:notEmpty name="hibetsuShiftBean" property="strTime11" >

                                <bean:write name="hibetsuShiftBean" property="strTime11"/>ÅF

                                <logic:equal value="èoãŒ" name="hibetsuShiftBean" property="strTime11">
                                  <bean:write name="hibetsuShiftBean" property="startTime"/>
                                  &#xFF5E;
                                  <bean:write name="hibetsuShiftBean" property="endTime"/>
                                  <br><bean:write name="hibetsuShiftBean" property="breakTime"/>
                                </logic:equal>
                              </logic:notEmpty>
                            </td>
                          </logic:equal>
                          <logic:equal value="false" name="hibetsuShiftBean" property="boolTime11">
                          <% // èoãŒó\íËäOÇÃéûä‘ë— %>
                            <td width="<%=tdWidth %>px" nowrap="nowrap" align="center">
                              <logic:empty name="hibetsuShiftBean" property="strTime11" >
                                <br>
                              </logic:empty>
                              <logic:notEmpty name="hibetsuShiftBean" property="strTime11" >
                                <bean:write name="hibetsuShiftBean" property="strTime11"/>
                              </logic:notEmpty>
                            </td>
                          </logic:equal>
                        </logic:iterate>
                      </tr>

                      <tr height="<%=trHeight %>px">
                        <logic:iterate id="hibetsuShiftBean" name="hibetsuShiftForm" property="hibetsuShiftBeanList">
                          <logic:equal value="true" name="hibetsuShiftBean" property="boolTime12">
                          <% // èoãŒó\íËÇÃéûä‘ë— %>
                            <td width="<%=tdWidth %>px" nowrap="nowrap" align="center" bgcolor="LightPink">
                              <logic:empty name="hibetsuShiftBean" property="strTime12" >
                                <br>
                              </logic:empty>
                              <logic:notEmpty name="hibetsuShiftBean" property="strTime12" >

                                <bean:write name="hibetsuShiftBean" property="strTime12"/>ÅF

                                <logic:equal value="èoãŒ" name="hibetsuShiftBean" property="strTime12">
                                  <bean:write name="hibetsuShiftBean" property="startTime"/>
                                  &#xFF5E;
                                  <bean:write name="hibetsuShiftBean" property="endTime"/>
                                  <br><bean:write name="hibetsuShiftBean" property="breakTime"/>
                                </logic:equal>
                              </logic:notEmpty>
                            </td>
                          </logic:equal>
                          <logic:equal value="false" name="hibetsuShiftBean" property="boolTime12">
                          <% // èoãŒó\íËäOÇÃéûä‘ë— %>
                            <td width="<%=tdWidth %>px" nowrap="nowrap" align="center">
                              <logic:empty name="hibetsuShiftBean" property="strTime12" >
                                <br>
                              </logic:empty>
                              <logic:notEmpty name="hibetsuShiftBean" property="strTime12" >
                                <bean:write name="hibetsuShiftBean" property="strTime12"/>
                              </logic:notEmpty>
                            </td>
                          </logic:equal>
                        </logic:iterate>
                      </tr>

                      <tr height="<%=trHeight %>px">
                        <logic:iterate id="hibetsuShiftBean" name="hibetsuShiftForm" property="hibetsuShiftBeanList">
                          <logic:equal value="true" name="hibetsuShiftBean" property="boolTime13">
                          <% // èoãŒó\íËÇÃéûä‘ë— %>
                            <td width="<%=tdWidth %>px" nowrap="nowrap" align="center" bgcolor="LightPink">
                              <logic:empty name="hibetsuShiftBean" property="strTime13" >
                                <br>
                              </logic:empty>
                              <logic:notEmpty name="hibetsuShiftBean" property="strTime13" >

                                <bean:write name="hibetsuShiftBean" property="strTime13"/>ÅF

                                <logic:equal value="èoãŒ" name="hibetsuShiftBean" property="strTime13">
                                  <bean:write name="hibetsuShiftBean" property="startTime"/>
                                  &#xFF5E;
                                  <bean:write name="hibetsuShiftBean" property="endTime"/>
                                  <br><bean:write name="hibetsuShiftBean" property="breakTime"/>
                                </logic:equal>
                              </logic:notEmpty>
                            </td>
                          </logic:equal>
                          <logic:equal value="false" name="hibetsuShiftBean" property="boolTime13">
                          <% // èoãŒó\íËäOÇÃéûä‘ë— %>
                            <td width="<%=tdWidth %>px" nowrap="nowrap" align="center">
                              <logic:empty name="hibetsuShiftBean" property="strTime13" >
                                <br>
                              </logic:empty>
                              <logic:notEmpty name="hibetsuShiftBean" property="strTime13" >
                                <bean:write name="hibetsuShiftBean" property="strTime13"/>
                              </logic:notEmpty>
                            </td>
                          </logic:equal>
                        </logic:iterate>
                      </tr>

                      <tr height="<%=trHeight %>px">
                        <logic:iterate id="hibetsuShiftBean" name="hibetsuShiftForm" property="hibetsuShiftBeanList">
                          <logic:equal value="true" name="hibetsuShiftBean" property="boolTime14">
                          <% // èoãŒó\íËÇÃéûä‘ë— %>
                            <td width="<%=tdWidth %>px" nowrap="nowrap" align="center" bgcolor="LightPink">
                              <logic:empty name="hibetsuShiftBean" property="strTime14" >
                                <br>
                              </logic:empty>
                              <logic:notEmpty name="hibetsuShiftBean" property="strTime14" >

                                <bean:write name="hibetsuShiftBean" property="strTime14"/>ÅF

                                <logic:equal value="èoãŒ" name="hibetsuShiftBean" property="strTime14">
                                  <bean:write name="hibetsuShiftBean" property="startTime"/>
                                  &#xFF5E;
                                  <bean:write name="hibetsuShiftBean" property="endTime"/>
                                  <br><bean:write name="hibetsuShiftBean" property="breakTime"/>
                                </logic:equal>
                              </logic:notEmpty>
                            </td>
                          </logic:equal>
                          <logic:equal value="false" name="hibetsuShiftBean" property="boolTime14">
                          <% // èoãŒó\íËäOÇÃéûä‘ë— %>
                            <td width="<%=tdWidth %>px" nowrap="nowrap" align="center">
                              <logic:empty name="hibetsuShiftBean" property="strTime14" >
                                <br>
                              </logic:empty>
                              <logic:notEmpty name="hibetsuShiftBean" property="strTime14" >
                                <bean:write name="hibetsuShiftBean" property="strTime14"/>
                              </logic:notEmpty>
                            </td>
                          </logic:equal>
                        </logic:iterate>
                      </tr>

                      <tr height="<%=trHeight %>px">
                        <logic:iterate id="hibetsuShiftBean" name="hibetsuShiftForm" property="hibetsuShiftBeanList">
                          <logic:equal value="true" name="hibetsuShiftBean" property="boolTime15">
                          <% // èoãŒó\íËÇÃéûä‘ë— %>
                            <td width="<%=tdWidth %>px" nowrap="nowrap" align="center" bgcolor="LightPink">
                              <logic:empty name="hibetsuShiftBean" property="strTime15" >
                                <br>
                              </logic:empty>
                              <logic:notEmpty name="hibetsuShiftBean" property="strTime15" >

                                <bean:write name="hibetsuShiftBean" property="strTime15"/>ÅF

                                <logic:equal value="èoãŒ" name="hibetsuShiftBean" property="strTime15">
                                  <bean:write name="hibetsuShiftBean" property="startTime"/>
                                  &#xFF5E;
                                  <bean:write name="hibetsuShiftBean" property="endTime"/>
                                  <br><bean:write name="hibetsuShiftBean" property="breakTime"/>
                                </logic:equal>
                              </logic:notEmpty>
                            </td>
                          </logic:equal>
                          <logic:equal value="false" name="hibetsuShiftBean" property="boolTime15">
                          <% // èoãŒó\íËäOÇÃéûä‘ë— %>
                            <td width="<%=tdWidth %>px" nowrap="nowrap" align="center">
                              <logic:empty name="hibetsuShiftBean" property="strTime15" >
                                <br>
                              </logic:empty>
                              <logic:notEmpty name="hibetsuShiftBean" property="strTime15" >
                                <bean:write name="hibetsuShiftBean" property="strTime15"/>
                              </logic:notEmpty>
                            </td>
                          </logic:equal>
                        </logic:iterate>
                      </tr>

                      <tr height="<%=trHeight %>px">
                        <logic:iterate id="hibetsuShiftBean" name="hibetsuShiftForm" property="hibetsuShiftBeanList">
                          <logic:equal value="true" name="hibetsuShiftBean" property="boolTime16">
                          <% // èoãŒó\íËÇÃéûä‘ë— %>
                            <td width="<%=tdWidth %>px" nowrap="nowrap" align="center" bgcolor="LightPink">
                              <logic:empty name="hibetsuShiftBean" property="strTime16" >
                                <br>
                              </logic:empty>
                              <logic:notEmpty name="hibetsuShiftBean" property="strTime16" >

                                <bean:write name="hibetsuShiftBean" property="strTime16"/>ÅF

                                <logic:equal value="èoãŒ" name="hibetsuShiftBean" property="strTime16">
                                  <bean:write name="hibetsuShiftBean" property="startTime"/>
                                  &#xFF5E;
                                  <bean:write name="hibetsuShiftBean" property="endTime"/>
                                  <br><bean:write name="hibetsuShiftBean" property="breakTime"/>
                                </logic:equal>
                              </logic:notEmpty>
                            </td>
                          </logic:equal>
                          <logic:equal value="false" name="hibetsuShiftBean" property="boolTime16">
                          <% // èoãŒó\íËäOÇÃéûä‘ë— %>
                            <td width="<%=tdWidth %>px" nowrap="nowrap" align="center">
                              <logic:empty name="hibetsuShiftBean" property="strTime16" >
                                <br>
                              </logic:empty>
                              <logic:notEmpty name="hibetsuShiftBean" property="strTime16" >
                                <bean:write name="hibetsuShiftBean" property="strTime16"/>
                              </logic:notEmpty>
                            </td>
                          </logic:equal>
                        </logic:iterate>
                      </tr>

                      <tr height="<%=trHeight %>px">
                        <logic:iterate id="hibetsuShiftBean" name="hibetsuShiftForm" property="hibetsuShiftBeanList">
                          <logic:equal value="true" name="hibetsuShiftBean" property="boolTime17">
                          <% // èoãŒó\íËÇÃéûä‘ë— %>
                            <td width="<%=tdWidth %>px" nowrap="nowrap" align="center" bgcolor="LightPink">
                              <logic:empty name="hibetsuShiftBean" property="strTime17" >
                                <br>
                              </logic:empty>
                              <logic:notEmpty name="hibetsuShiftBean" property="strTime17" >

                                <bean:write name="hibetsuShiftBean" property="strTime17"/>ÅF

                                <logic:equal value="èoãŒ" name="hibetsuShiftBean" property="strTime17">
                                  <bean:write name="hibetsuShiftBean" property="startTime"/>
                                  &#xFF5E;
                                  <bean:write name="hibetsuShiftBean" property="endTime"/>
                                  <br><bean:write name="hibetsuShiftBean" property="breakTime"/>
                                </logic:equal>
                              </logic:notEmpty>
                            </td>
                          </logic:equal>
                          <logic:equal value="false" name="hibetsuShiftBean" property="boolTime17">
                          <% // èoãŒó\íËäOÇÃéûä‘ë— %>
                            <td width="<%=tdWidth %>px" nowrap="nowrap" align="center">
                              <logic:empty name="hibetsuShiftBean" property="strTime17" >
                                <br>
                              </logic:empty>
                              <logic:notEmpty name="hibetsuShiftBean" property="strTime17" >
                                <bean:write name="hibetsuShiftBean" property="strTime17"/>
                              </logic:notEmpty>
                            </td>
                          </logic:equal>
                        </logic:iterate>
                      </tr>

                      <tr height="<%=trHeight %>px">
                        <logic:iterate id="hibetsuShiftBean" name="hibetsuShiftForm" property="hibetsuShiftBeanList">
                          <logic:equal value="true" name="hibetsuShiftBean" property="boolTime18">
                          <% // èoãŒó\íËÇÃéûä‘ë— %>
                            <td width="<%=tdWidth %>px" nowrap="nowrap" align="center" bgcolor="LightPink">
                              <logic:empty name="hibetsuShiftBean" property="strTime18" >
                                <br>
                              </logic:empty>
                              <logic:notEmpty name="hibetsuShiftBean" property="strTime18" >

                                <bean:write name="hibetsuShiftBean" property="strTime18"/>ÅF

                                <logic:equal value="èoãŒ" name="hibetsuShiftBean" property="strTime18">
                                  <bean:write name="hibetsuShiftBean" property="startTime"/>
                                  &#xFF5E;
                                  <bean:write name="hibetsuShiftBean" property="endTime"/>
                                  <br><bean:write name="hibetsuShiftBean" property="breakTime"/>
                                </logic:equal>
                              </logic:notEmpty>
                            </td>
                          </logic:equal>
                          <logic:equal value="false" name="hibetsuShiftBean" property="boolTime18">
                          <% // èoãŒó\íËäOÇÃéûä‘ë— %>
                            <td width="<%=tdWidth %>px" nowrap="nowrap" align="center">
                              <logic:empty name="hibetsuShiftBean" property="strTime18" >
                                <br>
                              </logic:empty>
                              <logic:notEmpty name="hibetsuShiftBean" property="strTime18" >
                                <bean:write name="hibetsuShiftBean" property="strTime18"/>
                              </logic:notEmpty>
                            </td>
                          </logic:equal>
                        </logic:iterate>
                      </tr>

                      <tr height="<%=trHeight %>px">
                        <logic:iterate id="hibetsuShiftBean" name="hibetsuShiftForm" property="hibetsuShiftBeanList">
                          <logic:equal value="true" name="hibetsuShiftBean" property="boolTime19">
                          <% // èoãŒó\íËÇÃéûä‘ë— %>
                            <td width="<%=tdWidth %>px" nowrap="nowrap" align="center" bgcolor="LightPink">
                              <logic:empty name="hibetsuShiftBean" property="strTime19" >
                                <br>
                              </logic:empty>
                              <logic:notEmpty name="hibetsuShiftBean" property="strTime19" >

                                <bean:write name="hibetsuShiftBean" property="strTime19"/>ÅF

                                <logic:equal value="èoãŒ" name="hibetsuShiftBean" property="strTime19">
                                  <bean:write name="hibetsuShiftBean" property="startTime"/>
                                  &#xFF5E;
                                  <bean:write name="hibetsuShiftBean" property="endTime"/>
                                  <br><bean:write name="hibetsuShiftBean" property="breakTime"/>
                                </logic:equal>
                              </logic:notEmpty>
                            </td>
                          </logic:equal>
                          <logic:equal value="false" name="hibetsuShiftBean" property="boolTime19">
                          <% // èoãŒó\íËäOÇÃéûä‘ë— %>
                            <td width="<%=tdWidth %>px" nowrap="nowrap" align="center">
                              <logic:empty name="hibetsuShiftBean" property="strTime19" >
                                <br>
                              </logic:empty>
                              <logic:notEmpty name="hibetsuShiftBean" property="strTime19" >
                                <bean:write name="hibetsuShiftBean" property="strTime19"/>
                              </logic:notEmpty>
                            </td>
                          </logic:equal>
                        </logic:iterate>
                      </tr>

                      <tr height="<%=trHeight %>px">
                        <logic:iterate id="hibetsuShiftBean" name="hibetsuShiftForm" property="hibetsuShiftBeanList">
                          <logic:equal value="true" name="hibetsuShiftBean" property="boolTime20">
                          <% // èoãŒó\íËÇÃéûä‘ë— %>
                            <td width="<%=tdWidth %>px" nowrap="nowrap" align="center" bgcolor="LightPink">
                              <logic:empty name="hibetsuShiftBean" property="strTime20" >
                                <br>
                              </logic:empty>
                              <logic:notEmpty name="hibetsuShiftBean" property="strTime20" >

                                <bean:write name="hibetsuShiftBean" property="strTime20"/>ÅF

                                <logic:equal value="èoãŒ" name="hibetsuShiftBean" property="strTime20">
                                  <bean:write name="hibetsuShiftBean" property="startTime"/>
                                  &#xFF5E;
                                  <bean:write name="hibetsuShiftBean" property="endTime"/>
                                  <br><bean:write name="hibetsuShiftBean" property="breakTime"/>
                                </logic:equal>
                              </logic:notEmpty>
                            </td>
                          </logic:equal>
                          <logic:equal value="false" name="hibetsuShiftBean" property="boolTime20">
                          <% // èoãŒó\íËäOÇÃéûä‘ë— %>
                            <td width="<%=tdWidth %>px" nowrap="nowrap" align="center">
                              <logic:empty name="hibetsuShiftBean" property="strTime20" >
                                <br>
                              </logic:empty>
                              <logic:notEmpty name="hibetsuShiftBean" property="strTime20" >
                                <bean:write name="hibetsuShiftBean" property="strTime20"/>
                              </logic:notEmpty>
                            </td>
                          </logic:equal>
                        </logic:iterate>
                      </tr>

                      <tr height="<%=trHeight %>px">
                        <logic:iterate id="hibetsuShiftBean" name="hibetsuShiftForm" property="hibetsuShiftBeanList">
                          <logic:equal value="true" name="hibetsuShiftBean" property="boolTime21">
                          <% // èoãŒó\íËÇÃéûä‘ë— %>
                            <td width="<%=tdWidth %>px" nowrap="nowrap" align="center" bgcolor="LightPink">
                              <logic:empty name="hibetsuShiftBean" property="strTime21" >
                                <br>
                              </logic:empty>
                              <logic:notEmpty name="hibetsuShiftBean" property="strTime21" >

                                <bean:write name="hibetsuShiftBean" property="strTime21"/>ÅF

                                <logic:equal value="èoãŒ" name="hibetsuShiftBean" property="strTime21">
                                  <bean:write name="hibetsuShiftBean" property="startTime"/>
                                  &#xFF5E;
                                  <bean:write name="hibetsuShiftBean" property="endTime"/>
                                  <br><bean:write name="hibetsuShiftBean" property="breakTime"/>
                                </logic:equal>
                              </logic:notEmpty>
                            </td>
                          </logic:equal>
                          <logic:equal value="false" name="hibetsuShiftBean" property="boolTime21">
                          <% // èoãŒó\íËäOÇÃéûä‘ë— %>
                            <td width="<%=tdWidth %>px" nowrap="nowrap" align="center">
                              <logic:empty name="hibetsuShiftBean" property="strTime21" >
                                <br>
                              </logic:empty>
                              <logic:notEmpty name="hibetsuShiftBean" property="strTime21" >
                                <bean:write name="hibetsuShiftBean" property="strTime21"/>
                              </logic:notEmpty>
                            </td>
                          </logic:equal>
                        </logic:iterate>
                      </tr>

                      <tr height="<%=trHeight %>px">
                        <logic:iterate id="hibetsuShiftBean" name="hibetsuShiftForm" property="hibetsuShiftBeanList">
                          <logic:equal value="true" name="hibetsuShiftBean" property="boolTime22">
                          <% // èoãŒó\íËÇÃéûä‘ë— %>
                            <td width="<%=tdWidth %>px" nowrap="nowrap" align="center" bgcolor="LightPink">
                              <logic:empty name="hibetsuShiftBean" property="strTime22" >
                                <br>
                              </logic:empty>
                              <logic:notEmpty name="hibetsuShiftBean" property="strTime22" >

                                <bean:write name="hibetsuShiftBean" property="strTime22"/>ÅF

                                <logic:equal value="èoãŒ" name="hibetsuShiftBean" property="strTime22">
                                  <bean:write name="hibetsuShiftBean" property="startTime"/>
                                  &#xFF5E;
                                  <bean:write name="hibetsuShiftBean" property="endTime"/>
                                  <br><bean:write name="hibetsuShiftBean" property="breakTime"/>
                                </logic:equal>
                              </logic:notEmpty>
                            </td>
                          </logic:equal>
                          <logic:equal value="false" name="hibetsuShiftBean" property="boolTime22">
                          <% // èoãŒó\íËäOÇÃéûä‘ë— %>
                            <td width="<%=tdWidth %>px" nowrap="nowrap" align="center">
                              <logic:empty name="hibetsuShiftBean" property="strTime22" >
                                <br>
                              </logic:empty>
                              <logic:notEmpty name="hibetsuShiftBean" property="strTime22" >
                                <bean:write name="hibetsuShiftBean" property="strTime22"/>
                              </logic:notEmpty>
                            </td>
                          </logic:equal>
                        </logic:iterate>
                      </tr>

                      <tr height="<%=trHeight %>px">
                        <logic:iterate id="hibetsuShiftBean" name="hibetsuShiftForm" property="hibetsuShiftBeanList">
                          <logic:equal value="true" name="hibetsuShiftBean" property="boolTime23">
                          <% // èoãŒó\íËÇÃéûä‘ë— %>
                            <td width="<%=tdWidth %>px" nowrap="nowrap" align="center" bgcolor="LightPink">
                              <logic:empty name="hibetsuShiftBean" property="strTime23" >
                                <br>
                              </logic:empty>
                              <logic:notEmpty name="hibetsuShiftBean" property="strTime23" >

                                <bean:write name="hibetsuShiftBean" property="strTime23"/>ÅF

                                <logic:equal value="èoãŒ" name="hibetsuShiftBean" property="strTime23">
                                  <bean:write name="hibetsuShiftBean" property="startTime"/>
                                  &#xFF5E;
                                  <bean:write name="hibetsuShiftBean" property="endTime"/>
                                  <br><bean:write name="hibetsuShiftBean" property="breakTime"/>
                                </logic:equal>
                              </logic:notEmpty>
                            </td>
                          </logic:equal>
                          <logic:equal value="false" name="hibetsuShiftBean" property="boolTime23">
                            <% // èoãŒó\íËäOÇÃéûä‘ë— %>
                            <td width="<%=tdWidth %>px" nowrap="nowrap" align="center">
                              <logic:empty name="hibetsuShiftBean" property="strTime23" >
                                <br>
                              </logic:empty>
                              <logic:notEmpty name="hibetsuShiftBean" property="strTime23" >
                                <bean:write name="hibetsuShiftBean" property="strTime23"/>
                              </logic:notEmpty>
                            </td>
                          </logic:equal>
                        </logic:iterate>
                      </tr>
                    </table>
                  </div>
                </td>
              </tr>
            </table>
          </html:form>
        </div>
      </div>
      <div id="footer">
        <table>
          <tr>
            <td id="footLeft">
              Å@
            </td>
            <td id="footCenter">
              Å@
            </td>
            <td id="footRight">
              Å@
            </td>
          </tr>
        </table>
      </div>
    </div>
  </body>
</html>