import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/assessment_model.dart';
import '../models/major_model.dart';
class CatalogRepository { CatalogRepository(this._db); final FirebaseFirestore _db; Stream<List<MajorModel>> majors()=>_db.collection('majors').orderBy('name').snapshots().map((s)=>s.docs.map(MajorModel.fromFirestore).toList()); Stream<List<AssessmentModel>> assessments()=>_db.collection('assessments').where('isPublished',isEqualTo:true).snapshots().map((s)=>s.docs.map(AssessmentModel.fromFirestore).toList()); Future<void> saveMajor(MajorModel major)=>_db.collection('majors').doc(major.id).set(major.toFirestore()); Future<void> deleteMajor(String id)=>_db.collection('majors').doc(id).delete(); }
