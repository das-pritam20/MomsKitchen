<?php
session_start();
require_once "../../includes/connection.php";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Retrieve form data
    $name = $_POST['name'];
    $description = $_POST['description'];
    $category = $_POST['category'];
    $price = $_POST['price'];
    $quantity = $_POST['quantity'];
    $available = $_POST['available'];
    $uploads = "uploads/";
    $photo = $uploads . basename($_FILES["photo"]["name"]);
        
    if (move_uploaded_file($_FILES["photo"]["tmp_name"], $photo)) {
        // The file has been uploaded successfully
    } else {
        // Handle file up  load failure here
    }

    // Prepare and bind the SQL statement
    $stmt = $conn->prepare("INSERT INTO menu_items (name, description, category, price, quantity, available, image_path) VALUES (?, ?, ?, ?, ?, ?, ?)");
    $stmt->bind_param("sssdiis", $name, $description, $category, $price, $quantity, $available, $photo);

    // Execute the statement
    if ($stmt->execute()) {
        // Output JavaScript alert for success
        echo '<script>alert("Menu item added successfully.");</script>';
    } else {
        // Output JavaScript alert for error
        echo '<script>alert("Error adding menu item: ' . $conn->error . '");</script>';
    }

    // Close statement and connection
    $stmt->close();
    $conn->close();

    // Redirect back to the admin panel
    echo '<script>window.location.href="../admin.php";</script>';
    exit();
} else {
    // Redirect back to the admin panel if accessed directly
    header("location: ../admin.php");
    exit();
}
?>
