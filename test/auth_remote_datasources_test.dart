import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_sunmate/src/core/constants/variables.dart';
import 'package:flutter_sunmate/src/data/models/response/auth/auth_response_model.dart';
import 'package:flutter_sunmate/src/data/sources/auth/auth_local_datasources.dart';
import 'package:flutter_sunmate/src/data/sources/auth/auth_remote_datasources.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'auth_remote_datasources_test.mocks.dart';


@GenerateMocks([
  http.Client,
  AuthLocalDatasources
], customMocks: [
  MockSpec<http.Client>(as: #MockHttpClient),
])
void main() {
  late AuthRemoteDatasources remoteDatasources;
  late MockHttpClient mockClient;
  late MockAuthLocalDatasources mockLocalDatasources;

  setUp(() {
    mockClient = MockHttpClient();
    mockLocalDatasources = MockAuthLocalDatasources();
    remoteDatasources = AuthRemoteDatasources(
      client: mockClient,
      authLocalDatasources: mockLocalDatasources,
    );
  });

  group('AuthRemoteDatasources', () {
    group('login', () {
      test('returns AuthResponseModel on successful login', () async {
        final url = Uri.parse('${Variables.apiUrl}/login');
        const email = 'user@gmail.com';
        const password = 'user@gmail.com';
        final responseBody = jsonEncode({'token': 'sample_token'});

        when(mockClient.post(url, body: anyNamed('body')))
            .thenAnswer((_) async => http.Response(responseBody, 200));

        final result = await remoteDatasources.login(email, password);

        expect(result, isA<Right>());
        expect(
          result.getOrElse(() => throw Exception()),
          isA<AuthResponseModel>(),
        );
      });

      test('returns error message on failed login', () async {
        final url = Uri.parse('${Variables.apiUrl}/login');
        const email = 'test@example.com';
        const password = 'wrong_password';

        when(mockClient.post(url, body: anyNamed('body')))
            .thenAnswer((_) async => http.Response('Unauthorized', 401));

        final result = await remoteDatasources.login(email, password);

        expect(result, isA<Left>());
        expect(result.fold((l) => l, (r) => r), 'Failed to login');
      });
    });

    group('register', () {
      test('returns true on successful registration', () async {
        final url = Uri.parse('${Variables.apiUrl}/register');
        const name = 'Test User';
        const phoneNumber = '5234367892740'; // unique
        const email = 'test123@example.com'; // unique
        const password = 'password123';
        const passwordConfirmation = 'password123';

        when(mockClient.post(url, body: anyNamed('body')))
            .thenAnswer((_) async => http.Response('Success', 200));

        final result = await remoteDatasources.register(
            name, phoneNumber, email, password, passwordConfirmation);

        expect(result, isA<Right>());
        expect(result.getOrElse(() => false), true);
      });

      test('returns validation errors on failed registration', () async {
        final url = Uri.parse('${Variables.apiUrl}/register');
        const name = 'Test User';
        const phoneNumber = '1234576890';
        const email = '';
        const password = 'password';
        const passwordConfirmation = 'password';
        final errorResponse = jsonEncode({
          'errors': {
            'email': ['The email field is required.'],
            'phone_number': [
              'The phone number field must be between 11 and 15 digits.'
            ]
          }
        });

        when(mockClient.post(url, body: anyNamed('body')))
            .thenAnswer((_) async => http.Response(errorResponse, 422));

        final result = await remoteDatasources.register(
            name, phoneNumber, email, password, passwordConfirmation);

        expect(result, isA<Left>());
        expect(
          result.fold((l) => l, (r) => r),
          'The email field is required.\nThe phone number field must be between 11 and 15 digits.',
        );
      });
    });

    group('logout', () {
      test('returns true on successful logout', () async {
        final url = Uri.parse('${Variables.apiUrl}/logout');
        const token = '35|2eLdDxaLK4xTEZ14OYwYHcrgFgeIZVLfLs8w1i4je78f206b';

        when(mockClient.post(url, body: anyNamed('body')))
            .thenAnswer((_) async => http.Response('Success', 200));

        final result = await remoteDatasources.logout(token);

        expect(result, isA<Right>());
        expect(result.getOrElse(() => false), true);
      });

      test('returns error message on failed logout with 401 Unauthorized',
          () async {
        final url = Uri.parse('${Variables.apiUrl}/logout');
        const token = 'invalid_token';

        when(mockClient.post(url, body: anyNamed('body')))
            .thenAnswer((_) async => http.Response('Unauthorized', 401));

        final result = await remoteDatasources.logout(token);

        expect(result, isA<Left>());
        expect(result.fold((l) => l, (r) => r), 'Failed to logout');
      });

      test(
          'returns error message on server failure (500 Internal Server Error)',
          () async {
        final url = Uri.parse('${Variables.apiUrl}/logout');
        const token = '31|8cHoENBZEEpXnjIw7pQqspHAXwu1CgssPu9M6dIedb0a03a';

        when(mockClient.post(url, body: anyNamed('body'))).thenAnswer(
            (_) async => http.Response('Internal Server Error', 500));

        final result = await remoteDatasources.logout(token);

        expect(result, isA<Left>());
        expect(result.fold((l) => l, (r) => r), 'Failed to logout');
      });

      test('returns error message on unexpected response', () async {
        final url = Uri.parse('${Variables.apiUrl}/logout');
        const token = '31|8cHoENBZEEpXnjIw7pQqspHAXwu1CgssPu9M6dIedb0a03a';

        when(mockClient.post(url, body: anyNamed('body')))
            .thenAnswer((_) async => http.Response('Unexpected Error', 418));

        final result = await remoteDatasources.logout(token);

        expect(result, isA<Left>());
        expect(result.fold((l) => l, (r) => r), 'Failed to logout');
      });
    });
  });
}
