<%@ page import="timelog.Log" %>



<div class="fieldcontain ${hasErrors(bean: logInstance, field: 'isLogIn', 'error')} ">
	<label for="isLogIn">
		<g:message code="log.isLogIn.label" default="Is Log In" />
		
	</label>
	<g:checkBox name="isLogIn" value="${logInstance?.isLogIn}" />

</div>

<div class="fieldcontain ${hasErrors(bean: logInstance, field: 'employee', 'error')} required">
	<label for="employee">
		<g:message code="log.employee.label" default="Employee" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="employee" name="employee.id" from="${timelog.Employee.list()}" optionKey="id" required="" value="${logInstance?.employee?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: logInstance, field: 'logTime', 'error')} required">
	<label for="logTime">
		<g:message code="log.logTime.label" default="Log Time" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="logTime" precision="day"  value="${logInstance?.logTime}"  />

</div>

