<?php

$this->functions[] = $this->functionToView('messagem', function ($key, $type = 'danger') {
	return (new app\classes\Flash)->get($key, $type);
});
