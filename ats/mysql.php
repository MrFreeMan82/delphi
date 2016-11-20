<?php
	ini_set('display_errors',1);
	error_reporting(E_ALL);
	ini_set('date.timezone', 'Europe/Kiev');
	
	include_once 'memcache.php';
	
	define("DB_HOST", "localhost");
	define("DB_NAME", "ats");
	define("DB_USER", "db_user");
	define("DB_PASS", "db_user");
	
	function connect_db()  // Do not call directly
	{
		$mysqli = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_NAME);
		
		if($mysqli->connect_errno)
			die("DB_ERROR ".$mysqli->connect_error);
		
		return $mysqli;
	}	
	
	function refValues($arr)
	{
		if (strnatcmp(phpversion(),'5.3') >= 0) //Reference is required for PHP 5.3+
		{
			$refs = array();
			foreach($arr as $key => $value)
				$refs[$key] = &$arr[$key];
			return $refs;
		}
		return $arr;
	}
	
	/**
		$query = Statement to execute;
		$params = array of type and values of the parameters (if any)
		$close = true to close $stmt (in inserts) false to return an array with the values;
	*/

	function query($query, $params, $is_edit)
	{
		$mysqli = connect_db();
		$mysqli->set_charset("utf8");
		
        $stmt = $mysqli->prepare($query) or die ("Failed to prepared the statement! " . $query);

        if (isset($params))
        		call_user_func_array(array($stmt, 'bind_param'), refValues($params));
		
        $stmt->execute();
        $out_num_rows = $stmt->num_rows();
		
		if($is_edit)
		{
               $result = $mysqli->affected_rows;
               
               $stmt->close();
               $mysqli->close();
               return  $result;
        } 
        
        $meta = $stmt->result_metadata();
           
        while ($field = $meta->fetch_field()) 
                  $parameters[] = &$row[$field->name];
		
        call_user_func_array(array($stmt, 'bind_result'), refValues($parameters));
        
        $results = array();
        $i = 0;
        
		while ($stmt->fetch())
		{ 
               $x = array(); 
               foreach($row as $key => $val) $x[$key] = $val; 
               $results[] = $x;

               $i++;
        }

        if($i == 0) $results = null;
        $result = $results;
  
        $stmt->close();
        $mysqli->close();
          
        return  $result;
	}	
	
	function queryCache($key, $query, $params, $is_edit = false, $refresh = false)
	{				
		if($refresh)
		{
				$result = query($query, $params, $is_edit);
				$k = memSet($key, $result);
				if($k) return $result; else return $k;
		}
				
		$result = memGet($key);
		
		if($result) return $result;
		
		$result = query($query, $params, $is_edit);
		
		$k = memSet($key, $result);
		
		if($k) return $result; else return $k;
	}
?>