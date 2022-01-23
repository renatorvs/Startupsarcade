
<?php
namespace app\controllers\admin;

use app\controllers\ContainerController;
use app\models\admin\Blog;

class PostBlogfactoryController extends ContainerController {

	public function create() {

		$dir = opendir('C:/wamp64/www');
		while ($arquivo = readdir($dir)) {

		$blog = new Blog();
		$blog->setPost_titulo($val->post_titulo);
		$blog->setPost_subtitulo($val->post_subtitulo);
		$blog->setPost_description($val->post_description);
		$blog->setCat_id(0);
		$blog->setTipo_post_id(5);
		$blog->setUser_id($session_id);
		$blog->setPost_paisid($val->post_paisid);

		$blog->adicionaPost();

		$blogpost_id = Blog::getLastPost_id();

		$blog->setBlogdestaque_id($val->blogdestaque_id);
		$blog->setBlog_text($val->blog_text);
		$blog->setBlog_categoria_id($val->blogcat_id);
		$blog->setBlog_date($val->blog_date);
		$blog->setBlogpost_id($blogpost_id[0]['post_id']);

		$blog->setBlog_img($blog_img);

		$blog->adicionaPostBlog();



			foreach (new DirectoryIterator("C:/wamp64/www/$arquivo/") as $file) {
				print 'Diretorio: ' . $arquivo . '<br>' . PHP_EOL;
				print (string) $file . '<br>' . PHP_EOL;
				print 'Nome: ' . $file->getFileName() . '<br>' . PHP_EOL;
				print 'Extensão: ' . $file->getExtension() . '<br>' . PHP_EOL;
				print 'Tamanho: ' . $file->getSize() . '<br>' . PHP_EOL;
				print '<br>' . PHP_EOL;

			}

		}
		closedir($dir);

// foreach (new DirectoryIterator('/tmp') as $file) {
// 	print (string) $file . '<br>' . PHP_EOL;
// 	print 'Nome: ' . $file->getFileName() . '<br>' . PHP_EOL;
// 	print 'Extensão: ' . $file->getExtension() . '<br>' . PHP_EOL;
// 	print 'Tamanho: ' . $file->getSize() . '<br>' . PHP_EOL;
// 	print '<br>' . PHP_EOL;
// }

// // interpreta o documento XML
// $xml = simplexml_load_file('paises.xml');

// // exibe os atributos do objeto criado
// echo 'Nome : '     . $xml->nome      . "<br>\n";
// echo 'Idioma : '   . $xml->idioma    . "<br>\n";
// echo 'Capital : '  . $xml->capital   . "<br>\n";
// echo 'Moeda : '    . $xml->moeda     . "<br>\n";
// echo 'Prefixo : '  . $xml->prefixo   . "<br>\n";




	}

}






