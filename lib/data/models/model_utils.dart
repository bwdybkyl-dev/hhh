import 'package:cloud_firestore/cloud_firestore.dart';

DateTime? dateFromValue(Object? value) => value is Timestamp ? value.toDate() : value is DateTime ? value : null;
Timestamp? timestampFromDate(DateTime? value) => value == null ? null : Timestamp.fromDate(value);
List<String> stringsFrom(Object? value) => List<String>.from(value as List? ?? const []);
Map<String, num> numbersFrom(Object? value) => Map<String, num>.from(value as Map? ?? const {});
