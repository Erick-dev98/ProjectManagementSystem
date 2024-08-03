<?php
include 'db_connect.php';
if (!isset($_SESSION['login_id'])) {
    header('location:login.php');
    exit;
}

$title = "File List";
?>

<!-- File List Page Content -->
<div class="container-fluid">
    <h1 class="m-0">File List</h1>
    <div class="row">
        <?php
        $user_id = $_SESSION['login_id'];
        $result = $conn->query("SELECT f.*, u.firstname AS receiver_firstname, u.lastname AS receiver_lastname 
                                FROM file_shares f 
                                JOIN users u ON f.receiver_id = u.id 
                                WHERE f.sender_id = $user_id");
        while ($row = $result->fetch_assoc()) {
            $file_name = basename($row['file_path']);
            echo "<div class='col-md-4 mb-3'>
                    <div class='card'>
                        <div class='card-body'>
                            <h5 class='card-title'>$file_name</h5>
                            <p class='card-text'>Shared with: " . $row['receiver_firstname'] . " " . $row['receiver_lastname'] . "</p>
                        </div>
                    </div>
                </div>";
        }
        ?>
    </div>
</div>