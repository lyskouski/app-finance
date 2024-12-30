'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter.js": "4b2350e14c6650ba82871f60906437ea",
"main.dart.js": "d65f5722d0f6064e59186c3c7a72c354",
"assets/FontManifest.json": "c330ec2cddeda2575a852ddaf6af789d",
"assets/AssetManifest.bin": "16b003b324717de58238eb478ae5826c",
"assets/fonts/MaterialIcons-Regular.otf": "e7069dfd19b331be16bed984668fe080",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "b93248a553f9e8bc17f1065929d5934b",
"assets/assets/fonts/RobotoCondensed-Regular.ttf": "bde79f6eb992e9138d91ba2194d1b56d",
"assets/assets/fonts/Abel-Regular.ttf": "bde79f6eb992e9138d91ba2194d1b56d",
"assets/assets/images/coffee.png": "ab52a69150c64690d234f3d180303e3b",
"assets/assets/images/app_icon.ico": "bf485737a5371b3468dd5d7d69cfaa35",
"assets/assets/images/dinner.png": "cc10f9e9e38b0aeda40152e7c0ee355a",
"assets/assets/images/fingrom.svg": "7e17903d3a6d6fb5bb5f533eebe6428b",
"assets/assets/images/coin.png": "3f7219c1c4f87de5bacb3902aa3169a8",
"assets/assets/images/logo.png": "a24d3e5a52e8fe25914740a809e07b92",
"assets/assets/images/sub_tiny.png": "9ac6c3fad91eecfb28b92f25d218e3fb",
"assets/assets/images/presentation_en.png": "2b6f6c7366864f0ba56decde147d7cd4",
"assets/assets/l10n/upgrade_ar.md": "a9908098312019f8b3099754c1500e63",
"assets/assets/l10n/help_metrics_bill_az.md": "f9e2b7ed087ba9f65f8c4c9024832d56",
"assets/assets/l10n/help_metrics_budget_nl.md": "795c872f4b630f4aa90da3d00e591aab",
"assets/assets/l10n/help_metrics_budget_zh_TW.md": "56e948d2feef24340cf698f29c266c82",
"assets/assets/l10n/privacy_policy_fa.md": "f5fa35ba5dddad09cb9cb192f7614d70",
"assets/assets/l10n/privacy_policy_be.md": "cf59b8f4044a4bab58a61a33b1d0af6a",
"assets/assets/l10n/help_metrics_budget_uz.md": "2388661a4272008de1bac1fe600f9ce2",
"assets/assets/l10n/help_metrics_bill_uk.md": "ac99f633f400523f6cafb86f211990d1",
"assets/assets/l10n/help_metrics_budget_ro.md": "72e7560891a7512069677528c95770a0",
"assets/assets/l10n/help_metrics_account_uk.md": "adc054830cc3b6afe3c0d56bf8c73f95",
"assets/assets/l10n/about_ro.md": "972af59a8572fea436c909c3d05d82db",
"assets/assets/l10n/upgrade_nl.md": "ec1fe659e5494796445f32e534a4368d",
"assets/assets/l10n/help_metrics_account_be_EU.md": "975b9c9917edb33c60f2ab69069775e8",
"assets/assets/l10n/help_metrics_bill_de.md": "b328f32da0f61f12251c3717a087e6ca",
"assets/assets/l10n/help_metrics_account_pl.md": "acb4e201e998a2fa9b5d32b4b699c9d3",
"assets/assets/l10n/help_metrics_budget_zh.md": "b81dac75624bca0e6ee3b8439045d79c",
"assets/assets/l10n/help_metrics_account_zh_TW.md": "6052893bb87012ce53338378a722ab63",
"assets/assets/l10n/help_metrics_budget_it.md": "1105e607765f3f990d13fa80931bc61c",
"assets/assets/l10n/about_account_pl.md": "5158067393970947c8423989c9d750e7",
"assets/assets/l10n/upgrade_be_EU.md": "cc20162dd119856d16191749f61265f6",
"assets/assets/l10n/help_metrics_budget_fa.md": "ffd50c0d06e1698be3a5e6ab2f222683",
"assets/assets/l10n/help_metrics_account_es.md": "59a5f7e5bf624e53b77ba627152db6bc",
"assets/assets/l10n/help_metrics_bill_en.md": "79768b0eec4598edf4a894445058649e",
"assets/assets/l10n/terms_of_use_en.md": "152651b607d4a5d495ba6b45b5baa828",
"assets/assets/l10n/terms_of_use_pt.md": "a4c2f5a49973b0118bf9039cd1c61cc9",
"assets/assets/l10n/about_budget_pt.md": "aea8783894fbe0fe7c2f404dd1648380",
"assets/assets/l10n/privacy_policy_de.md": "53fea5afd588051aa50c55b7efb55992",
"assets/assets/l10n/help_metrics_account_ro.md": "66809a09f248228c1b0cc595f1a5e2ff",
"assets/assets/l10n/upgrade_it.md": "16ee8e2f3c6f4e529c4e8b9480af1be8",
"assets/assets/l10n/upgrade_zh_TW.md": "ea381d01bf2903fc916bfba0c64a5c8c",
"assets/assets/l10n/about_budget_nl.md": "917498bc34f49cb26fa84a9aa0af2996",
"assets/assets/l10n/about_az.md": "0fa8429d902a23676907d0a98d852111",
"assets/assets/l10n/privacy_policy_tr.md": "e0137552ccf4e4af6e15bcf03ecbf0d5",
"assets/assets/l10n/terms_of_use_pt_BR.md": "6b17b504e6d6baaac73b2e06b3e161c8",
"assets/assets/l10n/terms_of_use_zh_TW.md": "6378122813b8e8ce9812067651c64098",
"assets/assets/l10n/terms_of_use_ko.md": "532c3ff3d4240122e368089ed4306ee4",
"assets/assets/l10n/about_tr.md": "6c9589783a2536a5c5da2006f4cd5f1f",
"assets/assets/l10n/privacy_policy_pt_BR.md": "02c8a6aeb61bed0137a462507ada62a7",
"assets/assets/l10n/help_metrics_account_nl.md": "130209d4e9a9dd105175cde9258e476f",
"assets/assets/l10n/about_budget_es.md": "7f5a9b8ce079b1d8d2017406d2b761d8",
"assets/assets/l10n/help_metrics_budget_az.md": "71dd74331c3d34ac11b500d1ffca2a9e",
"assets/assets/l10n/about_account_fa.md": "433b6a50dbcd481b8e87057ba804678f",
"assets/assets/l10n/terms_of_use_es.md": "09e05d95eb4d3cc3e05dbb41f91158fc",
"assets/assets/l10n/upgrade_cs.md": "dc61eb51ed1eb1a752f702d36b8bfb2a",
"assets/assets/l10n/about_account_es.md": "158a1b8f233b6f73e63bf3f050a2154b",
"assets/assets/l10n/about_budget_pt_BR.md": "5d022ac6a5db22ff473f3532e131de5f",
"assets/assets/l10n/about_budget_de.md": "31e2b7246dc8f4b6f38d77763e474c28",
"assets/assets/l10n/about_budget_uk.md": "9bf89100288dee3a5941392f73d2dbf1",
"assets/assets/l10n/about_budget_be_EU.md": "e77d1405d7f269b9fe8e0cf5c26b77b3",
"assets/assets/l10n/about_pt_BR.md": "294a9edd93037b968bfff7f474f44b0f",
"assets/assets/l10n/about_account_ro.md": "7bf0244e951ad008a4343d4293a1d666",
"assets/assets/l10n/help_metrics_bill_fr.md": "d8482c28211c58b55647aa34b932ec85",
"assets/assets/l10n/about_account_pt.md": "7367725d0e846120f8ca908989d8681e",
"assets/assets/l10n/about_account_en.md": "6165c271d2663fe96cd147087d36f675",
"assets/assets/l10n/about_it.md": "67c2035da198a5b09103bd366cbf5ba5",
"assets/assets/l10n/terms_of_use_hi.md": "a7e33754480b7058071b5bae324f8725",
"assets/assets/l10n/privacy_policy_en.md": "1f7c0dd7e1a89806b900b84298f7e4ad",
"assets/assets/l10n/about_ar.md": "07363c18dbbfe09190341954dfcefbf8",
"assets/assets/l10n/help_metrics_account_ar.md": "69082cf2165b2e788514b0383e5c39c8",
"assets/assets/l10n/upgrade_pt.md": "d3af6702e71fbd79ee616d712f126682",
"assets/assets/l10n/upgrade_es.md": "cd02c15cd39b3eddb68ac750b9229146",
"assets/assets/l10n/about_account_fr.md": "aee36d6a1498cd5709b090b24ede3c25",
"assets/assets/l10n/help_metrics_account_fr.md": "90fee6a2a4def5dff75fd25cc01521f3",
"assets/assets/l10n/about_account_ko.md": "11cfc93d02b24584263af52c0183fbd2",
"assets/assets/l10n/upgrade_ko.md": "c42ff459d019e14d0dae3b86473351ee",
"assets/assets/l10n/upgrade_hi.md": "887f9dcbaecd2f8e2ee64edd874bc2b9",
"assets/assets/l10n/about_account_uz.md": "ad323c270db92f557b01443f1966073b",
"assets/assets/l10n/terms_of_use_tr.md": "7b0c594ed66ea24ac1354818e35a36da",
"assets/assets/l10n/privacy_policy_ko.md": "008a3097155a3303a67e4b221327487e",
"assets/assets/l10n/about_account_cs.md": "34c4ec2a3e16ae2eea20295cebd85d87",
"assets/assets/l10n/privacy_policy_uz.md": "5e4870aee6f0d82e598c79e1c6968584",
"assets/assets/l10n/about_account_be.md": "be81868c451ab4bc32fd1a0688566472",
"assets/assets/l10n/about_zh.md": "f3a534057e13f2e40b9c1de74190b5ff",
"assets/assets/l10n/upgrade_tr.md": "7c02ed53f813dde1ca7fe37283be5905",
"assets/assets/l10n/about_nl.md": "b245324388e268a8ce93f13ccdbb5b8f",
"assets/assets/l10n/help_metrics_bill_ja.md": "dda4e33f2b8100aa0e34049eb80fcc85",
"assets/assets/l10n/upgrade_zh.md": "2e46a33fe0648d7f31685f00ef3dea63",
"assets/assets/l10n/about_account_nl.md": "4b4f1b27a3ea61a5e493731c0eb9b1a3",
"assets/assets/l10n/help_metrics_bill_pt.md": "27a100de4d3cf8116040c18b5680e675",
"assets/assets/l10n/about_budget_ja.md": "c15a8c79298dedd59e62915ef682501c",
"assets/assets/l10n/terms_of_use_ar.md": "27189d0a6b8aa3dd52ff68d4bd501d56",
"assets/assets/l10n/help_metrics_account_be.md": "adfe1c7614a3e236eae8a55202215af4",
"assets/assets/l10n/help_metrics_budget_pt_BR.md": "cc6ab04b001e736e7af042b6c953dccf",
"assets/assets/l10n/help_metrics_bill_it.md": "679760dba150ebab5d572707a9579058",
"assets/assets/l10n/help_metrics_bill_uz.md": "466588aac581e49620bc44e865b4a8b4",
"assets/assets/l10n/terms_of_use_it.md": "44aad1a0b241f452422396ab90988a21",
"assets/assets/l10n/terms_of_use_az.md": "fa22cd5a770ca50543bea287f5acec0a",
"assets/assets/l10n/about_uz.md": "d063f32a49b560b276289542e0e9d2b4",
"assets/assets/l10n/help_metrics_account_ja.md": "9081ac9540821b27462ca4697f6c9378",
"assets/assets/l10n/help_metrics_bill_cs.md": "abf52ff93f8aa28fdd1d5eadcd992707",
"assets/assets/l10n/about_budget_cs.md": "431cf9aff2d1664116e55ceb53a5558f",
"assets/assets/l10n/privacy_policy_pl.md": "7a80c55ebe16d41bff83ced2af0d8239",
"assets/assets/l10n/help_metrics_account_it.md": "2ee26182b1bdace035c669b3209ad544",
"assets/assets/l10n/terms_of_use_zh.md": "dab1cd0698e65262387aafe96550b633",
"assets/assets/l10n/privacy_policy_zh.md": "581643b1e3abd2f48dc008a08f0dfebb",
"assets/assets/l10n/help_metrics_bill_be.md": "5e410ae927d87136d980a658ca8490b7",
"assets/assets/l10n/help_metrics_budget_es.md": "cd26c7603f3c1e7b16498715ed907f99",
"assets/assets/l10n/about_pt.md": "1172d8e923e45b01a375581015e30b63",
"assets/assets/l10n/upgrade_fa.md": "ace26ed9fe5a5753d24115aefd3eba1d",
"assets/assets/l10n/upgrade_pl.md": "1aac0f3d1b19266949a4f2b6ee9ab51d",
"assets/assets/l10n/privacy_policy_ja.md": "28a3650f42abfd78c102f865d2b421e3",
"assets/assets/l10n/about_budget_hi.md": "762bfc029beef2dbea465e5b23279695",
"assets/assets/l10n/help_metrics_budget_hi.md": "bdb65c59a3e7fe9786cde593292ec2f9",
"assets/assets/l10n/about_budget_tr.md": "e1df78e73c0b02c74a756e590f394829",
"assets/assets/l10n/about_es.md": "edea96b9ae867978e4fc502aedccadb6",
"assets/assets/l10n/about_uk.md": "6b9f2028afe1ababe274d60b2175cce2",
"assets/assets/l10n/help_metrics_bill_hi.md": "0d1483d7f4eece1e6965980fb5894ab4",
"assets/assets/l10n/about_budget_pl.md": "fff599dc209f10d70424831bbafeb68c",
"assets/assets/l10n/about_account_ar.md": "d2eef0ec20d08e86dcbed64a32d5cc6d",
"assets/assets/l10n/about_budget_en.md": "9f947a531220c274c92815cb91850558",
"assets/assets/l10n/about_account_it.md": "79325df06297a3b531896c3cfbc55ae0",
"assets/assets/l10n/help_metrics_bill_pl.md": "63c1597d1df63a52958c795cc4e016cf",
"assets/assets/l10n/about_account_hi.md": "3e63a492778970155dad27a8c2a7a8e6",
"assets/assets/l10n/about_account_zh_TW.md": "a5ed758d5ee3ba152d57c06a93f3b4b0",
"assets/assets/l10n/terms_of_use_ro.md": "706d8c238d13a2301b17c6a7084ebf2b",
"assets/assets/l10n/about_account_tr.md": "01d3dcf40a8308b489b6d0500c5f7549",
"assets/assets/l10n/help_metrics_bill_zh_TW.md": "079d386a1fa46a9c4459f524595a50b9",
"assets/assets/l10n/upgrade_fr.md": "c41f6b0da0b459781cd0a798f3bbeffa",
"assets/assets/l10n/about_budget_fr.md": "21d7192027bea9af6c1d3216e3417474",
"assets/assets/l10n/help_metrics_bill_fa.md": "95343484226d4ff32fff3a720109eedb",
"assets/assets/l10n/about_cs.md": "e15dab4d0b7711ff4687739d405ca641",
"assets/assets/l10n/help_metrics_bill_nl.md": "3ae297116f9368ec042eb4ed8cc3e88f",
"assets/assets/l10n/help_metrics_bill_zh.md": "51f346c55aa02779967f63b7db8e1c12",
"assets/assets/l10n/help_metrics_account_de.md": "1240363a21c5e9f75cfaa622a8a27c48",
"assets/assets/l10n/privacy_policy_ar.md": "9eac897ada88c855a8f742ee231577e1",
"assets/assets/l10n/help_metrics_account_en.md": "8aaef28b0a529ed28acb2a484e0ff990",
"assets/assets/l10n/terms_of_use_be.md": "4b563ae46b2e4320689194a7dace49e7",
"assets/assets/l10n/about_be_EU.md": "797dce8e33d80fe86bb56d46b40ae578",
"assets/assets/l10n/terms_of_use_fr.md": "16b2965749cd8ad92c9cecd5bc7269aa",
"assets/assets/l10n/help_metrics_budget_be_EU.md": "71623875773286d5b7d8dbf0d3b7bb93",
"assets/assets/l10n/help_metrics_account_zh.md": "06943d506e3756b9854239de29cb06f0",
"assets/assets/l10n/about_account_zh.md": "55861a83cac2e598816df8b225b1632b",
"assets/assets/l10n/about_account_uk.md": "069b5d3ad9ed0beebd4213373c9a7e41",
"assets/assets/l10n/help_metrics_account_fa.md": "99f585490654b928e969b4860647cf0f",
"assets/assets/l10n/help_metrics_budget_pl.md": "186e5e5c76833b33aa484b1ef540d6af",
"assets/assets/l10n/help_metrics_account_pt.md": "8814fbb29a6a3114ca59a98ab6234b88",
"assets/assets/l10n/privacy_policy_it.md": "5417e581cd18e8ee6b998555548c31c5",
"assets/assets/l10n/terms_of_use_be_EU.md": "583591049d2799182df0fc3146fc3134",
"assets/assets/l10n/help_metrics_account_hi.md": "292341eda9f6972ec5b79fd75564bb38",
"assets/assets/l10n/help_metrics_bill_ar.md": "07b3ef7521608191a7373eb9735e15d6",
"assets/assets/l10n/help_metrics_account_uz.md": "bcbcb88429eb0bf461bbf2d9da3d92f2",
"assets/assets/l10n/terms_of_use_uk.md": "1ecbaf1ade60cc9b7e42b283e29ccf63",
"assets/assets/l10n/help_metrics_bill_es.md": "3efdd92acb124337da6c47dae35ebe31",
"assets/assets/l10n/help_metrics_bill_be_EU.md": "58185be2eef8cb94d5fcaa39a31b9f23",
"assets/assets/l10n/terms_of_use_cs.md": "3388f9b79a748a178d6b329727997bf6",
"assets/assets/l10n/about_budget_it.md": "07d46976112395cce9ba2cb58e4966fb",
"assets/assets/l10n/help_metrics_budget_pt.md": "fe6864fc5b7082a8cc97c5fc71d15581",
"assets/assets/l10n/help_metrics_budget_ko.md": "d6134ff795cd87f1811781edd32476fb",
"assets/assets/l10n/help_metrics_budget_en.md": "12e244bc57f6a31e24242c0c0e1017a8",
"assets/assets/l10n/privacy_policy_uk.md": "ae87093994c68ded6281a7d941d28693",
"assets/assets/l10n/about_budget_ko.md": "89d2945e22367bab23f6809100834987",
"assets/assets/l10n/privacy_policy_zh_TW.md": "cefb09d2ae679071403fa34ba6fee400",
"assets/assets/l10n/about_budget_zh_TW.md": "dffdc4dd32137b9ec4198950c2775eba",
"assets/assets/l10n/about_en.md": "6ad466b83983f652d36c682937da29b6",
"assets/assets/l10n/help_metrics_bill_ko.md": "dd19c0ad349f378c3434b195999b999c",
"assets/assets/l10n/privacy_policy_nl.md": "8ca26ba4b7b1f72f63196f792b4e237f",
"assets/assets/l10n/privacy_policy_cs.md": "77ba4878f91bdec9e15e97f5f6b9f233",
"assets/assets/l10n/help_metrics_account_ko.md": "cda6633491fc079f9e3ad438e41521cc",
"assets/assets/l10n/terms_of_use_nl.md": "6453c99ba49d4d3f2f4cd7dbe8030dd2",
"assets/assets/l10n/about_budget_az.md": "205c18362b98672502b29472bbd0f20d",
"assets/assets/l10n/about_pl.md": "2c7f17d647af911a9e2a7d92259d5d3e",
"assets/assets/l10n/help_metrics_bill_pt_BR.md": "45dd5b5070f888c735c33c64b3f7041d",
"assets/assets/l10n/help_metrics_bill_ro.md": "75c2a936bef370dccdffccdd0c4cb6c4",
"assets/assets/l10n/terms_of_use_uz.md": "90b0061f8df716297a2c2e0aa3b74a3f",
"assets/assets/l10n/terms_of_use_ja.md": "04d1487c1a2573beea28f3f589edda2c",
"assets/assets/l10n/upgrade_be.md": "ccb639acd81999a4a50665e8d3fe30f8",
"assets/assets/l10n/upgrade_uz.md": "bc46b3e2fad2698e020718d5c1ffd148",
"assets/assets/l10n/help_metrics_account_tr.md": "58dad689c9d4f792ca84041de6dd1f1a",
"assets/assets/l10n/help_metrics_budget_ar.md": "317479bd846d989dc6464a2b1efa2f9b",
"assets/assets/l10n/terms_of_use_de.md": "437be661f43acbb7b4f7f9ca341082b0",
"assets/assets/l10n/help_metrics_account_pt_BR.md": "a55dc39748d19c5d3f3665b8b01bdb74",
"assets/assets/l10n/about_account_pt_BR.md": "2c1010052cecb062d7cf5a8d546e9bc3",
"assets/assets/l10n/help_metrics_budget_be.md": "163263b1859e2b2fa5677f99b8c64aa2",
"assets/assets/l10n/upgrade_ro.md": "2f2a5f6f92a390c148e637e4524c42c0",
"assets/assets/l10n/about_budget_zh.md": "99ba078f1182c153948f8122aad707e4",
"assets/assets/l10n/about_ja.md": "e44463bdd502a9b0d941ad3b51369794",
"assets/assets/l10n/privacy_policy_hi.md": "2de44bf847363322d1793f649c8765d6",
"assets/assets/l10n/about_ko.md": "539ec38b77c0175e5c38ab115fed01bd",
"assets/assets/l10n/upgrade_pt_BR.md": "56c7311e1402a5de52e36d71c6301718",
"assets/assets/l10n/privacy_policy_ro.md": "457de7dc379db4d86f1553541176babd",
"assets/assets/l10n/about_budget_ar.md": "de3abec89d1574dddbecb0690a2b1c6d",
"assets/assets/l10n/privacy_policy_es.md": "cccf66ec8ce086bc986d5ee82c95f449",
"assets/assets/l10n/about_account_az.md": "766b57337a1f5246d7fe9218ca842a38",
"assets/assets/l10n/help_metrics_budget_tr.md": "ac7f4c830284e9a9d2915436d2a3e228",
"assets/assets/l10n/terms_of_use_fa.md": "3675b0e6b3e54337aa5e2847d4a61352",
"assets/assets/l10n/upgrade_uk.md": "a47267916cf1cfe48546daf177e56231",
"assets/assets/l10n/terms_of_use_pl.md": "4f84363f90c0b7c9ab4164deac292116",
"assets/assets/l10n/help_metrics_budget_fr.md": "e006d1f73c9e29a615ee1ca79412408c",
"assets/assets/l10n/upgrade_ja.md": "74fa1c53f79bb9cd576ad4af59a107c6",
"assets/assets/l10n/upgrade_de.md": "1907334fba8a38599596ef87186f453b",
"assets/assets/l10n/help_metrics_account_az.md": "07c82261c03ebe59e2b0961cebc77f37",
"assets/assets/l10n/about_be.md": "a8dd7c7d698bb2ea1697be5c4769f515",
"assets/assets/l10n/upgrade_az.md": "f89cfe5718478624d35d9d352975c96f",
"assets/assets/l10n/about_budget_fa.md": "82afbee62e484f9110fe8602fdb84c37",
"assets/assets/l10n/upgrade_en.md": "e07bc3ebb885c80904178176a457fa86",
"assets/assets/l10n/privacy_policy_be_EU.md": "fba1de0b5675a96bac48c16c3efd5c55",
"assets/assets/l10n/about_fa.md": "b96a842d7424d517d8346e0cb371119f",
"assets/assets/l10n/about_zh_TW.md": "acaba2153953d50f93429f8c6c7b5ee2",
"assets/assets/l10n/about_fr.md": "7b7cca18588c5e57009ca4677e892a4f",
"assets/assets/l10n/privacy_policy_fr.md": "9c33ac77caaa234bd9c2d91213e1541f",
"assets/assets/l10n/help_metrics_budget_de.md": "09b423cd897eea264c7bcb0b5d0d6d21",
"assets/assets/l10n/help_metrics_account_cs.md": "7bfb87be8d44a26e4f3320bd36225607",
"assets/assets/l10n/help_metrics_bill_tr.md": "9738dcfd0cf496ae6d79681c35f5d30b",
"assets/assets/l10n/about_de.md": "4faf8cc6a7f817d99873e26919c18f5f",
"assets/assets/l10n/privacy_policy_az.md": "7c9dd063b0592b52b6a8138c26b4537d",
"assets/assets/l10n/about_budget_be.md": "88232942d3d57afecb46eae19d34084f",
"assets/assets/l10n/help_metrics_budget_uk.md": "fb6c8abd5885c2c60608ae8e818ff37d",
"assets/assets/l10n/about_budget_ro.md": "6c5068ca873767372ab3f9ea08d36c40",
"assets/assets/l10n/about_budget_uz.md": "03a863e56f98184e30588f5698a5b74e",
"assets/assets/l10n/about_hi.md": "dbb6517b59726ddfa1b3a90bc8514a1c",
"assets/assets/l10n/about_account_de.md": "d9dbfb27e727b22b7b7d5319a8b1c242",
"assets/assets/l10n/about_account_ja.md": "b00faf466a42f0eb88a9c5e9cbf183d7",
"assets/assets/l10n/about_account_be_EU.md": "0d32fafe86d9c516ba2ba8605f2f117e",
"assets/assets/l10n/help_metrics_budget_ja.md": "c41f66e267a4e80f75db745395451319",
"assets/assets/l10n/privacy_policy_pt.md": "8e352de0ee7563fda33f10124dc9aa04",
"assets/assets/l10n/help_metrics_budget_cs.md": "3f26fb5d8d0b759b4e153c637c833607",
"assets/NOTICES": "b70ba8a98ab892d5b0ae1130a0626b3a",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.json": "144b4f9b8cb712273da3e8c4d3f8b471",
"assets/AssetManifest.bin.json": "28cf83e4e5852cc996d516103e1c064e",
"index.html": "1cb09cf550e622736c65d89d5346a57a",
"/": "1cb09cf550e622736c65d89d5346a57a",
"manifest.json": "45a3f1e8a23817e9bf752339034f6320",
"canvaskit/canvaskit.js": "26eef3024dbc64886b7f48e1b6fb05cf",
"canvaskit/canvaskit.js.symbols": "efc2cd87d1ff6c586b7d4c7083063a40",
"canvaskit/chromium/canvaskit.js": "b7ba6d908089f706772b2007c37e6da4",
"canvaskit/chromium/canvaskit.js.symbols": "e115ddcfad5f5b98a90e389433606502",
"canvaskit/chromium/canvaskit.wasm": "ea5ab288728f7200f398f60089048b48",
"canvaskit/skwasm.js": "ac0f73826b925320a1e9b0d3fd7da61c",
"canvaskit/skwasm.js.symbols": "96263e00e3c9bd9cd878ead867c04f3c",
"canvaskit/canvaskit.wasm": "e7602c687313cfac5f495c5eac2fb324",
"canvaskit/skwasm.wasm": "828c26a0b1cc8eb1adacbdd0c5e8bcfa",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"icons/Icon-maskable-192.png": "7d1365a199f68916503a15ecc4c8f5a0",
"icons/Icon-192.png": "7d1365a199f68916503a15ecc4c8f5a0",
"icons/Icon-512.png": "d0a7ddaee9f1d4b7ed2a95ba8e5e50e6",
"icons/Icon-512_fz.png": "04dae777b7599834ee94fa0abbcb3291",
"icons/Icon-maskable-512.png": "7d1365a199f68916503a15ecc4c8f5a0",
"favicon.png": "6eb0f694702967bb15c471e8c8d3cb12",
"version.json": "b6acd1fcc3d7de19a5da92dff5876f18",
"flutter_bootstrap.js": "ed7571a4c0e039cbe7ac92e93b51357e"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
