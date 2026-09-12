import 'package:flutter_test/flutter_test.dart';
import 'package:smart_education_advisor/data/models/major_model.dart';
import 'package:smart_education_advisor/data/models/student_model.dart';
import 'package:smart_education_advisor/services/recommendation/recommendation_service.dart';
void main(){test('ranks majors by profile alignment',(){const student=StudentModel(userId:'s',gpa:4,skillIds:['dart'],interestIds:['tech']);const matched=MajorModel(id:'1',name:'هندسة البرمجيات',categoryId:'c',minimumGpa:3,skillIds:['dart'],interestIds:['tech']);const other=MajorModel(id:'2',name:'إدارة الأعمال',categoryId:'c',skillIds:['sales']);final rankings=RecommendationService().rank(student,[other,matched]);expect(rankings.first.major.id,'1');expect(rankings.first.percentage,greaterThan(80));});}
