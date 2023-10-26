import 'package:flutter_dotenv/flutter_dotenv.dart';

class Env {
  static String get filenName {
    return '.env';
  }

  static String get uri {
    return dotenv.env['URI'] ?? 'URI don\'t exist';
  }

  static String get collectionName {
    return dotenv.env['COLLECTION_NAME'] ?? 'COLLECTION_NAME don\'t exist';
  }
}
