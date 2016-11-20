<?php 	
    session_start();
    
	define("DICTIONARY_DEPT", "DICTIONARY_DEPT");
	define("LIMIT", 25);
	define("OFFSET", 0);
		
	function fetchAtsStat($params)
	{
		$query = "SELECT d.dept_id, d.dept_name FROM DEPT d";
		$dept = queryCache(DICTIONARY_DEPT, $query, null);

		$ats_stat = array();
		if (isset($params))
		{
			$query = "CALL ats_stat(?, ?, ?, ?, ?, ?, ?);";
			
			$date = date_create_from_format('d.m.Y', $params['ds']);
			$date = date_format($date, 'Y-m-d');
			$ds = $date;

			$date = date_create_from_format('d.m.Y', $params['de']);
			$date = date_format($date, 'Y-m-d');
			$de = $date;

			$sp_params = array('ssiiiii', $ds, $de, $params['durs'], $params['dure'], $params['dept'], $params['limit'], $params['offset']);
			$ats_stat = query($query, $sp_params, false);
		}	
		
		$total = 0;
		if (isset($ats_stat[0]['TOTAL_REC']))
					$total = $ats_stat[0]['TOTAL_REC'];
		
		if ($params['offset'] < 0) $params['offset'] = 0;
		
		
		$smarty = new Smarty();
		$smarty->assign('dept', $dept);		
		$smarty->assign('dept_selected', $params['dept']);
		$smarty->assign('ats_stat', $ats_stat);
		$smarty->assign('ts_def', $params['ts']);
		$smarty->assign('durs_def', $params['durs']);
		$smarty->assign('te_def', $params['te']);
		$smarty->assign('dure_def', $params['dure']);
		$smarty->assign('ds_def', $params['ds']);
		$smarty->assign('de_def', $params['de']);
		$smarty->assign('limit', $params['limit']);
		$smarty->assign('offset', $params['offset']);
		
		if($params['offset'] > 0) $smarty->assign('enableBackward', true);
		if($params['offset'] < $total) $smarty->assign('enableForward', true);
		
		return $smarty->fetch('atsStat.tpl');
	}
	
	function prepareParamsForATSStat()
	{
		$params = array();
		$params['ds'] = filter_input(INPUT_POST, 'ds');// strip_tags($_POST['ds']);
		$params['de'] = filter_input(INPUT_POST, 'de');
		$params['ts'] = filter_input(INPUT_POST, 'ts'); 
		$params['te'] = filter_input(INPUT_POST, 'te');
		$params['durs'] = filter_input(INPUT_POST, 'durs');
		$params['dure'] = filter_input(INPUT_POST, 'dure');
		$params['dept'] = filter_input(INPUT_POST, 'dept');
		$params['limit'] = filter_input(INPUT_POST, 'limit');
		$params['offset'] = filter_input(INPUT_POST, 'offset');
	
		if ((!isset($params['limit'])) || ($params['limit'] == "")) $params['limit'] = LIMIT;
	
		if ((!isset($params['offset'])) || ($params['offset'] == ""))  $params['offset'] = OFFSET;
	
		return $params;
	}
	
	function showATSStatBackward()	
	{
		$caption = "Статистика АТС, ".$_SESSION['NAME'];
		$params = prepareParamsForATSStat();
		$params['offset'] = $params['offset'] - $params['limit'];
		showMainForm(fetchAtsStat($params), $caption);
	}
	
	function showATSStatForward()
	{
		$caption = "Статистика АТС, ".$_SESSION['NAME'];
		$params = prepareParamsForATSStat();
		$params['offset'] = $params['offset'] + $params['limit'];
		showMainForm(fetchAtsStat($params), $caption);
	}
		
	function showATSStat()
	{
		$caption = "Статистика АТС, ".$_SESSION['NAME'];
		$params = prepareParamsForATSStat();
		$params['limit'] = LIMIT;
		$params['offset'] = OFFSET;
		showMainForm(fetchAtsStat($params), $caption);
	}
	
	function showATSStatDefault()
	{
		$caption = "Статистика АТС, ".$_SESSION['NAME'];
		showMainForm(fetchAtsStat(null), $caption);
	}

?>