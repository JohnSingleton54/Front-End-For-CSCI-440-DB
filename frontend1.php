<?php  // frontend1.php

// John M. Singleton
// REFERENCE: Learning PHP, MySQL & JavaScript by Robin Nixon

require_once '..\login_engraver.php';
$conn = new mysqli($hn, $un, $pw, $db);
if($conn->connect_error) die("Fatal Error");

/*// I added a row to customer_note for QUERY 1.
$query = "INSERT INTO customer_note VALUES('8', '2019-11-25 15:15:22', 'BDAY 11/25')";
$result = $conn->query($query);
if(!$result) die ("Database access failed");*/

echo <<<_END
<pre>
Query 1: For each customer who has a customer note mentioning a birthday, output the name, address,
         and relevant customer note. (The purpose of this transaction is to provide the client a
         list of customers who it can send birthday cards to.)

Query 2: What are the sizes and corresponding prices for a given product name, here Precision Walnut
         Plaques? (The purpose of this query is obvious; a customer may ask the client such a
         question.)

Query 3: Output a list of Product Names that are made by a given vendor, here Crown Awards. (This
         query might be used to help determine how valuable a given vendor is to the client's
         operations, for example.)

Query 4: Output customer names and dates from orders that have been delivered. (The purpose of this
         query is to help the client determine which packages have been delivered. In practice, the
         client would perhaps mostly likely select from a recent date range. E.g.
         WHERE...O.Date > '2019-11-18 00:00:00';)

Query 5: Output vendor names and addresses of vendors who make wood products. (The client may use
         this query in determining how many vendors he/she has that provide wood products.)

</pre>
<form action='frontend1.php' method='post'><pre>
Enter A Query Number (1-5): <input type="text" name="choice"><input type="submit" value="Process">
</pre></form>

_END;

if(isset($_POST['choice'])){
	$choice = get_post($conn, 'choice');
	switch($choice){
		case "1":
			query1($conn);
			break;
		case "2":
			query2($conn);
			break;
		case "3":
			//break;
		case "4":
			//break;
		case "5":
			echo "Not yet implemented";
			break;
		default:
			echo "Unrecognized selection";
			break;
	}
}

$conn->close();

function query1($conn){
	$query = "SELECT Cx.Name, Cx.Line1, Cx.Line2, Cx.City, Cx.State, Cx.Zip, N.Note
			   FROM customer as Cx, customer_note as N
			   WHERE Cx.ID = N.Customer_id AND N.Note LIKE '%b%day%'";
	$result = $conn->query($query);
	if(!$result) die ("Database access failed");

	$rows = $result->num_rows;
	echo "<table><tr> <th>Name</th> <th>Line1</th> <th>Line2</th> <th>City</th> <th>State</th>
	        <th>Zip</th> <th>Note</th></tr>";

	for($j = 0; $j < $rows; ++$j){
		$row = $result->fetch_array(MYSQLI_NUM);

		echo "<tr>";
		for($k = 0; $k < 7; ++$k){
			echo "<td>" . htmlspecialchars($row[$k]) . "</td>";
		}
		echo "</tr>";
	}

	echo "</table>";

	$result->close();
}

function query2($conn){
	$query = "SELECT P.Name, O.Sname, O.Price
			   FROM PRODUCT AS P, OFFERED_IN AS O
			   WHERE P.Name='Precision Walnut Plaques' AND P.SKU = O.PSKU";
	$result = $conn->query($query);
	if(!$result) die ("Database access failed");

	$rows = $result->num_rows;
	echo "<table><tr> <th>Name</th> <th>SName</th> <th>Price</th></tr>";

	for($j = 0; $j < $rows; ++$j){
		$row = $result->fetch_array(MYSQLI_NUM);

		echo "<tr>";
		for($k = 0; $k < 3; ++$k){
			echo "<td>" . htmlspecialchars($row[$k]) . "</td>";
		}
		echo "</tr>";
	}

	echo "</table>";

	$result->close();
}

function get_post($conn, $var){
  return $conn->real_escape_string($_POST[$var]);
}

?>

