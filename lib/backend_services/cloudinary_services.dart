import 'package:cloudinary_sdk/cloudinary_sdk.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class CloudinaryServices {
  String? _cloudinarySecretKey = dotenv.env["cloudinary_secret_key"];
  String? _cloudinaryAPIKey = dotenv.env["cloudinary_api_key"];
  String? _uploadPreset = dotenv.env["upload_preset"];
  String? _uploadFolder = dotenv.env["folder"];
  String? _cloudName = dotenv.env["cloud_name"];

  // static BlogSparkConfig _config = BlogSparkConfig();

  String? get uploadFolder => _uploadFolder;
  String? get uploadPreset => _uploadPreset;
  Cloudinary get cloudinary => Cloudinary.full(
      apiKey: _cloudinaryAPIKey!,
      apiSecret: _cloudinarySecretKey!,
      cloudName: _cloudName!);

  Future<CloudinaryResponse> deleteResource(
      {required String publicId, required String imageUrl}) async {
    CloudinaryResponse response = await cloudinary.deleteResource(
      resourceType: CloudinaryResourceType.image,
      publicId: publicId,
      url: imageUrl,
    );
    return response;
  }

  Future<CloudinaryResponse> uploadResource(
      {required String imagePath, required String fileName}) async {
    try {
      CloudinaryResponse response =
          await cloudinary.uploadResource(CloudinaryUploadResource(
        filePath: imagePath,
        fileName: fileName,
        resourceType: CloudinaryResourceType.image,
        uploadPreset: uploadPreset,
        folder: uploadFolder,
      ));
      return response;
    } catch (e) {
      print("eeeeee $e");
      return CloudinaryResponse(statusCode: 500);
    }
  }
}
