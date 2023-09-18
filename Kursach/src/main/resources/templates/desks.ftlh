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
        div {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0,0,0,0.2);
            margin-bottom: 20px;
        }
        p {
            margin: 0;
            font-size: 18px;
            color: #333;
        }
        b {
            font-weight: bold;
        }
        a {
            color: #333;
            text-decoration: none;
            font-weight: bold;
        }
        a:hover {
            color: #555;
        }
        form {
            width: 50%;
            margin: 50px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0,0,0,0.2);
        }
        input[type="text"], input[type="cymbol"] {
            width: 100%;
            padding: 10px;
            border-radius: 5px;
            border: none;
            margin-bottom: 20px;
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
        h3 {
            color: #333;
            margin-top: 50px;
        }
    </style>
</head>
<body>
<h1>Столики</h1><hr>
<#list desks as desk>
    <div>
        <p>Столик: ${desk.number}. Статус: <b>${desk.status}</b> | <a href="/desk/${desk.id}">Подробнее о столике</a></p>
    </div>
</#list>
<#if desks?size == 0>
    <h3>Нет столиков</h3>
</#if>
<hr>
<#if user.isAdmin()>
    <h3>Добавить столик</h3>
    <form action="/desk/create" method="post">
        Номер столика: <input type="cymbol", name="number"/><br><br>
        Статус столика: <input type="text", name="status"/><br><br>
        Категория столика: <input type="text", name="category"/><br><br>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input type="submit" value="Добавить столик"/>
    </form>
</#if>
</body>
</html>