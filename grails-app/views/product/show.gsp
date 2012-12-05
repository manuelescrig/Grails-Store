<html>
<head>
<title>Web Store</title>
<meta name="layout" content="main" />
</head>
<body>

	<div class="simpleform">
		<fieldset>
			<legend>Product</legend>
			<h2>
				${product.name}
			</h2>
			<div>
				<label for="description">Description</label>
				<div class="rightcol">
					${product.description}
				</div>
				<label for="price">Price</label>
				<div class="rightcol">
					${product.price}
					Euros
				</div>
				<label for="stock">Stock</label>
				<div class="rightcol">
					${product.stock}
				</div>
				<label for="category">Category</label>
				<div class="rightcol">
					<g:link controller="category" action="show"
						id="${product.category.id}">
						${product.category}
					</g:link>
				</div>

				<label for="User">User</label>
				<div class="rightcol">
					${product.user}
				</div>
				<label for="dateCreated">Created</label>
				<div class="rightcol">
					${product.dateCreated}
				</div>
				<%--		 <li>--%>
				<%--		<g:each in = "${product.category}">--%>
				<%--		${it.name}--%>
				<%--		</g:each>--%>
				<%--		</li> --%>
				</ul>
				<br>
				<g:if test="${session?.user?.username == 'admin'}">
					<g:form>
						<input type="hidden" name="id" value="${product?.id}" />
						<g:actionSubmit value="Edit" />
						<g:actionSubmit onclick="return confirm('Are you sure?');"
							value="Delete" />
					</g:form>
				</g:if>
				<div id="buy">
					<g:remoteLink controller="productPurchased" action="create"
						id="${product.id}">Click here to buy this product!
					</g:remoteLink>
				</div>
			</div>
		</fieldset>
	</div>

	<br>

</body>

</html>