<?
$dbprinfo = ibase_connect("192.168.10.4:/ib_db/PrInfo.gdb", "sysdba", "masterkey");

$qry = "select objav_text, objav_id, rubrika_id, rubrika_name, district_id, district_name from objav_list_v_internet(".$gz_id.")";

$res = ibase_query($dbprinfo, $qry);

header('Content-type: text/xml; charset=windows-1251');
header('Content-Encoding: windows-1251');
echo ('<?xml version="1.0" encoding="windows-1251"?>');
echo ('<export>');
echo ('<vacancies number="'.$name_issue.'">');

while ($row = ibase_fetch_row($res))
{
	echo ('<vacancy id="'.$row[1].
	'" category_id="'.$row[2].
	'" category_name="'.htmlspecialchars($row[3]).
	'" district_id="'.$row[4].
	'" district_name="'.htmlspecialchars($row[5]).
	'">'.htmlspecialchars($row[0]).'</vacancy>');
}

ibase_close($dbprinfo);

echo ('</vacancies>');
echo ('</export>');
?>


