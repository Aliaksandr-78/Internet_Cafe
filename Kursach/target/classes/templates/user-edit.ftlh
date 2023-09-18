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
            margin-top: 20px;
            text-align: center;
        }

        label {
            font-size: 16px;
            font-weight: bold;
        }

        input[type="checkbox"] {
            margin-right: 10px;
        }

        button[type="submit"] {
            background-color: #333;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
        }

        button[type="submit"]:hover {
            background-color: #555;
        }
    </style>
</head>
<body>
<h1>Редактирование пользователя ${user.name}</h1>
<form action="/admin/user/edit" method="post">
    <#list roles as role>
        <div>
            <label><input type="checkbox" name="${role}" ${user.roles?seq_contains(role)?string("checked", "")}>${role}</label>
        </div>
    </#list>
    <input type="hidden" value="${user.id}" name="userId">
    <input type="hidden" value="${_csrf.token}" name="_csrf">
    <button type="submit">Сохранить</button>
</form>
</body>
</html>