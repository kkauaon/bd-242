-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: mysql:3306
-- Tempo de geração: 05/02/2025 às 01:08
-- Versão do servidor: 8.0.41
-- Versão do PHP: 8.2.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `mydatabase`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `TB_CLIENTES`
--

CREATE TABLE `TB_CLIENTES` (
  `id` int NOT NULL,
  `nome` varchar(50) NOT NULL,
  `sobrenome_contato` varchar(50) NOT NULL,
  `nome_contato` varchar(50) NOT NULL,
  `telefone` int NOT NULL,
  `endereco1` varchar(50) NOT NULL,
  `endereco2` varchar(50) DEFAULT NULL,
  `cidade` varchar(50) NOT NULL,
  `estado` varchar(50) NOT NULL,
  `cep` int NOT NULL,
  `pais` varchar(50) NOT NULL,
  `empregado_id` int NOT NULL,
  `limite_credito` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `TB_CLIENTES`
--

INSERT INTO `TB_CLIENTES` (`id`, `nome`, `sobrenome_contato`, `nome_contato`, `telefone`, `endereco1`, `endereco2`, `cidade`, `estado`, `cep`, `pais`, `empregado_id`, `limite_credito`) VALUES
(1, 'João', 'Henrique', 'João', 12121212, 'Rua Doutor Marcos Tulio Cardoso, 2670', NULL, 'Feijó', 'Acre', 69960000, 'Brasil', 1, 10000);

-- --------------------------------------------------------

--
-- Estrutura para tabela `TB_DETALHES_DO_PEDIDO`
--

CREATE TABLE `TB_DETALHES_DO_PEDIDO` (
  `id` int NOT NULL,
  `produto_id` int NOT NULL,
  `quantidade` int NOT NULL,
  `preco_cada` double NOT NULL,
  `linha_pedido` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `TB_DETALHES_DO_PEDIDO`
--

INSERT INTO `TB_DETALHES_DO_PEDIDO` (`id`, `produto_id`, `quantidade`, `preco_cada`, `linha_pedido`) VALUES
(1, 1, 2, 1386, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `TB_EMPREGADOS`
--

CREATE TABLE `TB_EMPREGADOS` (
  `id` int NOT NULL,
  `sobrenome` varchar(50) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `extensao` varchar(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `escritorio_id` int NOT NULL,
  `relatorio` int NOT NULL,
  `cargo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `TB_EMPREGADOS`
--

INSERT INTO `TB_EMPREGADOS` (`id`, `sobrenome`, `nome`, `extensao`, `email`, `escritorio_id`, `relatorio`, `cargo`) VALUES
(1, 'Ricarte Evangelista', 'Isaac', '100', 'isaac.ricarte@gmail.com', 1, 1, 'Gerente');

-- --------------------------------------------------------

--
-- Estrutura para tabela `TB_ESCRITORIOS`
--

CREATE TABLE `TB_ESCRITORIOS` (
  `id` int NOT NULL,
  `cidade` varchar(50) NOT NULL,
  `telefone` int NOT NULL,
  `endereco1` varchar(50) NOT NULL,
  `endereco2` varchar(50) DEFAULT NULL,
  `estado` varchar(50) NOT NULL,
  `pais` varchar(50) NOT NULL,
  `cep` int NOT NULL,
  `territorio` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `TB_ESCRITORIOS`
--

INSERT INTO `TB_ESCRITORIOS` (`id`, `cidade`, `telefone`, `endereco1`, `endereco2`, `estado`, `pais`, `cep`, `territorio`) VALUES
(1, 'Fortaleza', 56324718, 'Av. 13 de Maio, 2081', NULL, 'Ceará', 'Brasil', 60040531, 'Benfica');

-- --------------------------------------------------------

--
-- Estrutura para tabela `TB_LINHAS_PRODUTO`
--

CREATE TABLE `TB_LINHAS_PRODUTO` (
  `id` int NOT NULL,
  `descricao_texto` text NOT NULL,
  `descricao_html` text,
  `imagem` blob
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `TB_LINHAS_PRODUTO`
--

INSERT INTO `TB_LINHAS_PRODUTO` (`id`, `descricao_texto`, `descricao_html`, `imagem`) VALUES
(1, 'Baixo elétrico\r\nInstrumento grave de acompanhamento contendo de 4 a 7 cordas (padrão).', NULL, 0x0000001c667479706176696600000000617669666d6966316d696166000000ea6d657461000000000000002168646c72000000000000000070696374000000000000000000000000000000000e7069746d00000000000100000022696c6f630000000044400001000100000000010e00010000000000002fa80000002369696e6600000000000100000015696e6665020000000001000061763031000000006a697072700000004b6970636f00000013636f6c726e636c780001000d0005000000000c6176314381040c000000001469737065000000000000021c0000021c000000107069786900000000030808080000001769706d6100000000000000010001048182038400002fb06d64617412000a07192661b86da008329a5f125030000fec04000204010300828041a0211003cf3cf1412400d7fe468c29cc85b42e53945cc210c6a9f7830a4c91994db06621b47c5d78aeb26e0005f97ee956f1ad9f1d6cf7d9bbbe8b372a5a8fc663bbbc96203abf92a2fb44041e1e96f832186f2a4e5577622489229b30f82f8d158019dcea5733126d07dd061e0a53c7ce4dc7ecb7e401b56c3d1ee5a5a64fdea0d7749330416030588ad2e4dc37e652298690a4a6b9d64b9639dd4453ea27c2a15a72a63ec2a3b58001399f203e78ca2917c203340c5914fcc27a256252852f4f84ab5f439464c56cc719d087d982538bb76f0ff82554aab72ad6d6fcc206fbdc15f60b63c16e3fc9b882923debcb1d0fe9c9f0edd6759f25a60accc736fbd96610602a172b4a6fcb9d7c5f25477a1822c75dbfcbf185563955c445667da661d99125e7fac81667384b6a14bff558814d7a6aa8d26c36f6033f18c5c9e9cbd82c61e83c39fb8c4b89b93cc2bcee531099dceed8e761dae944e46a6da3befb0aa72ed8bea34402ae4e25c8e210456f20aa5e5caf587b0f366a4758aa6adcfc472ba9024d1b6686e236e97e7879ca15054af7ed92497c864b00de34a17bba2adb26f830d1e9d7e106d04d84dcff328a34d753435fd31f1d7f2d1b20b43e064085d14784c8a8ca54aeadd982615cd7ad53459e155b7604a77d260475e1131a7b494ef91915c0be6d42f5a4004dcfec9a43b3b901910444eea055be13b871b431ff9fd5ad3f37a2bb9a764aed15cd6bc5fb9597aaafc01d4a7297b419131ab80ae6a43b0d12c35f8052b23015c12900e21d0cdf0c176741be6fd4f8efc71d74432dce1e4e6130cd8e3fa0b28952dfb827f270aaef1c2cc33d4fac3362b9eb55c39eddb8dc41bfeda2d0e44218a02670ee56ba89bbcf9b37e61d50b50de6e99d3b170d914324fa2e6422acf87a89b6ec365b015014065d51cbfb46b8ff4e56283316c17ba77c8d911e9cfce242e849908fb0a34962f90380a2ac04267d0b1bc62fc986e5f7fecfdedfe5db7f612574b422e796c43db53e29099240faef3aef0cfadaaf1634392e42f8e7ddee346e2aec52572454be92d527e2b1a49fb273929cf000406c726be75b4addc72916ff7b044e924e34077e84ff314f0622fa99554c12623f559ff016f73c5734471cd316f8a88e5e1e1f3dd032d45c3e67b591aac76bb6b866f3b58348558a52e8981d57eb909c500c65beeba5e7b43eac12029063738dd09e186ecc09aa9f1ee82ff2ec12e86ce751adf2ec94414be0c9eceb16721b6e9c349ed6c1ca8317e3eab821af902b9bd62c28f26cabf486aff9116a159e5403f899711483d1af746237c31fc3c73789bec667eaf44d826b9dd45cae42a0116c57ada845117f5872c28ca662cec6d27cfa23964d260b69d619fd4677b74cf932717b41bbfa4bf5d1e0615e6b1001000c69bcb70e86ae783d1c7c906a5b57205f6f3f6c4b00841a5f090404137a93286fb05323e08f76cb3f03b5e4466e40a011ba4586017cb043fe396237d73b41fa7a3f4d842554bd7ca9ea9593ab5b87a5c373605748a642bfc4a2dadb6894767c4bbef7e43493f68a501a506f8c302e5f0477be61f345b669eeca17665654891ec2d558171eafa2c190a022c636b27a12ed33c5f99b09bda38a802d93a0142301475f0375e30aab97f7fc5b9e6cdf666a625a377fec0701563f2b535c4c6ee4c8738ef5d81000cb258bf40b38b2519350bddae868aa4e5467e3b406ac0664b14d3ec8fc2a2976bec9321b3dc8af7377c64abe2df51f328a3e31043830779743f427b2dd5a382c6fd84f8ec1c5a46a095f8222f979f373557facd58394a39f94572b8ce8197fae1ff4e6efdc70d66cf76070947ad0da3c3ff50bb17999b9c36b9918987545c90fb9e9aeaaa1eae683d0d689c2255cb5c0d7afb1835cfb10100971a04245e805f34e4ed868c3b57b9a440e7e7195818d757f9a05d8ec97887b324fc27b211cd4120e2e2cefc693c837fac48e70b3c0ebf5c8fcb84d0d2700b0fcdb558672613e99983dfcc8f8e07680b8226239d7867a3857a9ba4206034d6e31bea1b165d253c232481f2a0cd4378878d0bfe9de9260494ee1d61e049c3909bc1dafb83e8fbbdc826e97e66255749b19e5371bdf794b3c01dfe9ad499a50aab70db70995aeec31afdd67e2ea49adf990d66e7f474f3bedf852fb5daf5adb4fbe2da954a3dd908a743a4daf96c7caf7944bc3b4597ab3866d634bb5c5019c9d5821923f0bffeaa92360242c90b157c54654fac72ad315931050aa0bf6f2dab2c9452ec6fcf0b269bf69e8e58c31b66ddaa2625d3487a4cf659b9181333cc714163b6971a23ebd3d8efbbd02e7639707022a8f3afed625f31769a580b5b4bf8970d6d8d74ab6d871f8667b9689e8204482746995251549e9f02ea3c987c32e74fa644eccc1eb2a45f477b48a1a48caaac8ee93e3770a6bb0f83cbe9d00f8b07b879fa44046ae4094696c244a37cc2799ab83c4cf770dc0acb4137dd9457be6866590e3e77c31e8f95af73d90b2474c0297594de7092c89123c99729ed04e72d28131f06a022e2ab7075d13d4d8462a6a827e24ec0143754400cf493a2b24fb1d8da9b16ef8a7025c341594b7209bf21b6617b77e99db56f38df27de4821e0ff2f6eb6fd10bbbc0795dd76a31fe4a07de0e55098284971c419219da57439f34b07b425f21f7353485393711cefcdfaaef352063b319ce68a49c1361a72256072f6b1fceab3b1730a4a50f92e4fe3aaba2ef2b3f4285047158ea9d8088f2068b1838f4d67ea0f2dcc972c19844deffda2024a4f088bff3f93b1e724b4f5694e1b609e14ebd90235bf23954ea11e000df9399c11098669f25c19bf010a4e8471cf4964fe5a475eb1452990c21c4bc3804e3f9a0d90aaa530d654811d3409b148dd1b811888f2e2948dd590f7b9861a8d6899d3fda5d222bbca96e6b35dbf04eef86f52e7865c9c1784cb59fdac03c1489267eec04cac95e93c6e9b70b718b8743f56f9f0799270bb85ed02c0d5c2d6d10168d7427e5d78ff42dda80d47eed037101000e5df45bc235b0a885c815a2f601256f737c129bdf1e2a64f32b86ce73ced3a338ac3e8953540a2a75a76eb04f13e1db98a35554e5a0ea5ea0c58f11fa59de607d6b7f951c2295bc4c07aba857baac8c14bb94ade32b1141c2115d3f4783a9ba68a4fdca7320f8885ba9da34b89b06c4e68b66f1681879a515113cef0e60abe66c1b7b7362747928bd906734a59aa44637a2a7bc01906a598ffbe2fff9af6b5c548c2184f410fbba399a6d7f2966efe725985fdda44066d3701ba26c5bce419e1e61f8b7c65e336d3221150778ec6c28008aa60a5370a4e7dd8ad8e2122b78f3753526bfc7aaee0d6b8e9d685ce5f2d3de05fcc9113116948fb6c576306b9fdf22679cd4d99abd3165abbcfcc0d6c92c7d2d1230eaf4512db6b3224a0eb9220c7994fe44901e0f526a2a0f24c7713ebff8e76c324b5ffa7a7a12bd17fad597f3fd652e5196ce0e1406de8f7f9ae47da95e0f35656c002bb52a131f43d1e4cce6580cc254a6f83732ff5824184b8706ad1658abc9c0d92bfcc4ba736b540dbcc1fd79db6f344b2c4fdc6c2b062973f159aadf890f282789564f705bb08156943892149acfd695f4e9a931f7f2c24d6032ef876236cd8c2c2149b1cf7b566ac79b8a6b63dfe4ee490033d25ea765b2e71044c7971068aaf6226e9dc331f784e030113b3427a2fffe6c493e5952299708e2cdfa0d944d0ef007d5ab9b33d0da80ac5518895f5631a552745d5f3f330bd9310df11a5f873910857b9638a92275ead55191931245b14c7637d765c7e098ddf00ba954111134ffd5bd489c293c309b109c8e0e79620287e8138412d6ec932a7fa698ef66ea3ea80b092231c4a0a73e994d9a39641232ef683f90e953882e4d5f40caa1ad9387582ea389aaac23f5fe64b5f123d5440590eef226f58cb7844d2414fb14b504db12fe9eb61f822717ab1dfbfbeabb240864c4d4e3ad68986a94693a8f601ad3cf2d13d173c9f1f233892e692cbe50e0b1ca79f5e9d2fc90dd3ea1c86ca02ad92ed0680dc71ff55cc13e17f7a51065658b841fb0026d9c31ca24df2ed276266e09b24d5800b5b23d7cfca2d9c5a4e179dd2503b658a60a64c498c59002a34337292b7f3b92e76470b7744c9e578bacd68e88a8df4354cd9f3a626fa5b6a1f6316259ae890b5592918df528dab9110dba329b8cec356bbe74ff51af648a8c42d5c2232a3fed29aa405c075a284d72bc8441a64042bf0d7df4dacd38a708db3f9d89cbc7100ce8baae1165d09824236c3a67dbb2512df9bfb4ec1bee449d8943f9c0dc8928888b608fc10a02a3cfc334bd6a37bd1c55875ba6ff41210a708f61377d5512f910b97b74858dc87da873e556d3bdd47b99c269bb1477e69e352ebbd154645fd5154dae4c717713a33c9c8f452ad113c5ba8c664b6f8acc71f49cc3277d629963de07f52bc2316ed797b2a5d17ff573cd01e0ffcae02b6700d1b6f5eaa3b505ebb76f82a37e6a97aa005e14140213f2170e60c21de6a8ee8d59cf1effbd196810f5b8d83831575cd98d89c58fd815532dff4b8fa7dd24d24c7519108b9b0ddb7f89718c1e058f0e71dc52a5cbc5dacffc69ad3f8675b5b07068354cffc8f8471837c26151a4e41e763b693036f512e7ae483ac18c891c9cb1d968c6176ff537dfcfa52f6ceb95a03713dc23c771ebc75bb5652389b69014a405b98b86a7becb9ba6b3c48c775887a4a2465e28b9ffde1ecd4d5c370fe57c00c4b4e2ce5d9ccc40b353bdde65371d041e69cea5c428b38d295ecf0cb29cce4d7ddc9b15d3c09c16479923582a4d4d4977892f69d69da0349ea8c430a6e84a6690b59046d96e98228dd69790e27bf6171ef04b9688ffa15e9040e0d1bf82ae076fd2ef852a08a1fd213e5dc23734425d9ebf433dc4509eb514db7f5d7ab87d8777033b7cb302c9aa49946e3f75e3bbd79b84edadae6afc744dee101bbe03337a661b3260c28e29c3c80395279853db24f1b15f553fad4e957d313cea83436ed776074c601897a8f23e45e03b0787ebc7a0423003635cebbfc9a699f961af873cf35ae2d0f64a4976f44a02e36a29cf67920b9369c554a8a74984698b177af0394a204f354f15bad42d78ed5dde34873ed4b55cd164cf62dc12e2d62a1a4d4fc0b02aa5afc805de1b1219be3d9492c29101dccc9861f0732022148b6b42c0ee6b44fb4b3df4e1d6d81cd5ff8618a4bdd4e4afcf2ab20011dcc609cae1d31a8214f087b56c33688112819f922a8ca97023d72a00935e3eba905a8e19daa219d79c882b59ea20ad5dcbd7e91a7194d1f6c8e7a352e9f418fe68d94c2abb8d6da34a8808691730f712d9cfdc78c993bb9bf52f7638c0c0c11357d0730d6a0d6a76fd11b7d78dd1b234feb577149d01eee990a7d21abf4c8b9c9d5fe5bbf575107e8bd9d407d65b3d6ed7eff845be2fe1aed5858535a730c9fe2beb22c723e32b015683021a112a1d5d6bd64f056e3bffb5dff9913bdcdd08261eab5545ab46d4745f1e77ab35833436404071b58a30b29e2958b3f5092efb0b7e4c9941e78158846582f8146f9b2dd7ae34cf238bc37242cecb50709500b64e68c5ee6fc84565c81b9f19e3f3ed20a95b65d5ab46f03121ff3f65009287b6bcc2bb60140e7e999f0d8f3c08ad0ef0c8a8a15a1125fcc73a0d0cc3d9aeb0223d035120334d58eacba050c9e1d74a49203a82e6ad662ecd110049f30b1fa8ca1dd233a46ef22835b0928fdab3ea2a00b9ad00eec12755e7b3552a4f9da5bd4d8d50d2ba2b621289de7566876ca85cc02df61a741f917febd691850dba311f15dce17ba88c6f4d102d154919788268126d4cd4c6ea0b00f347cb7e8517b9b8633ee9c821e7aae0709c3f83e4c8543978cd4e17c8bf83ed292f40cb265fac222afe11fe6e2a9a6f52cc57fdfb35d34b43b40f41d4b068bed1e2337491bc1370b4dfc662a586d277eeace3d1c4b2a4f256d84b8d4f28a1457fa57effc3153d5ca09d50fb290eff0abbc751791e96e507cafd3a7be4fdd422139dcfca8f973cf902323f72f1833209f886e5a5f060e57093b764826c0055edf1f3c4cc84877343c05e42984be7ab71f05292a425a1fca6fc51b1a7d8c9c7f54f4fcabff5c98f29504c04602dd72346b655ad08f10ddcfcf11bad96553b7e3181d21a1d2da1f71a9f0389f167ad8d5d13c3deee2bce8da4cf4ea49813ba10d6eb6bd9b08a4db592c981c711289c9827c7a8328553dd6c4e474519431c8ff00058656de163a00f9ca9428c80e8109338f75378baa47ab8f9d24c42dd7fa029f07a80d696aaae67655c5dd146807615ebdcf54cc440dd029d5a8285fe70d76a7156019bd97e4c26009053033b048f144f194faaf68d9c6489ec91eb5321d013e051dda87420afa3962fa82192940628508987d2713725ec2d451679b039e15f8856d28c407e5701d6c21f41065b6e41efdf16d7eadb7f22d7f5a10b9867a5a765766862e723f90a7b67c839097f3bc98c40744f8700c0f0c446c4efbbe4926d45ea3da1a820636edae4dfec7f5cf9870aeccef5b72f592e82064f8422392c78fdaa1b5cbbd52be79dee0c129733f6366f558817584e6653c60815955dd2b2aaa5f2c79250d36e3d5ce5fe80466a1fa71b0b9fd48c9b043dc32e2a3fc274ad24efa191f787548b84873dfa513d6763e29c774041c18c3d5c6e004bb3f63f35708deabab3855818116fb0b5f75c8145935b85f28fb35146f5d2b67cf2beb6b935fd928bc27d14123b0648f0978d93cdb0998fd644ca66abc7d6aa6ad183bd0f5c782652d6e5cfcf8d939e2f7aac650902e4ac78a9df731c98adc7122edeb5f39db19dc9523e316d2a3a903e8507e34b01df0ffeb7d970098106544bb2223ac68193f9eff0cf194f1af14719266802e29d03c9b147565eb09c32b9e5199ca68ad2834947b59f054ab4717afda3cce2d7777d65622ffbdf863e49361b9d4141cb128905cf5d9f51b0b1897ca247ebae9a3e72ff2953dd80746363c4cd271456a800f130ba1af59d0ce1d06dbd530c0a1d20da4259462a10272103f747ce0c6a54ffd82c6da37c77fbe1a34f3c194cab140b0215966006ed1c0496925ad831a770e515dadb7db9c54c84f7b1175b6787474437192e748648a42c80a157027034d3deaf66b2f3661d7f3f53900e980d674e4ebbd73b7e8f8eb44f628361a7985e1e43596dd1665cbff897cc566a505132416fecaad6ab72b2ea5b68d7634acaec54acec8967fe453f52263a1c2f9b21c7357c67a444613de58bb5410b103199aabbaa0cd7e59565c1bd139f7f60dd87fa7e92cb003d1b1b6d1198dd09cec8b29a52aa139c8c1a2fef9a60e2aa70b0431a9c22ace20c8dc1db9d75e55d92420b1dc25e6a69d45f2f68d78e7c161aa4f799ada745ef0760ad9b38128f9b42ef9676b88df3425ea0a382b7c14001954274090d8cc989a3bed6d4aa5593d9313ee70847497e2d7a5a6d20cfcf8686c9710106918114de55e5f4c2f0852ee0e7e9c671cda7af463754036ebf8a896dbd8cae111bc9bee2053038215bf6f59136bb8f1d8e3ace9bdd9dd7f28ff73ad04719ae553676ef96edfddf83258be41dc5d525f2e7323e64821a806484b65b2c7b4078bfed9af31c234b3f637fa6b83ac2b1f74b51eaac2f26f3678571413693aa0723d900e0978f95b5ab7473567dc595bb376fcfe44bb098018e04532c53c57aadc78a0d8844ae971e7d8a6cdcd36765cebc64bc57f618cbf0464e64160f326fbb8cb020f0e874efa8c272a96abc56d25d5fa0866066ae6af32597c3582fd1108a8534299b1c71d384690958a0ff52e3aa1cf799fb190e813627b9e2e5e0c29798992c304c0852d8a50cd146696dc48009e4dc7a686567b74a64a3a5fe3ed42d2a185046e52a45cd4c91973ff494899dac2dd7ced7474d294db90072f27b2ad9bf68e6090b2fe2396ef076cbe6548c4ad2f4b1c7a9b8178778797b60c6565402fb9e786a3d3a39349b98dbf0f57063ea87b6e2f3c61b38ea06f88f4cd84a08beda2edb2477a44d7b1eb3d76ec46cb5dd7dafd665ee31e8bae468353c3536bb40af5aa2519da9b20b91f6822d8e9e031b99fe33e3a3469026806a62f34060c55379d730d1dc7c1e31c346fb1bdd6cc119d3cb39cd991c4bd9cb059975b717e7fde6773c46730ab69db10492db837806ea55eca41d237da23095c465b0c10b5cbbe3902bf828b98d91e6615342777bed49e473057063601ad8409ea57d4798043c0699a1c3342dacc40d2980748a99fcc9253572f9d5d6038da0e77a5000ea97469741542b0057cb714ed2a81ebfbde06ccbe82f098b5000ce4705c05107a25dd037b5a9cff742665a35dd34b7d9079112842cc454df4b6a8a3a294324e2411b7bb5af0871de0f20d218c4baabf00517f36334c4b82a75fee80986654a62d14b51bf5342baecbb6f1f870bafe47b66bf9a6f1389f8107cf097371beee3bc66011a91b1853d9dcca69ecff60830a0d07a0e7960fc7c8859cc77da08b5b3b60a8ce16ba4887d0239f9cb6b2898ac2f1ceb173bdb2a48e28d66ca24f4ca0f8cbe1267505e55ea5773af69cbc642477855bdf89bceac5996b775ef01198ac8563a3b5ce29935c65d068f0b88d7fb451ab0479abe56109a04c40368a45922e629924e913fa4cef8b49d7f137d13692b1c7ccb269199a1ac71abfca746023d3739d245d9e946ed2263d21402dab6ce25e06ac802bab29cefca68ed12ed644f77aaf24aab9fb7d2bcd52e5e80a07c2b18acb368960c07de6eae9bb674a2e9de4f835ee1b38d254483122046923039b4773cc0e9ee00773e4c7dbba13aaefc9c31d2b5f3d5dd30e195429f19fe79ce2f323c5b02717d133f8411c026e4f71ec0491b4ab9adfcf7b10bda83f7ec10b3c547efeaca17074c98785463ed71bcd8fab8deae1f587c912ac54eeb81daa293df0794884223ea65087337480c861bd6099bd964ec8566d7a2f7c45e3411cd608e83fd7deb50b130d7dfce8585990cba4ec366a93f0eaac46a5d5609e98e6e4fb8aba7c9362f4d625cd035ffd6defd7623484013bda4db052aef24830ec10a8d7049fa7c4df4dba64bca3b114e0fadf6d622c877fe669de0cef01fd7606eb26e73e191207def940477ca7a8e981ffecdfe385bea5f821012d8501eac1eea64223efd7b6d3ac9718183b2e976b0e74df9006a5d915a44da793780d89500c5596115b82ba5d25d92b062ee151e97c0e49e6149c0d2f47930204f1c98ba0c7a11a19714d0478aa4750494723ee5aae77a2c728ad1438b888adf66da94904b08961d924d3cf98a9bcf231e1bc00baf31efeeaa41a016bfb94a8cebc20152174d5ce43a82d15371e94ef40b515089e722edf70cd43972a736605ed1336dc770c4a5c024c7882db7c0032ba9d7214b8cb6ee2fb3cc3381af0723c5b6196617fda7b6d51afbd0456c83b07aaade7a649319e17191eca882eb2d6b53882edaad60c19a8c9441fa20632eadf1dd9330efeb2fdfb7d3e46e23ef98d1a1fbcb84caf6eeca3e881c3cf98836fb200592160ed49149b790b69512b9f2982d7c9cc5e5c93ec8d9970fd9aa410d7493330f6507c256d52a2fdd6141b083ea8a7e8fa79ec4fc372494eaacde570413bd23bdc94a42bf5d3af85691846e0c24e33ef9545dc91e457b34a16d865325bcdb482527be6bf13ea45779a6b06c274fb4dff9a72659932dc0071449569140e1bcf83edeb56d8e338724e35c291152449311b5ac5365033e1d59c6467260577a24b6a373024727cba8391eedb0443e7e0dd8fbda021a633e80f4a003acbfdfc211ed2a80ae6e015ee963dc7749b535617b8068e35feb43763b2239afaec9f107a77ef092e54ad512885c5cff55b39096588928daefc61c1b517218050232b4c332739f168c2431798f6bc160807c18a0d16c93d67dc6c2cedb1b39d09b81b4031d3c1fd7521426e8806e641a6cb2f7a942f14cb5687d5ab5d04aa3335160b40b4fad537256c2f607f7436aed0db30f17c53c757c12d08156280526a477be854ebe8189ef969a21d1a811c074ba4754cb989dfef04bc2ac41cdf42c7d265cc6cb8becdfca28a76bfee92db6603c86ff322ad9cfcf8cb1084104769ac6f665a86c51f117c3c06b8957b51dd42d46bf3e3a265d2551962f56c6bf710b8680d79c12eaa3c4aecf7530f206b1effe2fbc7c7dd767883324ab1da6fb22407176afd8b98f469b4898f60431e5f0b6307232d66c5a64442be4ce5a8f02f845e7f31ae28f3dc208a68a2902354986bd68ea4c90c289cae0c1a0b46d64fea14e7bd4199602667cbe22070dc0c99b5bb078618f3f519c4547b870f6ea1b5329347f44d350ca44475bf06f6be4aa761ee3036711c3087381f7840ee41d43c434e685332be763bae93061d43c271c47a6e02f80c349654b942d39136999ae0ed113e6664c0f858a6564bf4084145bb9242c55e78fe2d249db5ab4a9e2bd727ad6b0105daeebb3b45dc16bb6ddbbd6ea1f404a90454af8623c25e08ac8920cccfc3c2f59a90510109b82f133ebbb5edbeaa1f42daedafa0bb9345892d10bdc4472f16b62794766d2b9cb51a10e62405049f7edfeb579525b9219bbd195dd65f2f7598c2c538966b95726c83c8b2f86548f6d127ce740aa467aa229cb95de2b4b9137e885feea87ee76bfa8a92837059b0f3098354f97bec70ac134cf812b19a761ad0797c6eb014ee36c841deba897bdfcbd3e5b712687304ab7ab10e93c40d73231d7f62bcc35737f8a96e6bcc95ee9767ca35af312b08380743b0c745188d50d114377ca6c1eae774e6865009c6da242ad21b85c52fa59933345ae4180e0051e281f4e36506b57b52edabe57cbb115222487c136926e5bcb08a5a18e7f1c655945d0adb2190aba25ab70491e08b40a425a29f195a46a95dfcff6fc949b79353802c8b514bbcf1e1d918f5733a43861b4b576ee9b980aaf552fed1ca3dfabcd4f4d166ff2de4e509b88f4b8e619678bc86b8e91d9db5457c17ae1eeef499957551f4a37c7515ad9bdc852e71154a8f8ce6675a82eb97e3b80c7107df60db9d6c98dc89758136560aa821ede5b191e3e193b99eb0814043a93e877b7c2edbe286f293834d620387896ef8ecd102b5b40b1f95d10e1834876b0a9254dd82e48d7d35c3a76593c4af90f72e8bc285b202c26b1659c8b8392ecc81c00fe81a0a163f6d646c801c8b76f87c1074f20329d05f25bb4983baf879cd87d67b046a5665737822f283c4a780efc2c1a934712e9b0bacab93c0a8073eb8b6944908078ecc5e4b1ea175093326e145c8344a54b0d11815d653f4a2746bb9216324b790abb84843e4ced28c0d875b378f04344aba2768205534243b5d544db4429efa5894cf649a3448a2391f49149bc4214e29821d86eb4a058406d8b6e4684254b2945ba9cfdfa5e31e71a7e5ec74f40cefe5d59aeb7f2892b5b94665a82cad94dbb786b2c728cda60eacd62f6541281392b254837311c886c85ee5e57238630d75883f8693945498915de35da01bacefe9ec3580310ba0c324919a3dee69eb8ea498c97d5c9a23467b1ffdd63f57b7f5cd86392e86fb5e132686042832b639aacda252ead211347edcc44febe654ef2d90283af313bc767699e3363f64755b67a89bcc9e18dda885bfa633d696077126ace85175b14bfefae391397e823225a023326c560dfa6012d370fb76a37bd69c7dcaa61b190674866e2d1cc990533e21bc46a6051967415f50bdcb496091e5c9dd69cb982a57e0d82f84eae80daf625c6fa9ee3c5f1ed87868e4468749490d24ee2cf05975f90f626ea16e96e2b738f32ce1b1d85ece055adeeb8fa8d2eb8e9f10334d34a3f9c85f119f9bbff0f6efe84abf73419bd8df95ceaa9e10c5cd13f882abb2fdcc0c8389e1dfcc3aaa4a932389b47db62dc32764ea89cbda5f9219fc438b20c73cf006ef3d68fd84dd9c69188f2bbde539fe5469d7816d06950760b815cd3cedd728d004caa0479218d529cd8436ce6e5330c2a908068248a8f4e2ba453570fdde9606f5912752fc23cf02ee3453e7716d134311399a305189df9f56da9fcc1c449d6951d5858de1a08070f82becf5fe1a8620128be18e2d0d28348b35b62fcd6a747f61abbc27a87b4340e9e9aab2a290eda40debbfb489ec3828558535a6c51d356a9624d7f30fd8d4de90123a0d2b3320fcc8226557f4fef4c7e4d22bb1948623176b8292b6ca0c1f98ced4554f90caaccf8ddb5c609e42dfae00cf7ceda4ca2b3d096a7ba3e538ee760d28dc453f953b303f02200b28f8c5c2ec6b5edd2413864c02aea0b48617a92089c4622c19d1b8c02ca034627f79fe965432478cb34910228dcbb802070ab75d5a9595a1f9d010f4c89bd2f108ebdc400811d0e1e5bc7d0a68494a644747827a5f7aa9049be70dca9331a7f4e07e492a6cd19e38298e848bb0efcc78a83fef0f9f3037f50eac7123c30880f7726fcb84715ba17db2581d91ed7195c4fcce7ef15490b1a749f30e8385e9b047cc2ebf3ebc9eeff430c6f410a684427d6c0db5c2e22e911438330386d91f0bbc9d54684ee838ce4d8523a7ceaa67ab8664ee099067ecce6262dc501f0a79424e8ed5aad9249345e9729a41d8cbfed25f4fe117ba7cf743b456f8aff6434f4e56863770457d1af698ff9dafde82da2237264eaab9e70b851cd4bc88e8d1ec1b02b20d5cb992f8f254c1886854f0f039a790d5aa70fdbae6f0071a153c000a7e4282b246cbc64e1fc24d7a6b8c1af157cc03df0f34d7f8f15170890ddc98828d4ea92694af3db7a5ae45ce2656d8d0ba34eba2401685f8f7c4a647364e6765abf4b4690ce66f3a9af5a8a0c270634f81ef3810f6e5e2e6f781793ae93c978f771adcf5792b7703bfbb6baf3f44344c5dfebd47b6cf1b66179326d887d656c164ce77bdb80301ad52c4960152ff664a66089a6225d048ade565ea94932acb27b253ac9ed1dd915474d3227aafc92c23b87e950e0f7d40ef6618f5c02216214469165d3508d0d45e63a7bd8fb1f20e431a4dafdc14b933156acab383d46947a746465e7531e47cd6e24b65904ea28b6994df48c55e72237208cdd0cf6488aca294c1e37eafc95bc9c8b50b2795567ac5cc703d2290e422b99ea900f0fdd7a54d6b297774b268055447741419e6ff3d3e5e518e0560a669537741284c10526210c1dd7e0a56ba5f7b87cdf421aa05d30f23bf5d2457e0abced6c939ed9605d1d7e0e2bf3c498ee9cd46a44e66e173078871cb58045dc7ef1815eace1939f6b9db9c1e85215fb2c4c064c8a0a8c348aa0f27d46a2eedf3ae3ff781c99a11c7cf7609054d9b7f981a93b305931377be7b313e3b0a63fe80bbcf4004d64bd67f9c932e7ae1f18d7866fd0382bd4abe23dd0b750dceec17b3b90afc03c69f9e503bf18d594215f26cd11741bf1b8a734335abb83aff0f9bac48a0c6360a835520ed6f9354944c6e26483e85d1866ec5b499ee7b55c1eb225491038d681fc126c7b82e138ae367ef6e0802ac81a7d876ff710990e4931cab4bd83a0b3d86bae9e2b566b0f5ccb82d0c925d13ce2ebc55a40510e9806a21773724bc7b229e23ee7e11cc5e7df3c29f1b285b4ee54edfd4347fd31a844b70002472a60b69de85d128e2304813d79440cbf895e3821fffdeb4e988c7264f5c7bb48fa62bd75a8ca1ed8389d69aa96fbdcc0e8c0e3287a47b277ed1a76b543134cd4112f882b0d7e276a297bfd56e7fa901bceafba1be8a6977029c18afb097ca0a0a99e29e3a4ca8a8de0810191cd64bedc5af51fa76799bd268f0c6934a0840387f8fd269ca540d3c61c668dd39548bf7c72eb736fe37b649004085bf5ee4db973b5f14fe64c1ef4cdd62e5e8d76b2efec0a7f66d14ccb3a0b4c3f6bb42be4aa82d0df94f6600383bee8bde079bb33e30191346736766d000576b76d70c18c3c743734243f572f37c3ec12906fd168e39888df3be4348809601271e9ea5a860093f66e28026218765bb79f0a65f8f2f176974838253a33744e7849db6aa2e66ce5eab18b3cd1bb6ad52bcb6c846684ec1c5b93d1872889d0913b47399f322951de47b0d6e328c8c15fa60f8d920a5c101bc8c83b7821476dc2a0e0ad78ebd7b69ac26187086c86ac83888a21dc0b658bbc166d53db38edfab45114fdb8e870f647ed0bd177cc4c5fd8c7f13680147baeae89cb26507ef09bc095710831fb8e9eb3e6cf8035a067d697ca5c338cc47bda978779f1306cc92a93886b93f04026346a86ee05f1aab8c77a77ca48bd21cf0a9eab221db73d39bb1d28e89bbd46fffd6990edabd7c7795697bae9641cdf3e4e36ac981068647ccf2d6fa6c776085b6b56fe2dbd8615016cee70bb537fc720589edd542a171bef51723050985f43c639bd4499a0d1ea49d3c6d0f24522a4f56eb742afdf52ad6e22db02eeb24165c0d14ff6b64a818f4847d7833b7f0997d01aa5ce9ee67dfd3825fa7b4b441a95272c2ef285c8f75419184f15c77819f5521e3b0340fac7e4bca6243731459f7e6b9d13e33020e634638b8478bead0200831deb2ad9ee05696204a1c645982045074ae0275c517eb5712399dffb620e3b8b4ce7c75976acd66aede4a85de0a6a3d632aa79029b9e519a2b9dc49c3bd0715d72830d8dbb53ce3d8cb40e44f2fc58e2979f1dff723ec51d10d5316a26aec1b289c402fdb36603564515a16e2c9d473e3fc356c683d8a3ea19aacd3bb2b514e10b230ecb8273eec5016c9c06469413bf034f6255188f262a434a02ebcd96ea1f79a46c9cb74e1d66c51571e29637658b69496021d37696f759aa94ae45720d7c49f6ca42ee06b51dfdb22be0a535892938f86cc12aa9de9982b5175b13b25072acd0c1b6ce5582bdc27774371f10a55ba44a68e09d46e6a83dbea6cb5cb973b3f861cc0b2bf20f4bc8d51903633550b3dca20fffe6d6ec78614c3ad8a979d4a02104f59718032a2d73af5e22f3dd6dbdd8e467974c77326086bf2b3f26d1c65e9f698aaf5b1c3327a42175be636a7e285714aa917c57921b2e40334a96b3005a10737a7698d2e34a83135c0571e76697018fe0256dd82aabf09ea13a3e5b5d8f90b01dea31bae22c58404901d516b7b297e82462843532ac34a3ef4f0ed4f78f5f2fdb270c3d76727334e0fe152b9c59a8513eedb644623565b3b85633d8363252d696d78757ae0736c770d14c680fd3ee80e85604b1f30e252491f60792fa630f5f048da55d7430d2de2762d2c451451eb58ae3a7cee36d3eb8ecfd18d846e3d223648446b6565c6fece54a19a720870b581e9a603e17aa083f522a7bee08a5d81a27b542ce350988462b143d19ff92acc49a1dc3a4eff48c2eab3f78477c83b06daceb5117296033337623be8a6c0095c2ce803fba5c29fc29536d425effa31f00026c8e962cd2b7816957e792ee83606974401355710c1eccaf06facf447dbf758d92b54c772889a1e734b0c1d1c6ef5c98e997b02401181090e89feeae1089c070dd71ed24af0e495d13cf6b7db0515408d8509d89b670e65481eead8f2cfbd8aec3b86fc7fec85ef064b00dce6312ffcdd1a79e535730db38f5e7fab497a76c6d74244f9fad86d41b0dbf1f9aeb381391a14647ac6596a5fe980bb3c9d7d170c953814d7c1c93a3c7092926b6ed551e156b338accdb7fdbb8bcab698b2800a1d90a6756361b4895499847740276037d355ee5249b991eae73ec487b6a65f0444c2b4d3d087ca0d816aaf5bf7827aa6d3b3facb85ea1927eb0b8dd01f77bfc73e6c4d58650162315269052be5a44565fb3633f48c7ebad887bea8454d9c9ceda62eb38c2d290def1a780b1c317446ae0dab8a468306f49b19c1e689fb58cbe70a00732d84da75d085c877762100b136fb62125de6c4be5fbd1276a5472feb7f3b0574ad9268540b8efd97ca8c2245f3823f7888bd46261f02b14f68f63c2afa6f8824c99d652e32077943706e9abaae1fd0d6eeb5aaeda6884d7e82d01db45933a208fb20534a3729b188c18455946b2345fcbd7aff1785383ea8c1ded7d4ae16535b4572cc2555beabdd0053378de035690d0e8194decf20963f7cbc690dfcf760f05da997cf000cdf10c1bc8e16bcadc1a3dd88fd1165cf12cf420ea2a7b24c0060359d2ad7963d85713afd4801baee2e4c7eb58e85e63300bfe0847faa7d5902ee4d2d6c3df253b843786d9017c526744e89bdd5b884737ee481e340da1e4b3cf81b503fa406a426e5dd71a9eb2b46375795d1345bb24a99bc845fe068642907b792c9d3e6361bb5b5bf62bd958de48a77e02e9f8d5e84af826bc311a5be8a555e7c011b23f14e563e58ce0dbfdcb3dddf653bf20e16ccbf5d95af19703b238220cd4ab7dd284b8475f107ae3a82d2e02ea84167efd5ca05a04b6358829d3a7efc59843b3613fef2735372b53ed2b5c7ff4b457501d97af78d63a5ad5720403f23a4945378ed329b62b3c303a58662d0f8a5630f0cb645aabf9ee897f0db3fbcc7f397f7a187c0b304349d1eb4d60a3bb26180b795d3304b6210b72e26ffb4cb976164407e467b0705fb88f7afc9fe170ddb040ca9eb1b34a797a6520a21c08b8db293e3c5328aef139516ca9e9c44dca218205c40ee045f27bccc83649d9c8608b19d32bcf348c76a8b2f2dc6dd97d679d4d71d1b534b2e8e8cd9443724107a4c143a981e9bb53fd12f7de03ae2ebf276ce600651dd8aea329447edc497e302847e86f8f4acc7489abac3d09771018d0fde885fac9b5d295d6769bec2b4219b42e2ba29d6061c062adf850d8ae0f344d76324ed8df9d2fe1375123963a45923178c7160cb86a3255da61bebfdcb1228c2f1b57f8f68c8e3693667026ae80b01a708f13a48037298ca0393c41a9ead0670815a2af9fc91898eb262331ebfd688d21a077f714c8907f041b01deea40229483dabad80442de09beeac6d99d9e5e0be228c156b7c1fdb145871526c4b69224987576162c173ad0f8e2f1d54ae659c9d378aec641372e236387f436ca84f61adc1363dda0112f653e173e5dbc8b11b96ece2cb5cdaf0632b24acff73e767387494fe85ae000000000000000000000000000000000000000000000000000000000000000000000000000000000);

-- --------------------------------------------------------

--
-- Estrutura para tabela `TB_PAGAMENTOS`
--

CREATE TABLE `TB_PAGAMENTOS` (
  `id` int NOT NULL,
  `cliente_id` int NOT NULL,
  `data_pagamento` date NOT NULL,
  `valor` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `TB_PAGAMENTOS`
--

INSERT INTO `TB_PAGAMENTOS` (`id`, `cliente_id`, `data_pagamento`, `valor`) VALUES
(1, 1, '2025-02-02', 2772);

-- --------------------------------------------------------

--
-- Estrutura para tabela `TB_PEDIDOS`
--

CREATE TABLE `TB_PEDIDOS` (
  `id` int NOT NULL,
  `data_pedido` date NOT NULL,
  `data_requerida` date NOT NULL,
  `data_envio` date NOT NULL,
  `status` varchar(15) NOT NULL,
  `comentarios` text,
  `cliente_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `TB_PEDIDOS`
--

INSERT INTO `TB_PEDIDOS` (`id`, `data_pedido`, `data_requerida`, `data_envio`, `status`, `comentarios`, `cliente_id`) VALUES
(1, '2025-02-02', '2025-02-02', '2025-02-04', 'Em trânsito', 'Aguardando ansiosamente!!', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `TB_PRODUTOS`
--

CREATE TABLE `TB_PRODUTOS` (
  `id` int NOT NULL,
  `nome_produto` varchar(70) NOT NULL,
  `linhas_produto_id` int NOT NULL,
  `tamanho_produto` varchar(10) NOT NULL,
  `fornecedor_produto` varchar(50) NOT NULL,
  `descricao_produto` text NOT NULL,
  `quantidade_estoque` int NOT NULL,
  `preco_compra` double NOT NULL,
  `MSRP` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `TB_PRODUTOS`
--

INSERT INTO `TB_PRODUTOS` (`id`, `nome_produto`, `linhas_produto_id`, `tamanho_produto`, `fornecedor_produto`, `descricao_produto`, `quantidade_estoque`, `preco_compra`, `MSRP`) VALUES
(1, 'Contrabaixo Tagima Woodstock Tw65 4 Cordas', 1, '9x43x110cm', 'Tagima', 'Especificações técnicas:\r\n• Corpo: Poplar\r\n• Braço: Maple\r\n• Escala: Technical Wood ou Maple Com 21 Trastes\r\n• Nut: 40mm\r\n• Captadores: 01 Tagima p Model e 01 Tagima Jj\r\n• Controles: 02 Volume, 01 Tonalidade\r\n• Ponte: Standard Cromada\r\n• Tarraxas: Cromadas\r\n• Cor: Branco Vintage\r\n• Escudo: Mint Green', 4, 1386, 1300);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `TB_CLIENTES`
--
ALTER TABLE `TB_CLIENTES`
  ADD PRIMARY KEY (`id`),
  ADD KEY `empregado_id` (`empregado_id`);

--
-- Índices de tabela `TB_DETALHES_DO_PEDIDO`
--
ALTER TABLE `TB_DETALHES_DO_PEDIDO`
  ADD PRIMARY KEY (`id`,`produto_id`),
  ADD KEY `produto_id` (`produto_id`);

--
-- Índices de tabela `TB_EMPREGADOS`
--
ALTER TABLE `TB_EMPREGADOS`
  ADD PRIMARY KEY (`id`),
  ADD KEY `relatorio` (`relatorio`),
  ADD KEY `escritorio_id` (`escritorio_id`);

--
-- Índices de tabela `TB_ESCRITORIOS`
--
ALTER TABLE `TB_ESCRITORIOS`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `TB_LINHAS_PRODUTO`
--
ALTER TABLE `TB_LINHAS_PRODUTO`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `TB_PAGAMENTOS`
--
ALTER TABLE `TB_PAGAMENTOS`
  ADD PRIMARY KEY (`id`,`cliente_id`),
  ADD KEY `cliente_id` (`cliente_id`);

--
-- Índices de tabela `TB_PEDIDOS`
--
ALTER TABLE `TB_PEDIDOS`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cliente_id` (`cliente_id`);

--
-- Índices de tabela `TB_PRODUTOS`
--
ALTER TABLE `TB_PRODUTOS`
  ADD PRIMARY KEY (`id`),
  ADD KEY `linhas_produto_id` (`linhas_produto_id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `TB_CLIENTES`
--
ALTER TABLE `TB_CLIENTES`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `TB_DETALHES_DO_PEDIDO`
--
ALTER TABLE `TB_DETALHES_DO_PEDIDO`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `TB_EMPREGADOS`
--
ALTER TABLE `TB_EMPREGADOS`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `TB_ESCRITORIOS`
--
ALTER TABLE `TB_ESCRITORIOS`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `TB_LINHAS_PRODUTO`
--
ALTER TABLE `TB_LINHAS_PRODUTO`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `TB_PAGAMENTOS`
--
ALTER TABLE `TB_PAGAMENTOS`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `TB_PEDIDOS`
--
ALTER TABLE `TB_PEDIDOS`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `TB_PRODUTOS`
--
ALTER TABLE `TB_PRODUTOS`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `TB_CLIENTES`
--
ALTER TABLE `TB_CLIENTES`
  ADD CONSTRAINT `TB_CLIENTES_ibfk_1` FOREIGN KEY (`empregado_id`) REFERENCES `TB_EMPREGADOS` (`id`);

--
-- Restrições para tabelas `TB_DETALHES_DO_PEDIDO`
--
ALTER TABLE `TB_DETALHES_DO_PEDIDO`
  ADD CONSTRAINT `TB_DETALHES_DO_PEDIDO_ibfk_1` FOREIGN KEY (`id`) REFERENCES `TB_PEDIDOS` (`id`),
  ADD CONSTRAINT `TB_DETALHES_DO_PEDIDO_ibfk_2` FOREIGN KEY (`produto_id`) REFERENCES `TB_PRODUTOS` (`id`);

--
-- Restrições para tabelas `TB_EMPREGADOS`
--
ALTER TABLE `TB_EMPREGADOS`
  ADD CONSTRAINT `TB_EMPREGADOS_ibfk_1` FOREIGN KEY (`relatorio`) REFERENCES `TB_EMPREGADOS` (`id`),
  ADD CONSTRAINT `TB_EMPREGADOS_ibfk_2` FOREIGN KEY (`escritorio_id`) REFERENCES `TB_ESCRITORIOS` (`id`);

--
-- Restrições para tabelas `TB_PAGAMENTOS`
--
ALTER TABLE `TB_PAGAMENTOS`
  ADD CONSTRAINT `TB_PAGAMENTOS_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `TB_CLIENTES` (`id`);

--
-- Restrições para tabelas `TB_PEDIDOS`
--
ALTER TABLE `TB_PEDIDOS`
  ADD CONSTRAINT `TB_PEDIDOS_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `TB_CLIENTES` (`id`);

--
-- Restrições para tabelas `TB_PRODUTOS`
--
ALTER TABLE `TB_PRODUTOS`
  ADD CONSTRAINT `TB_PRODUTOS_ibfk_1` FOREIGN KEY (`linhas_produto_id`) REFERENCES `TB_LINHAS_PRODUTO` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
