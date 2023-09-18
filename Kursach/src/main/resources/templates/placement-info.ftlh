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
        hr {
            border: none;
            height: 1px;
            background-color: #ccc;
            margin-top: 20px;
        }
        p {
            margin-top: 20px;
            text-align: center;
        }
        a {
            color: #333;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
        form {
            margin-top: 20px;
            text-align: center;
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
<h1>Интернет кафе на ${placement.address}</h1><hr>
<p><a href="/desk/main?cafe=${placement.id}">Перейти к столикам</a></p>
<hr>
<p><a href="/product/main?cafe=${placement.id}">Перейти к меню</a></p>
<hr>
<#if user.isAdmin()>
    <form action="/placement/delete/${placement.id}" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input type="submit" value="Удалить Интернет-кафе"/>
    </form>
</#if>
</body>
</html>