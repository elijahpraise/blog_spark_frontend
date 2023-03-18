import 'package:cloudinary_sdk/cloudinary_sdk.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class BlogSparkVariables {
  String? _cloudinarySecretKey = dotenv.env["cloudinary_secret_key"];
  String? _cloudinaryAPIKey = dotenv.env["cloudinary_api_key"];
  String? _uploadPreset = dotenv.env["upload_preset"];
  String? _uploadFolder = dotenv.env["folder"];
  String? _cloudName = dotenv.env["cloud_name"];

  String? get uploadFolder => _uploadFolder;
  String? get uploadPreset => _uploadPreset;
  Cloudinary get cloudinary => Cloudinary.full(
      apiKey: _cloudinaryAPIKey!,
      apiSecret: _cloudinarySecretKey!,
      cloudName: _cloudName!);
}
