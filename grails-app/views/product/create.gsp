<html>
<head>
<title>Web Store</title>
<meta name="layout" content="main" />
</head>
<body>

		<g:form class="simpleform"
			url="[controller:'product',action:'create']">
			<fieldset>
				<legend>Create Product</legend>
				<p class="info">Complete the form below to create a product!</p>
				<g:hasErrors bean="${product}">
					<div class="errors">
						<g:renderErrors bean="${product}" />
					</div>
				</g:hasErrors>

				<label for="name">Name</label>
				<div class="rightcol">
					<g:textField name="name" value="${product?.name}"
						class="${hasErrors(bean:user,field:'name','errors')}" />
				</div>

				<label for="description">Description</label>
				<div class="rightcol">
					<g:textField name="description" value="${product?.description}"
						class="${hasErrors(bean:user,field:'description','errors')}" />
				</div>

				<label for="price">Price</label>
				<div class="rightcol">
					<g:textField name="price" value="${product?.price}"
						class="${hasErrors(bean:user,field:'price','errors')}" />
				</div>
				
				<label for="stock">Stock</label>
				<div class="rightcol">
					<g:textField name="stock" value="${product?.stock}"
						class="${hasErrors(bean:user,field:'stock','errors')}" />
				</div>

				<label for="category">Category</label>
				<div class="rightcol">
					<g:select name="category.id" from="${en.store.Category.list()}"
						optionKey="id" value="${category?.user?.id}"
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
					<g:submitButton class="button" name="submitButton"
						value="Create Product" />
				</div>
			</fieldset>
		</g:form>

</body>
</html>

