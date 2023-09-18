<!DOCTYPE html>
<html>
<head>
    <title>BUYSELL</title>
    <style>
        body {
            background-color: #F4F6FC;
            font-family: Arial, sans-serif;
        }
        h1 {
            text-align: center;
            color: #696969;
        }
        form {
            width: 50%;
            margin: 0 auto;
            background-color: #FFFFFF;
            padding: 20px;
            box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.2);
            border-radius: 5px;
        }
        label {
            display: block;
            margin-bottom: 10px;
            color: #333333;
            font-weight: 500;
        }
        input[type="email"], input[type="password"] {
            width: 100%;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #C5C5C5;
            box-sizing: border-box;
            margin-bottom: 20px;
        }
        input[type="submit"] {
            padding: 10px 20px;
            background-color: #355C7D;
            color: #FFFFFF;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }
        input[type="submit"]:hover {
            background-color: #243B55;
        }
        a {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #696969;
        }
        a:hover {
            color: #333333;
        }
    </style>
</head>
<body>
<h1>Авторизация</h1>
<form action="/login" method="post">
    <label for="username">Эл. почта:</label>
    <input type="email" name="username" id="username" required>
    <label for="password">Пароль:</label>
    <input type="password" name="password" id="password" required>
    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <input type="submit" value="Вход"/>
</form>
<a href="/registration">Зарегистрироваться</a>
</body>
</html>