import 'package:cloud_firestore/cloud_firestore.dart';
class AdminRepository { AdminRepository(this._db); final FirebaseFirestore _db; Stream<Map<String,Object?>> watchMetrics()=>_db.collection('system_metrics').doc('current').snapshots().map((doc)=>doc.data()??const {}); }
