<%--FIRST NAME--%>
<div class="form-group ${ hasErrors(bean:employee, field:'firstName', 'has-error has-feedback') }">
	<label for="firstName"><g:message code="employee.firstName.label" default="First Name"/></label>
	<g:textField class="form-control" name="firstName" value="${ employee?.firstName }" required=""/>
	<g:hasErrors bean="${ employee }" field="firstName">
		<span class="glyphicon glyphicon-remove form-control-feedback"></span>
		<g:eachError bean="${ employee }" field="firstName" var="e">
			<span class="help-block"><g:message error="${e}"/></span>
		</g:eachError>
	</g:hasErrors>
</div>

<%--MIDDLE NAME--%>
<div class="form-group ${ hasErrors(bean:employee, field:'middleName', 'has-error has-feedback') }">
	<label for="middleName"><g:message code="employee.middleName.label" default="Middle Name"/></label>
	<g:textField class="form-control" name="middleName" value="${ employee?.middleName }"required=""/>
	<g:hasErrors bean="${ employee }" field="middleName">
		<span class="glyphicon glyphicon-remove form-control-feedback"></span>
		<g:eachError bean="${ employee }" field="middleName" var="e">
			<span class="help-block"><g:message error="${e}"/></span>
		</g:eachError>
	</g:hasErrors>
</div>

<%--LAST NAME--%>
<div class="form-group ${ hasErrors(bean:employee, field:'lastName', 'has-error has-feedback') }">
	<label for="lastName"><g:message code="employee.lastName.label" default="Last Name"/></label>
	<g:textField class="form-control" name="lastName" value="${ employee?.lastName }"required=""/>
	<g:hasErrors bean="${ employee }" field="lastName">
		<span class="glyphicon glyphicon-remove form-control-feedback"></span>
		<g:eachError bean="${ employee }" field="lastName" var="e">
			<span class="help-block"><g:message error="${e}"/></span>
		</g:eachError>
	</g:hasErrors>
</div>

<%--POSITION--%>
<div class="form-group ${ hasErrors(bean:employee, field:'position', 'has-error has-feedback') }">
	<label for="position"><g:message code="employee.position.label" default="Position"/></label>
	<g:textField class="form-control" name="position" value="${ employee?.position }" required=""/>
	<g:hasErrors bean="${ employee }" field="position">
		<span class="glyphicon glyphicon-remove form-control-feedback"></span>
		<g:eachError bean="${ employee }" field="position" var="e">
			<span class="help-block"><g:message error="${e}"/></span>
		</g:eachError>
	</g:hasErrors>
</div>
<%--PIN--%>
<div class="form-group ${ hasErrors(bean:employee, field:'pin', 'has-error has-feedback') }">
	<label for="pin"><g:message code="employee.pin.label" default="PIN"/></label>
	<g:textField class="form-control" name="pin" value="${ employee?.pin }" required=""/>
	<g:hasErrors bean="${ employee }" field="pin">
		<span class="glyphicon glyphicon-remove form-control-feedback"></span>
		<g:eachError bean="${ employee }" field="pin" var="e">
			<span class="help-block"><g:message error="${e}"/></span>
		</g:eachError>
	</g:hasErrors>
</div>
<%--ADMIN--%>
<div class="form-group form-inline ${ hasErrors(bean:employee, field:'isAdmin', 'has-error has-feedback') }">
	<label>
		<g:checkBox name="isAdmin" value="${ employee?.isAdmin }"/>
		<label for="isAdmin"><g:message code="employee.isAdmin.label" default="Administrator"/></label>
		<g:hasErrors bean="${ employee }" field="isAdmin">
			<span class="glyphicon glyphicon-remove form-control-feedback"></span>
		</g:hasErrors>
	</label>
</div>

<%--PHOTO--%>
<div class="form-group ${ hasErrors(bean:employee, field:'photo_url', 'has-error has-feedback') }">

	<label for="photo"><g:message code="employee.photo.label" default="Photo"/></label>
	<input type="file" name="photo">
	<g:hasErrors bean="${ employee }" field="photo">
		<span class="glyphicon glyphicon-remove form-control-feedback"></span>
	</g:hasErrors>

</div>