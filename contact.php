<?php
session_start();

// Include database connection file
require_once "includes/connection.php";


if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Retrieve the email address from the form
    $email = isset($_POST['email_address']) ? $_POST['email_address'] : '';

    // Validate and sanitize the email address if needed

    // Insert the data into the 'contact' table
    $query = "INSERT INTO `contact` (`email`, `timestamp`) VALUES (?, NOW())";
    $insertStmt = $conn->prepare($query);

    if ($insertStmt) {
    $insertStmt->bind_param("s", $email);
        $result = $insertStmt->execute();

        if ($result) {
            // Insertion successful
            echo "
            <script>alert('Email submitted successfully!');
            window.location.href='contact.php';
            </script>
            ";
        } else {
            // Insertion failed
            echo "
            <script>alert('Error in submission!');
            window.location.href='contact.php';
            </script>
            ";
        }

        $insertStmt->close();
    } else {
        // Handle the error
        die("Error preparing statement: " . $conn->error);
    }
}
?>
<?php require "includes/header.php"; ?>

<section class="contact-section" id="home">
  <div class="contact-container">
    <div class="contact-content">
      <img src="./mklogo.jpg" alt="ICON" width="70" height="70"> 
      <br>
      <h1 style="font-size:30px;">Contact Us</h1>
      <br>
            <h2>Address</h2>
            <p>
             Mom's Kitchen, 
             Takatpur, Baripada, Mayurbhanj, Odisha-757001 <br>
            
            </p>
            <br>
            <h2 style="font-size:30px">Contact Details</h2>
            <p class="hero-text">
            MOBILE: +91 9337067262<br>
            EMAIL : pritam.mitha2018@gmail.com<br>
            </p>
            <br>
      <form action="" class="contact-form" method="POST">
        <input type="email" name="email_address" aria-label="email" placeholder="Your Email Address..." required
          class="email-field">
        <button type="submit" class="btn">Get Response Back</button>
      </form>
    </div>
    <figure class="hero-banner">
    <iframe 
      src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3720.084881796099!2d86.7644985!3d21.9296134!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3a1dae725494d48d%3A0x6d87a7403432eeed!2sMaharaja%20Purna%20Chandra%20Autonomous%20College%2C%20Baripada!5e0!3m2!1sen!2sin!4v1711999999999" 
      width="600" 
      height="450" 
      style="border:0;" 
      allowfullscreen="" 
      loading="lazy" 
      referrerpolicy="no-referrer-when-downgrade">
    </iframe>

    </figure>
  </div>
</section>
<br><br><br><br>

<?php require "includes/footer.php"; ?>
