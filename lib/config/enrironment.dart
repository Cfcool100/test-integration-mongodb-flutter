import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Env {
  static String get fileName {
    if (kReleaseMode) {
      return '.env.product';
    }
    return '.env.development';
  }

  static String get uri {
    return dotenv.env['URI'] ?? 'URI don\'t exist';
  }

  static String get collection {
    return dotenv.env['COLLECTION_NAME'] ?? 'COLLECTION_NAME don\'t exist';
  }
}
