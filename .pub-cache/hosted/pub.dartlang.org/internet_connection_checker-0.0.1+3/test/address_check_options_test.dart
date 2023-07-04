import 'dart:io';

import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:test/test.dart';

void main() {
  test(
    'should verify toString() method',
    () {
      // Setup - Arrange
      final InternetAddress tInternetAddress = InternetAddress('1.1.1.1');
      const int DEFAULT_PORT = 43;
      const Duration DEFAULT_TIMEOUT = Duration(seconds: 10);
      final AddressCheckOptions tOptions = AddressCheckOptions(
        tInternetAddress,
        port: DEFAULT_PORT,
      );
      // Action - Act

      // Result - Assert
      expect(tOptions.toString(),
          'AddressCheckOptions($tInternetAddress, $DEFAULT_PORT, $DEFAULT_TIMEOUT)');
    },
  );
}
