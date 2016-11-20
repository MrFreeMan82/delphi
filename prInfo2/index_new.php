<?
$dbprinfo = ibase_connect("192.168.10.4:/ib_db/PrInfo.gdb", "sysdba", "masterkey");
switch ($gz_id)
{
	case 1:
		$qry = "select max(is_id) from issue where gz_id=1 and is_id < (select PM_CURRENT_ISSUE_PR from params)";
		break;
	case 2:
		$qry = "select max(is_id) from issue where gz_id=2 and is_id < (select PM_CURRENT_ISSUE_RK from params)";
		break;
	case 3:
		$qry = "select max(is_id) from issue where gz_id=3 and is_id < (select PM_CURRENT_ISSUE_SR from params)";
		break;
	case 4:
		$qry = "select max(is_id) from issue where gz_id=4 and is_id < (select PM_CURRENT_ISSUE_RZ from params)";
		break;
	case 5:
		$qry = "select max(is_id) from issue where gz_id=5 and is_id < (select PM_CURRENT_ISSUE_RK from params)";
		break;
}

//$qry = "select max(is_id) from issue where gz_id=5 and is_id < (select PM_CURRENT_ISSUE_RK from params)";
$res = ibase_query($dbprinfo, $qry);

$cur_issue = -1;

if ($row = ibase_fetch_row($res))
{
	$cur_issue = $row[0];
}
else
{
	echo "Error. Connot find current issue.";
	ibase_close($dbprinfo);
	die;
}

$qry = "select is_name from issue where is_id=".$cur_issue;
$res = ibase_query($dbprinfo, $qry);
$row = ibase_fetch_row($res);
$name_issue = $row[0];

$qry = "select o.ob_text, o.ob_id, o.rb_id, r.rb_name, o.district_id, d.dt_name, s.sd_id, p.pd_id

		from
		podacha p inner join sdelka s on (p.sd_id=s.sd_id)
        inner join objav o on (o.sd_id=s.sd_id)
        inner join rubrika r on (o.rb_id=r.rb_id)
        left join district d on (o.district_id=d.dt_id)

		where p.is_id=".$cur_issue;

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


