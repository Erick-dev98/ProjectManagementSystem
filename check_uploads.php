<?php
$dir = 'assets/uploads/';
if (is_dir($dir)) {
    echo "The directory exists.";
    if (is_writable($dir)) {
        echo " The directory is writable.";
    } else {
        echo " The directory is not writable.";
    }
} else {
    echo "The directory does not exist.";
}
?>
