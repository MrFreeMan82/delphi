<?php
	define("HOST", "localhost");
	define("PORT", "11211");
	define("COMPRESS", 0);

	function memConnect()
	{
		$memcache = new Memcache;
		$memcache->connect(HOST, PORT);
		
		return $memcache;
	}
	
	function memGet($key)
	{
		$mem = memConnect();
		if(!$mem)die("Memcache connect failed");
		
		$result = $mem->get($key);
		$mem->close();
		
		return $result;		
	}
	
	function memSet($key, $value)
	{
		$mem = memConnect();
		if(!$mem)die("Memcache connect failed");
		
		$result = $mem->set($key, $value, COMPRESS, 0);
		$mem->close();
		
		return $result;
	}
	
	function memReplace($key, $value)
	{
		$mem = memConnect();
		if(!$mem)die("Memcache connect failed");
		
		$result = $mem->replace($key, $value, COMPRESS);
		$mem->close();
		
		return $result;		
	}
	
	function memDelete($key)
	{
		$mem = memConnect();
		if(!$mem)die("Memcache connect failed");
		
		$result = $mem->delete($key);
		$mem->close();
		
		return $result;
	}
		
?>