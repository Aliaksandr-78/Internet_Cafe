<!DOCTYPE html>
<html>
<head>
    <title>BUYSELL</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
        }
        h1 {
            text-align: center;
            color: #333;
        }
        hr {
            border: none;
            border-top: 2px solid #333;
            margin: 20px 0;
        }
        form {
            display: inline-block;
            margin-bottom: 20px;
        }
        input[type="text"], input[type="password"], input[type="email"] {
            padding: 10px;
            border-radius: 5px;
            border: none;
            margin-bottom: 10px;
            width: 100%;
        }
        input[type="submit"], input[type="button"] {
            background-color: #333;
            color: #fff;
            padding: 10px;
            border-radius: 5px;
            border: none;
            cursor: pointer;
            width: 100%;
        }
        input[type="submit"]:hover, input[type="button"]:hover {
            background-color: #555;
        }
        a {
            color: #333;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
        .placement {
            background-color: #fff;
            padding: 10px;
            border-radius: 5px;
            margin-bottom: 20px;
        }
        .placement h2 {
            margin-top: 0;
        }
    </style>
</head>
<body>
<h1>Интернет-кафе </h1><hr>
<#if user.email??>
    <h3>Имя пользователя: <i>${user.name}</i></h3>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input type="submit" value="Выйти"/>
    </form>
    <#if user.isAdmin()>
        <a href="/admin">Панель администратора</a>
    </#if>
<#else>
    <a href="/login">Войти</a>
</#if>
<hr>
<form action="/placement" method="get">
    Поиск по адресу Интернет-кафе: <input type="text" name="address"><br>
    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <input type="submit" value="Поиск" />
</form>
<h4>Местоположение Интернет-кафе</h4>
<#list placements as placement>
    <div class="placement">
        <h2>${placement.address}</h2>
        <p><a href="/placement/${placement.id}">Перейти к интернет-кафе</a></p>
    </div>
<#else>
    <h3>Интернет-кафе нет</h3>
</#list>
<hr>
<#if user.isAdmin()>
    <h3>Создать новое местоположение интернет-кафе</h3>
    <form action="/placement/create" method="post">
        Адресс интернет-кафе: <input type="text", name="address"/><br><br>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input type="submit" value="Добавить Интернет кафе"/>
    </form>
</#if>
</body>
</html>


