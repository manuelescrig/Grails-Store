<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title><g:layoutTitle default="Grails" /></title>
<link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
<link rel="shortcut icon"
	href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
<g:layoutHead />
</head>
<body>
	<div id="wrapper">
		<!-- header picture -->
		<div id="header">
			
		</div>
		<!-- END #header -->

		<!-- username | logout link -->
		<g:if test="${session?.user}">
			<div id="login">
				${session?.user?.firstName}
				${session?.user?.lastName}
				|
				<g:link controller="user" action="logout">Logout</g:link>
			</div>
			<!-- END #login -->
		</g:if>
		<g:else>
			<div id="login">
				<p>
					<g:link controller="user" action="login">Click here to Login</g:link>
					or
					<g:link controller="user" action="register">Register</g:link>
				</p>
			</div>
		</g:else>

		<h1>WebShop</h1>
	<g:if test="${session?.user?.username == 'admin'}">
			<div>
				<g:link controller="main" action="index">Home</g:link>
				|
				<g:link controller="product" action="list">Show all Products</g:link>
				|
				<g:link controller="category" action="list">Show all Categories</g:link>
				|
				<g:link controller="product" action="create">Create Product</g:link>
				|
				<g:link controller="category" action="create">Create Category</g:link>

			</div>
		</g:if>
		<g:else>
			<div>
				<g:link controller="main" action="index">Home</g:link>
				|
				<g:link controller="product" action="list">Show all Products</g:link>
				|
				<g:link controller="category" action="list">Show all Categories</g:link>
			</div>
		</g:else>
		<div id="line"></div>
		<g:if test="${session?.user}">
			<div id="bag">
				<p><g:link controller="bag" action="show" id="${session?.user.id}">My Shopping Bag</g:link>
				(${session?.bag?.items} items)
				</p>
			</div>
		</g:if>
		<g:else>
			<div id="bag">
				<g:link controller="user" action="login">Login</g:link> to check your Shopping Bag!
			</div>
		</g:else>
		<br></br>


		<div id="nav"></div>
		<!-- END #nav -->

		<div id="content">
			<g:layoutBody />
		</div>
		<!-- END #content -->

		<br></br>
		<g:link controller="main" action="index">Home</g:link>
		<div id="footer">
			<p>Created by <a href="http://www.youngbit.com">www.youngbit.com</a> | 2011</p>
		</div>
		<!-- END #footer -->

	</div>
	<!-- END #wrapper -->
</body>
</html>
