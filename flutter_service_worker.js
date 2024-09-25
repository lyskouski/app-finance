'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.json": "3ec1740114d2b3b178aa4dfd6faeee3e",
"assets/assets/images/app_icon.ico": "bf485737a5371b3468dd5d7d69cfaa35",
"assets/assets/images/coin.png": "3f7219c1c4f87de5bacb3902aa3169a8",
"assets/assets/images/logo.png": "a24d3e5a52e8fe25914740a809e07b92",
"assets/assets/images/dinner.png": "cc10f9e9e38b0aeda40152e7c0ee355a",
"assets/assets/images/sub_tiny.png": "9ac6c3fad91eecfb28b92f25d218e3fb",
"assets/assets/images/coffee.png": "ab52a69150c64690d234f3d180303e3b",
"assets/assets/images/presentation_en.png": "ef66e3cb960ada14fcfabf716be1f4f7",
"assets/assets/images/presentation_de.png": "5e3268e12b8be28f67df46f0de3661d7",
"assets/assets/images/fingrom.svg": "7e17903d3a6d6fb5bb5f533eebe6428b",
"assets/assets/l10n/upgrade_de.md": "13e619057009c08f4983ce07819d18dd",
"assets/assets/l10n/upgrade_pl.md": "5a2b2f3f1f19822a620b20f90867e103",
"assets/assets/l10n/help_metrics_account_ja.md": "9081ac9540821b27462ca4697f6c9378",
"assets/assets/l10n/about_budget_uz.md": "03a863e56f98184e30588f5698a5b74e",
"assets/assets/l10n/about_account_zh.md": "55861a83cac2e598816df8b225b1632b",
"assets/assets/l10n/help_metrics_account_uz.md": "bcbcb88429eb0bf461bbf2d9da3d92f2",
"assets/assets/l10n/upgrade_zh_TW.md": "c848e7fa58f23ba297651487f9b8b609",
"assets/assets/l10n/help_metrics_bill_uz.md": "466588aac581e49620bc44e865b4a8b4",
"assets/assets/l10n/help_metrics_account_de.md": "1240363a21c5e9f75cfaa622a8a27c48",
"assets/assets/l10n/privacy_policy_ja.md": "28a3650f42abfd78c102f865d2b421e3",
"assets/assets/l10n/help_metrics_budget_pt.md": "fe6864fc5b7082a8cc97c5fc71d15581",
"assets/assets/l10n/help_metrics_budget_en.md": "12e244bc57f6a31e24242c0c0e1017a8",
"assets/assets/l10n/help_metrics_bill_en.md": "79768b0eec4598edf4a894445058649e",
"assets/assets/l10n/help_metrics_budget_zh.md": "b81dac75624bca0e6ee3b8439045d79c",
"assets/assets/l10n/privacy_policy_de.md": "53fea5afd588051aa50c55b7efb55992",
"assets/assets/l10n/about_budget_uk.md": "9bf89100288dee3a5941392f73d2dbf1",
"assets/assets/l10n/help_metrics_budget_zh_TW.md": "56e948d2feef24340cf698f29c266c82",
"assets/assets/l10n/upgrade_ar.md": "e3369fa507cc3493bbb3a0d8c744f50e",
"assets/assets/l10n/about_budget_fa.md": "82afbee62e484f9110fe8602fdb84c37",
"assets/assets/l10n/privacy_policy_be_EU.md": "fba1de0b5675a96bac48c16c3efd5c55",
"assets/assets/l10n/help_metrics_bill_ja.md": "dda4e33f2b8100aa0e34049eb80fcc85",
"assets/assets/l10n/help_metrics_account_it.md": "2ee26182b1bdace035c669b3209ad544",
"assets/assets/l10n/upgrade_tr.md": "8ef03fa9cd3524b09a20eb19f3bd1512",
"assets/assets/l10n/about_budget_tr.md": "e1df78e73c0b02c74a756e590f394829",
"assets/assets/l10n/privacy_policy_tr.md": "e0137552ccf4e4af6e15bcf03ecbf0d5",
"assets/assets/l10n/privacy_policy_pt.md": "8e352de0ee7563fda33f10124dc9aa04",
"assets/assets/l10n/help_metrics_budget_be_EU.md": "71623875773286d5b7d8dbf0d3b7bb93",
"assets/assets/l10n/about_az.md": "d2a4be42f830bdc0f101475f5ef351a4",
"assets/assets/l10n/terms_of_use_de.md": "437be661f43acbb7b4f7f9ca341082b0",
"assets/assets/l10n/terms_of_use_it.md": "44aad1a0b241f452422396ab90988a21",
"assets/assets/l10n/about_account_it.md": "79325df06297a3b531896c3cfbc55ae0",
"assets/assets/l10n/help_metrics_bill_zh.md": "51f346c55aa02779967f63b7db8e1c12",
"assets/assets/l10n/upgrade_en.md": "24e40b33f08c903dcc447ca9258401f9",
"assets/assets/l10n/terms_of_use_ja.md": "04d1487c1a2573beea28f3f589edda2c",
"assets/assets/l10n/about_uk.md": "c89ecbfaa93000ec738e514ec1d44bb9",
"assets/assets/l10n/about_budget_pl.md": "fff599dc209f10d70424831bbafeb68c",
"assets/assets/l10n/help_metrics_account_hi.md": "292341eda9f6972ec5b79fd75564bb38",
"assets/assets/l10n/help_metrics_budget_uz.md": "2388661a4272008de1bac1fe600f9ce2",
"assets/assets/l10n/about_de.md": "a4a576b3870d94e83df01057af8cc77a",
"assets/assets/l10n/about_account_fa.md": "433b6a50dbcd481b8e87057ba804678f",
"assets/assets/l10n/about_budget_be.md": "88232942d3d57afecb46eae19d34084f",
"assets/assets/l10n/about_hi.md": "6c805f6f24d8b94d86bea08e401bf81e",
"assets/assets/l10n/help_metrics_account_fr.md": "90fee6a2a4def5dff75fd25cc01521f3",
"assets/assets/l10n/terms_of_use_ar.md": "27189d0a6b8aa3dd52ff68d4bd501d56",
"assets/assets/l10n/help_metrics_bill_es.md": "3efdd92acb124337da6c47dae35ebe31",
"assets/assets/l10n/upgrade_hi.md": "ddec27748427dfe4164b3feb4d431370",
"assets/assets/l10n/terms_of_use_uk.md": "1ecbaf1ade60cc9b7e42b283e29ccf63",
"assets/assets/l10n/help_metrics_account_pl.md": "acb4e201e998a2fa9b5d32b4b699c9d3",
"assets/assets/l10n/about_budget_es.md": "7f5a9b8ce079b1d8d2017406d2b761d8",
"assets/assets/l10n/help_metrics_account_pt.md": "8814fbb29a6a3114ca59a98ab6234b88",
"assets/assets/l10n/terms_of_use_es.md": "09e05d95eb4d3cc3e05dbb41f91158fc",
"assets/assets/l10n/help_metrics_account_zh.md": "06943d506e3756b9854239de29cb06f0",
"assets/assets/l10n/about_account_hi.md": "3e63a492778970155dad27a8c2a7a8e6",
"assets/assets/l10n/about_pl.md": "e3562376775f018214aedfd0257e1487",
"assets/assets/l10n/help_metrics_bill_fr.md": "d8482c28211c58b55647aa34b932ec85",
"assets/assets/l10n/about_ja.md": "ea3125ebcf312d2f1d913d7c89e1ccb2",
"assets/assets/l10n/help_metrics_bill_pl.md": "63c1597d1df63a52958c795cc4e016cf",
"assets/assets/l10n/privacy_policy_pt_BR.md": "02c8a6aeb61bed0137a462507ada62a7",
"assets/assets/l10n/about_budget_hi.md": "762bfc029beef2dbea465e5b23279695",
"assets/assets/l10n/upgrade_ja.md": "d2798c2bd56ef7d199beb61c27fdd9a5",
"assets/assets/l10n/help_metrics_bill_pt_BR.md": "45dd5b5070f888c735c33c64b3f7041d",
"assets/assets/l10n/terms_of_use_pl.md": "4f84363f90c0b7c9ab4164deac292116",
"assets/assets/l10n/about_ar.md": "bf95f45c21a6b67afb5fbaabdb0e8234",
"assets/assets/l10n/terms_of_use_tr.md": "7b0c594ed66ea24ac1354818e35a36da",
"assets/assets/l10n/terms_of_use_hi.md": "a7e33754480b7058071b5bae324f8725",
"assets/assets/l10n/about_account_be.md": "be81868c451ab4bc32fd1a0688566472",
"assets/assets/l10n/help_metrics_budget_es.md": "cd26c7603f3c1e7b16498715ed907f99",
"assets/assets/l10n/help_metrics_budget_pt_BR.md": "cc6ab04b001e736e7af042b6c953dccf",
"assets/assets/l10n/help_metrics_bill_az.md": "f9e2b7ed087ba9f65f8c4c9024832d56",
"assets/assets/l10n/help_metrics_budget_az.md": "71dd74331c3d34ac11b500d1ffca2a9e",
"assets/assets/l10n/help_metrics_bill_pt.md": "27a100de4d3cf8116040c18b5680e675",
"assets/assets/l10n/help_metrics_bill_uk.md": "ac99f633f400523f6cafb86f211990d1",
"assets/assets/l10n/about_account_pt_BR.md": "2c1010052cecb062d7cf5a8d546e9bc3",
"assets/assets/l10n/terms_of_use_pt_BR.md": "6b17b504e6d6baaac73b2e06b3e161c8",
"assets/assets/l10n/terms_of_use_zh_TW.md": "6378122813b8e8ce9812067651c64098",
"assets/assets/l10n/upgrade_be.md": "fea86bcc292176191165d7b70cd7574a",
"assets/assets/l10n/about_budget_zh_TW.md": "dffdc4dd32137b9ec4198950c2775eba",
"assets/assets/l10n/help_metrics_budget_ar.md": "317479bd846d989dc6464a2b1efa2f9b",
"assets/assets/l10n/terms_of_use_az.md": "fa22cd5a770ca50543bea287f5acec0a",
"assets/assets/l10n/about_account_zh_TW.md": "a5ed758d5ee3ba152d57c06a93f3b4b0",
"assets/assets/l10n/help_metrics_budget_tr.md": "ac7f4c830284e9a9d2915436d2a3e228",
"assets/assets/l10n/about_account_ar.md": "d2eef0ec20d08e86dcbed64a32d5cc6d",
"assets/assets/l10n/help_metrics_bill_de.md": "b328f32da0f61f12251c3717a087e6ca",
"assets/assets/l10n/privacy_policy_it.md": "5417e581cd18e8ee6b998555548c31c5",
"assets/assets/l10n/about_account_uz.md": "ad323c270db92f557b01443f1966073b",
"assets/assets/l10n/help_metrics_budget_de.md": "09b423cd897eea264c7bcb0b5d0d6d21",
"assets/assets/l10n/terms_of_use_be.md": "4b563ae46b2e4320689194a7dace49e7",
"assets/assets/l10n/about_budget_en.md": "91f3b00d667569afb2fb8daa197619be",
"assets/assets/l10n/about_be.md": "559ff2b15822c41affd29c99baa3b9d5",
"assets/assets/l10n/terms_of_use_en.md": "152651b607d4a5d495ba6b45b5baa828",
"assets/assets/l10n/about_budget_pt.md": "aea8783894fbe0fe7c2f404dd1648380",
"assets/assets/l10n/upgrade_zh.md": "c34fe64f080ec2c14a8cbe45667f9159",
"assets/assets/l10n/help_metrics_bill_be.md": "5e410ae927d87136d980a658ca8490b7",
"assets/assets/l10n/privacy_policy_en.md": "1f7c0dd7e1a89806b900b84298f7e4ad",
"assets/assets/l10n/about_budget_pt_BR.md": "5d022ac6a5db22ff473f3532e131de5f",
"assets/assets/l10n/help_metrics_account_tr.md": "58dad689c9d4f792ca84041de6dd1f1a",
"assets/assets/l10n/help_metrics_account_be_EU.md": "975b9c9917edb33c60f2ab69069775e8",
"assets/assets/l10n/about_account_pl.md": "5158067393970947c8423989c9d750e7",
"assets/assets/l10n/about_account_be_EU.md": "0d32fafe86d9c516ba2ba8605f2f117e",
"assets/assets/l10n/about_account_fr.md": "aee36d6a1498cd5709b090b24ede3c25",
"assets/assets/l10n/privacy_policy_az.md": "7c9dd063b0592b52b6a8138c26b4537d",
"assets/assets/l10n/about_budget_ar.md": "de3abec89d1574dddbecb0690a2b1c6d",
"assets/assets/l10n/help_metrics_budget_it.md": "1105e607765f3f990d13fa80931bc61c",
"assets/assets/l10n/about_en.md": "1be14c20ff3533cd8289a9a3b62caae5",
"assets/assets/l10n/about_budget_it.md": "07d46976112395cce9ba2cb58e4966fb",
"assets/assets/l10n/help_metrics_budget_uk.md": "fb6c8abd5885c2c60608ae8e818ff37d",
"assets/assets/l10n/help_metrics_account_az.md": "07c82261c03ebe59e2b0961cebc77f37",
"assets/assets/l10n/help_metrics_budget_fr.md": "e006d1f73c9e29a615ee1ca79412408c",
"assets/assets/l10n/about_budget_az.md": "205c18362b98672502b29472bbd0f20d",
"assets/assets/l10n/about_account_ja.md": "b00faf466a42f0eb88a9c5e9cbf183d7",
"assets/assets/l10n/privacy_policy_fr.md": "9c33ac77caaa234bd9c2d91213e1541f",
"assets/assets/l10n/upgrade_be_EU.md": "bd332ad937d255e6fe5f216eafdfb383",
"assets/assets/l10n/help_metrics_account_ar.md": "69082cf2165b2e788514b0383e5c39c8",
"assets/assets/l10n/upgrade_fr.md": "2b1a2cbcc4599c92f786639239d160b4",
"assets/assets/l10n/help_metrics_budget_hi.md": "bdb65c59a3e7fe9786cde593292ec2f9",
"assets/assets/l10n/about_account_pt.md": "7367725d0e846120f8ca908989d8681e",
"assets/assets/l10n/upgrade_it.md": "a8b77e891473d47138584895651c1e44",
"assets/assets/l10n/upgrade_fa.md": "3ed951bfad26b1e84d4e40de5b6da39f",
"assets/assets/l10n/upgrade_pt_BR.md": "2173fb5e6d54e65cccd9fd77982b6e3a",
"assets/assets/l10n/about_tr.md": "0b3cf6f81aed64af0cb23f5ffb5b0977",
"assets/assets/l10n/about_budget_fr.md": "21d7192027bea9af6c1d3216e3417474",
"assets/assets/l10n/terms_of_use_uz.md": "90b0061f8df716297a2c2e0aa3b74a3f",
"assets/assets/l10n/about_zh.md": "d32bb2059064a9b377e8d792504c376d",
"assets/assets/l10n/about_account_tr.md": "01d3dcf40a8308b489b6d0500c5f7549",
"assets/assets/l10n/about_pt_BR.md": "3e57e91e85451ce04cab7823bd5dfc1f",
"assets/assets/l10n/help_metrics_account_pt_BR.md": "a55dc39748d19c5d3f3665b8b01bdb74",
"assets/assets/l10n/about_account_es.md": "158a1b8f233b6f73e63bf3f050a2154b",
"assets/assets/l10n/privacy_policy_zh.md": "581643b1e3abd2f48dc008a08f0dfebb",
"assets/assets/l10n/terms_of_use_fa.md": "3675b0e6b3e54337aa5e2847d4a61352",
"assets/assets/l10n/privacy_policy_uk.md": "ae87093994c68ded6281a7d941d28693",
"assets/assets/l10n/privacy_policy_be.md": "cf59b8f4044a4bab58a61a33b1d0af6a",
"assets/assets/l10n/about_budget_be_EU.md": "e77d1405d7f269b9fe8e0cf5c26b77b3",
"assets/assets/l10n/upgrade_es.md": "eb8d825d823d4c6f84a60dfd9c894a84",
"assets/assets/l10n/about_account_de.md": "d9dbfb27e727b22b7b7d5319a8b1c242",
"assets/assets/l10n/privacy_policy_zh_TW.md": "cefb09d2ae679071403fa34ba6fee400",
"assets/assets/l10n/about_budget_de.md": "31e2b7246dc8f4b6f38d77763e474c28",
"assets/assets/l10n/terms_of_use_fr.md": "16b2965749cd8ad92c9cecd5bc7269aa",
"assets/assets/l10n/about_be_EU.md": "8570d0481ae77b1f3ade8d86d20a7f5f",
"assets/assets/l10n/about_pt.md": "c1c04c980edb13eb2377056f2a8e50a3",
"assets/assets/l10n/upgrade_uz.md": "4b29fd5bd33811da2ae50d0a7e5a6fad",
"assets/assets/l10n/terms_of_use_pt.md": "a4c2f5a49973b0118bf9039cd1c61cc9",
"assets/assets/l10n/about_zh_TW.md": "12ce11495dff5944c19eccd8edb98e4e",
"assets/assets/l10n/help_metrics_account_fa.md": "99f585490654b928e969b4860647cf0f",
"assets/assets/l10n/about_fa.md": "9f915f530daf21590c765200f5a3fc77",
"assets/assets/l10n/about_es.md": "31d314f7dd44c780c4d27ba091f348ec",
"assets/assets/l10n/about_uz.md": "cbabb70167b50aeef2009e56ce0bac11",
"assets/assets/l10n/help_metrics_account_zh_TW.md": "6052893bb87012ce53338378a722ab63",
"assets/assets/l10n/about_budget_ja.md": "c15a8c79298dedd59e62915ef682501c",
"assets/assets/l10n/help_metrics_budget_ja.md": "c41f66e267a4e80f75db745395451319",
"assets/assets/l10n/help_metrics_bill_zh_TW.md": "079d386a1fa46a9c4459f524595a50b9",
"assets/assets/l10n/terms_of_use_be_EU.md": "583591049d2799182df0fc3146fc3134",
"assets/assets/l10n/help_metrics_account_en.md": "8aaef28b0a529ed28acb2a484e0ff990",
"assets/assets/l10n/privacy_policy_uz.md": "5e4870aee6f0d82e598c79e1c6968584",
"assets/assets/l10n/about_account_en.md": "6165c271d2663fe96cd147087d36f675",
"assets/assets/l10n/about_budget_zh.md": "99ba078f1182c153948f8122aad707e4",
"assets/assets/l10n/help_metrics_account_es.md": "59a5f7e5bf624e53b77ba627152db6bc",
"assets/assets/l10n/about_it.md": "f585ac56e367b379e1ccd62a4938887d",
"assets/assets/l10n/help_metrics_bill_hi.md": "0d1483d7f4eece1e6965980fb5894ab4",
"assets/assets/l10n/terms_of_use_zh.md": "dab1cd0698e65262387aafe96550b633",
"assets/assets/l10n/privacy_policy_pl.md": "7a80c55ebe16d41bff83ced2af0d8239",
"assets/assets/l10n/help_metrics_budget_be.md": "163263b1859e2b2fa5677f99b8c64aa2",
"assets/assets/l10n/upgrade_pt.md": "7d3a875f7c46239dc24944ee8ae85c2f",
"assets/assets/l10n/upgrade_uk.md": "7d1472e1ef0c33cdaaab5c5dbeddd288",
"assets/assets/l10n/help_metrics_bill_tr.md": "9738dcfd0cf496ae6d79681c35f5d30b",
"assets/assets/l10n/privacy_policy_ar.md": "9eac897ada88c855a8f742ee231577e1",
"assets/assets/l10n/help_metrics_budget_fa.md": "ffd50c0d06e1698be3a5e6ab2f222683",
"assets/assets/l10n/help_metrics_bill_it.md": "679760dba150ebab5d572707a9579058",
"assets/assets/l10n/upgrade_az.md": "1f16c2ca0675ba565e52b9c89fe0278c",
"assets/assets/l10n/help_metrics_account_be.md": "adfe1c7614a3e236eae8a55202215af4",
"assets/assets/l10n/privacy_policy_fa.md": "f5fa35ba5dddad09cb9cb192f7614d70",
"assets/assets/l10n/about_account_uk.md": "069b5d3ad9ed0beebd4213373c9a7e41",
"assets/assets/l10n/help_metrics_bill_ar.md": "07b3ef7521608191a7373eb9735e15d6",
"assets/assets/l10n/about_fr.md": "73cabde6fa5950a9dc9d852e7d3011ec",
"assets/assets/l10n/help_metrics_budget_pl.md": "186e5e5c76833b33aa484b1ef540d6af",
"assets/assets/l10n/help_metrics_bill_be_EU.md": "58185be2eef8cb94d5fcaa39a31b9f23",
"assets/assets/l10n/privacy_policy_es.md": "cccf66ec8ce086bc986d5ee82c95f449",
"assets/assets/l10n/privacy_policy_hi.md": "2de44bf847363322d1793f649c8765d6",
"assets/assets/l10n/help_metrics_bill_fa.md": "95343484226d4ff32fff3a720109eedb",
"assets/assets/l10n/help_metrics_account_uk.md": "adc054830cc3b6afe3c0d56bf8c73f95",
"assets/assets/l10n/about_account_az.md": "766b57337a1f5246d7fe9218ca842a38",
"assets/assets/fonts/Abel-Regular.ttf": "bde79f6eb992e9138d91ba2194d1b56d",
"assets/assets/fonts/RobotoCondensed-Regular.ttf": "bde79f6eb992e9138d91ba2194d1b56d",
"assets/AssetManifest.bin.json": "0bb87519e56d229fe36690ea7d1f7367",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "f61755d83cabd97acc69d96dc3395eb3",
"assets/FontManifest.json": "c330ec2cddeda2575a852ddaf6af789d",
"assets/NOTICES": "b1d88e8beb16bfeb28b1737c1235b3cb",
"assets/fonts/MaterialIcons-Regular.otf": "e7069dfd19b331be16bed984668fe080",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "b93248a553f9e8bc17f1065929d5934b",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"canvaskit/canvaskit.js": "66177750aff65a66cb07bb44b8c6422b",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/skwasm.js": "694fda5704053957c2594de355805228",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/chromium/canvaskit.js": "671c6b4f8fcc199dcc551c7bb125f239",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"main.dart.js": "b6bfd4a7b1df89b4633f22c01dc4006a",
"icons/Icon-512.png": "d0a7ddaee9f1d4b7ed2a95ba8e5e50e6",
"icons/Icon-192.png": "7d1365a199f68916503a15ecc4c8f5a0",
"icons/Icon-512_fz.png": "04dae777b7599834ee94fa0abbcb3291",
"icons/Icon-maskable-512.png": "7d1365a199f68916503a15ecc4c8f5a0",
"icons/Icon-maskable-192.png": "7d1365a199f68916503a15ecc4c8f5a0",
"flutter_bootstrap.js": "a944f64ca418e436dd745e9377de6954",
"favicon.png": "6eb0f694702967bb15c471e8c8d3cb12",
"flutter.js": "f393d3c16b631f36852323de8e583132",
"index.html": "1cb09cf550e622736c65d89d5346a57a",
"/": "1cb09cf550e622736c65d89d5346a57a",
"version.json": "2493797bcd6d7687f7ea7e89313d2b0a",
"manifest.json": "45a3f1e8a23817e9bf752339034f6320"};
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
