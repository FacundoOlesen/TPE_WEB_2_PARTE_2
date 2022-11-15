<?php
require_once './libs/Router.php';
require_once './app/controllers/product-api.controller.php';
require_once './app/controllers/comment-api.controller.php';
require_once './app/controllers/auth-api.controller.php';

$router = new Router();
//Acciones con los productos:
$router->addRoute('products', 'GET', 'ProductApiController', 'getProducts');
$router->addRoute('products/:ID', 'GET', 'ProductApiController', 'getProductById');
$router->addRoute('products/:ID', 'DELETE', 'ProductApiController', 'deleteProductById');
$router->addRoute('products', 'POST', 'ProductApiController', 'insertProducts');
//Acciones con los comentarios de los productos:
$router->addRoute('comments', 'GET', 'CommentsApiController', 'getComments');
$router->addRoute('comments/:ID', 'GET', 'CommentsApiController', 'getCommentUsingId');
$router->addRoute('comments/:ID', 'DELETE', 'CommentsApiController', 'deleteCommentById');
$router->addRoute('comments', 'POST', 'CommentsApiController', 'insertComment');
//Autenticacion por token:
$router->addRoute("auth/token", 'GET', 'AuthApiController', 'getToken');

$router->route($_GET["resource"], $_SERVER['REQUEST_METHOD']);