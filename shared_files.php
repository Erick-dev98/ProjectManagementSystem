<?php
include 'db_connect.php';
if (!isset($_SESSION['login_id'])) {
    header('location:login.php');
    exit;
}

$title = "Shared Files";

// Fetch shared files
$login_id = $_SESSION['login_id'];
$query = "SELECT f.id, f.file_path, u.firstname AS sender_firstname, u.lastname AS sender_lastname 
          FROM file_shares f 
          JOIN users u ON f.sender_id = u.id 
          WHERE f.receiver_id = $login_id";
$result = $conn->query($query);
?>

<!-- Shared Files Page Content -->
<div class="container-fluid">
    <h1 class="m-0">Shared Files</h1>
    <?php if ($result->num_rows > 0): ?>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>File Name</th>
                    <th>Sender</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <?php while ($row = $result->fetch_assoc()): ?>
                    <tr>
                        <td><?php echo htmlspecialchars(basename($row['file_path'])); ?></td>
                        <td><?php echo htmlspecialchars($row['sender_firstname'] . ' ' . $row['sender_lastname']); ?></td>
                        <td>
                            <a href="<?php echo htmlspecialchars($row['file_path']); ?>" class="btn btn-primary" download>Download</a>
                            <button class="btn btn-danger" onclick="deleteFile(<?php echo $row['id']; ?>)">Delete</button>
                        </td>
                    </tr>
                <?php endwhile; ?>
            </tbody>
        </table>
    <?php else: ?>
        <p>No files have been shared with you.</p>
    <?php endif; ?>
</div>

<script>
    function deleteFile(fileId) {
        if (confirm("Are you sure you want to delete this file?")) {
            $.ajax({
                url: 'delete_file.php',
                method: 'POST',
                data: { id: fileId },
                success: function(response) {
                    if (response == 1) {
                        alert("File deleted successfully.");
                        location.reload();
                    } else {
                        alert("An error occurred. Please try again.");
                    }
                }
            });
        }
    }
</script>
