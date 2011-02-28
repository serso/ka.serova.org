<?php

$host = 'localhost';
$user = 'serso';
$password = 'mysq2282';
$database = 'ka_serova_db';

/*if (@mysql_connect($host, $user, $password)) {
	// create the database.

	if (!mysql_select_db($database)) {
		trigger_error("Can't select database", E_USER_ERROR);
	}

	$resultSet = @mysql_query("select * from users");

	$resultSetLength = mysql_num_fields($resultSet);

	echo "<table>";

	while($row = mysql_fetch_row($resultSet)){
		echo "<tr>";

		// $row is array... foreach( .. ) puts every element
		// of $row to $cell variable
		foreach ($row as $cell)
			echo "<td>$cell</td>";

		echo "</tr>\n";
	}

	echo "</table>";

} else {
	trigger_error(mysql_error(), E_USER_ERROR);
}*/

$options = array(PDO::ATTR_AUTOCOMMIT => FALSE);
$dbh = new PDO('mysql:host=' . $host . ';dbname=' . $database, $user, $password, $options);

class SqlCommand {

	protected $stmt;

	public function __construct($sql, $dbh) {
		$this->stmt = $dbh->prepare($sql);
	}
}

abstract class InsertSqlCommand extends SqlCommand {

	abstract protected function getSqlValues();

	abstract protected function setInsertedId($id);

	protected $object;

	public function __construct($sql, $dbh) {
		parent::__construct($sql, $dbh);
	}

	public final function insert(&$object, $dbh) {
		try {

			$this->object = $object;
			
			foreach ( $this->getSqlValues() as $k => $v ) {
				$this->stmt->bindParam($v->getName(), $v->getValue(), $v->getSqlType());
			}

			$dbh->beginTransaction();

			$this->stmt->execute();

			$this->setInsertedId($dbh->lastInsertId());

			$dbh->commit();

		} catch (PDOExecption $e) {
			$dbh->rollback();
			throw $e;
		}
	}
}

class SqlValue {

	private $name;

	private $value;

	private $sqlType;

	public function __construct($name, $value, $sqlType) {
		$this->name = $name;
		$this->value = $value;
		$this->sqlType = $sqlType;
	}

	public function getName() {
		return $this->name;
	}

	public function getSqlType() {
		return $this->sqlType;
	}

	public function getValue() {
		return $this->value;
	}
}

?>