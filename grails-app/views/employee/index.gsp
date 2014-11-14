<html>
	<head>
		<meta name="layout" content="main">
	</head>
	<body>
		<g:render template="/nav"></g:render>
		<content>
			<div class="container-fluid">
				<h3>Employees</h3>
				<g:link class="btn btn-default" controller="employee" action="create">
					<span class="glyphicon glyphicon-plus"></span> Add New</g:link>
				
				<g:if test="${employeeList}">
					<table class="table table-hover">
						<thead>
							<th>Name</th>
							<th>Position</th>
							<th>Logged</th>
							<th>Time</th>
						</thead>
						<tbody>
							<g:each in="${employeeList}" var="employee">
								<tr>
									<td>${ employee?.fullName() }</td>
									<td>${ employee?.position }</td>
									<td><g:formatBoolean boolean="${ employee?.isLoggedIn }" true="IN" false="OUT"/></td>
									<td><g:formatDate format="E, dd-MMM-yyyy hh:mm a" date="${ employee?.lastLog }"/></td>
								</tr>
							</g:each>
						</tbody>
					</table>
				</g:if>
				<g:else>
					<h3>
						There are no employees to display yet. 
						<small><g:link controller="employee" action="create">Click here</g:link> to add some.</small>
					</h3>
				</g:else>
			</div>
		</content>
	</body>
</html>