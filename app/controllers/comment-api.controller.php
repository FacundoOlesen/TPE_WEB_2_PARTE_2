<?php
require_once './app/models/comments.model.php';
require_once './app/views/api.view.php';
require_once './app/helpers/auth-api.helper.php';

class CommentsApiController
{
    private $model;
    private $view;
    private $data;

    public function __construct() {
        $this->model = new CommentsModel();
        $this->view = new ApiView();
        $this->authHelper = new AuthApiHelper();
        $this->data = file_get_contents("php://input");
    }

    private function getData() {
        return json_decode($this->data);
    }

    private function orderedComments($sortby, $order)  {
        if (($sortby == 'id_comment') || ($sortby == 'comment') || ($sortby == 'id_producto') && ($order == "asc") || ($order == "desc")) {
            try {
                $productsordered = $this->model->getCommentsInOrder($sortby, $order);
                $this->view->response($productsordered);
            } catch (Exception $e) {
                $this->view->response("Error! Ingresaste mal el parametro sortby o el order.", 400);
                die();
            }
        }
    }

    private function getPagination($limit, $offset)  {
        if (isset($limit) && isset($offset)) {
            try {
                $commentspaginated = $this->model->getPaginationByLimitAndOffset($limit, $offset);
                $this->view->response($commentspaginated);
            } catch (Exception $e) {
                $this->view->response("Error! Ingresaste mal el parametro limit o el offset.", 400);
                die();
            }
        }
    }

    private function getFilterByColumn($filterby, $value) {

        if (isset($filterby) && isset($value)) {
            try {
                $productsfiltered = $this->model->filterByColumn($filterby, $value);
                if ($productsfiltered != NULL) {
                    $this->view->response($productsfiltered);
                } else {
                    $this->view->response("Campo o valor no encotrado", 400);
                }
            } catch (Exception $e) {
                $this->view->response("Error! Ingresaste mal el filterby o el value.", 400);
            }
        }
    }

    private function getCommentsFilteredAndOrdered($filterby, $value, $sortby, $order) {
        if ((isset($filterby) && isset($value)) && isset($sortby) && isset($order)) {
            try {
                $productsfilteredandordered = $this->model->commentsFilteredAndSorted($filterby, $value, $sortby, $order);
                if ($productsfilteredandordered != NULL) {
                    $this->view->response($productsfilteredandordered);
                } else {
                    $this->view->response("Campo o valor no encotrado", 400);
                }
            } catch (Exception $e) {
                $this->view->response("Error! Ingresaste mal el filterby o el value.", 400);
            }
        }
    }

    public function getComments($params = null) {

        //Si esta esta seteado el filtro y su valor y el sort by y el orden: Hago filtro y ordenamiento.
        if (((isset($_GET['filterby'])) && isset($_GET['value'])) && ((isset($_GET['sortby'])) && isset($_GET['order']))) {
            $filterby = $_GET['filterby'];
            $value = $_GET['value'];
            $sortby = $_GET['sortby'];
            $order = $_GET['order'];
            if ((($filterby == NULL) || ($value == NULL)) || (($sortby == NULL) && ($order == NULL))) {
                $this->view->response("Error! Campo o valor no encotrado", 400);
                die();
            }
            $this->getCommentsFilteredAndOrdered($filterby, $value, $sortby, $order);
            die();
        }

        //Si solo esta seteado el sortby y el orden: Obtengo los datos de manera ordenada por el campo asignado y el orden asignado.
        if ((isset($_GET['sortby'])) && isset($_GET['order'])) {
            $sortby = $_GET['sortby'];
            $order = $_GET['order'];
            $this->orderedComments($sortby, $order);
        }

        //Si la cantidad de elementos del arreglo es igual a 1: Obtengo los datos sin filtro, ordenamiento o paginación.
        if (count($_GET) == 1) {
            $comments = $this->model->getAllComments();
            $this->view->response($comments);
        }

        //Si solo esta seteado el limite y el offset: Obtengo los datos de manera paginada.
        if ((isset($_GET['limit'])) && isset($_GET['offset'])) {
            $limit = $_GET['limit'];
            $offset = $_GET['offset'];
            $this->getPagination($limit, $offset);
        }

        //Si solo esta seteado el campo a filtrar y su valor: Obtengo los datos con el filtro asignado y su valor.
        if ((isset($_GET['filterby'])) && isset($_GET['value'])) {
            $filterby = $_GET['filterby'];
            $value = $_GET['value'];
            if ((($value == NULL) || ($filterby == NULL)) || (($value == NULL) && ($filterby == NULL))) {
                $this->view->response("Error! Campo o valor no encotrado", 400);
                die();
            }
            $this->getFilterByColumn($filterby, $value);
        }
    }

    public function getCommentUsingId($params = null) {
        $id = $params[':ID'];
        $comment = $this->model->getCommentById($id);

        if ($comment)
            $this->view->response($comment);
        else
            $this->view->response("El comment con el ID= $id no existe", 404);
    }

    public function deleteCommentById($params = null) {

        $id = $params[':ID'];
        if (!$this->authHelper->isLoggedIn()) {
            $this->view->response("Error! Para agregar un comentario debes estar logueado.", 401);
            return;
        }
        if (!$this->authHelper->isLoggedIn()) {
            $this->view->response("Error! Para eliminar un comment debes estar logueado.", 401);
            return;
        }
        $productbyid = $this->model->getCommentById($id);
        if ($productbyid) {
            $this->model->deleteComment($id);
            $this->view->response($productbyid, 200);
        } else
            $this->view->response("El comment con el id=$id no existe", 404);
    }

    public function insertComment($params = null) {
            $comments = $this->getData();

        if(!$this->authHelper->isLoggedIn()) {
            $this->view->response("Error! Para agregar un comentario a un producto debes estar logueado.", 401);
            return;
        }

        if (empty($comments->comment) || empty($comments->id_producto)) {
            $this->view->response("Error. Falto completar algún campo.", 400);
            die();
        }

        try {
            $id = $this->model->insertComent($comments->comment, $comments->id_producto);
            $commentsbyid = $this->model->getCommentById($id);
            $this->view->response($commentsbyid, 201);
        } 
        catch (Exception $e) {
            $this->view->response("Error! Ingresaste un comentario a un producto no existente.", 400);
            die();
        }
    }
}
