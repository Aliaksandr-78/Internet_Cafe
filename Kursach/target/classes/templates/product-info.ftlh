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

        h3, h4 {
            margin-top: 20px;
            text-align: center;
        }

        h4 {
            font-weight: bold;
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

        /* Дополнительные стили для улучшения внешнего вида */

        .container {
            max-width: 800px;
            margin: 0 auto;
        }

        .product {
            background-color: #fff;
            padding: 20px;
            margin-bottom: 20px;
            border-radius: 5px;
        }

        .product-title {
            font-size: 24px;
            font-weight: bold;
        }

        .product-details {
            font-size: 16px;
            margin-top: 10px;
        }

        .product-price {
            font-size: 24px;
            font-weight: bold;
            color: #333;
            margin-top: 10px;
        }

        .add-product-form {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
        }

        .form-group {
            margin-bottom: 10px;
        }

        .form-group label {
            display: block;
            font-size: 16px;
            font-weight: bold;
            margin-bottom: 5px;
        }

        .form-group input[type="text"],
        .form-group input[type="number"] {
            width: 100%;
            padding: 10px;
            border-radius: 5px;
            border: none;
            box-shadow: none;
            font-size: 16px;
        }

        .form-group input[type="submit"] {
            background-color: #333;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
        }

        .form-group input[type="submit"]:hover {
            background-color: #555;
        }

    </style>
</head>
<body>
<h1>${product.name}</h1>
<h3>Информация</h3>
<h4>Состав блюда: ${product.structure}</h4>
<h4>Цена блюда: ${product.weight} р.</h4>
<hr>
<#if user.isAdmin()>
    <form action="/product/delete/${product.id}" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input type="submit" value="Удалить блюдо"/>
    </form>
</#if>
</body>
</html>