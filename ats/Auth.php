<?php		
	function showAuthForm()
	{
		$smarty = new Smarty();
		$smarty->display('Auth.tpl');
	}

	function alreadyAuthorized(){
		if(isset($_SESSION['USER_ID'])) return true; else return false;
	}

	function checkAuthorization($login, $pass)
	{		
		    $query = "CALL authorize(?,?);";

		    $result = query($query, array('ss', $login, $pass), false);
		   		    
		    if(isset($result) && ($result[0]['result'] == 1)) return true;
		     			 
			return false;	
	}
	/**
	 * Store user information into a session array.
	 * @param string $login
	 * @param string $pass
	 * @return boolean
	 */
	
	function storeUserInfo($login, $pass)
	{
		$query = "CALL get_user_info(?,?);";
		
		$result = query($query, array('ss', $login, $pass), false);
		if(isset($result)) 
		{
	    	$row = $result[0];
	    	
		    $_SESSION['USER_ID'] = $row['USER_ID'];
			$_SESSION['NAME'] = $row['US_NAME'];
			$_SESSION['USER_TYPE_ID'] = $row['USER_TYPE_ID'];
			
			return true;
		}				
		return false;
	}
	
	function authorize()
	{
		$login = strip_tags($_POST['login']);
		$pass = strip_tags($_POST['pass']);
			
		if(checkAuthorization($login, $pass))
		{
			if(storeUserInfo($login, $pass))
			{				
				return true;
			}
		}
	
		print "401";
		return false;
	}

?>