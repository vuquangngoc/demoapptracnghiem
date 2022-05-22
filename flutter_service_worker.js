'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "main.dart.js": "a3ee7cc2ac7e52fd71d74795dd465253",
"canvaskit/canvaskit.wasm": "4b83d89d9fecbea8ca46f2f760c5a9ba",
"canvaskit/profiling/canvaskit.wasm": "95e736ab31147d1b2c7b25f11d4c32cd",
"canvaskit/profiling/canvaskit.js": "ae2949af4efc61d28a4a80fffa1db900",
"canvaskit/canvaskit.js": "c2b4e5f3d7a3d82aed024e7249a78487",
"flutter.js": "0816e65a103ba8ba51b174eeeeb2cb67",
"index.html": "879947c8b660617cb4103975df5be5dc",
"/": "879947c8b660617cb4103975df5be5dc",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"version.json": "e16b4fda28878611d94019b5fc213327",
"assets/images/success.png": "0763de5f7c0ea95f6acf489bf9fed18b",
"assets/images/success.gif": "995614f496e92806bd9c51b77bded7b4",
"assets/images/good.png": "09a36760442f89cdbc80abf7940f9f93",
"assets/images/sinhhoc.png": "9225109b263559bc9c1baec5cf8beaad",
"assets/images/bad.png": "6e731fc9c28ffda5a35bc2861f27436d",
"assets/images/vatly.png": "03fc06853e7999a0d0eab1438aeeb2b4",
"assets/images/hoahoc.png": "ebb8ad86645197c01e60b68e099f0bc5",
"assets/images/bad.gif": "89f5d4b15030f9588790f24dac6bc896",
"assets/images/good1.gif": "50765fd68f71d3b1f25a9bce93f0ea3c",
"assets/images/good.gif": "ceea3af50563831c437aa35cd0a6f8b0",
"assets/images/tienganh.png": "d8f7c208bff7bbe8b5f288c8c988109e",
"assets/images/toan.png": "17177f4e5cd58340146f4f0a5dd901b9",
"assets/AssetManifest.json": "5d4979027a81570dc540dd8987aff58e",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "115e937bb829a890521f72d2e664b632",
"assets/assets/vatly.json": "1f5019d24bd04903c404d1df1ae27011",
"assets/assets/letsgo.mp3": "5faa176431ead65444e4e22d68c5cf18",
"assets/assets/sinhhoc.json": "679e1351e73d5fcdcc9bcbe64bde87b9",
"assets/assets/hoahoc.json": "93dc0517c6ae7587d72b945560bfb0d3",
"assets/assets/logo.png": "393b3d174b785dfcb344609c8ffb2602",
"assets/assets/nen.png": "3610be657e30b0f52b2f1bcd7cbb38b4",
"assets/assets/2222.gif": "6cd539cc9acae9f806bca2532663dfd2",
"assets/assets/toanhoc.json": "ab0935d8c7f8276dffd3a361a65fc2a5",
"assets/assets/tienganh.json": "ee639e7f5097122a3d2ffdd16e8aa6ad",
"assets/assets/try-again.mp3": "c7e1688e9713d8c81b7c211d2dac1965",
"assets/NOTICES": "4bfb888bb9c0c4272b2bf1e859c832fa",
"assets/FontManifest.json": "2517a4c95395f6f96cdafa1014fbb6ce",
"assets/fonts/Satisfy.ttf": "4b6d03ce5461faeda7d8e785d1a2351a",
"assets/fonts/Quando.ttf": "379c31b5db00641e87bdadb9cfbb9ad3",
"assets/fonts/MaterialIcons-Regular.otf": "95db9098c58fd6db106f1116bae85a0b",
"assets/fonts/Alike-Regular.ttf": "46e9398fe7763bb8b9a7d2944c7529a5",
"manifest.json": "479e441745e1da3f756aeefc16c69026",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
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
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
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
