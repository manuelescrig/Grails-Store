<html>
<head>
<title>Web Store</title>
<meta name="layout" content="main" />
</head>
<body>

	<h2>My Shopping Bag</h2>
	<g:if test="${session?.user?.username == 'admin'}">
		<g:form>
			<input type="hidden" name="id" value="${bag?.id}" />
			<g:actionSubmit value="Edit" />
			<g:actionSubmit onclick="return confirm('Are you sure?');"
				value="Delete" />
		</g:form>
	</g:if>
	<br>

	<div>
		<h2>
			Products in
			${bag.user.firstName}'s bag!
		</h2>
		<p>
			<strong>Date Created:</strong>
			${bag.dateCreated}
			| <strong>Last Updated:</strong>
			${bag.lastUpdated}
		</p>
		<table>
			<thead>
				<tr>
					<g:sortableColumn property="id" title="Id" />
					<g:sortableColumn property="name" title="Name" />
					<g:sortableColumn property="description" title="Description" />
					<g:sortableColumn property="category" title="Category" />
					<g:sortableColumn property="price" title="Price" />
					<g:sortableColumn property="quantity" title="Quantity" />
					<g:sortableColumn property="totalprice" title="Total Price" />
				</tr>
			</thead>
			<tbody>
				<g:each in="${bag.products}" var="product">
					<tr>
						<td>
							${product.id}
						</td>
						<td><g:link controller="product" action="show"
								id="${product.product.id}">
								${product.product.name}
							</g:link></td>
						<td>
							${product.product.description}
						</td>
						<td>
							${product.product.category}
						</td>
						<td>
							${product.price}
						</td>
						<td>
						<g:remoteLink controller="productPurchased" action="deleteOne"
								id="${product.id}">[-]
						</g:remoteLink>
							${product.quantity}
							
						<g:remoteLink controller="productPurchased" action="addOne"
								id="${product.id}">[+]
						</g:remoteLink>
						</td>
						<td>
							${product.totalprice}
						</td>
						<td><g:remoteLink controller="bag" action="removeProduct"
								id="${product.id}">Remove product!
					</g:remoteLink>
						</td>
					</tr>
				</g:each>
			</tbody>
		</table>
		<p>
			<strong>Total items:</strong>
			${bag.items}
			| <strong>Total Price:</strong>
			${bag.total}
			Euros
		</p>
	</div>
	<div id="buy">
		<p>
			<a href="#">Click here to check out your order</a>
		</p>
	</div>



	<br>

</body>

</html>