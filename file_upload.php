<?php
include 'db_connect.php';
session_start();

if (!isset($_SESSION['login_id'])) {
    echo 'Unauthorized';
    exit;
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $sender_id = $_SESSION['login_id'];
    $receiver_id = $_POST['user'];
    
    if (isset($_FILES['file']) && $_FILES['file']['error'] === UPLOAD_ERR_OK) {
        $file_name = basename($_FILES['file']['name']);
        $file_path = 'assets/uploads/' . $file_name;
        
        if (move_uploaded_file($_FILES['file']['tmp_name'], $file_path)) {
            // Insert file details into database
            $stmt = $conn->prepare("INSERT INTO file_shares (sender_id, receiver_id, file_path) VALUES (?, ?, ?)");
            if ($stmt === false) {
                error_log('MySQL Prepare Error: ' . $conn->error);
                echo 'Database prepare error.';
                exit;
            }
            $stmt->bind_param("iis", $sender_id, $receiver_id, $file_path);

            if ($stmt->execute()) {
                echo '1'; // Success
            } else {
                error_log('MySQL Execute Error: ' . $stmt->error);
                echo 'An error occurred while saving to the database.';
            }
            $stmt->close();
        } else {
            echo 'Failed to move uploaded file.';
        }
    } else {
        echo 'No file uploaded or there was an upload error.';
    }
}
?>
