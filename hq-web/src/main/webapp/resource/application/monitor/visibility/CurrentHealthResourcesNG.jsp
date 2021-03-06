<%@ page language="java" %>
<%@ page errorPage="/common/Error2.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags/jsUtils" prefix="jsu" %>

<%--
  NOTE: This copyright does *not* cover user programs that use HQ
  program services by normal system calls through the application
  program interfaces provided as part of the Hyperic Plug-in Development
  Kit or the Hyperic Client Development Kit - this is merely considered
  normal use of the program, and does *not* fall under the heading of
  "derived work".
  
  Copyright (C) [2004, 2005, 2006], Hyperic, Inc.
  This file is part of HQ.
  
  HQ is free software; you can redistribute it and/or modify
  it under the terms version 2 of the GNU General Public License as
  published by the Free Software Foundation. This program is distributed
  in the hope that it will be useful, but WITHOUT ANY WARRANTY; without
  even the implied warranty of MERCHANTABILITY or FITNESS FOR A
  PARTICULAR PURPOSE. See the GNU General Public License for more
  details.
  
  You should have received a copy of the GNU General Public License
  along with this program; if not, write to the Free Software
  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307
  USA.
 --%>


<tiles:insertTemplate template="/resource/common/monitor/visibility/ResourcesTabNG.jsp"/>

<tiles:importAttribute name="mode" ignore="true"/>
<tiles:importAttribute name="showProblems" ignore="true"/>
<tiles:importAttribute name="showOptions" ignore="true"/>

<c:if test="${showProblems}">
	<jsu:importScript path="/js/listWidget.js" />
</c:if>

<table width="285" cellpadding="2" cellspacing="0" border="0">
  <tr>
    <td>
      <tiles:insertDefinition name=".resource.application.monitor.visibility.listchildresources">
        <tiles:putAttribute name="mode" value="${mode}"/>
        <tiles:putAttribute name="childResourceType" value="3"/>
        <tiles:putAttribute name="childResourcesHealthKey" value="resource.server.inventory.ServicesTab" />
        <tiles:putAttribute name="childResourcesTypeKey" value="resource.application.monitor.visibility.ServiceTypeTH"/>
        <tiles:putAttribute name="checkboxes"  value="${showProblems}"/>
      </tiles:insertDefinition>
    </td>
  </tr>
  <tr>
    <td>
      <tiles:insertDefinition name=".resource.common.monitor.visibility.hostResourcesCurrentHealth">
        <tiles:putAttribute name="mode" value="${mode}"/>
        <tiles:putAttribute name="summaries" value="${HostHealthSummaries}"/>
        <tiles:putAttribute name="showHostPlatform" value="true"/>
        <tiles:putAttribute name="tabKey" value="resource.common.monitor.visibility.HostServersTab"/>
        <tiles:putAttribute name="hostResourcesHealthKey" value="resource.common.monitor.visibility.ServerTH"/>
        <tiles:putAttribute name="checkboxes" value="${showProblems}"/>
      </tiles:insertDefinition>
    </td>
  </tr>
  <tr>
    <td>
  <c:choose>
    <c:when test="${showProblems}">
      <tiles:insertDefinition name=".resource.common.monitor.visibility.problemmetrics"/>
    </c:when>
    <c:when test="${showOptions}">
      <tiles:insertTemplate template="/resource/common/monitor/visibility/MetricsDisplayOptionsNG.jsp"/>
    </c:when>
  </c:choose>
    </td>
  </tr>
</table>
