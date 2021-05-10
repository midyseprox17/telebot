<?php
class telebot extends CI_Controller
{
	function index(){
        $TOKEN = "1830992890:AAFGXDpuD-scD3e_KTXMYfZfdqtwp6lDv48";
        $apiURL = "https://api.telegram.org/bot$TOKEN";
        $update = json_decode(file_get_contents("php://input"), TRUE);
        $chatID = $update["message"]["chat"]["id"];
        $message = $update["message"]["text"];
        
        
        if (strpos($message, "/start") === 0) {
        
        file_get_contents($apiURL."/sendmessage?chat_id=".$chatID."&text=Haloo, test webhookL");
        }
    }
}