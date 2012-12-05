<html>
<head>
<title>Web Store</title>
<meta name="layout" content="main" />
</head>
<body>
	<g:form method="post" class="simpleform">
		<fieldset>
			<legend>Edit Category</legend>
			<p class="info">Complete the form below to update a category!</p>
			<g:hasErrors bean="${category}">
				<div class="errors">
					<g:renderErrors bean="${category}" />
				</div>
			</g:hasErrors>

			<label for="name">Id</label>
			<div class="rightcol">
				<g:textField name="id" value="${category?.id}"
					class="${hasErrors(bean:user,field:'name','errors')}" />
			</div>


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
					optionKey="id" value="${product?.user?.id}"
					class="${hasErrors(bean:user,field:'description','errors')}" />
			</div>

			<label>&nbsp;</label>
			<div class="rightcol">
				<g:actionSubmit class="button" value="Update" />
			</div>
		</fieldset>
	</g:form>

</body>

</html>