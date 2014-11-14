<html>
	<head>
		<meta name="layout" content="main">
	</head>
	<body>
		<g:render template="/nav"></g:render>
		<div class="container-fluid">
			<h3>Add Employee</h3>
			
			<div class="col-md-4">
				<g:if test="${flash.message}">
					<div class="alert alert-${flash.context} }" role="alert">
						<span class="glyphicon glyphicon-remove pull-right" data-dismiss="alert"></span>
						<g:message message="${flash.message}"/>
					</div>
				</g:if>				
				<g:uploadForm url="[resource:employee, action:'save']">
					<g:render template="form"></g:render>
					<button type="submit" class="btn btn-primary" name="submit" value="add-one">Submit</button>
					<button type="submit" class="btn btn-default" name="submit" value="add-more">Submit + Add More</button>
				</g:uploadForm>
			</div>
		</div>
	</body>
</html>