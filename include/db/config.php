<?php

$host = 'localhost';
$user = 'serso';
$password = 'mysq2282';
$database = 'ka_serova_db';

if (@mysql_connect($host, $user, $password)) {
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
}
?>