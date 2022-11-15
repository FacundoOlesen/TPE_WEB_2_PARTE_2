<?php
require_once './app/models/product.model.php';
require_once './app/views/api.view.php';
require_once './app/helpers/auth-api.helper.php';

class ProductApiController
{
    private $model;
    private $view;

    private $data;

    public function __construct() {
        $this->model = new ProductModel();
        $this->view = new ApiView();
        $this->authHelper = new AuthApiHelper();
        $this->data = file_get_contents("php://input");
    }

    private function getData() {
        return json_decode($this->data);
    }

    private function orderedProducts($sortby, $order)  {
        if (($sortby == 'id') ||($sortby == 'nombre') || ($sortby == 'precio') || ($sortby == 'talle') || ($sortby == 'descripcion')||($sortby == 'id_categoria_fk')||($sortby == 'imagen')  && ($order == "asc") || ($order == "desc")) {
            try {
                $productsordered = $this->model->getProductsInOrder($sortby, $order);
                $this->view->response($productsordered);
            } 
            catch (Exception $e) {
                $this->view->response("Error! Ingresaste mal el parametro sortby o el order.", 400);
                die();
            }   
        }
    }
    
    private function getPagination($limit, $offset) {
        if (isset($limit) && isset($offset)) {
            try {
                $productspaginated = $this->model->getPaginationByLimitAndOffset($limit, $offset);
                $this->view->response($productspaginated);
            }
            catch (Exception $e) {
                $this->view->response("Error! Ingresaste mal el parametro limit o el offset.", 400);
                die();
            }   
        }
    }

    private function getFilterByColumn($filterby, $value) {
        if (isset($filterby) && isset($value)) {
            try {
                $productsfiltered = $this->model->filterByColumn($filterby, $value);
                if ($productsfiltered !=NULL) {
                    $this->view->response($productsfiltered);
                }
                else {
                    $this->view->response("Campo o valor no encotrado", 400);
                }
            }
            catch (Exception $e) {
                $this->view->response("Error! Ingresaste mal el filterby o el value.", 400);
            }  
            
        }
        
    }

    private function getProductsFilteredAndOrdered($filterby, $value, $sortby, $order) {
        if ((isset($filterby) && isset($value)) && isset($sortby) && isset($order)) {
            try {
                $productsfilteredandordered = $this->model->productsFilteredAndOrdered($filterby, $value, $sortby,$order);
                if ($productsfilteredandordered !=NULL) {
                    $this->view->response($productsfilteredandordered);
                }
                else {
                    $this->view->response("Campo o valor no encotrado", 400);
                }
            }
            catch (Exception $e) {
                $this->view->response("Error! Ingresaste mal el filterby o el value.", 400);
            }  
            
        }
        
    }

    public function getProducts($params = null) {

        //Si esta esta seteado el filtro y su valor y el sort by y el orden: Hago filtro y ordenamiento.
        if(((isset($_GET['filterby'])) && isset($_GET['value']))&&((isset($_GET['sortby'])) && isset($_GET['order']))) {
                $filterby = $_GET['filterby'];
                $value = $_GET['value'];
                $sortby = $_GET['sortby'];
                $order = $_GET['order'];
                if((($filterby==NULL)||($value==NULL))||(($sortby==NULL)&&($order==NULL))){
                    $this->view->response("Error! Campo o valor no encotrado", 400);
                    die();
                }
                $this->getProductsFilteredAndOrdered($filterby, $value, $sortby, $order);
                die();
        }

        //Si solo esta seteado el sortby y el orden: Obtengo los datos de manera ordenada por el campo asignado y el orden asignado.
        if((isset($_GET['sortby'])) && isset($_GET['order'])) {
            $sortBy = $_GET['sortby'];
            $order = $_GET['order'];
            $this->orderedProducts($sortBy, $order);
        }

        //Si la cantidad de elementos del arreglo es igual a 1: Obtengo los datos sin filtro, ordenamiento o paginación.
        if (count($_GET)==1) {
            $products = $this->model->getAllProducts();
            $this->view->response($products);
        }

        //Si solo esta seteado el limite y el offset: Obtengo los datos de manera paginada.
        if((isset($_GET['limit'])) && isset($_GET['offset'])) {
            $limit = $_GET['limit'];
            $offset = $_GET['offset'];
            $this->getPagination($limit, $offset);
        }

        //Si solo esta seteado el campo a filtrar y su valor: Obtengo los datos con el filtro asignado y su valor.
        if((isset($_GET['filterby'])) && isset($_GET['value'])) {
            $filterby = $_GET['filterby'];
            $value = $_GET['value'];
            if((($value==NULL)||($filterby==NULL))||(($value==NULL)&&($filterby==NULL))){
                $this->view->response("Error! Campo o valor no encotrado", 400);
                die();
            }
            $this->getFilterByColumn($filterby, $value);
        }

    }

    public function getProductById($params = null) {
        $id = $params[':ID'];
        $product = $this->model->getProductsById($id);

        if ($product)
            $this->view->response($product);
        else
            $this->view->response("El producto con el ID= $id no existe", 404);
    }

    public function deleteProductById($params = null) {
        $id = $params[':ID'];
        if(!$this->authHelper->isLoggedIn()) {
            $this->view->response("Error! Para eliminar un producto debes estar logueado.", 401);
            return;
        }
        $productbyid = $this->model->getProductsById($id);
        if ($productbyid) {
            $this->model->deleteProduct($id);
            $this->view->response($productbyid, 200);
        } 
        else
            $this->view->response("El producto con el id=$id no existe", 404);
    }

    public function insertProducts($params = null) {
        $products = $this->getData();

        if(!$this->authHelper->isLoggedIn()) {
            $this->view->response("Error! Para agregar un producto debes estar logueado.", 401);
            return;
        }

        if (empty($products->nombre) || empty($products->precio) || empty($products->talle) || empty($products->descripcion) || empty($products->id_categoria_fk) || empty($products->imagen)) {
            $this->view->response("Error. Falto completar algún campo.", 400);
            die();
        }

        try {
            $id = $this->model->insertProduct($products->nombre, $products->precio, $products->talle, $products->descripcion,  $products->id_categoria_fk,  $products->imagen);
            $product = $this->model->getProductsById($id);
            $this->view->response($product, 201);
        } 
        catch (Exception $e) {
            $this->view->response("Error. La categoría ingresada no existe en la sección de categorías.", 400);
            die();
        }
    }
}
