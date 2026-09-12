import 'package:go_router/go_router.dart';
import '../../features/admin/admin_dashboard_screen.dart';
import '../../features/advisor/advisor_shell.dart';
import '../../features/auth/forgot_password_screen.dart';
import '../../features/auth/login_screen.dart';
import '../../features/auth/register_screen.dart';
import '../../features/splash/splash_screen.dart';
import '../../features/student/student_shell.dart';
final appRouter=GoRouter(initialLocation:'/',routes:[GoRoute(path:'/',builder:(context,state)=>const SplashScreen()),GoRoute(path:'/login',builder:(context,state)=>const LoginScreen()),GoRoute(path:'/register',builder:(context,state)=>const RegisterScreen()),GoRoute(path:'/forgot-password',builder:(context,state)=>const ForgotPasswordScreen()),GoRoute(path:'/student',builder:(context,state)=>const StudentShell()),GoRoute(path:'/advisor',builder:(context,state)=>const AdvisorShell()),GoRoute(path:'/admin',builder:(context,state)=>const AdminDashboardScreen())]);
