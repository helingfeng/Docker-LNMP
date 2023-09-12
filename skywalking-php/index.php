<?php

$handle = curl_init('http://agent-php2:8080');
$result = curl_exec($handle);

phpinfo();