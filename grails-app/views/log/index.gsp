
<%@ page import="timelog.Log" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'log.label', default: 'Log')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<g:render template="/nav"></g:render>
		<div id="list-log" class="container-fluid" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="alert alert-default" role="status">${flash.message}</div>
			</g:if>
			<table class="table">
				<thead>		
					<th><g:message code="log.employee.label" default="Employee" /></th>
					<g:sortableColumn property="isLogIn" title="${message(code: 'log.isLogIn.label', default: 'Is Log In')}" />
					<g:sortableColumn property="logTime" title="${message(code: 'log.logTime.label', default: 'Log Time')}" />
				</thead>
				<tbody>
				<g:each in="${logInstanceList}" status="i" var="logInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td>${ logInstance.employee.fullName() }</td>
						<td><g:formatBoolean boolean="${ logInstance.isLogIn }" true="IN" false="OUT"/></td>					
						<td><g:formatDate date="${logInstance.logTime}" format="dd-MMM-yyyy hh:mm a" /></td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${logInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
