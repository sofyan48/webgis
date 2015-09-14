<?php
$fp = stream_socket_client("tcp://localhost:6969", $errno, $errstr, 30);
if (!$fp) {
    echo "$errstr ($errno)<br />\n";
} else {
    fwrite($fp, "#357671031#v600#0000#AUTOLOW#1#243ba217$GPRMC,152334.000,A,0050.8663,S,11954.4597,E,0.18,110.82,270815,,,D*70##");
    while (!feof($fp)) {
        echo fgets($fp, 1024);
    }
    fclose($fp);
}
?>
