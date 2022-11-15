<?php
require_once './libs/Router.php';
require_once './app/controllers/product-api.controller.php';
require_once './app/controllers/auth-api.controller.php';



$router = new Router();

$router->addRoute('products', 'GET', 'ProductApiController', 'getProducts');
$router->addRoute('products/:ID', 'GET', 'ProductApiController', 'getProductById');
$router->addRoute('products/:ID', 'DELETE', 'ProductApiController', 'deleteProductById');
$router->addRoute('products', 'POST', 'ProductApiController', 'insertProducts'); 
$router->addRoute("auth/token", 'GET', 'AuthApiController', 'getToken');


$router->route($_GET["resource"], $_SERVER['REQUEST_METHOD']);