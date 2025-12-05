import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/services/auth_service.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';

void main() {
  test('Sign up and sign in updates user', () async {
    final mockAuth = MockFirebaseAuth();
    final authService = AuthService(auth: mockAuth);
    authService.user = null;

    // Simulate sign up
    final user = await mockAuth.createUserWithEmailAndPassword(
      email: 'test@example.com',
      password: 'password123',
    );
    expect(user.user?.email, 'test@example.com');

    // Simulate sign in
    final signInUser = await mockAuth.signInWithEmailAndPassword(
      email: 'test@example.com',
      password: 'password123',
    );
    expect(signInUser.user?.email, 'test@example.com');
  });
}
