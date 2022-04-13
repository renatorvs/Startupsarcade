-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geração: 06-Abr-2022 às 02:35
-- Versão do servidor: 5.6.41-84.1
-- versão do PHP: 7.3.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `start277_startupsarcade`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `accept`
--

CREATE TABLE `accept` (
  `acc_id` int(11) NOT NULL,
  `acc_nome` varchar(40) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `adm`
--

CREATE TABLE `adm` (
  `adm_id` int(11) NOT NULL,
  `adm_nome` varchar(60) NOT NULL,
  `adm_email` varchar(60) NOT NULL,
  `adm_senha` varchar(255) NOT NULL,
  `car_id` int(11) DEFAULT NULL,
  `admuser_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `adm`
--

INSERT INTO `adm` (`adm_id`, `adm_nome`, `adm_email`, `adm_senha`, `car_id`, `admuser_id`) VALUES
(1, 'Renato Vieira', 'nato.re.vieira@gmail.com', '$2y$12$6LnTXgn3kZAaxmbK62b96OfhqSiiGWeag47TDYioBmL6OGfrTdjZ.', 1, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `blog`
--

CREATE TABLE `blog` (
  `blog_id` int(11) NOT NULL,
  `blogdestaque_id` int(11) NOT NULL,
  `blog_text` text NOT NULL,
  `blog_date` date NOT NULL,
  `blog_img` varchar(255) NOT NULL,
  `blog_categoria_id` int(11) NOT NULL,
  `blogpost_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `blog`
--

INSERT INTO `blog` (`blog_id`, `blogdestaque_id`, `blog_text`, `blog_date`, `blog_img`, `blog_categoria_id`, `blogpost_id`) VALUES
(1, 1, 'Google Ads, antes conhecido como Google AdWords, o serviço usa o sistema de publicidade por Custo por Clique (CPC) e Custo por mil impressões (CPM) que consiste em anúncios em forma de links encontrados, principalmente, nos mecanismos de pesquisa relacionados às palavras-chave que o internauta está pesquisando. É um modo de adquirir publicidade altamente segmentada independentemente de qual seja o orçamento do anunciante, no entanto, não oferece tantos recursos e facilidades nas políticas como o BingAds, seu maior concorrente. Os anúncios do Ads são exibidos juntamente com os resultados de pesquisa no Google, assim como em sites de pesquisa e de conteúdo, chamado de rede de Display, da crescente rede de anúncios do Google.\r\n\r\n#Classificação dos anúncios##\r\nA posição do anúncio na página de resultados é definida pela fórmula:\r\n\r\nClassificação do anúncio = CPC máximo X Índice de qualidade\r\n\r\nO Índice de qualidade é determinado pelo histórico de desempenho no Google: sua taxa de cliques (CTR), a relevância do texto do anúncio, o histórico de desempenho da palavra-chave, a qualidade da página de destino e outros fatores de relevância.\r\n\r\nEm resumo, o Google valoriza anúncios cujo conteúdo tem uma relação mais estreita com a busca realizada, e com isso, dificulta que empresas exibam anúncios nos resultados de pesquisa em setores não relacionados ao seu ramo de atividade.\r\n\r\nCPM - Custo por mil impressões\r\nConsiste num sistema no qual o anunciante paga um valor acordado pela quantidade de vezes que o anúncio é visto pelo consumidor, independentemente da sua ação posterior. Este acordo, normalmente, é estipulado o valor por cada mil impressões.\r\n\r\nCPC - Custo por Clique\r\nConsiste num sistema no qual o anunciante paga um valor acordado pela quantidade de vezes que o anúncio é clicado e não apenas visualizado, permitindo assim ao anunciante pagar um determinado valor somente quando o usuário clica em determinada coisa. É considerado por muitos a forma mais justa de publicidade visto que o usuário que realizou a pesquisa apenas clica no anúncio que já está inclinado à compra.\r\n\r\n#Rede de Display##\r\nOs anúncios são exibidos em sites parceiros do Google (como o próprio Gmail), site e blogs que se inscreveram no programa de afiliados Google, conhecido como Adsense. Muitos blogs e inclusive portais de notícias disponibilizam blocos de anúncios Google em suas respectivas páginas.[2]\r\n\r\nEstrutura de conta e campanha no Google Ads\r\nEstrutura conta e campanha Adwords\r\n\r\n#Exemplo de estrutura de conta Adwords##\r\n\r\nConta: Qualquer conta Google, como Gmail, por exemplo.\r\nCampanhas: leve em consideração criar uma campanha para cada linha de produtos ou serviços do seu site. Campanhas diferentes para dispositivos, entre desktop e mobile. Exemplo prático: se você trabalha com vendas de produtos para bebês, crie uma campanha para vestuários e outra para acessórios.\r\nGrupos de anúncios: Divida cada tipo de produto e coloque em grupos respectivos. Crie um grupo para sapatinhos de bebês, outro para macacões, e por aí vai.\r\nPalavras-chave: adicione as palavras-chave correspondentes para cada grupo de anúncio.\r\nAnúncios: configure títulos, descrições e páginas de destinos.\r\nTipos de Anúncios no Google Ads:\r\nAnúncios nos motores de pesquisa (SEA/SEM)\r\nAnúncios na Rede de Pesquisa Google (Search Ads)\r\nAnúncios na Rede de Pesquisa Google de Chamada (Call Only)\r\nAnúncios na Rede de Pesquisa Google Dinâmico (Dynamic Search Ads – DSA)\r\nAnúncios na Rede de Pesquisa Google para Instalações de Aplicações para dispositivos móveis\r\nAnúncios na Rede de Pesquisa Google e Rede de Parceiros\r\nAnúncios na rede de Display (GDN)\r\nAnúncios de texto na Rede Display Google\r\nAnúncios Gráficos na Rede Display Google\r\nAnúncios Dinâmicos na Rede Display Google\r\nAnúncios de Engajamento na Rede Display Google (Light Box)\r\nAnúncios de Engajamento na Rede Display Google (Rich Media)\r\nAnúncios de Banners na Rede Display de Aplicações (Admob)\r\nAnúncios Gmail Sponsored Promotions (GSP Ad Gallery)\r\nAnúncios Gmail Sponsored Promotions (GSP HTML/Formulário)\r\nAnúncios vídeo (Rede Youtube)\r\nAnúncios de Visualização (Youtube In-Display)\r\nAnúncios Vídeo em Pesquisa Youtube (Youtube In-Search)\r\nAnúncios de Sobreposição (Youtube Overlay)\r\nAnúncios de Vídeo Ignoráveis (Youtube Trueview)\r\nAnúncios de Vídeo não ignoráveis.\r\n\r\n\r\nNomes anteriores:	Google AdWords\r\nProprietário(s)	Google\r\nRequer pagamento?	Sim\r\nGênero	Programa de publicidade\r\nLançamento	23 de outubro de 2000; há 21 anos\r\nEndereço eletrônico	ads.google.com\r\nFonte: wikipedia;\r\n', '2022-03-23', '', 3, 1),
(2, 1, 'Google Ads, formerly known as Google AdWords, the service uses the Cost per Click (CPC) and Cost per Thousand Impressions (CPM) advertising system, which consists of ads in the form of links found mainly in search engines related to the words -key that the Internet user is searching for. It is a way of acquiring highly targeted advertising regardless of the advertiser\'s budget, however, it does not offer as many features and policy facilities as BingAds, its biggest competitor. Ads ads are displayed alongside search results on Google, as well as on search and content sites, called the Display Network, of Google\'s growing ad network.\r\n\r\n#Classification of ads##\r\nThe position of the ad on the results page is defined by the formula:\r\n\r\nAd Rank = Max CPC X Quality Score\r\n\r\nQuality Score is determined by your performance history on Google: your clickthrough rate (CTR), ad text relevancy, keyword performance history, landing page quality, and other relevancy factors.\r\n\r\nIn short, Google values ​​ads whose content is more closely related to the search performed, and thus makes it difficult for companies to show ads in search results in sectors unrelated to their field of activity.\r\n\r\nCPM - Cost per thousand impressions\r\nIt consists of a system in which the advertiser pays an agreed amount for the number of times the ad is seen by the consumer, regardless of their subsequent action. This agreement, normally, is stipulated the value for each thousand impressions.\r\n\r\nCPC - Cost per Click\r\nIt consists of a system in which the advertiser pays an agreed amount for the number of times the ad is clicked and not just viewed, thus allowing the advertiser to pay a certain amount only when the user clicks on a certain thing. It is considered by many to be the fairest form of advertising since the user who carried out the search only clicks on the ad that he is already inclined to buy.\r\n\r\n#Display Network##\r\nAds are displayed on Google partner sites (such as Gmail itself), websites and blogs that have signed up for the Google affiliate program known as Adsense. Many blogs and even news portals provide Google ad units on their respective pages.[2]\r\n\r\nAccount and Campaign Structure in Google Ads\r\nAdwords account and campaign structure\r\n\r\n#Adwords account structure example##\r\n\r\nAccount: Any Google account, like Gmail for example.\r\nCampaigns: Consider creating a campaign for each product or service line on your website. Different campaigns for devices, between desktop and mobile. Practical example: if you work with sales of baby products, create a campaign for clothing and another for accessories.\r\nAd groups: Divide each product type and place in respective groups. Create a group for baby shoes, another for rompers, and so on.\r\nKeywords: Add the corresponding keywords for each ad group.\r\nAds: Set up titles, descriptions, and landing pages.\r\nTypes of Ads in Google Ads:\r\nAds on search engines (SEA/SEM)\r\nAds on the Google Search Network (Search Ads)\r\nAds on the Google Search Network Call (Call Only)\r\nAds on the Google Dynamic Search Network (Dynamic Search Ads – DSA)\r\nGoogle Search Ads for Mobile App Installs\r\nAds on the Google Search Network and Partner Network\r\nAds on the Display Network (GDN)\r\nText Ads on the Google Display Network\r\nDisplay Ads on the Google Display Network\r\nDynamic Ads on the Google Display Network\r\nGoogle Display Network Engagement Ads (Light Box)\r\nGoogle Display Network Engagement Ads (Rich Media)\r\nBanner Ads on the Application Display Network (Admob)\r\nGmail Ads Sponsored Promotions (GSP Ad Gallery)\r\nGmail Ads Sponsored Promotions (GSP HTML/Form)\r\nVideo Ads (Youtube Network)\r\nPreview Ads (Youtube In-Display)\r\nVideo Ads in Youtube Search (Youtube In-Search)\r\nOverlay Ads (Youtube Overlay)\r\nSkippable Video Ads (Youtube Trueview)\r\nNon-skippable Video Ads.\r\n\r\n\r\nPrevious names: Google AdWords\r\nGoogle Owner(s)\r\nRequire payment? Yea\r\nGenre Advertising program\r\nRelease October 23, 2000; 21 years ago\r\nads.google.com email address\r\nSource: wikipedia;', '2022-03-23', '', 7, 2),
(3, 1, 'Como a maioria dos serviços da Google, só pode acessá-lo quem tem uma conta no Google. Um endereço de email no Gmail é suficiente.\r\n\r\nDesenvolvedor	Google\r\nPlataforma	Web, Android, iOS\r\nGênero(s)	Agenda eletrônica\r\nLicença	Gratuita\r\nPágina oficial	calendar.google.com/calendar\r\nFonte: wikipedia;', '2022-03-23', '', 3, 3),
(4, 1, 'Like most Google services, only those who have a Google account can access it. An email address in Gmail is enough.\r\n\r\nGoogle developer\r\nWeb Platform, Android, iOS\r\nGenre(s) Electronic diary\r\nFree License\r\nOfficial page calendar.google.com/calendar\r\nSource: wikipedia;', '2022-03-23', '', 7, 4),
(5, 1, ' Desenvolvedor	Google\r\nPlataforma	Web, Android, iOS\r\nGênero(s)	alarme eletrônico\r\nLicença	Gratuita\r\nPágina oficial	alarm.google.comalarm\r\n\r\nFonte: wikipedia;\r\n\r\n                    ', '2022-03-26', '', 3, 5),
(6, 1, 'Google developer\r\nWeb Platform, Android, iOS\r\nGenre(s) electronic alarm\r\nFree License\r\nOfficial alarm.google.comalarm page\r\n\r\nSource: wikipedia; ', '2022-03-26', '', 7, 6),
(7, 1, ' Recursos\r\nO Analytics é capaz de identificar além da tradicional taxa de exibição e hit de uma página, localização geográfica do visitante, forma com a qual chegou na página (através de links de outros sites, buscador, AdSense ou diretamente pelo endereço), sistema operacional, navegador, navegador e sistema operacional combinados e suas versões, resolução de tela, Java, reprodutor de flash instalado, entre outros, em períodos diários, semanais, mensais e anuais.\r\n\r\nEmbora muitas pessoas vejam o Google Analytics apenas como uma ferramenta de monitoramento de tráfego essa ferramenta na verdade funciona como uma poderosa ferramenta para tomada de decisões em negócios relacionados à Internet.\r\n\r\nTecnologia\r\nO Sistema conta com um breve código javascript em cada página do site que o visitante acessar. Este código envia os dados ao Analytics, que, por sua vez, os transmite ao dono. A cada novo site cadastrado no sistema, o Google Analytics varre o código-fonte em busca do código fornecido. Caso não encontre ele continua acessando a página periodicamente até encontrar a seqüencia de caracteres prevista. Caso não a encontre, o sistema não fornecerá dados ao cadastrante. Isto serve como uma forma de confirmar que somente o dono da página cadastre seus sites e somente ele tenha acesso aos dados.\r\n\r\n\r\nProprietário(s)	Google\r\nRequer pagamento ?	Não\r\nGênero	Estatística de visitas a sites e blogs\r\nCadastro	Obrigatório\r\nIdioma(s)	Diversos\r\nEndereço eletrônico\r\nPágina oficial	alarm.google.comalarm\r\n\r\nFonte: wikipedia;\r\n                    ', '2022-03-26', '', 3, 7),
(8, 1, 'Resources\r\nAnalytics is able to identify, in addition to the traditional page view and hit rate, the visitor\'s geographic location, the way in which he arrived on the page (through links from other sites, search engine, AdSense or directly by address), operating system, browser, browser and operating system combined and their versions, screen resolution, Java, installed flash player, among others, in daily, weekly, monthly and yearly periods.\r\n\r\nWhile many people see Google Analytics as just a traffic monitoring tool, this tool actually works as a powerful decision-making tool in Internet-related business.\r\n\r\nTechnology\r\nThe System has a short javascript code on each page of the website that the visitor accesses. This code sends the data to Analytics, which in turn transmits it to the owner. With each new site registered in the system, Google Analytics scans the source code in search of the code provided. If it doesn\'t find it, it continues accessing the page periodically until it finds the predicted sequence of characters. If it does not find it, the system will not provide data to the registrant. This serves as a way to confirm that only the page owner registers their sites and only he has access to the data.\r\n\r\n\r\nGoogle Owner(s)\r\nRequire payment ? No\r\nGenre Statistics of visits to websites and blogs\r\nMandatory registration\r\nMiscellaneous Language(s)\r\nE-mail\r\nOfficial alarm.google.comalarm page\r\n\r\nSource: wikipedia;', '2022-03-26', '', 7, 8),
(9, 1, 'Google Docs é um pacote de aplicativos do Google baseado em AJAX.[1] As ferramentas do Google Docs funcionam de forma síncrona e assíncrona, portanto, on-line para acessar dados em nuvens e off-line através de aplicativos de extensão instaladas diretamente do Google, onde há bancos de dados criados por essa extensão para posterior sincronização através de upload instantâneo ao acessá-los online, diretamente no browser de desktops ou aplicativos de dispositivos móveis do Android e Mec. Os aplicativos são compatíveis com o Apache OpenOffice, LibreOffice e Microsoft Office, e atualmente compõe-se de um processador de texto, um editor de apresentações, um editor de planilhas e um editor de formulários.\r\n\r\nOriginalmente, o processador de texto foi desenvolvido a parte, sob o nome Writely, e comprado pelo Google meses depois. Alguns dos recursos mais peculiares são a portabilidade de documentos, que permite a edição do mesmo documento por mais de um usuário e o recurso de publicação direta em blog. Os aplicativos permitem a compilação em PDF.\r\n\r\nEle permite aos usuários criar e editar documentos online ao mesmo tempo colaborando em tempo real com outros usuários. Google Docs combina as características de Writely e Spreadsheets com um programa de apresentação incorporando tecnologia projetada por Sistemas Tonic. Armazenamento de dados de arquivos de até 1 GB no total de tamanho foi introduzido em 13 de janeiro de 2011, os documentos criados no Google Docs não contam para este contingente.\r\n\r\n\r\nFormatos de arquivo\r\nO Google Docs suporta inúmeros formatos de arquivo:\r\nMicrosoft Word (.DOC e .DOCX)\r\nMicrosoft Excel (.XLS e .XLSX)\r\nMicrosoft PowerPoint (.PPT e .PPTX)\r\nOpenDocument Format (.ODT e .ODS)\r\nAdobe Portable Document Format (.PDF)\r\nPáginas Apple (.PAGES)\r\nAdobe Illustrator (.AI)\r\nAdobe Photoshop (.PSD)\r\nTagged Image File Format (.TIFF)\r\nAutodesk AutoCad (.DXF)\r\nScalable Vector Graphics (.SVG)\r\nPostScript (.EPS e .PS)\r\nTrueType (.TTF)\r\nXML Paper Specification (.XPS)\r\nTipos de arquivo (.ZIP e .RAR)\r\nArquivos de imagem (.JPG, .JPEG, .BMP, .PNG e .GIF)\r\n\r\nProprietário(s)	Google Inc.\r\nGênero	Editor de documentos On-line\r\nCadastro	Necessário (conta Google)\r\nPaís de origem	 Estados Unidos\r\nIdioma(s)	54\r\nLançamento	agosto de 2005\r\nDesenvolvedor	Writely Team (original)\r\nGoogle Inc.\r\nEndereço eletrônico\r\nFonte: wikipedia;\r\n                    ', '2022-03-26', '', 3, 9),
(10, 1, 'Google Docs is an AJAX-based application package from Google. Google Docs tools work synchronously and asynchronously, therefore, online to access data in clouds and offline through extension applications installed directly from Google, where there are databases created by this extension for later synchronization through Instant upload when accessing them online, directly in the desktop browser or Android and Mec mobile apps. The applications are compatible with Apache OpenOffice, LibreOffice and Microsoft Office, and currently consist of a word processor, a presentation editor, a spreadsheet editor and a form editor.\r\n', '2022-03-26', '', 7, 10),
(11, 1, 'Google Drive é um serviço de armazenamento e sincronização de arquivos que foi apresentado pela Google em 24 de abril de 2012. Google Drive abriga agora o Google Docs, um leque de aplicações de produtividade, que oferece a edição de documentos, folhas de cálculo, apresentações, e muito mais. O Google Drive é considerado uma \"evolução natural\" do Google Docs (uma vez ativado substitui a URL docs.google.com por drive.google.com). Rumores sobre o Google Drive começaram a circular no início de março de 2006. Com o lançamento do Google Drive, o Google aumentou o espaço de armazenamento do Gmail para 15 GB.\r\n\r\nO Google Drive baseia-se no conceito de computação em nuvem, pois o internauta poderá armazenar arquivos através deste serviço e acedê-los a partir de qualquer computador ou outros dispositivos compatíveis, desde que ligados à internet. Para além disso o Google Drive disponibiliza vários aplicativos via online, sem que esses programas estejam instalados no computador da pessoa que os utiliza.\r\n\r\nO Google Drive dá ao usuário 15 GB grátis de armazenamento no início. Um utilizador consegue espaço extra, que é compartilhado entre Picasa e Google Drive, que vai de 25 GB até 16TB pagando uma quantia mensal (2,49 dolares/mês ou menos de 2,00 euros/mês). Pode ser adquirido através da contratação de um plano de pagamento mensal.\r\nEm agosto de 2018, Google lançou o Google One para substituir planos não gratuitos do Google Drive.\r\n\r\nNo dia 6 de Outubro de 2020, com a remodelação do G Suíte para o Google Workspace, a logomarca do Google Drive, assim como a de alguns outros apps da Google, foram alteradas.\r\n\r\nEstes são alguns dos tipos de arquivos que são compatíveis com o Google Drive:\r\n\r\nArquivos compactados (.ZIP, .RAR, tar, gzip)\r\nFormatos de áudio (MP3, MPEG, WAV, .ogg)\r\nArquivos de imagem (.JPEG, .PNG, .GIF, .BMP)\r\nMarcação/código (.CSS, .HTML, .PHP, .C, .CPP, .H, .HPP, .JS)\r\nArquivos de texto (.TXT)\r\nArquivos de vídeo (WebM, .MPEG4, .3GPP, .MOV, .AVI, .MPEGPS, .WMV, .FLV, .ogg)\r\nArquivos Adobe\r\nAutodesk AutoCad (.DXF)\r\nllustrator (.AI)\r\nPhotoshop (.PSD)\r\nFormato de documento portátil (.PDF)\r\nPostScript (.EPS, .PS)\r\nElementos gráficos vetoriais escaláveis (.SVG)\r\nFormato de arquivo de imagem com tag (.TIFF)\r\nTrueType (.TTF)\r\nExcel (.XLS, .XLSX)\r\nPowerPoint (.PPT, .PPTX)\r\nWord (.DOC, .DOCX)\r\nXML Paper Specification (.XPS)\r\n\r\n\r\nProprietário(s)	Google\r\nRequer pagamento?	Não (paga-se comprando mais espaço)\r\nGênero	Serviço de hospedagem e backup de arquivos\r\nCadastro	Público\r\nPaís de origem	Múltiplos\r\nIdioma(s)	Múltiplos\r\nLançamento	24 de abril de 2012\r\nDesenvolvedor	Google\r\nEndereço eletrônico	https://www.google.com/intl/pt-PT/drive/\r\nFonte: wikipedia;', '2022-03-26', '', 3, 11),
(12, 1, 'Google Drive is a file storage and synchronization service that was introduced by Google on April 24, 2012. Google Drive is now home to Google Docs, a range of productivity applications that offer editing documents, spreadsheets, presentations , and much more. Google Drive is considered a \"natural evolution\" of Google Docs (once activated it replaces the docs.google.com URL with drive.google.com). Rumors about Google Drive began to circulate in early March 2006. With the launch of Google Drive, Google increased Gmail\'s storage space to 15GB.\r\n\r\nGoogle Drive is based on the concept of cloud computing, as the internet user can store files through this service and access them from any computer or other compatible devices, as long as they are connected to the internet. In addition, Google Drive makes several applications available online, without these programs being installed on the computer of the person who uses them.\r\n\r\nGoogle Drive gives the user 15GB of free storage at the beginning. A user gets extra space, which is shared between Picasa and Google Drive, ranging from 25GB to 16TB for a monthly fee ($2.49/month or less than €2.00/month). It can be acquired by contracting a monthly payment plan.\r\nIn August 2018, Google launched Google One to replace non-free Google Drive plans.\r\n\r\nOn October 6, 2020, with the remodeling of the G Suite for Google Workspace, the Google Drive logo, as well as that of some other Google apps, were changed.\r\n\r\nThese are some of the file types that Google Drive supports:\r\n\r\nCompressed files (.ZIP, .RAR, tar, gzip)\r\nAudio formats (MP3, MPEG, WAV, .ogg)\r\nImage files (.JPEG, .PNG, .GIF, .BMP)\r\nMarkup/Code (.CSS, .HTML, .PHP, .C, .CPP, .H, .HPP, .JS)\r\nText files (.TXT)\r\nVideo files (WebM, .MPEG4, .3GPP, .MOV, .AVI, .MPEGPS, .WMV, .FLV, .ogg)\r\nAdobe files\r\nAutodesk AutoCad (.DXF)\r\nillustrator (.AI)\r\nPhotoshop (.PSD)\r\nPortable Document Format (.PDF)\r\nPostScript (.EPS, .PS)\r\nScalable vector graphics (.SVG)\r\nTagged image file format (.TIFF)\r\nTrueType (.TTF)\r\nExcel (.XLS, .XLSX)\r\nPowerPoint (.PPT, .PPTX)\r\nWord (.DOC, .DOCX)\r\nXML Paper Specification (.XPS)\r\n\r\n\r\nGoogle Owner(s)\r\nRequire payment? No (pays by buying more space)\r\nGenre File hosting and backup service\r\nPublic Registration\r\nMultiple country of origin\r\nMultiple Language(s)\r\nRelease April 24, 2012\r\nGoogle developer\r\nEmail address https://www.google.com/intl/pt-EN/drive/\r\nSource: wikipedia;', '2022-03-26', '', 7, 12);

-- --------------------------------------------------------

--
-- Estrutura da tabela `blog_categoria`
--

CREATE TABLE `blog_categoria` (
  `blogcat_id` int(11) NOT NULL,
  `blogcat_nome` varchar(50) NOT NULL,
  `blogpais_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `blog_categoria`
--

INSERT INTO `blog_categoria` (`blogcat_id`, `blogcat_nome`, `blogpais_id`) VALUES
(1, 'Planejamento', 1),
(2, 'Administração', 1),
(3, 'Dicas & ferramentas', 1),
(4, 'Negocios', 1),
(5, 'Management', 2),
(6, 'Planning', 2),
(7, 'Good habits & tools', 2),
(8, 'Business', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `blog_destaque`
--

CREATE TABLE `blog_destaque` (
  `blogdest_id` int(11) NOT NULL,
  `blogdest_nome` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `blog_destaque`
--

INSERT INTO `blog_destaque` (`blogdest_id`, `blogdest_nome`) VALUES
(1, 'No blog'),
(2, 'Destaque blog '),
(3, 'blog no index (não implementado)');

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `blog_post_categoria`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `blog_post_categoria` (
`post_id` int(11)
,`post_titulo` varchar(255)
,`post_subtitulo` varchar(255)
,`post_description` text
,`postcat_id` int(11)
,`tipo_post_id` int(11)
,`userpost_id` int(11)
,`post_paisid` int(11)
,`blog_id` int(11)
,`blogdestaque_id` int(11)
,`blog_text` text
,`blog_date` date
,`blog_img` varchar(255)
,`blog_categoria_id` int(11)
,`blogpost_id` int(11)
,`blogcat_id` int(11)
,`blogcat_nome` varchar(50)
,`blogpais_id` int(11)
,`blogdest_id` int(11)
,`blogdest_nome` varchar(50)
);

-- --------------------------------------------------------

--
-- Estrutura da tabela `categoria_grupo`
--

CREATE TABLE `categoria_grupo` (
  `cg_id` int(11) NOT NULL,
  `cg_nome` varchar(100) DEFAULT NULL,
  `cg_pais_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `categoria_grupo`
--

INSERT INTO `categoria_grupo` (`cg_id`, `cg_nome`, `cg_pais_id`) VALUES
(1, 'Comercial, Vendas', 1),
(2, 'Telecomunicações', 1),
(3, 'Administração ', 1),
(4, 'Informática, TI, Telecomunicações ', 1),
(5, 'Alimentação / Gastronomia', 1),
(6, 'Construção, Manutenção ', 1),
(7, 'Logística ', 1),
(8, 'industrial, Produção, Fábrica ', 1),
(9, 'Contábil, Finanças, Economia ', 1),
(10, 'Transportes', 1),
(11, 'Serviços Gerais', 1),
(12, 'Saúde', 1),
(13, 'Marketing', 1),
(14, 'Recursos Humanos', 1),
(15, 'Educação, Ensino, Idiomas', 1),
(16, 'Engenharia ', 1),
(17, 'Segurança ', 1),
(18, 'Compras ', 1),
(19, 'Jurídica', 1),
(20, 'Qualidade', 1),
(21, 'Estética ', 1),
(22, 'Hotelaria, Turismo ', 1),
(23, 'Comunicação, TV, Cinema ', 1),
(24, 'Moda', 1),
(25, 'Arquitetura, Decoração, Design', 1),
(26, 'Artes', 1),
(27, 'Agricultura, Pecuária, Veterinária', 1),
(28, 'Comércio Exterior, Importação, Exportação ', 1),
(29, 'Auditoria ', 1),
(30, 'Química, Petroquímica', 1),
(31, 'Ciências, Pesquisa', 1),
(32, 'Cultura, Lazer, Entretenimento ', 1),
(33, 'Meio Ambiente, Ecologia', 1),
(34, 'Serviço Social e Comunitário', 1),
(35, 'blog', 1),
(36, 'Design grafico', 1),
(37, 'Commercial, Sales', 2),
(38, 'Telemarketing', 2),
(39, 'Administration', 2),
(40, 'IT, Telecommunications', 2),
(41, 'Telecommunications', 2),
(42, 'Computing', 2),
(43, 'Food / Gastronomy', 2),
(44, 'Construction, Maintenance', 2),
(45, 'Logistics', 2),
(46, 'industrial, production, factory', 2),
(47, 'Accounting, Finance, Economy', 2),
(48, 'Transportation', 2),
(49, 'General Services', 2),
(50, 'Health', 2),
(51, 'Marketing', 2),
(52, 'Human Resources', 2),
(53, 'Education, Teaching, Languages', 2),
(54, 'engineering', 2),
(55, 'SafetyS', 2),
(56, 'hopping', 2),
(57, 'Legal', 2),
(58, 'Quality', 2),
(59, 'Aesthetics', 2),
(60, 'Communication, TV, Cinema', 2),
(61, 'Fashion', 2),
(62, 'Architecture, Decoration, Design', 2),
(63, 'Graphic design', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `categoria_publicidade`
--

CREATE TABLE `categoria_publicidade` (
  `catpu_id` int(11) NOT NULL,
  `catpu_nome` varchar(100) NOT NULL,
  `catpu_commisao` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `categoria_publicidade`
--

INSERT INTO `categoria_publicidade` (`catpu_id`, `catpu_nome`, `catpu_commisao`) VALUES
(1, 'Beleza', '15%'),
(2, 'Dispositivos Amazon (Echo)', '14%'),
(3, 'Bebês', '13%'),
(4, 'Alimentos e Bebidas', '13%'),
(5, 'Cuidados Pessoais', '13%'),
(6, 'Pet Shop', '13%'),
(7, 'Bebida Alcoólicas', '13%'),
(8, 'Livros Digitais (eBooks)', '13%'),
(9, 'Roupas', '13%'),
(10, 'Dispositivos Amazon (Echo)', '14%'),
(11, 'Bebês', '13%'),
(12, 'Alimentos e Bebidas', '13%'),
(13, 'Cuidados Pessoais', '13%'),
(14, 'Pet Shop', '13%'),
(15, 'Bebida Alcoólicas', '13%'),
(16, 'Livros Digitais (eBooks)', '13%'),
(17, 'Roupas', '13%'),
(18, 'Calçados', '13%'),
(19, 'Relógios', '13%'),
(20, 'Bolsas, Malas e Mochilas', '13%'),
(21, 'Livros físicos', '10%'),
(22, 'Automotivo', '10%'),
(23, 'Dispositivos Amazon (Kindle e Fire TV)', '9,5%'),
(24, 'Brinquedos e Jogos', '9%'),
(25, 'Ferramentas e Construção', '9%'),
(26, 'Jardim e Piscina', '9%'),
(27, 'Casa', '9%'),
(28, 'Cozinha', '9%'),
(29, 'Câmeras e Fotos', '8,5%'),
(30, 'Eletrônicos', '8,5%'),
(31, 'TV e Áudio', '8,5%'),
(32, 'Papelaria e Escritório', '8,5%'),
(33, 'Computadores e Informática', '8,5%'),
(34, 'Instrumentos Musicais', '8,5%'),
(35, 'Eletrodomésticos', '8%'),
(36, 'Móveis', '8%'),
(37, 'CD e Vinil', '8%'),
(38, 'DVD e Blu-ray', '8%'),
(39, 'Aventura e Lazer', '8%'),
(40, 'Esportes', '8%'),
(41, 'Games e Consoles', '8%'),
(42, 'Outros', '8%'),
(43, 'Celulares e Comunicação', '7%');

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `chatgrupomensagem`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `chatgrupomensagem` (
`msn_id` int(11)
,`msn_nome` varchar(255)
,`msn_date` timestamp
,`msn_type` int(11)
,`gml_id` int(11)
,`gml_date` timestamp
,`gml_grupo_id` int(11)
,`gml_remetente_id` int(11)
,`gml_msn_id` int(11)
,`gmdl_id` int(11)
,`gml_view` int(11)
,`mdl_id` int(11)
,`mdl_nome` varchar(50)
,`mdl_grupo_id` int(11)
,`mdl_user_id` int(11)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `chatprivadomensagem`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `chatprivadomensagem` (
`msn_id` int(11)
,`msn_nome` varchar(255)
,`msn_date` timestamp
,`msn_type` int(11)
,`pml_id` int(11)
,`pml_date` timestamp
,`pml_grupo_id` int(10)
,`pml_user_remetente_id` int(11)
,`pml_msn_id` int(11)
,`pmld_id` int(11)
,`pml_view` int(11)
,`pml_user_destinatario_id` int(11)
,`cp_id` int(11)
,`mdl_id` int(11)
,`mdl_nome` varchar(50)
,`mdl_grupo_id` int(11)
,`mdl_user_id` int(11)
);

-- --------------------------------------------------------

--
-- Estrutura da tabela `conversa_private`
--

CREATE TABLE `conversa_private` (
  `cp_id` int(11) NOT NULL,
  `cp_remetente` int(11) NOT NULL,
  `cp_destinatario` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `dadosgrupo`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `dadosgrupo` (
`cg_id` int(11)
,`cg_nome` varchar(100)
,`cg_pais_id` int(11)
,`gr_id` int(11)
,`gr_nome` varchar(50)
,`gr_descricao` varchar(255)
,`gr_cidade` varchar(50)
,`gr_estado` varchar(50)
,`gr_foto` varchar(255)
,`grcat_id` int(11)
,`gr_private` int(11)
,`gr_pais` int(11)
,`admin_id` int(11)
,`adm_user_id` int(11)
,`adm_sub_user_id` int(11)
,`adm_grupo_id` int(11)
,`adm_flag` int(11)
);

-- --------------------------------------------------------

--
-- Estrutura da tabela `duvidas`
--

CREATE TABLE `duvidas` (
  `duv_id` int(11) NOT NULL,
  `duv_pergunta` varchar(250) DEFAULT NULL,
  `duv_resposta` varchar(250) DEFAULT NULL,
  `duvcategoria_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `duvidas`
--

INSERT INTO `duvidas` (`duv_id`, `duv_pergunta`, `duv_resposta`, `duvcategoria_id`) VALUES
(1, 'Quantos grupos posso criar ?', 'Quantos quiser', 1),
(2, 'O que os grupos ?', 'São grupos criando por alguem que tem um ideia de negocio e procura um socio para agregar', 1),
(3, 'Plano de negocios tem limite', 'Há campos que você tem que  preencher', 1),
(4, 'Há notificações de grupo ?', 'Sim', 1),
(5, 'Vou saber quando alguem entra no meu grupo ?', 'Sim, há notificação para isso.', 3),
(6, 'Vou pode bloquer alguem ?', 'Sim, usuarios indesejados', 3),
(7, 'How many groups can I create ?', 'As many as I want', 4),
(8, 'What are groups?', 'They are groups created by someone who has a business idea and is looking for a partner to add', 4),
(9, 'Business plan has a limit', 'There are fields you have to fill', 4),
(10, 'Are there group notifications?', 'Yes', 4),
(11, 'Will I know when someone joins my group?', 'Yes, there is notification for that.', 6),
(12, 'Will I block someone?', 'Yes, unwanted users', 6);

-- --------------------------------------------------------

--
-- Estrutura da tabela `duvidas_categoria`
--

CREATE TABLE `duvidas_categoria` (
  `duvcat_id` int(10) NOT NULL,
  `duvcat_nome` varchar(10) DEFAULT NULL,
  `duvpais_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `duvidas_categoria`
--

INSERT INTO `duvidas_categoria` (`duvcat_id`, `duvcat_nome`, `duvpais_id`) VALUES
(1, 'Grupos', 1),
(2, 'Ideias', 1),
(3, 'Pessoas', 1),
(4, 'groups', 2),
(5, 'ideas', 2),
(6, 'people', 2);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `duvidas_categorias_view`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `duvidas_categorias_view` (
`duv_id` int(11)
,`duv_pergunta` varchar(250)
,`duvcategoria_id` int(11)
,`duv_resposta` varchar(250)
,`duvcat_id` int(10)
,`duvcat_nome` varchar(10)
,`duvpais_id` int(11)
);

-- --------------------------------------------------------

--
-- Estrutura da tabela `estado`
--

CREATE TABLE `estado` (
  `est_id` int(11) NOT NULL,
  `est_nome` varchar(50) DEFAULT NULL,
  `pais_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `estado`
--

INSERT INTO `estado` (`est_id`, `est_nome`, `pais_id`) VALUES
(1, 'AC', 1),
(2, 'AL', 1),
(3, 'AM', 1),
(4, 'AP', 1),
(5, 'BA', 1),
(6, 'CE', 1),
(7, 'DF', 1),
(8, 'ES', 1),
(9, 'GO', 1),
(10, 'MA', 1),
(11, 'MG', 1),
(12, 'MS', 1),
(13, 'MT', 1),
(14, 'PA', 1),
(15, 'PB', 1),
(16, 'PE', 1),
(17, 'PI', 1),
(18, 'PR', 1),
(19, 'RJ', 1),
(20, 'RN', 1),
(21, 'RO', 1),
(22, 'RR', 1),
(23, 'RS', 1),
(24, 'SC', 1),
(25, 'SE', 1),
(26, 'SP', 1),
(27, 'TO', 1);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `exploregrupos`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `exploregrupos` (
`cg_id` int(11)
,`cg_nome` varchar(100)
,`cg_pais_id` int(11)
,`gr_id` int(11)
,`gr_nome` varchar(50)
,`gr_descricao` varchar(255)
,`gr_cidade` varchar(50)
,`gr_estado` varchar(50)
,`gr_foto` varchar(255)
,`grcat_id` int(11)
,`gr_private` int(11)
,`gr_pais` int(11)
,`gu_accept` int(11)
,`gu_user_id` int(11)
,`gu_grupo_id` int(11)
);

-- --------------------------------------------------------

--
-- Estrutura da tabela `grupo`
--

CREATE TABLE `grupo` (
  `gr_id` int(11) NOT NULL,
  `gr_nome` varchar(50) NOT NULL,
  `gr_descricao` varchar(255) NOT NULL,
  `gr_cidade` varchar(50) NOT NULL,
  `gr_estado` varchar(50) NOT NULL,
  `gr_foto` varchar(255) NOT NULL,
  `grcat_id` int(11) NOT NULL,
  `gr_private` int(11) NOT NULL,
  `gr_pais` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `grupo`
--

INSERT INTO `grupo` (`gr_id`, `gr_nome`, `gr_descricao`, `gr_cidade`, `gr_estado`, `gr_foto`, `grcat_id`, `gr_private`, `gr_pais`) VALUES
(1, 'atartup user1 ', 'Descriçao do plano de negocio', 'cidade', 'SP', 'starstup-logo.PNG', 3, 1, 1),
(2, 'statup 2 user1', 'Descriçao ', 'cidade', 'SP', 'starstup-logo.PNG', 3, 1, 1);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `grupocategorias`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `grupocategorias` (
`cg_id` int(11)
,`cg_nome` varchar(100)
,`gr_id` int(11)
,`gr_nome` varchar(50)
,`gr_descricao` varchar(255)
,`gr_cidade` varchar(50)
,`gr_estado` varchar(50)
,`gr_pais` int(11)
,`gr_foto` varchar(255)
,`grcat_id` int(11)
,`gr_private` int(11)
);

-- --------------------------------------------------------

--
-- Estrutura da tabela `grupo_admin`
--

CREATE TABLE `grupo_admin` (
  `admin_id` int(11) NOT NULL,
  `adm_user_id` int(11) NOT NULL,
  `adm_sub_user_id` int(11) DEFAULT NULL,
  `adm_grupo_id` int(11) NOT NULL,
  `adm_flag` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `grupo_admin`
--

INSERT INTO `grupo_admin` (`admin_id`, `adm_user_id`, `adm_sub_user_id`, `adm_grupo_id`, `adm_flag`) VALUES
(1, 3, 3, 1, 1),
(2, 3, 3, 2, 1),
(3, 3, 2, 1, 0),
(4, 3, 1, 1, 0),
(5, 3, 2, 2, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `grupo_mensagem_link`
--

CREATE TABLE `grupo_mensagem_link` (
  `gml_id` int(11) NOT NULL,
  `gml_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gml_grupo_id` int(11) NOT NULL,
  `gml_remetente_id` int(11) NOT NULL,
  `gml_msn_id` int(11) NOT NULL,
  `gmdl_id` int(11) NOT NULL,
  `gml_view` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `grupo_mensagem_link`
--

INSERT INTO `grupo_mensagem_link` (`gml_id`, `gml_date`, `gml_grupo_id`, `gml_remetente_id`, `gml_msn_id`, `gmdl_id`, `gml_view`) VALUES
(4, '2021-12-04 17:59:06', 1, 3, 4, 1, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `grupo_usuario`
--

CREATE TABLE `grupo_usuario` (
  `gu_accept` int(11) NOT NULL DEFAULT '1',
  `gu_user_id` int(11) DEFAULT NULL,
  `gu_grupo_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `grupo_usuario`
--

INSERT INTO `grupo_usuario` (`gu_accept`, `gu_user_id`, `gu_grupo_id`) VALUES
(2, 3, 1),
(2, 1, 1),
(2, 3, 2),
(2, 2, 1),
(2, 1, 1),
(2, 1, 1),
(2, 2, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `mensagem`
--

CREATE TABLE `mensagem` (
  `msn_id` int(11) NOT NULL,
  `msn_nome` varchar(255) DEFAULT NULL,
  `msn_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `msn_type` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `mensagem`
--

INSERT INTO `mensagem` (`msn_id`, `msn_nome`, `msn_date`, `msn_type`) VALUES
(1, 'BOM DIA ', '2021-12-04 17:57:56', 1),
(2, 'BOM DIA ', '2021-12-04 17:57:56', 1),
(3, 'OI', '2021-12-04 17:58:06', 1),
(4, 'OI', '2021-12-04 17:59:06', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `mensagem_dados_link`
--

CREATE TABLE `mensagem_dados_link` (
  `mdl_id` int(11) NOT NULL,
  `mdl_nome` varchar(50) NOT NULL,
  `mdl_grupo_id` int(11) NOT NULL,
  `mdl_user_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `mensagem_dados_link`
--

INSERT INTO `mensagem_dados_link` (`mdl_id`, `mdl_nome`, `mdl_grupo_id`, `mdl_user_id`) VALUES
(1, 'usuario 1', 1, 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `plano_de_negocios`
--

CREATE TABLE `plano_de_negocios` (
  `pn_id` int(11) NOT NULL,
  `pn_compreensao_de_mercado` varchar(255) DEFAULT NULL,
  `pn_acompanhamento` varchar(255) DEFAULT NULL,
  `pn_estrategias_de_venda` varchar(255) DEFAULT NULL,
  `pn_projecao_financeira` varchar(255) DEFAULT NULL,
  `pn_captacao_fundos_investimento` varchar(255) DEFAULT NULL,
  `pn_grupo_id` int(11) NOT NULL,
  `pn_publico_alvo` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `plano_de_negocios`
--

INSERT INTO `plano_de_negocios` (`pn_id`, `pn_compreensao_de_mercado`, `pn_acompanhamento`, `pn_estrategias_de_venda`, `pn_projecao_financeira`, `pn_captacao_fundos_investimento`, `pn_grupo_id`, `pn_publico_alvo`) VALUES
(1, 'sss', 'ssssssssssss', 'sssssssss', 'ssssssssss', 'ssssssssssss', 1, 'ssss');

-- --------------------------------------------------------

--
-- Estrutura da tabela `post`
--

CREATE TABLE `post` (
  `post_id` int(11) NOT NULL,
  `post_titulo` varchar(255) DEFAULT NULL,
  `post_subtitulo` varchar(255) DEFAULT NULL,
  `post_description` text,
  `postcat_id` int(11) DEFAULT NULL,
  `tipo_post_id` int(11) NOT NULL,
  `userpost_id` int(11) NOT NULL,
  `post_paisid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `post`
--

INSERT INTO `post` (`post_id`, `post_titulo`, `post_subtitulo`, `post_description`, `postcat_id`, `tipo_post_id`, `userpost_id`, `post_paisid`) VALUES
(1, ' Google Ads ', 'Internet para leigos | Ferramenta Google Ads', '#Antes de falarmos de Google ads vale resaltar a diferença entre o Google AdSense e o Google Ads, A comparação entre os produtos de anunciantes e os de editores.##   #Google AdSense## É para editores. Se você possui ou gerencia sites, blogs ou fóruns e quer gerar receita com eles, o programa Google AdSense pode ser a opção certa.Os anúncios são exibidos na sua propriedade digital, e você pode gerar receita com base no número de pessoas que visualizam ou interagem com esses anúncios. Outras plataformas para editores incluem o Google Ad Manager e a AdMob. Saiba mais em Comparação entre o Ad Manager, o Google AdSense e a AdMob.  #Google Ads## É destinado a anunciantes. Se você quer anunciar produtos ou serviços em sites ou apps, com o objetivo de expandir seus negócios ou vendas, o Google Ads é a escolha ideal. Seus anúncios são exibidos nos resultados da pesquisa do Google e na nossa rede de sites de editores. Saiba mais sobre o Google Ads e comece a anunciar acessando www.ads.google.com.', 3, 1, 1, 1),
(2, ' Google Ads ', 'Internet for Dummies | Google Ads Tool', 'Before we talk about Google ads, it\'s worth mentioning the difference between Google AdSense and Google Ads, The comparison between advertisers\' and publishers\' products.## #Google AdSense## It\'s for publishers. If you own or manage websites, blogs or forums and want to monetize them, the Google AdSense program may be the right choice. Ads are displayed on your digital property, and you can monetize based on the number of people who view or interact with these ads. Other platforms for publishers include Google Ad Manager and AdMob. Learn more at Comparison of Ad Manager, Google AdSense and AdMob. #Google Ads## It is intended for advertisers. If you want to advertise products or services on websites or apps, with the aim of growing your business or sales, Google Ads is the ideal choice. Your ads appear in Google search results and on our network of publisher sites. Learn more about Google Ads and start advertising at www.ads.google.com.', 7, 1, 1, 2),
(3, 'Google Agenda ', 'Internet para leigos | Ferramenta Google Agenda', 'Google Agenda é um serviço de agenda e calendário on-line oferecido gratuitamente pela empresa Google. Disponível em uma interface web, é possível adicionar, controlar eventos, compromissos, compartilhar a programação com outras pessoas, agregar à sua agenda diversas agendas públicas, entre outras funcionalidades.', 3, 1, 1, 1),
(4, 'Google Calendar ', 'Internet for Dummies | Google Calendar Tool', 'Google Calendar is an online calendar and calendar service offered for free by the Google company. Available in a web interface, it is possible to add, control events, appointments, share the schedule with other people, add several public calendars to your agenda, among other features.', 7, 1, 1, 2),
(5, 'Google Alerts', 'Internet para leigos | Ferramenta Google Alerts', 'Google Alerts é um serviço do Google que retorna resultados de uma pesquisa à caixa de emails do usuário, sempre que for encontrada nova citação de um termo pré determinado.', 3, 1, 1, 1),
(6, 'Google Alerts', 'Internet for Dummies | Google Alerts Tool', 'Google Alerts is a Google service that returns search results to the user\'s mailbox whenever a new citation of a predetermined term is found.\r\n', 3, 1, 1, 1),
(7, 'Google Analytics', 'Internet para leigos | Ferramenta Google Analytics', 'Google Analytics é um serviço gratuito e é oferecido pela Google no qual, ao ativar-se o serviço por intermédio de uma conta do Google, e ao cadastrar-se um site recebe-se um código para ser inserido na página cadastrada e, a cada exibição, estatísticas de visitação são enviadas ao sistema e apresentadas ao dono do site. Foi criado principalmente como um auxilio aos webmasters para otimizar seus sites para campanhas de marketing e para o Google AdSense. É incorreto pensar que este serviço resolve os problemas de um site automaticamente sem um webmaster por trás, ele apenas demonstra as informações para que sejam corrigidas.  O sistema foi modelado com o sistema de estatísticas Urchin, da Urchin Software Corporation, adquirida pela Google em abril de 2005. Ainda hoje o sistema Urchin original para instalação em computadores é vendido pelo Google como um novo pacote.', 3, 1, 1, 1),
(8, 'Google Analytics', 'Internet for Dummies | Google Analytics Tool', 'Google Analytics is a free service and is offered by Google in which, when activating the service through a Google account, and when registering a website, a code is received to be inserted in the registered page and, at each display, visitor statistics are sent to the system and presented to the website owner. It was created primarily as an aid to webmasters to optimize their websites for marketing campaigns and for Google AdSense. It is incorrect to think that this service solves a site\'s problems automatically without a webmaster behind it, it just demonstrates the information to be corrected. The system was modeled on the Urchin statistics system from Urchin Software Corporation, acquired by Google in April 2005. Even today the original Urchin system for computer installation is sold by Google as a new package.\r\n\r\n', 3, 1, 1, 1),
(9, 'Google Docs', 'Internet para leigos | Ferramenta Google Docs', 'Google Docs é um pacote de aplicativos do Google baseado em AJAX.[1] As ferramentas do Google Docs funcionam de forma síncrona e assíncrona, portanto, on-line para acessar dados em nuvens e off-line através de aplicativos de extensão instaladas diretamente do Google, onde há bancos de dados criados por essa extensão para posterior sincronização através de upload instantâneo ao acessá-los online, diretamente no browser de desktops ou aplicativos de dispositivos móveis do Android e Mec. Os aplicativos são compatíveis com o Apache OpenOffice, LibreOffice e Microsoft Office, e atualmente compõe-se de um processador de texto, um editor de apresentações, um editor de planilhas e um editor de formulários...', 3, 1, 1, 1),
(10, 'Google Docs', 'Internet for Dummies | Google Docs Tool', 'Google Docs is an AJAX-based application package from Google. Google Docs Ass works synchronously and asynchronously, therefore, online to access data in clouds and offline through extension applications installed directly from Google, where there are databases created by this extension for later synchronization through upload instant access when accessing them online, directly in the desktop browser or mobile apps from Android and Mec. The applications are compatible with Apache OpenOffice, LibreOffice and Microsoft Office, and currently consist of a word processor, a presentation editor, a spreadsheet editor and a form editor...\r\n', 3, 1, 1, 1),
(11, 'Google Drive', 'Internet para leigos | Ferramenta Google Drive', 'Google Drive é um serviço de armazenamento e sincronização de arquivos que foi apresentado pela Google em 24 de abril de 2012. Google Drive abriga agora o Google Docs, um leque de aplicações de produtividade, que oferece a edição de documentos, folhas de cálculo, apresentações, e muito mais. O Google Drive é considerado uma \"evolução natural\" do Google Docs (uma vez ativado substitui a URL docs.google.com por drive.google.com). Rumores sobre o Google Drive começaram a circular no início de março de 2006. Com o lançamento do Google Drive, o Google aumentou o espaço de armazenamento do Gmail para 15 GB...\r\n', 3, 1, 1, 1),
(12, 'Google Drive', 'Internet for Dummies | Google Drive Tool', 'Google Drive is a file storage and synchronization service that was introduced by Google on April 24, 2012. Google Drive is now home to Google Docs, a range of productivity applications that offer editing documents, spreadsheets, presentations , and much more. Google Drive is considered a \"natural evolution\" of Google Docs (once activated it replaces the docs.google.com URL with drive.google.com). Rumors about Google Drive started circulating in early March 2006. With the launch of Google Drive, Google increased Gmail\'s storage space to 15GB...\r\n', 3, 1, 1, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `privado_mensagem_link`
--

CREATE TABLE `privado_mensagem_link` (
  `pml_id` int(11) NOT NULL,
  `pml_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `pml_grupo_id` int(10) NOT NULL,
  `pml_user_remetente_id` int(11) NOT NULL,
  `pml_msn_id` int(11) NOT NULL,
  `pmld_id` int(11) NOT NULL,
  `pml_view` int(11) NOT NULL DEFAULT '0',
  `pml_user_destinatario_id` int(11) NOT NULL,
  `cp_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `privado_mensagem_link`
--

INSERT INTO `privado_mensagem_link` (`pml_id`, `pml_date`, `pml_grupo_id`, `pml_user_remetente_id`, `pml_msn_id`, `pmld_id`, `pml_view`, `pml_user_destinatario_id`, `cp_id`) VALUES
(1, '2021-03-24 21:27:29', 1, 3, 7, 1, 0, 1, 0),
(2, '2021-03-24 22:43:53', 1, 3, 8, 1, 0, 1, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `proposta`
--

CREATE TABLE `proposta` (
  `pr_id` int(11) NOT NULL,
  `pr_mvc` varchar(200) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `propostagrupo`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `propostagrupo` (
`cg_id` int(11)
,`cg_nome` varchar(100)
,`cg_pais_id` int(11)
,`gr_id` int(11)
,`gr_nome` varchar(50)
,`gr_descricao` varchar(255)
,`gr_cidade` varchar(50)
,`gr_estado` varchar(50)
,`gr_foto` varchar(255)
,`grcat_id` int(11)
,`gr_private` int(11)
,`gr_pais` int(11)
,`pn_id` int(11)
,`pn_compreensao_de_mercado` varchar(255)
,`pn_acompanhamento` varchar(255)
,`pn_estrategias_de_venda` varchar(255)
,`pn_projecao_financeira` varchar(255)
,`pn_captacao_fundos_investimento` varchar(255)
,`pn_grupo_id` int(11)
,`pn_publico_alvo` varchar(255)
);

-- --------------------------------------------------------

--
-- Estrutura da tabela `publicidade`
--

CREATE TABLE `publicidade` (
  `pu_id` int(11) NOT NULL,
  `pu_produto` varchar(250) NOT NULL,
  `pu_link` text NOT NULL,
  `pu_categoria_id` int(11) NOT NULL,
  `pu_pais` int(11) NOT NULL,
  `pu_preco` varchar(100) NOT NULL,
  `pu_parcela` varchar(100) NOT NULL,
  `pu_src` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `publicidade`
--

INSERT INTO `publicidade` (`pu_id`, `pu_produto`, `pu_link`, `pu_categoria_id`, `pu_pais`, `pu_preco`, `pu_parcela`, `pu_src`) VALUES
(1, 'All In One Positivo Union C464A-21', 'https://www.amazon.com.br/dp/B07ZRXHT37?&linkCode=li2&tag=08261096-20&linkId=a17c42c50d41484ab1322a69fc933553&language=pt_BR&ref_=as_li_ss_il', 1, 1, 'Por: R$2.319,10', 'Em até 10x R$ 231,91 sem juros', '//ws-na.amazon-adsystem.com/widgets/q?_encoding=UTF8&ASIN=B07ZRXHT37&Format=_SL160_&ID=AsinImage&MarketPlace=BR&ServiceVersion=20070822&WS=1&tag=08261096-20&language=pt_BR');

-- --------------------------------------------------------

--
-- Estrutura da tabela `solicitacao`
--

CREATE TABLE `solicitacao` (
  `soli_id` varchar(10) NOT NULL,
  `solistatus_id` varchar(10) DEFAULT NULL,
  `soli_decricao` varchar(10) DEFAULT NULL,
  `soli_response` varchar(10) DEFAULT NULL,
  `soli_date` varchar(10) DEFAULT NULL,
  `soliusuario_id` varchar(10) DEFAULT NULL,
  `solicategoria_id` varchar(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `solicitacao_categoria`
--

CREATE TABLE `solicitacao_categoria` (
  `solicat_id` varchar(10) DEFAULT NULL,
  `soli_cat_nome` varchar(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `termos`
--

CREATE TABLE `termos` (
  `term_id` int(11) NOT NULL,
  `term_titulo` varchar(100) NOT NULL,
  `term_subtitulo` varchar(150) NOT NULL,
  `term_text` text NOT NULL,
  `term_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `term_pais_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `termos`
--

INSERT INTO `termos` (`term_id`, `term_titulo`, `term_subtitulo`, `term_text`, `term_date`, `term_pais_id`) VALUES
(1, 'termo titulozddddddddddddddd', 'term subtitulozzzzzzzzzdddddddddddddddddddddzz', '                    termo titulddddddddddddddddddddddddddddddddddddddoz\r\n                  ', '2021-12-26 16:58:06', 1),
(3, 'dd', 'ddddddddddd', 'ddddddddddddd', '2021-12-26 21:49:27', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `us_id` int(11) NOT NULL,
  `us_email` varchar(255) DEFAULT NULL,
  `us_nome` varchar(100) DEFAULT NULL,
  `us_tipo_pessoa` int(11) NOT NULL,
  `us_senha` varchar(255) DEFAULT NULL,
  `us_foto` varchar(255) DEFAULT 'padraoperfil.svg',
  `us_status_conta` int(11) DEFAULT NULL,
  `us_data_compra` date DEFAULT NULL,
  `us_data_expiracao` date DEFAULT NULL,
  `us_cpf_cnpj` varchar(50) DEFAULT NULL,
  `us_dataCadastro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `us_pais_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`us_id`, `us_email`, `us_nome`, `us_tipo_pessoa`, `us_senha`, `us_foto`, `us_status_conta`, `us_data_compra`, `us_data_expiracao`, `us_cpf_cnpj`, `us_dataCadastro`, `us_pais_id`) VALUES
(1, 'nato.re.vieira@gmail.com', 'nato re ', 1, '$2y$12$6LnTXgn3kZAaxmbK62b96OfhqSiiGWeag47TDYioBmL6OGfrTdjZ.', 'padraoperfil.svg', 1, NULL, NULL, NULL, '2021-01-09 18:52:53', 1),
(2, 'usuario@gmail.com', 'usuario', 1, '$2y$12$6LnTXgn3kZAaxmbK62b96OfhqSiiGWeag47TDYioBmL6OGfrTdjZ.', 'padraoperfil.svg', 1, NULL, NULL, NULL, '2021-01-17 02:17:23', 1),
(3, 'usuario1@gmail.com', 'usuario 1', 1, '$2y$12$M2cAdPhfMm05adJGmSJGGuubJ8k0VoMpXMzkxwiEdz7dDhVQiYYFG', 'padraoperfil.svg', 1, NULL, NULL, NULL, '2021-01-17 17:33:55', 1);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `usuariogrupos`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `usuariogrupos` (
`cg_id` int(11)
,`cg_nome` varchar(100)
,`cg_pais_id` int(11)
,`gr_id` int(11)
,`gr_nome` varchar(50)
,`gr_descricao` varchar(255)
,`gr_cidade` varchar(50)
,`gr_estado` varchar(50)
,`gr_foto` varchar(255)
,`grcat_id` int(11)
,`gr_private` int(11)
,`gr_pais` int(11)
,`gu_accept` int(11)
,`gu_user_id` int(11)
,`gu_grupo_id` int(11)
,`us_id` int(11)
,`us_email` varchar(255)
,`us_nome` varchar(100)
,`us_tipo_pessoa` int(11)
,`us_senha` varchar(255)
,`us_foto` varchar(255)
,`us_status_conta` int(11)
,`us_data_compra` date
,`us_data_expiracao` date
,`us_cpf_cnpj` varchar(50)
,`us_dataCadastro` timestamp
,`us_pais_id` int(11)
,`admin_id` int(11)
,`adm_user_id` int(11)
,`adm_sub_user_id` int(11)
,`adm_grupo_id` int(11)
,`adm_flag` int(11)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `usuariogrupospendentes`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `usuariogrupospendentes` (
`cg_id` int(11)
,`cg_nome` varchar(100)
,`cg_pais_id` int(11)
,`gr_id` int(11)
,`gr_nome` varchar(50)
,`gr_descricao` varchar(255)
,`gr_cidade` varchar(50)
,`gr_estado` varchar(50)
,`gr_foto` varchar(255)
,`grcat_id` int(11)
,`gr_private` int(11)
,`gr_pais` int(11)
,`gu_accept` int(11)
,`gu_user_id` int(11)
,`gu_grupo_id` int(11)
,`us_id` int(11)
,`us_email` varchar(255)
,`us_nome` varchar(100)
,`us_tipo_pessoa` int(11)
,`us_senha` varchar(255)
,`us_foto` varchar(255)
,`us_status_conta` int(11)
,`us_data_compra` date
,`us_data_expiracao` date
,`us_cpf_cnpj` varchar(50)
,`us_dataCadastro` timestamp
,`us_pais_id` int(11)
,`admin_id` int(11)
,`adm_user_id` int(11)
,`adm_sub_user_id` int(11)
,`adm_grupo_id` int(11)
,`adm_flag` int(11)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `usuario_notificantions_mensagem`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `usuario_notificantions_mensagem` (
`gr_id` int(11)
,`gr_nome` varchar(50)
,`gr_descricao` varchar(255)
,`gr_cidade` varchar(50)
,`gr_estado` varchar(50)
,`gr_foto` varchar(255)
,`grcat_id` int(11)
,`gr_private` int(11)
,`gr_pais` int(11)
,`gml_id` int(11)
,`gml_date` timestamp
,`gml_grupo_id` int(11)
,`gml_remetente_id` int(11)
,`gml_msn_id` int(11)
,`gmdl_id` int(11)
,`gml_view` int(11)
,`msn_id` int(11)
,`msn_nome` varchar(255)
,`msn_date` timestamp
,`msn_type` int(11)
);

-- --------------------------------------------------------

--
-- Estrutura para vista `blog_post_categoria`
--
DROP TABLE IF EXISTS `blog_post_categoria`;

CREATE ALGORITHM=UNDEFINED DEFINER=`start277`@`localhost` SQL SECURITY DEFINER VIEW `blog_post_categoria`  AS SELECT `p`.`post_id` AS `post_id`, `p`.`post_titulo` AS `post_titulo`, `p`.`post_subtitulo` AS `post_subtitulo`, `p`.`post_description` AS `post_description`, `p`.`postcat_id` AS `postcat_id`, `p`.`tipo_post_id` AS `tipo_post_id`, `p`.`userpost_id` AS `userpost_id`, `p`.`post_paisid` AS `post_paisid`, `b`.`blog_id` AS `blog_id`, `b`.`blogdestaque_id` AS `blogdestaque_id`, `b`.`blog_text` AS `blog_text`, `b`.`blog_date` AS `blog_date`, `b`.`blog_img` AS `blog_img`, `b`.`blog_categoria_id` AS `blog_categoria_id`, `b`.`blogpost_id` AS `blogpost_id`, `cat`.`blogcat_id` AS `blogcat_id`, `cat`.`blogcat_nome` AS `blogcat_nome`, `cat`.`blogpais_id` AS `blogpais_id`, `bd`.`blogdest_id` AS `blogdest_id`, `bd`.`blogdest_nome` AS `blogdest_nome` FROM (((`post` `p` join `blog` `b` on((`p`.`post_id` = `b`.`blogpost_id`))) join `blog_categoria` `cat` on((`b`.`blog_categoria_id` = `cat`.`blogcat_id`))) join `blog_destaque` `bd` on((`b`.`blogdestaque_id` = `bd`.`blogdest_id`))) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `chatgrupomensagem`
--
DROP TABLE IF EXISTS `chatgrupomensagem`;

CREATE ALGORITHM=UNDEFINED DEFINER=`start277`@`localhost` SQL SECURITY DEFINER VIEW `chatgrupomensagem`  AS SELECT `m`.`msn_id` AS `msn_id`, `m`.`msn_nome` AS `msn_nome`, `m`.`msn_date` AS `msn_date`, `m`.`msn_type` AS `msn_type`, `gml`.`gml_id` AS `gml_id`, `gml`.`gml_date` AS `gml_date`, `gml`.`gml_grupo_id` AS `gml_grupo_id`, `gml`.`gml_remetente_id` AS `gml_remetente_id`, `gml`.`gml_msn_id` AS `gml_msn_id`, `gml`.`gmdl_id` AS `gmdl_id`, `gml`.`gml_view` AS `gml_view`, `mdl`.`mdl_id` AS `mdl_id`, `mdl`.`mdl_nome` AS `mdl_nome`, `mdl`.`mdl_grupo_id` AS `mdl_grupo_id`, `mdl`.`mdl_user_id` AS `mdl_user_id` FROM ((`mensagem` `m` left join `grupo_mensagem_link` `gml` on((`m`.`msn_id` = `gml`.`gml_msn_id`))) left join `mensagem_dados_link` `mdl` on((`gml`.`gmdl_id` = `mdl`.`mdl_id`))) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `chatprivadomensagem`
--
DROP TABLE IF EXISTS `chatprivadomensagem`;

CREATE ALGORITHM=UNDEFINED DEFINER=`start277`@`localhost` SQL SECURITY DEFINER VIEW `chatprivadomensagem`  AS SELECT `m`.`msn_id` AS `msn_id`, `m`.`msn_nome` AS `msn_nome`, `m`.`msn_date` AS `msn_date`, `m`.`msn_type` AS `msn_type`, `pml`.`pml_id` AS `pml_id`, `pml`.`pml_date` AS `pml_date`, `pml`.`pml_grupo_id` AS `pml_grupo_id`, `pml`.`pml_user_remetente_id` AS `pml_user_remetente_id`, `pml`.`pml_msn_id` AS `pml_msn_id`, `pml`.`pmld_id` AS `pmld_id`, `pml`.`pml_view` AS `pml_view`, `pml`.`pml_user_destinatario_id` AS `pml_user_destinatario_id`, `pml`.`cp_id` AS `cp_id`, `mdl`.`mdl_id` AS `mdl_id`, `mdl`.`mdl_nome` AS `mdl_nome`, `mdl`.`mdl_grupo_id` AS `mdl_grupo_id`, `mdl`.`mdl_user_id` AS `mdl_user_id` FROM (`mensagem_dados_link` `mdl` left join (`mensagem` `m` left join `privado_mensagem_link` `pml` on((`m`.`msn_id` = `pml`.`pml_msn_id`))) on((`pml`.`pmld_id` = `mdl`.`mdl_id`))) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `dadosgrupo`
--
DROP TABLE IF EXISTS `dadosgrupo`;

CREATE ALGORITHM=UNDEFINED DEFINER=`start277`@`localhost` SQL SECURITY DEFINER VIEW `dadosgrupo`  AS SELECT `cg`.`cg_id` AS `cg_id`, `cg`.`cg_nome` AS `cg_nome`, `cg`.`cg_pais_id` AS `cg_pais_id`, `g`.`gr_id` AS `gr_id`, `g`.`gr_nome` AS `gr_nome`, `g`.`gr_descricao` AS `gr_descricao`, `g`.`gr_cidade` AS `gr_cidade`, `g`.`gr_estado` AS `gr_estado`, `g`.`gr_foto` AS `gr_foto`, `g`.`grcat_id` AS `grcat_id`, `g`.`gr_private` AS `gr_private`, `g`.`gr_pais` AS `gr_pais`, `ga`.`admin_id` AS `admin_id`, `ga`.`adm_user_id` AS `adm_user_id`, `ga`.`adm_sub_user_id` AS `adm_sub_user_id`, `ga`.`adm_grupo_id` AS `adm_grupo_id`, `ga`.`adm_flag` AS `adm_flag` FROM ((`categoria_grupo` `cg` join `grupo` `g` on((`cg`.`cg_id` = `g`.`grcat_id`))) join `grupo_admin` `ga` on((`ga`.`adm_grupo_id` = `g`.`gr_id`))) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `duvidas_categorias_view`
--
DROP TABLE IF EXISTS `duvidas_categorias_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`start277`@`localhost` SQL SECURITY DEFINER VIEW `duvidas_categorias_view`  AS SELECT `duv`.`duv_id` AS `duv_id`, `duv`.`duv_pergunta` AS `duv_pergunta`, `duv`.`duvcategoria_id` AS `duvcategoria_id`, `duv`.`duv_resposta` AS `duv_resposta`, `dv`.`duvcat_id` AS `duvcat_id`, `dv`.`duvcat_nome` AS `duvcat_nome`, `dv`.`duvpais_id` AS `duvpais_id` FROM (`duvidas` `duv` join `duvidas_categoria` `dv` on((`duv`.`duvcategoria_id` = `dv`.`duvcat_id`))) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `exploregrupos`
--
DROP TABLE IF EXISTS `exploregrupos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`start277`@`localhost` SQL SECURITY DEFINER VIEW `exploregrupos`  AS SELECT `cg`.`cg_id` AS `cg_id`, `cg`.`cg_nome` AS `cg_nome`, `cg`.`cg_pais_id` AS `cg_pais_id`, `g`.`gr_id` AS `gr_id`, `g`.`gr_nome` AS `gr_nome`, `g`.`gr_descricao` AS `gr_descricao`, `g`.`gr_cidade` AS `gr_cidade`, `g`.`gr_estado` AS `gr_estado`, `g`.`gr_foto` AS `gr_foto`, `g`.`grcat_id` AS `grcat_id`, `g`.`gr_private` AS `gr_private`, `g`.`gr_pais` AS `gr_pais`, `gu`.`gu_accept` AS `gu_accept`, `gu`.`gu_user_id` AS `gu_user_id`, `gu`.`gu_grupo_id` AS `gu_grupo_id` FROM ((`categoria_grupo` `cg` join `grupo` `g` on((`cg`.`cg_id` = `g`.`grcat_id`))) left join `grupo_usuario` `gu` on((`g`.`gr_id` = `gu`.`gu_grupo_id`))) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `grupocategorias`
--
DROP TABLE IF EXISTS `grupocategorias`;

CREATE ALGORITHM=UNDEFINED DEFINER=`start277`@`localhost` SQL SECURITY DEFINER VIEW `grupocategorias`  AS SELECT `cg`.`cg_id` AS `cg_id`, `cg`.`cg_nome` AS `cg_nome`, `g`.`gr_id` AS `gr_id`, `g`.`gr_nome` AS `gr_nome`, `g`.`gr_descricao` AS `gr_descricao`, `g`.`gr_cidade` AS `gr_cidade`, `g`.`gr_estado` AS `gr_estado`, `g`.`gr_pais` AS `gr_pais`, `g`.`gr_foto` AS `gr_foto`, `g`.`grcat_id` AS `grcat_id`, `g`.`gr_private` AS `gr_private` FROM (`categoria_grupo` `cg` join `grupo` `g` on((`cg`.`cg_id` = `g`.`grcat_id`))) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `propostagrupo`
--
DROP TABLE IF EXISTS `propostagrupo`;

CREATE ALGORITHM=UNDEFINED DEFINER=`start277`@`localhost` SQL SECURITY DEFINER VIEW `propostagrupo`  AS SELECT `cg`.`cg_id` AS `cg_id`, `cg`.`cg_nome` AS `cg_nome`, `cg`.`cg_pais_id` AS `cg_pais_id`, `g`.`gr_id` AS `gr_id`, `g`.`gr_nome` AS `gr_nome`, `g`.`gr_descricao` AS `gr_descricao`, `g`.`gr_cidade` AS `gr_cidade`, `g`.`gr_estado` AS `gr_estado`, `g`.`gr_foto` AS `gr_foto`, `g`.`grcat_id` AS `grcat_id`, `g`.`gr_private` AS `gr_private`, `g`.`gr_pais` AS `gr_pais`, `pn`.`pn_id` AS `pn_id`, `pn`.`pn_compreensao_de_mercado` AS `pn_compreensao_de_mercado`, `pn`.`pn_acompanhamento` AS `pn_acompanhamento`, `pn`.`pn_estrategias_de_venda` AS `pn_estrategias_de_venda`, `pn`.`pn_projecao_financeira` AS `pn_projecao_financeira`, `pn`.`pn_captacao_fundos_investimento` AS `pn_captacao_fundos_investimento`, `pn`.`pn_grupo_id` AS `pn_grupo_id`, `pn`.`pn_publico_alvo` AS `pn_publico_alvo` FROM ((`categoria_grupo` `cg` join `grupo` `g` on((`cg`.`cg_id` = `g`.`grcat_id`))) left join `plano_de_negocios` `pn` on((`g`.`gr_id` = `pn`.`pn_grupo_id`))) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `usuariogrupos`
--
DROP TABLE IF EXISTS `usuariogrupos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`start277`@`localhost` SQL SECURITY DEFINER VIEW `usuariogrupos`  AS SELECT `cg`.`cg_id` AS `cg_id`, `cg`.`cg_nome` AS `cg_nome`, `cg`.`cg_pais_id` AS `cg_pais_id`, `g`.`gr_id` AS `gr_id`, `g`.`gr_nome` AS `gr_nome`, `g`.`gr_descricao` AS `gr_descricao`, `g`.`gr_cidade` AS `gr_cidade`, `g`.`gr_estado` AS `gr_estado`, `g`.`gr_foto` AS `gr_foto`, `g`.`grcat_id` AS `grcat_id`, `g`.`gr_private` AS `gr_private`, `g`.`gr_pais` AS `gr_pais`, `gu`.`gu_accept` AS `gu_accept`, `gu`.`gu_user_id` AS `gu_user_id`, `gu`.`gu_grupo_id` AS `gu_grupo_id`, `u`.`us_id` AS `us_id`, `u`.`us_email` AS `us_email`, `u`.`us_nome` AS `us_nome`, `u`.`us_tipo_pessoa` AS `us_tipo_pessoa`, `u`.`us_senha` AS `us_senha`, `u`.`us_foto` AS `us_foto`, `u`.`us_status_conta` AS `us_status_conta`, `u`.`us_data_compra` AS `us_data_compra`, `u`.`us_data_expiracao` AS `us_data_expiracao`, `u`.`us_cpf_cnpj` AS `us_cpf_cnpj`, `u`.`us_dataCadastro` AS `us_dataCadastro`, `u`.`us_pais_id` AS `us_pais_id`, `ga`.`admin_id` AS `admin_id`, `ga`.`adm_user_id` AS `adm_user_id`, `ga`.`adm_sub_user_id` AS `adm_sub_user_id`, `ga`.`adm_grupo_id` AS `adm_grupo_id`, `ga`.`adm_flag` AS `adm_flag` FROM ((((`categoria_grupo` `cg` join `grupo` `g` on((`cg`.`cg_id` = `g`.`grcat_id`))) join `grupo_usuario` `gu` on((`g`.`gr_id` = `gu`.`gu_grupo_id`))) join `usuario` `u` on((`gu`.`gu_user_id` = `u`.`us_id`))) left join `grupo_admin` `ga` on((`ga`.`adm_sub_user_id` = `u`.`us_id`))) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `usuariogrupospendentes`
--
DROP TABLE IF EXISTS `usuariogrupospendentes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`start277`@`localhost` SQL SECURITY DEFINER VIEW `usuariogrupospendentes`  AS SELECT `cg`.`cg_id` AS `cg_id`, `cg`.`cg_nome` AS `cg_nome`, `cg`.`cg_pais_id` AS `cg_pais_id`, `g`.`gr_id` AS `gr_id`, `g`.`gr_nome` AS `gr_nome`, `g`.`gr_descricao` AS `gr_descricao`, `g`.`gr_cidade` AS `gr_cidade`, `g`.`gr_estado` AS `gr_estado`, `g`.`gr_foto` AS `gr_foto`, `g`.`grcat_id` AS `grcat_id`, `g`.`gr_private` AS `gr_private`, `g`.`gr_pais` AS `gr_pais`, `gu`.`gu_accept` AS `gu_accept`, `gu`.`gu_user_id` AS `gu_user_id`, `gu`.`gu_grupo_id` AS `gu_grupo_id`, `u`.`us_id` AS `us_id`, `u`.`us_email` AS `us_email`, `u`.`us_nome` AS `us_nome`, `u`.`us_tipo_pessoa` AS `us_tipo_pessoa`, `u`.`us_senha` AS `us_senha`, `u`.`us_foto` AS `us_foto`, `u`.`us_status_conta` AS `us_status_conta`, `u`.`us_data_compra` AS `us_data_compra`, `u`.`us_data_expiracao` AS `us_data_expiracao`, `u`.`us_cpf_cnpj` AS `us_cpf_cnpj`, `u`.`us_dataCadastro` AS `us_dataCadastro`, `u`.`us_pais_id` AS `us_pais_id`, `ga`.`admin_id` AS `admin_id`, `ga`.`adm_user_id` AS `adm_user_id`, `ga`.`adm_sub_user_id` AS `adm_sub_user_id`, `ga`.`adm_grupo_id` AS `adm_grupo_id`, `ga`.`adm_flag` AS `adm_flag` FROM ((((`categoria_grupo` `cg` join `grupo` `g` on((`cg`.`cg_id` = `g`.`grcat_id`))) join `grupo_usuario` `gu` on((`g`.`gr_id` = `gu`.`gu_grupo_id`))) join `usuario` `u` on((`gu`.`gu_user_id` = `u`.`us_id`))) left join `grupo_admin` `ga` on((`ga`.`adm_sub_user_id` = `u`.`us_id`))) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `usuario_notificantions_mensagem`
--
DROP TABLE IF EXISTS `usuario_notificantions_mensagem`;

CREATE ALGORITHM=UNDEFINED DEFINER=`start277`@`localhost` SQL SECURITY DEFINER VIEW `usuario_notificantions_mensagem`  AS SELECT `g`.`gr_id` AS `gr_id`, `g`.`gr_nome` AS `gr_nome`, `g`.`gr_descricao` AS `gr_descricao`, `g`.`gr_cidade` AS `gr_cidade`, `g`.`gr_estado` AS `gr_estado`, `g`.`gr_foto` AS `gr_foto`, `g`.`grcat_id` AS `grcat_id`, `g`.`gr_private` AS `gr_private`, `g`.`gr_pais` AS `gr_pais`, `gml`.`gml_id` AS `gml_id`, `gml`.`gml_date` AS `gml_date`, `gml`.`gml_grupo_id` AS `gml_grupo_id`, `gml`.`gml_remetente_id` AS `gml_remetente_id`, `gml`.`gml_msn_id` AS `gml_msn_id`, `gml`.`gmdl_id` AS `gmdl_id`, `gml`.`gml_view` AS `gml_view`, `m`.`msn_id` AS `msn_id`, `m`.`msn_nome` AS `msn_nome`, `m`.`msn_date` AS `msn_date`, `m`.`msn_type` AS `msn_type` FROM ((`grupo` `g` join `grupo_mensagem_link` `gml` on((`g`.`gr_id` = `gml`.`gml_grupo_id`))) join `mensagem` `m` on((`gml`.`gml_msn_id` = `m`.`msn_id`))) ;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `accept`
--
ALTER TABLE `accept`
  ADD PRIMARY KEY (`acc_id`);

--
-- Índices para tabela `adm`
--
ALTER TABLE `adm`
  ADD PRIMARY KEY (`adm_id`);

--
-- Índices para tabela `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`blog_id`);

--
-- Índices para tabela `blog_categoria`
--
ALTER TABLE `blog_categoria`
  ADD PRIMARY KEY (`blogcat_id`);

--
-- Índices para tabela `blog_destaque`
--
ALTER TABLE `blog_destaque`
  ADD PRIMARY KEY (`blogdest_id`);

--
-- Índices para tabela `categoria_grupo`
--
ALTER TABLE `categoria_grupo`
  ADD PRIMARY KEY (`cg_id`);

--
-- Índices para tabela `categoria_publicidade`
--
ALTER TABLE `categoria_publicidade`
  ADD PRIMARY KEY (`catpu_id`);

--
-- Índices para tabela `conversa_private`
--
ALTER TABLE `conversa_private`
  ADD PRIMARY KEY (`cp_id`);

--
-- Índices para tabela `duvidas`
--
ALTER TABLE `duvidas`
  ADD PRIMARY KEY (`duv_id`);

--
-- Índices para tabela `duvidas_categoria`
--
ALTER TABLE `duvidas_categoria`
  ADD PRIMARY KEY (`duvcat_id`);

--
-- Índices para tabela `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`est_id`);

--
-- Índices para tabela `grupo`
--
ALTER TABLE `grupo`
  ADD PRIMARY KEY (`gr_id`);

--
-- Índices para tabela `grupo_admin`
--
ALTER TABLE `grupo_admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Índices para tabela `grupo_mensagem_link`
--
ALTER TABLE `grupo_mensagem_link`
  ADD PRIMARY KEY (`gml_id`);

--
-- Índices para tabela `mensagem`
--
ALTER TABLE `mensagem`
  ADD PRIMARY KEY (`msn_id`);

--
-- Índices para tabela `mensagem_dados_link`
--
ALTER TABLE `mensagem_dados_link`
  ADD PRIMARY KEY (`mdl_id`);

--
-- Índices para tabela `plano_de_negocios`
--
ALTER TABLE `plano_de_negocios`
  ADD PRIMARY KEY (`pn_id`);

--
-- Índices para tabela `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`post_id`);

--
-- Índices para tabela `privado_mensagem_link`
--
ALTER TABLE `privado_mensagem_link`
  ADD PRIMARY KEY (`pml_id`);

--
-- Índices para tabela `proposta`
--
ALTER TABLE `proposta`
  ADD PRIMARY KEY (`pr_id`);

--
-- Índices para tabela `publicidade`
--
ALTER TABLE `publicidade`
  ADD PRIMARY KEY (`pu_id`);

--
-- Índices para tabela `solicitacao`
--
ALTER TABLE `solicitacao`
  ADD PRIMARY KEY (`soli_id`);

--
-- Índices para tabela `termos`
--
ALTER TABLE `termos`
  ADD PRIMARY KEY (`term_id`);

--
-- Índices para tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`us_id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `accept`
--
ALTER TABLE `accept`
  MODIFY `acc_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `adm`
--
ALTER TABLE `adm`
  MODIFY `adm_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `blog`
--
ALTER TABLE `blog`
  MODIFY `blog_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `blog_categoria`
--
ALTER TABLE `blog_categoria`
  MODIFY `blogcat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de tabela `blog_destaque`
--
ALTER TABLE `blog_destaque`
  MODIFY `blogdest_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `categoria_grupo`
--
ALTER TABLE `categoria_grupo`
  MODIFY `cg_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT de tabela `categoria_publicidade`
--
ALTER TABLE `categoria_publicidade`
  MODIFY `catpu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT de tabela `conversa_private`
--
ALTER TABLE `conversa_private`
  MODIFY `cp_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `duvidas`
--
ALTER TABLE `duvidas`
  MODIFY `duv_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `duvidas_categoria`
--
ALTER TABLE `duvidas_categoria`
  MODIFY `duvcat_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `estado`
--
ALTER TABLE `estado`
  MODIFY `est_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de tabela `grupo`
--
ALTER TABLE `grupo`
  MODIFY `gr_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `grupo_admin`
--
ALTER TABLE `grupo_admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `grupo_mensagem_link`
--
ALTER TABLE `grupo_mensagem_link`
  MODIFY `gml_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `mensagem`
--
ALTER TABLE `mensagem`
  MODIFY `msn_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `mensagem_dados_link`
--
ALTER TABLE `mensagem_dados_link`
  MODIFY `mdl_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `plano_de_negocios`
--
ALTER TABLE `plano_de_negocios`
  MODIFY `pn_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `post`
--
ALTER TABLE `post`
  MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `privado_mensagem_link`
--
ALTER TABLE `privado_mensagem_link`
  MODIFY `pml_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `proposta`
--
ALTER TABLE `proposta`
  MODIFY `pr_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `publicidade`
--
ALTER TABLE `publicidade`
  MODIFY `pu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `termos`
--
ALTER TABLE `termos`
  MODIFY `term_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `us_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
