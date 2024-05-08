<?php
require 'C:\xampp\htdocs\UMakClinic\mail\PHPMailer.php';
require 'C:\xampp\htdocs\UMakClinic\mail\SMTP.php';
require 'C:\xampp\htdocs\UMakClinic\mail\Exception.php';

session_start();
require 'C:\xampp\htdocs\UMakClinic\vendor\autoload.php';

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;

include 'include/config1.php';

$error = array();
if (!$conn) {
    $error[] = 'Connection to the database failed.';
} else {
    if (isset($_POST['submit'])) {
        // Check if connection is established
        if (!$conn) {
            $error[] = 'Connection to the database failed.';
        } else {
            // Check if 'name' key is set in $_POST
            if (isset($_POST['full_name'])) {
                $name = mysqli_real_escape_string($conn, $_POST['full_name']);
            } else {
                $error[] = 'Full Name is not set in the form.';
            }

            if (empty($error)) {
                $name = mysqli_real_escape_string($conn, $_POST['full_name']);
                $address = mysqli_real_escape_string($conn, $_POST['address']);
                $city = mysqli_real_escape_string($conn, $_POST['city']);
                $gender = isset($_POST['gender']) ? mysqli_real_escape_string($conn, $_POST['gender']) : '';
                $email = mysqli_real_escape_string($conn, $_POST['email']);
                $pass = $_POST['password'];
                $cpass = isset($_POST['password_again']) ? md5($_POST['password_again']) : '';

                // Validate password length
                if (strlen($pass) < 10) {
                    $error[] = 'Password must be at least 10 characters long.';
                }
            }

            if (empty($error)) {
                // Hash the password after validation
                $pass = md5($pass);

                // Generate OTP
                $otp = generateOTP();

                // Save OTP and activation code in the database
                $insert = "INSERT INTO users(fullname, address, city, gender, email, password, otp,  status) VALUES ('$name','$address','$city','$gender','$email','$pass','$otp', 'status')";
                mysqli_query($conn, $insert);

                // Send verification email
                $subject = 'Email Verification';
                $message = 'Hello ' . $name . ',<br><br>Here is the OTP to verify your email:<br>';
                $message .= "Your OTP is: " . $otp;

                $mail = new PHPMailer(true);
                $mail->isSMTP();
                $mail->Host = 'smtp.gmail.com';  
                $mail->SMTPAuth = true;
                $mail->Username = 'umakmedicalanddentalclinic@gmail.com';
                $mail->Password = 'rtklnxgiduqqplme';
                $mail->SMTPSecure = PHPMailer::ENCRYPTION_SMTPS;
                $mail->Port = 465;

        $mail->setFrom('umakmedicalanddentalclinic@gmail.com', 'UMak Medical and Denatl Clinic');  // Replace with your email and name
                $mail->addAddress($email, $name);
                $mail->isHTML(true);
                $mail->Subject = $subject;
                $mail->Body = $message;

                // Send the email
                try {
                    $_SESSION['email'] = $email;
                    $mail->send();
                    header('Location: verification.php');
                    exit();
                } catch (Exception $e) {
                    $error[] = 'Email could not be sent. Please try again later.';
                }
            }
        }
    }
}

function generateOTP($length = 6)
{
    $otp = "";
    $chars = "0123456789";
    $chars_length = strlen($chars);

    for ($i = 0; $i < $length; $i++) {
        $otp .= $chars[rand(0, $chars_length - 1)];
    }

    return $otp;
}

function generateActivationCode() {
    // Your logic to generate an activation code (e.g., using random_bytes and bin2hex)
    $activation_code = bin2hex(random_bytes(16));
    return $activation_code;
}
?>

<!DOCTYPE html>
<html lang="en">
	<head>
 <title>User Registration</title>
    					<meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes, minimum-scale=1.0, maximum-scale=10.0">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<meta content="" name="description" />
		<meta content="" name="author" />
    <link rel="icon" href="umaklogos.png">
    <link href="http://fonts.googleapis.com/css?family=Lato:300,400,400italic,600,700|Raleway:300,400,500,600,700|Crete+Round:400italic" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="vendor/fontawesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="vendor/themify-icons/themify-icons.min.css">
    <link href="vendor/animate.css/animate.min.css" rel="stylesheet" media="screen">
    <link href="vendor/perfect-scrollbar/perfect-scrollbar.min.css" rel="stylesheet" media="screen">
    <link href="vendor/switchery/switchery.min.css" rel="stylesheet" media="screen">
    <link rel="stylesheet" href="assets/css/styles.css">
    <link rel="stylesheet" href="assets/css/plugins.css">
    <link rel="stylesheet" href="assets/css/themes/theme-1.css" id="skin_color" />

    <script type="text/javascript">
        function valid() {
            if (document.registration.password.value != document.registration.password_again.value) {
                alert("Password and Confirm Password Field do not match  !!");
                document.registration.password_again.focus();
                return false;
            }
            return true;
        }
    </script>


</head>
	<style>

    #eyeIcon,
    #eyeIcon1{
      
        margin-left: 90%; /* Center the icon horizontally */
        transform: translateX(-50%); /* Center the icon precisely */
        cursor: pointer;
    }
    
    @media(max-width:768px){
        
        #eyeIcon{
        margin-left: 90%; /* Center the icon horizontally */
        transform: translateX(-50%); /* Center the icon precisely */
    }
    }

</style>
<body class="login">
    <!-- start: REGISTRATION -->
    <div class="row">
        <div class="main-login col-xs-10 col-xs-offset-1 col-sm-8 col-sm-offset-2 col-md-4 col-md-offset-4">
            <div class="logo margin-top-30">
                <a href="../index.html">
                    <h2>Patient Registration</h2>
                </a>
            </div>
            <!-- start: REGISTER BOX -->
            <div class="box-register">
                <form name="registration" id="registration" method="post" onSubmit="return valid();">
                    <fieldset>
                        <legend>
                            Sign Up
                        </legend>
                        <p>
                            Enter your personal details below:
                        </p>
                        <div class="form-group">
                            <input type="text" class="form-control" name="full_name" placeholder="Full Name" required>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" name="address" placeholder="Address" required>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" name="city" placeholder="City" required>
                        </div>
                        <div class="form-group">
                            <label class="block">
                                Gender
                            </label>
                            <div class="clip-radio radio-primary">
                                <input type="radio" id="rg-female" name="gender" value="female">
                                <label for="rg-female">
                                    Female
                                </label>
                                <input type="radio" id="rg-male" name="gender" value="male">
                                <label for="rg-male">
                                    Male
                                </label>
                            </div>
                        </div>
                        <p>
                            Enter your account details below:
                        </p>
                        <div class="form-group">
                            <span class="input-icon">
                                <input type="email" class="form-control" name="email" id="email" onBlur="userAvailability()" placeholder="University Email" required>
                                <i class="fa fa-envelope"></i> </span>
                            <span id="user-availability-status1" style="font-size:12px;"></span>
                        </div>
                        <div class="form-group">
<div class="input-icon">
        <i id="lockIcon" class="fa fa-lock"></i>
        <input type="password" class="form-control password" name="password" id="password" placeholder="Password" required minlength="6">
 <i id="eyeIcon" class="fa fa-eye"></i>
                        </div></div>
                        <div class="form-group">
                             <div class="input-icon">
        <i id="lockIcon" class="fa fa-lock"></i>
        <input type="password" class="form-control password" name="password_again" id="password_again" placeholder="Confirm Password" required minlength="6">
 <i id="eyeIcon1" class="fa fa-eye"></i>
                        </div></div>
                        <p>
    By clicking Sign up, you agree to our 
    <a href="privacy-patient.php" data-modal="terms">Terms, Privacy Policy and Cookies Policy</a>, 

</p>

<div class="form-group">
    <div class="checkbox clip-check check-primary">
        <input type="checkbox" id="agree" name="agree" value="agree" required>
        <label for="agree">
            I agree
        </label>
    </div>
</div>

    <div class="form-actions ">
                            <p>
                                Already have an account?
                                <a href="user-login.php">
                                    Log-in
                                </a>
                            </p>
                            <button type="submit" class="btn btn-primary pull-right" id="submit" name="submit">
                                Sign up <i class="fa fa-arrow-circle-right"></i>
                            </button>
                        </div>

                        <!-- The modal container -->
<div class="modal" id="terms-modal">
    <div class="modal-content">
        <span class="close" onclick="closeModal('terms-modal')">&times;</span>
        <div class="modal-scroll">

        </div>
    </div>
    </div>
    
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="vendor/modernizr/modernizr.js"></script>
    <script src="vendor/jquery-cookie/jquery.cookie.js"></script>
    <script src="vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="vendor/switchery/switchery.min.js"></script>
    <script src="vendor/jquery-validation/jquery.validate.min.js"></script>
    <script src="assets/js/main.js"></script>
    <script src="assets/js/login.js"></script>
    <script>
        jQuery(document).ready(function () {
            Main.init();
            Login.init();
        });
    </script>

    <script>
        function userAvailability() {
            $("#loaderIcon").show();
            jQuery.ajax({
                url: "check_availability.php",
                data: 'email=' + $("#email").val(),
                type: "POST",
                success: function (data) {
                    $("#user-availability-status1").html(data);
                    $("#loaderIcon").hide();
                },
                error: function () { }
            });
        }

   // Function to open the modal
function openModal(modalId) {
    var modal = document.getElementById(modalId);
    if (modal) {
        modal.style.display = "block";
    }
}

// Function to close the modal
function closeModal(modalId) {
    var modal = document.getElementById(modalId);
    if (modal) {
        modal.style.display = "none";
    }
}

// Add event listeners to the links
document.querySelector('[data-modal="terms"]').addEventListener('click', function () {
    openModal('terms-modal');
});



// Function to close the modal
function closeModal(modalId) {
    console.log('Trying to close modal: ' + modalId);
    var modal = document.getElementById(modalId);
    if (modal) {
        console.log('Modal found, changing display to "none".');
        modal.style.display = "none";
    } else {
        console.error('Modal not found!');
    }
}


</script>

<script>

    $(document).ready(function() {
        // Smooth scrolling when clicking on anchor links
        $("a").on('click', function(event) {
            if (this.hash !== "") {
                event.preventDefault();

                var hash = this.hash;
                $('html, body').animate({
                    scrollTop: $(hash).offset().top
                }, 800, function(){
                    window.location.hash = hash;
                });
            }
        });
    });
</script>

<script>
    document.getElementById('eyeIcon').addEventListener('click', function () {
        var passwordInput = document.getElementById('password');

        if (passwordInput.type === 'password') {
            passwordInput.type = 'text';
            this.className = 'fa fa-eye-slash';

            // Remove the "required" attribute when showing the password
            passwordInput.removeAttribute('required');
        } else {
            passwordInput.type = 'password';
            this.className = 'fa fa-eye';

            // Add the "required" attribute when hiding the password
            passwordInput.setAttribute('required', 'required');
        }
    });
    
    document.getElementById('eyeIcon1').addEventListener('click', function () {
    var passwordInput1 = document.getElementById('password_again');

    if (passwordInput1.type === 'password') {
        passwordInput1.type = 'text';
        this.className = 'fa fa-eye-slash';

        // Remove the "required" attribute when showing the password
        passwordInput1.removeAttribute('required');
    } else {
        passwordInput1.type = 'password';
        this.className = 'fa fa-eye';

        // Add the "required" attribute when hiding the password
        passwordInput1.setAttribute('required', 'required');
    }
});
</script>

</body>
<!-- end: BODY -->

</html>