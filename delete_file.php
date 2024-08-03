<?php
include 'db_connect.php';

if (isset($_POST['id'])) {
    $file_id = $_POST['id'];
    $query = $conn->query("SELECT file_path FROM file_shares WHERE id = $file_id");

    if ($query->num_rows > 0) {
        $row = $query->fetch_assoc();
        $file_path = $row['file_path'];

        // Delete the file from the directory
        if (file_exists($file_path)) {
            unlink($file_path);
        }

        // Delete the file record from the database
        $delete_query = $conn->query("DELETE FROM file_shares WHERE id = $file_id");

        if ($delete_query) {
            echo 1; // Success
        } else {
            echo 0; // Database deletion error
        }
    } else {
        echo 0; // File not found
    }
} else {
    echo 0; // Invalid request
}
?>
