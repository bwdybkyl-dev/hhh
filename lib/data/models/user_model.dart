import 'package:cloud_firestore/cloud_firestore.dart';
import 'app_enums.dart';
import 'model_utils.dart';
class UserModel {
  const UserModel({required this.id, required this.name, required this.email, required this.role, required this.status, this.photoUrl, this.phone, this.lastSeenAt, this.createdAt});
  final String id, name, email; final UserRole role; final AccountStatus status; final String? photoUrl, phone; final DateTime? lastSeenAt, createdAt;
  factory UserModel.fromFirestore(DocumentSnapshot<Map<String, Object?>> doc) => UserModel.fromMap(doc.id, doc.data() ?? {});
  factory UserModel.fromMap(String id, Map<String, Object?> map) => UserModel(id:id,name:map['name'] as String? ?? '',email:map['email'] as String? ?? '',role:UserRole.values.byName(map['role'] as String? ?? 'student'),status:AccountStatus.values.byName(map['status'] as String? ?? 'active'),photoUrl:map['photoUrl'] as String?,phone:map['phone'] as String?,lastSeenAt:dateFromValue(map['lastSeenAt']),createdAt:dateFromValue(map['createdAt']));
  Map<String,Object?> toFirestore() => {'name':name,'email':email,'role':role.value,'status':status.value,'photoUrl':photoUrl,'phone':phone,'lastSeenAt':timestampFromDate(lastSeenAt),'createdAt':timestampFromDate(createdAt)};
  UserModel copyWith({String? name, String? photoUrl, String? phone, AccountStatus? status}) => UserModel(id:id,name:name??this.name,email:email,role:role,status:status??this.status,photoUrl:photoUrl??this.photoUrl,phone:phone??this.phone,lastSeenAt:lastSeenAt,createdAt:createdAt);
}
