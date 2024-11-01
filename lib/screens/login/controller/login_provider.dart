import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// final usernameProvider = StateProvider<String>((ref) => '');
// final passwordProvider = StateProvider<String>((ref) => '');
// final isPasswordVisibleProvider = StateProvider<bool>((ref) => false);
// final authRepositoryProvider = Provider<AuthRepository>(
//         (ref) => AuthRepository());
//
// final loginResultProvider = StateProvider<LoginResult?>((
//     ref,
//     ) =>
// null);
//
// final loginButtonProvider = Provider.family<VoidCallback?, BuildContext>((ref, context) {
//   final username = ref.watch(usernameProvider);
//   final password = ref.watch(passwordProvider);
//
//   if (username.isEmpty || password.isEmpty) {
//     return null; // Disable button if fields are empty
//   }
//
//   return () async {
//
//     final user = User(username, password);
//     final authRepository = ref.read(authRepositoryProvider);
//     final result = await authRepository.login(user,context);
//     ref.read(loginResultProvider.notifier).state = result;
//   };
// });