import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories/admin_repository.dart';
final _adminRepositoryProvider=Provider((ref)=>AdminRepository(FirebaseFirestore.instance));
final _metricsProvider=StreamProvider((ref)=>ref.watch(_adminRepositoryProvider).watchMetrics());
class AdminDashboardScreen extends ConsumerWidget { const AdminDashboardScreen({super.key}); @override Widget build(BuildContext context,WidgetRef ref)=>Scaffold(appBar:AppBar(title:const Text('لوحة الإدارة')),body:ref.watch(_metricsProvider).when(loading:()=>const Center(child:CircularProgressIndicator()),error:(_,__)=>const Center(child:Text('تعذر تحميل إحصاءات النظام')),data:(data){final entries={'الطلاب':data['students']??0,'المستشارون':data['advisors']??0,'التخصصات':data['majors']??0,'الاختبارات':data['assessments']??0,'الاستشارات':data['consultations']??0,'المواعيد':data['appointments']??0};return GridView.count(crossAxisCount:2,padding:const EdgeInsets.all(16),crossAxisSpacing:12,mainAxisSpacing:12,children:entries.entries.map((e)=>Card(child:Center(child:Column(mainAxisSize:MainAxisSize.min,children:[Text('${e.value}',style:Theme.of(context).textTheme.headlineMedium),Text(e.key)])))).toList());})); }
