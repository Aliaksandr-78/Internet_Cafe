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
        form {
            width: 50%;
            margin: 50px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0,0,0,0.2);
        }
        label {
            display: block;
            margin-bottom: 10px;
            font-weight: bold;
            color: #333;
        }
        input[type="text"], input[type="email"], input[type="password"] {
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
        .error-message {
            color: red;
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>
<h1>Регистрация</h1>
<form action="/registration" method="post">
    <label for="name">Имя пользователя:</label>
    <input type="text" name="name" id="name">

    <label for="email">Эл. почта:</label>
    <input type="email" name="email" id="email">

    <label for="phoneNumber">Номер телефона:</label>
    <input type="text" name="phoneNumber" id="phoneNumber">

    <label for="password">Пароль:</label>
    <input type="password" name="password" id="password">

    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <input type="submit" value="Зарегистрироваться">
</form>
<#if errorMessage??>
    <div class="error-message">${errorMessage}</div>
</#if>
</body>
</html>