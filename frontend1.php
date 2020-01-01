<?php  // frontend1.php

require_once '..\login_engraver.php';
$conn = new mysqli($hn, $un, $pw, $db);

if($conn->connect_error) die("Fatal Error");

// I added a row to customer_note for QUERY 1.
/*$query = "INSERT INTO customer_note VALUES('8', '2019-11-25 15:15:22', 'BDAY 11/25')";
$result = $conn->query($query);
if(!$result) die ("Database access failed");*/

$query1 = "SELECT Cx.Name, Cx.Line1, Cx.Line2, Cx.City, Cx.State, Cx.Zip, N.Note
		   FROM customer as Cx, customer_note as N
		   WHERE Cx.ID = N.Customer_id AND N.Note LIKE '%b%day%'";
$result1 = $conn->query($query1);
if(!$result1) die ("Database access failed");

$rows = $result1->num_rows;
echo "<table><tr> <th>Name</th> <th>Line1</th> <th>Line2</th> <th>City</th> <th>State</th>
        <th>Zip</th> <th>Note</th></tr>";

for($j = 0; $j < $rows; ++$j){
	$row = $result1->fetch_array(MYSQLI_NUM);

	echo "<tr>";
	for($k = 0; $k < 7; ++$k){
		echo "<td>" . htmlspecialchars($row[$k]) . "</td>";
	}
	echo "</tr>";
}

echo "</table>";


?>

