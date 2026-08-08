<!DOCTYPE html>
<html>
<head>
<title>Login Page</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!--loading a css framework or file-->
<link rel="stylesheet" type="text/css"
	href="../../ui-js/semantic.min.css" />

<!--loading local a js framework from file-->
<script src="../../ui-js/jquery.min.js"></script>

<!--loading local a js-->
<script src="../../ui-js/semantic.min.js"></script>

<!--loading a remote js framework from webResource-->
<link rel="stylesheet" type="text/javascript" href="" />

<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/fomantic-ui@2.9.3/dist/semantic.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/fomantic-ui@2.9.3/dist/semantic.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$("#btn-main-id").click(function() {
			$("#form-login-id").attr('action', '/');
			$("#form-login-id").submit(); // Submit the form
		});
	});

	$(document).ready(function() {
		$("#btn-register-id").click(function() {
			$("#form-login-id").attr('action', '/user-register?isUser=false');
			$("#form-login-id").submit(); // Submit the form
		});
	});

	$(document).ready(function() {
		$("button.continue").html("Next Step...");
	});

	//Evente handling :- get an css class element and apply jq functions
	var hiddenBox = $("#banner-message");

	$("button-container button").on("click", function(event) {
		//enable display of element
		hiddenBox.show();
	});

	//Ajax :- calls a function on server /api/v23/findBy<functionName>/<serviceName>
	//        where query parameter is <parameterName>=ce23XX

	//ajax sintaxe
	$(document).ready(function() {
		$.ajax({
			url : "/api/v23/findBy<functionName>/<serviceName>",
			data : {
				<parameterName> : "ceXX23"
			},
			success : function(result) {
				$("#class-element").html("<i>".concat(result, "</i>"))
			}
		});
	});
</script>

<style type="text/css">
fieldset {
	width: 300px;
	margin-left: 500px;
	margin-top: 300px;
}

legend {
	font-size: 50px;
}

tr th {
	font-size: 12px;
}

table {
	border: 0px solid;
	background-repeat: no-repeat;
	margin-left: 30%;
	margin-top: 40%;
}
</style>

</head>
<body>

	<form id="form-login-id" name="form-login" method="POST"
		action="userAuth.v3">
		<div class="login"
			style="background-image: url(../userAuthentication/dmj_logo.png); text-align: right; background-color: white">


			<table id="table-login">
				<tr>
					<th>
						<div class="ui right labeled left icon input">
							<i class="user icon"></i> <input type="text"
								placeholder="accountName" name='username' autocomplete="off">
							<a class="ui access label">
								accountName&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </a>
						</div>
					</th>
				</tr>
				<tr>
					<th>
						<div class="ui right labeled left icon input">
							<i class="key icon"></i> <input type="password"
								placeholder="accountCredential" name='password'
								autocomplete="off"> <a class="ui key label">
								accountCredential </a>
						</div>
					</th>
				<tr>
					<td colspan='2'><input class="ui button" id="btn-main-id"
						name="btn-m-submit" type="submit" value="Login" /></td>
				</tr>
				<!-- <tr><td colspan='2'><input id="btn-register-id" name="btn-r-submit" type="submit" value="Registre-se"/></td></tr> -->
			</table>
		</div>
	</form>
</body>
</html>