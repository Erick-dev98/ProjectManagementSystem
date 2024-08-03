<?php
include 'db_connect.php';
if (!isset($_SESSION['login_id'])) {
    header('location:login.php');
    exit;
}

$title = "File Share";
?>

<!-- File Share Page Content -->
<div class="container-fluid">
    <h1 class="m-0">File Share</h1>
    <form id="fileShareForm" method="post" enctype="multipart/form-data">
        <div class="form-group">
            <label for="file">Select File:</label>
            <input type="file" name="file" id="file" class="form-control" required>
        </div>
        <div class="form-group">
            <label for="user">Select User:</label>
            <select name="user" id="user" class="form-control" required>
                <?php
                $result = $conn->query("SELECT id, CONCAT(firstname, ' ', lastname) AS username FROM users");
                while ($row = $result->fetch_assoc()) {
                    echo "<option value='" . $row['id'] . "'>" . $row['username'] . "</option>";
                }
                ?>
            </select>
        </div>
        <button type="submit" class="btn btn-primary">Share File</button>
    </form>
</div>

<script>
    $('#fileShareForm').submit(function(e) {
        e.preventDefault();
        start_load();
        $.ajax({
            url: 'file_upload.php',
            data: new FormData($(this)[0]),
            cache: false,
            contentType: false,
            processData: false,
            method: 'POST',
            type: 'POST',
            success: function(resp) {
                if (resp === '1') {
                    Swal.fire('Success', 'File successfully shared', 'success');
                    setTimeout(function() {
                        location.href = 'index.php?page=file_list';
                    }, 2000);
                } else {
                    Swal.fire('Error', resp, 'error');
                }
            }
        });
    });
</script>