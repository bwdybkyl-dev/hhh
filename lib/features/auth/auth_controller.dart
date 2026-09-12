import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/app_enums.dart';
import '../../data/repositories/auth_repository.dart';

final authRepositoryProvider = Provider<AuthRepository>(
  (ref) => AuthRepository(FirebaseAuth.instance, FirebaseFirestore.instance),
);
final authStateProvider = StreamProvider<User?>(
  (ref) => ref.watch(authRepositoryProvider).authChanges,
);
final profileProvider = FutureProvider(
  (ref) => ref.watch(authRepositoryProvider).currentProfile(),
);

class AuthController extends StateNotifier<AsyncValue<void>> {
  AuthController(this._repository) : super(const AsyncData(null));
  final AuthRepository _repository;
  Future<void> signIn(String email, String password) => _run(() => _repository.signIn(email, password));
  Future<void> register({required String name, required String email, required String password, required UserRole role}) => _run(() => _repository.register(name: name, email: email, password: password, role: role));
  Future<void> _run(Future<void> Function() action) async { state = const AsyncLoading(); state = await AsyncValue.guard(action); }
}
final authControllerProvider = StateNotifierProvider<AuthController, AsyncValue<void>>((ref) => AuthController(ref.watch(authRepositoryProvider)));
