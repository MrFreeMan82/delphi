<?php	     
    session_start();
    
	ini_set('display_errors',1);
	error_reporting(E_ALL);
	ini_set('date.timezone', 'Europe/Kiev');
			
	$path = $_SERVER['DOCUMENT_ROOT'];

	require_once "$path/lib/Smarty.class.php";
	$smarty = new Smarty();
	$smarty->display("index.tpl");
?>
