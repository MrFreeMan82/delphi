<?php	
	ini_set('display_errors',1);
	error_reporting(E_ALL);
	ini_set('date.timezone', 'Europe/Kiev');
	
	include_once 'mysql.php';
	include_once "./lib/Smarty.class.php";
	
	include_once 'Auth.php';
	include_once 'main.php';
	include_once 'atsStat.php';
	
	$command = filter_input(INPUT_POST,'com');
		
	switch ($command){
		case 'authorize':	
							if (authorize())
							{
								showATSStatDefault();
							}					
							break;
						  
		case 'authorizeRequest':	
							showAuthForm();
							break;
		case 'exitSite':    
							setcookie(session_name(), '');
							session_destroy();
							break;	
							
		case 'showATSStatDefault':	
							showATSStatDefault();
							break;

		case 'showATSStat':		
							showATSStat();
							break;
		case 'atsstatForward':	
							showATSStatForward();
							break;	

		case 'atsstatBackward':
							showATSStatBackward();
							break;
							
		default: 			print "Form $command is unavialabel!";
	}
	
	


?>