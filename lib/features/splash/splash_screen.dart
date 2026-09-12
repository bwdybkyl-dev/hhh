import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../auth/auth_controller.dart';
import '../../data/models/app_enums.dart';
class SplashScreen extends ConsumerWidget { const SplashScreen({super.key}); @override Widget build(BuildContext context,WidgetRef ref){ref.listen(authStateProvider,(_,state){state.whenData((user){if(user==null){Navigator.pushReplacementNamed(context,'/login');}else{ref.read(profileProvider.future).then((profile){if(!context.mounted)return;Navigator.pushReplacementNamed(context,profile?.role==UserRole.admin?'/admin':profile?.role==UserRole.advisor?'/advisor':'/student');});}});});return const Scaffold(body:Center(child:Column(mainAxisSize:MainAxisSize.min,children:[Icon(Icons.auto_awesome_rounded,size:72),SizedBox(height:16),Text('المستشار التعليمي الذكي'),SizedBox(height:24),CircularProgressIndicator()])));}}
