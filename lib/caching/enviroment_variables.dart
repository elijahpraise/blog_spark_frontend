import 'package:flutter_dotenv/flutter_dotenv.dart';

class BlogSparkVariables {
  String? _cloudinarySecretKey = dotenv.env["cloudinary_secret_key"];
  String? _cloudinaryAPIKey = dotenv.env["cloudinary_api_key"];
  String? _uploadPreset = dotenv.env["upload_preset"];
  String? _uploadFolder = dotenv.env["folder"];

  String? get cloudinarySecretKey => _cloudinarySecretKey;
  String? get cloudinaryAPIKey => _cloudinaryAPIKey;
  String? get uploadPreset => _uploadPreset;
  String? get uploadFolder => _uploadFolder;
}
