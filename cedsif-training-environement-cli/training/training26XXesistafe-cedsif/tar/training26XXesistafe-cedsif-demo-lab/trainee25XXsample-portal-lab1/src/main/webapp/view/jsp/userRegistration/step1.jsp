<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="ce007shifitaichi"%>
<style type="text/css">
  
    .perfil
    {
       color: red   
    }
    
    .aplicacoes
    {
       color: blue   
    }
    
    select
    {
        color: blue
    }
    
    #perfil
    {
      color: darkcyan   
    }
    
    .hidden-tr{
        
         border: 0px;
         visibility: hidden;
    }
    
    table {
        
        border: 0px;
    }
    
  
</style>
    
<script type="text/javascript">
    
</script>
    
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <link rel="stylesheet" type="text/css" href="../css/struture.css">
        <link rel="stylesheet" type="text/javascript" href="../js/struture.js">             
        
        <title>Login Page</title>
    </head>
    <body>
       
<h3>Registro de Utilizador2</h3>
<form name='f' action='SendRequest.html' method='POST'>
 <table>
     <tr class="hidden-tr"><td>Id:</td><td><input type='text' name='id' value='' disabled="false"></td></tr>
     <tr><td>CÃ³digo:</td><td><input type='text' name='codigo' value="ce2022007|cp2022007" disabled="true"/></td></tr>
    <tr><td>Nome Apelido:</td><td><input type='text' name='nomeapelido'/>,<input type='text' name='apelido'/></td></tr>
    <tr><td>Conta do usuario:</td><td><input type='text' name='contausario' value="shifushaolin" disabled="true"/></td></tr>
    <tr><td>Senha:</td><td><input type='password' name='senha'/></td></tr>
    <tr><td>Perfil:</td>
    <!--
       perfil,* 
           (indefinido, 
            estudante, 
            docente ,
            administrador, 
            super administrador)
       
       aplicaÃ§Ãµes permitadas 
            * (gestÃ£o de horÃ¡rios, 
               gestÃ£o de disciplinas, 
               gestÃ£o de economato, 
               gestÃ£o de dispensas, 
               alocaÃ§Ã£o de disciplinas)
    
        <td>
            <select name="perfil" id="perfil" style="">
                <option value="undefined" selected="true">Indefinido</option>
                <option class="hidden-tr" value="simple_user">Utilizador</option>
                <option class="hidden-tr" value="admin">Administrador</option>
                <option class="hidden-tr" value="super_admin">Super Administrador</option>
            </select>
        </td>
    
    -->
            <select name="perfil" id="perfil" style="">
                <ce007shifitaichi:forEach var="entry" items="${perfil}">
                    <option value=${entry.key} selected="true">${entry.value}</option>
                </ce007shifitaichi:forEach>
                
            </select>
        </td>
    </tr>
    <tr class="hidden-tr"><td>Aplicacoes permitidas:</td>
        <td>
            <select name="aplicoes" multiple="true" size="2" style="">
                <option value="calendario_disciplinas">Cadastro de Disciplinas</option>
                <option value="gestao_ferias">Licenï¿½a Discipliar</option>
            </select>
        </td>
    </tr>
    <tr><td colspan='2'><input id="submit" name="submit" type="submit" value="registar"/></td></tr>
  </table>
</form>
</body>
