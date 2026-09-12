import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
class StorageService { StorageService(this._storage); final FirebaseStorage _storage; Future<String> upload({required String path,required Uint8List bytes,required String contentType}) async { final ref=_storage.ref(path); await ref.putData(bytes,SettableMetadata(contentType:contentType)); return ref.getDownloadURL(); } }
