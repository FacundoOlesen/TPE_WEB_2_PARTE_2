<?php

class ProductModel {

    private $db;

    public function __construct() {
        $this->db = new PDO('mysql:host=localhost;'.'dbname=clothes_db;charset=utf8', 'root', '');
    }
    public function getAllProducts() {
        $query = $this->db->prepare("SELECT  `nombre`, `precio`, `talle`, `descripcion`, `id_categoria_fk`, `imagen` FROM `products`");
        $query->execute();
        $products = $query->fetchAll(PDO::FETCH_OBJ); 
        return $products;
    }

    public function getProductsById($id) {
        $query = $this->db->prepare("SELECT * FROM products WHERE id = ?");
        $query->execute([$id]);
        $productbyid = $query->fetch(PDO::FETCH_OBJ);
        return $productbyid;
    }

    public function insertProduct($name, $price, $size, $description, $category, $imagen ) {
        $query = $this->db->prepare('INSERT INTO products (nombre, precio, talle, descripcion, id_categoria_fk, imagen) VALUES (?, ?, ?, ?, ?, ?)');
        $query->execute([$name, $price, $size, $description, $category, $imagen]);
        return $this->db->lastInsertId();
    }

    function deleteProduct($id) {
        $query = $this->db->prepare('DELETE FROM products WHERE id = ?');
        $query->execute([$id]);
    }

    public function getProductsInOrder($sortby, $order) {
        $query = $this->db->prepare("SELECT * FROM products ORDER BY $sortby $order;");
        $query->execute();
        return $query->fetchAll(PDO::FETCH_OBJ); 
    }

    public function getPaginationByLimitAndOffset($limit, $offset) {
        $query = $this->db->prepare("SELECT * FROM products LIMIT $limit OFFSET $offset;");
        $query->execute();
        return $query->fetchAll(PDO::FETCH_OBJ); 
    }

    public function filterByColumn($filterby, $value) {
        $query = $this->db->prepare("SELECT * FROM products WHERE $filterby = '$value'");
        $query->execute();
        return $query->fetchAll(PDO::FETCH_OBJ); 
    }

    public function productsFilteredAndOrdered($filterby, $value, $sortby,$order) {
        $query = $this->db->prepare("SELECT * FROM products WHERE $filterby = '$value' ORDER BY $sortby $order;");
        $query->execute();
        return $query->fetchAll(PDO::FETCH_OBJ); 
    }
}
