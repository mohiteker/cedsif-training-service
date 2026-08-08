<!DOCTYPE html>
<html>
    <head>
        <title>Login Page</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!--<link rel="stylesheet" type="text/javascript" href=""/>-->
        
        <link rel="stylesheet" type="text/css" href="../css/"/>
        <script src="../js/jquery-3.5.1.min.js"></script>

        <script type="text/javascript">

            $(document).ready(function () {
                $("#btn-main-id").click(function () {
                    $("#form-login-id").attr('action', '/');
                    $("#form-login-id").submit(); // Submit the form
                });
            });

            $(document).ready(function () {
                $("#btn-register-id").click(function () {
                    $("#form-login-id").attr('action', '/user-register?isUser=false');
                    $("#form-login-id").submit(); // Submit the form
                });
            });

        </script>

        <style type="text/css">
            table{
                border:0px solid;
                background-repeat: no-repeat;
                width: 510px;
                margin-left: 30%;
                margin-top: 10%; 
            }
        </style>

    </head>
    <body>
  
        
        <!-- criar um formulario-->
        <form id="login-form" name="login-form" action="Login" method="post">
           
            <div style="background-image: url(login.png)">
            <table id="table-login">
                <tr><td>User:</td><td><input type='text'         name="login-username"></td></tr>
                <tr><td>Password:</td><td><input type='password' name="login-password"/></td></tr>
                <tr><td colspan='2'><input id="btn-main-id"      name="login-submit" type="submit" value="login"/></td></tr>
                <tr><td colspan='2'><input id="btn-register-id" name="btn-r-submit" type="submit" value="Registre-se"/></td></tr>
            </table>
            </div>
            
            
        </form>
    </body>
</html>
