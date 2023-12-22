<?php
// API Key check
$validAPIKey = 'APIkey'; //APIkey
$userAPIKey = $_GET['apikey'];

$captchaCode = $_GET['captcha'];
$validCaptchaCode = 'ModID'; //ModID

if ($captchaCode === $validCaptchaCode && $userAPIKey === $validAPIKey) {
    echo "Captcha valide!";
} else {
    echo "Captcha non valide ou clé API invalide!";
}
?>
