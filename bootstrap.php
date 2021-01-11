<?php

require "vendor/autoload.php";

use app\classes\Bind;

$config = require "config/config.php";

Bind::set('config', $config);
