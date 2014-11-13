
<%@ page import="timelog.Log" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'log.label', default: 'Log')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-log" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-log" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list log">
			
				<g:if test="${logInstance?.isLogIn}">
				<li class="fieldcontain">
					<span id="isLogIn-label" class="property-label"><g:message code="log.isLogIn.label" default="Is Log In" /></span>
					
						<span class="property-value" aria-labelledby="isLogIn-label"><g:formatBoolean boolean="${logInstance?.isLogIn}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${logInstance?.employee}">
				<li class="fieldcontain">
					<span id="employee-label" class="property-label"><g:message code="log.employee.label" default="Employee" /></span>
					
						<span class="property-value" aria-labelledby="employee-label"><g:link controller="employee" action="show" id="${logInstance?.employee?.id}">${logInstance?.employee?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${logInstance?.logTime}">
				<li class="fieldcontain">
					<span id="logTime-label" class="property-label"><g:message code="log.logTime.label" default="Log Time" /></span>
					
						<span class="property-value" aria-labelledby="logTime-label"><g:formatDate date="${logInstance?.logTime}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:logInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${logInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
