<?php

namespace app\models;

use app\models\Connection ;
use PDO;

class Banco extends PDO {

	private $conn;

	public function __construct() {
        
        $this->conn = Connection::connect();
	}

	// - 3
	private function setParams($stmt, $parameters = array()) {

		foreach ($parameters as $key => $value) {
			$this->setParam($stmt, $key, $value);
		}
	}

	// - 2
	public function setParam($stmt, $key, $value) {
		$stmt->bindParam($key, $value);
	}

	// - 1
	public function query($rawQuery, $params = array()) {

		$stmt = $this->conn->prepare($rawQuery);

		$this->setParams($stmt, $params);

		$stmt->execute();

		return $stmt;
	}

	public function select($rawQuery, $params = array()): array
	{
		$stmt = $this->query($rawQuery, $params);

		//retirn um objeto ex "$key->deslogin"
		//return $stmt->fetchAll(PDO::FETCH_OBJ);

		return $stmt->fetchAll(PDO::FETCH_ASSOC);
	}
}
