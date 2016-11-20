<?php
	ini_set('display_errors',1);
	error_reporting(E_ALL);
	ini_set('date.timezone', 'Europe/Kiev');
	
	function showMainForm($activeform, $caption)
	{
		$smarty = new Smarty();
		$smarty->assign('maincaption', $caption);
		checkAccessRights($_SESSION['USER_TYPE_ID'], $smarty, 'main');
		if (isset($activeform)) $smarty->assign('mainleftcol', $activeform);
		
		$smarty->display('main.tpl');
	}
	
	
	function isOurUserType($usertype, $forusertypes)
	{
		if($forusertypes == '*') return true;
		
		$arr = str_getcsv($forusertypes, ',');

		foreach($arr as $value)
		{
			if ($value == $usertype) return true;
		}
		
		return false;
	}
	
	function checkAccessRights($usertype, $smarty, $form)
	{
		$result = array();
	
		$query = "SELECT * FROM ACCESS_RIGHTS ar WHERE ar.AR_FORM = ? ORDER BY AR_ORDER_NO";
	
		$result = query($query, array('s', $form), false);
		
		if(!isset($result)) return false;
			
		foreach($result as $row)
		{			
			if (!isOurUserType($usertype, $row['USER_TYPE_ID'])) continue;
			
			$action = $row['AR_ACTION'];
			$target = $row['AR_TARGET_NAME'];
			$html = $row['AR_HTML'];
				
			switch ($action)
			{
				case '+': $smarty->assign($target, $html); break;
				case '-': $smarty->assign($target, null); break;
			}
		}
		return true;
	}
?>