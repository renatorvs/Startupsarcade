<?php
//require_once 'a.php';

foreach (new DirectoryIterator("C:\wamp64\www\Projeto-startup-arcade\app\controllers\admin") as $file) {
	print (string) $file . '<br>' . PHP_EOL;
	print 'Nome: ' . $file->getFileName() . '<br>' . PHP_EOL;
	print 'Extensão: ' . $file->getExtension() . '<br>' . PHP_EOL;
	print '<br>' . PHP_EOL;

}

// foreach (new DirectoryIterator('/tmp') as $file) {
// 	print (string) $file . '<br>' . PHP_EOL;
// 	print 'Nome: ' . $file->getFileName() . '<br>' . PHP_EOL;
// 	print 'Extensão: ' . $file->getExtension() . '<br>' . PHP_EOL;
// 	print 'Tamanho: ' . $file->getSize() . '<br>' . PHP_EOL;
// 	print '<br>' . PHP_EOL;
// }

// <?php
// // interpreta o documento XML
// $xml = simplexml_load_file('paises.xml');

// // exibe os atributos do objeto criado
// echo 'Nome : '     . $xml->nome      . "<br>\n";
// echo 'Idioma : '   . $xml->idioma    . "<br>\n";
// echo 'Capital : '  . $xml->capital   . "<br>\n";
// echo 'Moeda : '    . $xml->moeda     . "<br>\n";
// echo 'Prefixo : '  . $xml->prefixo   . "<br>\n";