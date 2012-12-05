<html>
<head>
<title>Web Store</title>
<meta name="layout" content="main" />
</head>
<body>

		<g:form class="simpleform"
			url="[controller:'category',action:'create']">
			<fieldset>
				<legend>Create Category</legend>
				<p class="info">Complete the form below to create a new
					Category!</p>
				<g:hasErrors bean="${category}">
					<div class="errors">
						<g:renderErrors bean="${category}" />
					</div>
				</g:hasErrors>

				<label for="name">Name</label>
				<div class="rightcol">
					<g:textField name="name" value="${category?.name}"
						class="${hasErrors(bean:user,field:'name','errors')}" />
				</div>

				<label for="description">Description</label>
				<div class="rightcol">
					<g:textField name="description" value="${category?.description}"
						class="${hasErrors(bean:user,field:'description','errors')}" />
				</div>

				<label for="user">User</label>
				<div class="rightcol">
					<g:select name="user.id" from="${en.store.User.list()}"
						optionKey="id" value="${category?.user?.id}"
						class="${hasErrors(bean:user,field:'description','errors')}" />
				</div>


				<label>&nbsp;</label>
				<div class="rightcol">
					<g:submitButton class="button" name="submitButton"
						value="Create Category" />
				</div>
			</fieldset>
		</g:form>
</body>
</html>

