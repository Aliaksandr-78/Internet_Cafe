<!DOCTYPE html>
<html>
<head>
    <title>BUYSELL</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
        }
        h1 {
            text-align: center;
            margin-top: 50px;
            color: #333;
        }
        h3, h4 {
            color: #333;
            margin-top: 20px;
        }
        form {
            margin-top: 20px;
        }
        input[type="submit"] {
            background-color: #333;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #555;
        }
    </style>
</head>
<body>
<h1>Столик номер: ${desk.number}</h1>
<h3>Информация</h3>
<h4>Статус столика: ${desk.status}</h4>
<h4>Категория столика: ${desk.category}</h4><hr>
<#if desk.status == "свободен">
    <form action="/desk/occupy/${desk.id}/${user.email}" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input type="submit" value="Занять столик">
    </form>
<#else>
    <#if user.email == desk.user || user.isAdmin()>
        <form action="/desk/clear/${desk.id}" method="post">
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <input type="submit" value="Освободить столик">
        </form>
    </#if>
</#if>
<hr>
<#if user.isAdmin()>
    <form action="/desk/delete/${desk.id}" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input type="submit" value="Удалить столик"/>
    </form>
</#if>
</body>
</html>