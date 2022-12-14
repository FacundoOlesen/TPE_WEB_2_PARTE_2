<?php

class CommentsModel{
    private $db;

    function __construct(){
    $this->db = new PDO('mysql:host=localhost;'.'dbname=clothes_db;charset=utf8', 'root', '');
    }

    public function getAllComments(){
        $query = $this->db->prepare ("SELECT a.*, b.* FROM comments a INNER JOIN products b ON a.id_producto = b.id");
        $query->execute();
        $comments = $query->fetchAll(PDO::FETCH_OBJ);
        return $comments;
    }

    public function getCommentById($id){
        $query = $this->db->prepare('SELECT a.*, b.* FROM comments a INNER JOIN products b ON a.id_producto = b.id WHERE id_comment = ?');
        $query->execute([$id]);
        $comment = $query->fetch(PDO::FETCH_OBJ);
        return $comment;
    }

    public function deleteComment($id){
        $query = $this->db->prepare('DELETE FROM comments WHERE id_comment =?');
        $query->execute([$id]);
    }
    public function insertComent($comment, $id_producto){
        $query = $this->db->prepare('INSERT INTO comments(comment, id_producto) VALUES(?,?)');
        $query->execute([$comment, $id_producto]);
        return $this->db->lastInsertId();
    }

    public function getCommentsInOrder($sortby, $order) {
        $query = $this->db->prepare("SELECT * FROM comments ORDER BY $sortby $order;");
        $query->execute();
        return $query->fetchAll(PDO::FETCH_OBJ); 
    }

    public function getPaginationByLimitAndOffset($limit, $offset) {
        $query = $this->db->prepare("SELECT * FROM comments LIMIT $limit OFFSET $offset;");
        $query->execute();
        return $query->fetchAll(PDO::FETCH_OBJ); 
    }

    public function filterByColumn($filterby, $value) {
        $query = $this->db->prepare("SELECT * FROM comments WHERE $filterby = '$value'");
        $query->execute();
        return $query->fetchAll(PDO::FETCH_OBJ); 
    }

    public function commentsFilteredAndSorted($filterby, $value, $sortby, $order){
        $query = "SELECT * FROM comments WHERE $filterby = '$value' ORDER BY $sortby $order";
        $querydb = $this->db->prepare($query);
        $querydb->execute();
        $comments = $querydb->fetchAll(PDO::FETCH_OBJ);
        return $comments;
    }


}