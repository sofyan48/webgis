<?php
include "db/conf.php";
//include "plugin/security.php";
$regId = isset($_POST['regId']) ? $_POST['regId'] : "";

if( !empty($regId)){
    $cdate = date("Y-m-d H:i:s");
    $sql = "UPDATE android_gcm__devices SET last_update_date = '$cdate', active = '0' WHERE device_id = '$regId'";
    mysql_query($sql) or die("NG #2:".mysql_error());
    echo "OK";
} else {
    echo "NG";
}
