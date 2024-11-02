import 'package:flutter_test/flutter_test.dart';
import 'package:movies/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('UnderDevViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
