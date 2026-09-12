import 'package:flutter_test/flutter_test.dart';
import 'package:smart_education_advisor/core/validators/app_validators.dart';
void main(){test('Arabic validation rejects malformed email',()=>expect(AppValidators.email('nope'),'أدخل بريدًا إلكترونيًا صحيحًا'));}
