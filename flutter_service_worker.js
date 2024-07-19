'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"icons/Icon-maskable-512.png": "7d1365a199f68916503a15ecc4c8f5a0",
"icons/Icon-maskable-192.png": "7d1365a199f68916503a15ecc4c8f5a0",
"icons/Icon-512.png": "d0a7ddaee9f1d4b7ed2a95ba8e5e50e6",
"icons/Icon-192.png": "7d1365a199f68916503a15ecc4c8f5a0",
"icons/Icon-512_fz.png": "04dae777b7599834ee94fa0abbcb3291",
"manifest.json": "45a3f1e8a23817e9bf752339034f6320",
"canvaskit/canvaskit.js": "738255d00768497e86aa4ca510cce1e1",
"canvaskit/canvaskit.js.symbols": "74a84c23f5ada42fe063514c587968c6",
"canvaskit/chromium/canvaskit.js": "901bb9e28fac643b7da75ecfd3339f3f",
"canvaskit/chromium/canvaskit.js.symbols": "ee7e331f7f5bbf5ec937737542112372",
"canvaskit/chromium/canvaskit.wasm": "399e2344480862e2dfa26f12fa5891d7",
"canvaskit/canvaskit.wasm": "9251bb81ae8464c4df3b072f84aa969b",
"canvaskit/skwasm.wasm": "4051bfc27ba29bf420d17aa0c3a98bce",
"canvaskit/skwasm.js.symbols": "c3c05bd50bdf59da8626bbe446ce65a3",
"canvaskit/skwasm.js": "5d4f9263ec93efeb022bb14a3881d240",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"flutter.js": "383e55f7f3cce5be08fcf1f3881f585c",
"flutter_bootstrap.js": "3e6c5a45f728145da4f53c0cabb1f140",
"version.json": "ee0f6dc4b66a95ae4684034db7316e12",
"favicon.png": "6eb0f694702967bb15c471e8c8d3cb12",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "b93248a553f9e8bc17f1065929d5934b",
"assets/NOTICES": "d3afa38a9093e97a2234c45189f849ce",
"assets/AssetManifest.bin": "e38cc119805d8413616a9e5e90ab366a",
"assets/FontManifest.json": "c330ec2cddeda2575a852ddaf6af789d",
"assets/AssetManifest.bin.json": "2d91f004a289882a0cefd7bf9b238838",
"assets/assets/fonts/RobotoCondensed-Regular.ttf": "bde79f6eb992e9138d91ba2194d1b56d",
"assets/assets/fonts/Abel-Regular.ttf": "bde79f6eb992e9138d91ba2194d1b56d",
"assets/assets/images/fingrom.svg": "7e17903d3a6d6fb5bb5f533eebe6428b",
"assets/assets/images/coin.png": "3f7219c1c4f87de5bacb3902aa3169a8",
"assets/assets/images/sub_tiny.png": "9ac6c3fad91eecfb28b92f25d218e3fb",
"assets/assets/images/logo.png": "a24d3e5a52e8fe25914740a809e07b92",
"assets/assets/images/app_icon.ico": "bf485737a5371b3468dd5d7d69cfaa35",
"assets/assets/images/coffee.png": "ab52a69150c64690d234f3d180303e3b",
"assets/assets/images/dinner.png": "cc10f9e9e38b0aeda40152e7c0ee355a",
"assets/assets/l10n/help_metrics_budget_it.md": "1105e607765f3f990d13fa80931bc61c",
"assets/assets/l10n/help_metrics_account_es.md": "59a5f7e5bf624e53b77ba627152db6bc",
"assets/assets/l10n/help_metrics_account_en.md": "8aaef28b0a529ed28acb2a484e0ff990",
"assets/assets/l10n/help_metrics_budget_pt.md": "fe6864fc5b7082a8cc97c5fc71d15581",
"assets/assets/l10n/help_metrics_budget_en.md": "12e244bc57f6a31e24242c0c0e1017a8",
"assets/assets/l10n/privacy_policy_es.md": "cccf66ec8ce086bc986d5ee82c95f449",
"assets/assets/l10n/help_metrics_account_ja.md": "9081ac9540821b27462ca4697f6c9378",
"assets/assets/l10n/privacy_policy_be.md": "cf59b8f4044a4bab58a61a33b1d0af6a",
"assets/assets/l10n/privacy_policy_pt.md": "8e352de0ee7563fda33f10124dc9aa04",
"assets/assets/l10n/terms_of_use_uz.md": "3bc0644693b8dd9c2091ed2bc11ae320",
"assets/assets/l10n/help_metrics_budget_az.md": "71dd74331c3d34ac11b500d1ffca2a9e",
"assets/assets/l10n/help_metrics_bill_pt_BR.md": "45dd5b5070f888c735c33c64b3f7041d",
"assets/assets/l10n/help_metrics_bill_en.md": "79768b0eec4598edf4a894445058649e",
"assets/assets/l10n/help_metrics_bill_az.md": "f9e2b7ed087ba9f65f8c4c9024832d56",
"assets/assets/l10n/privacy_policy_it.md": "5417e581cd18e8ee6b998555548c31c5",
"assets/assets/l10n/terms_of_use_fa.md": "5f8878cf1801b46cabfec35d9bdad9a6",
"assets/assets/l10n/help_metrics_account_pl.md": "acb4e201e998a2fa9b5d32b4b699c9d3",
"assets/assets/l10n/help_metrics_budget_de.md": "09b423cd897eea264c7bcb0b5d0d6d21",
"assets/assets/l10n/help_metrics_bill_hi.md": "0d1483d7f4eece1e6965980fb5894ab4",
"assets/assets/l10n/upgrade_zh.md": "45ec9060569d6b618582a4884ab7401b",
"assets/assets/l10n/help_metrics_account_zh.md": "06943d506e3756b9854239de29cb06f0",
"assets/assets/l10n/terms_of_use_de.md": "437be661f43acbb7b4f7f9ca341082b0",
"assets/assets/l10n/upgrade_pt_BR.md": "70ee289fd134a0e17cf7e2022a9311e3",
"assets/assets/l10n/upgrade_be_EU.md": "f91d7b26da39486ced2eb44491ec2c89",
"assets/assets/l10n/help_metrics_budget_zh.md": "b81dac75624bca0e6ee3b8439045d79c",
"assets/assets/l10n/privacy_policy_ja.md": "28a3650f42abfd78c102f865d2b421e3",
"assets/assets/l10n/help_metrics_account_ar.md": "69082cf2165b2e788514b0383e5c39c8",
"assets/assets/l10n/help_metrics_bill_be.md": "5e410ae927d87136d980a658ca8490b7",
"assets/assets/l10n/help_metrics_bill_uk.md": "ac99f633f400523f6cafb86f211990d1",
"assets/assets/l10n/help_metrics_account_pt.md": "8814fbb29a6a3114ca59a98ab6234b88",
"assets/assets/l10n/privacy_policy_hi.md": "2de44bf847363322d1793f649c8765d6",
"assets/assets/l10n/terms_of_use_tr.md": "03f5df5f5c55b6df7c951f6773fd9816",
"assets/assets/l10n/privacy_policy_az.md": "7c9dd063b0592b52b6a8138c26b4537d",
"assets/assets/l10n/privacy_policy_de.md": "53fea5afd588051aa50c55b7efb55992",
"assets/assets/l10n/help_metrics_budget_ar.md": "317479bd846d989dc6464a2b1efa2f9b",
"assets/assets/l10n/privacy_policy_pl.md": "7a80c55ebe16d41bff83ced2af0d8239",
"assets/assets/l10n/terms_of_use_uk.md": "1ecbaf1ade60cc9b7e42b283e29ccf63",
"assets/assets/l10n/terms_of_use_pl.md": "4f84363f90c0b7c9ab4164deac292116",
"assets/assets/l10n/help_metrics_budget_uk.md": "fb6c8abd5885c2c60608ae8e818ff37d",
"assets/assets/l10n/help_metrics_budget_fr.md": "e006d1f73c9e29a615ee1ca79412408c",
"assets/assets/l10n/terms_of_use_pt_BR.md": "6b17b504e6d6baaac73b2e06b3e161c8",
"assets/assets/l10n/upgrade_pl.md": "6c06eedff43781f3f1a7a4b2b8564778",
"assets/assets/l10n/upgrade_it.md": "594036114dbd8dc63cb9e219a9c2d430",
"assets/assets/l10n/terms_of_use_en.md": "62d0ba13966492ada8bb6207c489a4af",
"assets/assets/l10n/help_metrics_budget_be_EU.md": "71623875773286d5b7d8dbf0d3b7bb93",
"assets/assets/l10n/help_metrics_bill_fr.md": "d8482c28211c58b55647aa34b932ec85",
"assets/assets/l10n/terms_of_use_zh.md": "33c9b3cdfa4474f21f7baf069a172b4b",
"assets/assets/l10n/help_metrics_account_fa.md": "99f585490654b928e969b4860647cf0f",
"assets/assets/l10n/upgrade_az.md": "1a157469438d2ed1079ace99c4767328",
"assets/assets/l10n/help_metrics_account_be_EU.md": "975b9c9917edb33c60f2ab69069775e8",
"assets/assets/l10n/help_metrics_account_az.md": "07c82261c03ebe59e2b0961cebc77f37",
"assets/assets/l10n/help_metrics_account_hi.md": "292341eda9f6972ec5b79fd75564bb38",
"assets/assets/l10n/help_metrics_account_tr.md": "58dad689c9d4f792ca84041de6dd1f1a",
"assets/assets/l10n/help_metrics_bill_zh.md": "51f346c55aa02779967f63b7db8e1c12",
"assets/assets/l10n/terms_of_use_hi.md": "45745cba3d31768cda759b55ae6cb011",
"assets/assets/l10n/help_metrics_bill_es.md": "3efdd92acb124337da6c47dae35ebe31",
"assets/assets/l10n/privacy_policy_fr.md": "9c33ac77caaa234bd9c2d91213e1541f",
"assets/assets/l10n/help_metrics_bill_ja.md": "dda4e33f2b8100aa0e34049eb80fcc85",
"assets/assets/l10n/help_metrics_bill_pl.md": "63c1597d1df63a52958c795cc4e016cf",
"assets/assets/l10n/upgrade_es.md": "f6b03fb206c0939120d26105bfa405f3",
"assets/assets/l10n/upgrade_pt.md": "986a6c2d0ba61773808b7f1fe6d39415",
"assets/assets/l10n/help_metrics_bill_pt.md": "27a100de4d3cf8116040c18b5680e675",
"assets/assets/l10n/help_metrics_budget_es.md": "cd26c7603f3c1e7b16498715ed907f99",
"assets/assets/l10n/help_metrics_budget_pl.md": "186e5e5c76833b33aa484b1ef540d6af",
"assets/assets/l10n/terms_of_use_it.md": "5d0883596e4926ebff74b6761232d117",
"assets/assets/l10n/terms_of_use_es.md": "1eaafebc3b46da4e56c06467cc3c5fca",
"assets/assets/l10n/upgrade_ja.md": "2efe4b54df54fe0997141ba18f9162ee",
"assets/assets/l10n/help_metrics_budget_ja.md": "c41f66e267a4e80f75db745395451319",
"assets/assets/l10n/upgrade_ar.md": "572e7e8c762612d77171e312f9fa88b4",
"assets/assets/l10n/privacy_policy_pt_BR.md": "02c8a6aeb61bed0137a462507ada62a7",
"assets/assets/l10n/privacy_policy_en.md": "1f7c0dd7e1a89806b900b84298f7e4ad",
"assets/assets/l10n/upgrade_de.md": "1682eca7138185a244ab9a768661361c",
"assets/assets/l10n/help_metrics_bill_uz.md": "466588aac581e49620bc44e865b4a8b4",
"assets/assets/l10n/privacy_policy_uk.md": "ae87093994c68ded6281a7d941d28693",
"assets/assets/l10n/upgrade_uz.md": "a60d80c167afa24e32e74533e9910ded",
"assets/assets/l10n/upgrade_uk.md": "2bf4f4cf7fa10879a18f1964ec84c288",
"assets/assets/l10n/privacy_policy_fa.md": "f5fa35ba5dddad09cb9cb192f7614d70",
"assets/assets/l10n/help_metrics_account_pt_BR.md": "a55dc39748d19c5d3f3665b8b01bdb74",
"assets/assets/l10n/help_metrics_account_fr.md": "90fee6a2a4def5dff75fd25cc01521f3",
"assets/assets/l10n/privacy_policy_tr.md": "e0137552ccf4e4af6e15bcf03ecbf0d5",
"assets/assets/l10n/upgrade_en.md": "7c456595f6d11dac2aef98e99a99836e",
"assets/assets/l10n/help_metrics_account_uk.md": "adc054830cc3b6afe3c0d56bf8c73f95",
"assets/assets/l10n/terms_of_use_be_EU.md": "d1c2f93f6b0e6ec35a967c8c08b15c40",
"assets/assets/l10n/help_metrics_bill_de.md": "b328f32da0f61f12251c3717a087e6ca",
"assets/assets/l10n/terms_of_use_pt.md": "a4c2f5a49973b0118bf9039cd1c61cc9",
"assets/assets/l10n/help_metrics_budget_tr.md": "ac7f4c830284e9a9d2915436d2a3e228",
"assets/assets/l10n/help_metrics_bill_fa.md": "95343484226d4ff32fff3a720109eedb",
"assets/assets/l10n/terms_of_use_be.md": "c20a1b9abb08758a386e30a11f7ff35d",
"assets/assets/l10n/help_metrics_account_be.md": "adfe1c7614a3e236eae8a55202215af4",
"assets/assets/l10n/help_metrics_budget_be.md": "163263b1859e2b2fa5677f99b8c64aa2",
"assets/assets/l10n/terms_of_use_az.md": "d2ca9c71c55fc6c560934a794568fab7",
"assets/assets/l10n/privacy_policy_uz.md": "5e4870aee6f0d82e598c79e1c6968584",
"assets/assets/l10n/help_metrics_budget_hi.md": "bdb65c59a3e7fe9786cde593292ec2f9",
"assets/assets/l10n/help_metrics_account_de.md": "1240363a21c5e9f75cfaa622a8a27c48",
"assets/assets/l10n/help_metrics_account_it.md": "2ee26182b1bdace035c669b3209ad544",
"assets/assets/l10n/privacy_policy_ar.md": "9eac897ada88c855a8f742ee231577e1",
"assets/assets/l10n/upgrade_tr.md": "4a5f54e66fee0ac739ec2cf077102abb",
"assets/assets/l10n/upgrade_fa.md": "95d6b87b18e88c1a13e2553a165adb66",
"assets/assets/l10n/help_metrics_bill_be_EU.md": "58185be2eef8cb94d5fcaa39a31b9f23",
"assets/assets/l10n/upgrade_hi.md": "af90a5a06827b55035ab682a7a669149",
"assets/assets/l10n/terms_of_use_ar.md": "d3cad7f2f4e45bd52f83a1db9ad88007",
"assets/assets/l10n/upgrade_fr.md": "bb562be22e805704b7327501583c57c2",
"assets/assets/l10n/privacy_policy_be_EU.md": "fba1de0b5675a96bac48c16c3efd5c55",
"assets/assets/l10n/help_metrics_bill_ar.md": "07b3ef7521608191a7373eb9735e15d6",
"assets/assets/l10n/terms_of_use_ja.md": "cbd296d6530afe8f63d213b7d2063a4b",
"assets/assets/l10n/help_metrics_bill_tr.md": "9738dcfd0cf496ae6d79681c35f5d30b",
"assets/assets/l10n/privacy_policy_zh.md": "581643b1e3abd2f48dc008a08f0dfebb",
"assets/assets/l10n/upgrade_be.md": "5a1a24742add74de9147933a4bff191b",
"assets/assets/l10n/help_metrics_budget_fa.md": "ffd50c0d06e1698be3a5e6ab2f222683",
"assets/assets/l10n/help_metrics_budget_uz.md": "2388661a4272008de1bac1fe600f9ce2",
"assets/assets/l10n/help_metrics_account_uz.md": "bcbcb88429eb0bf461bbf2d9da3d92f2",
"assets/assets/l10n/help_metrics_budget_pt_BR.md": "cc6ab04b001e736e7af042b6c953dccf",
"assets/assets/l10n/help_metrics_bill_it.md": "679760dba150ebab5d572707a9579058",
"assets/assets/l10n/terms_of_use_fr.md": "16b2965749cd8ad92c9cecd5bc7269aa",
"assets/fonts/MaterialIcons-Regular.otf": "e7069dfd19b331be16bed984668fe080",
"assets/AssetManifest.json": "997723aa73187d4ef05f78bfc607708a",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"index.html": "b32af1a981b251cfcad7f15a55fcb7fc",
"/": "b32af1a981b251cfcad7f15a55fcb7fc",
"main.dart.js": "723eec21a94253fe7565aaf3f551d603"};
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
