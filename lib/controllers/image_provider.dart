// import 'dart:developer';
// import 'dart:io';
// import 'dart:ui';

// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/foundation.dart';
// import 'package:image_cropper/image_cropper.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:jobhub/constants/app_constants.dart';
// import 'package:uuid/uuid.dart';

// class ImageUploader extends ChangeNotifier {
//   var uuid = Uuid();
//   final ImagePicker _picker = ImagePicker();
//   String? imageUrl;
//   String? imagePath;
//   List<String> imageFile = [];
//   void pickImage() async {
//     XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);

//     if (pickedFile != null) {
//       XFile? croppedFile = await cropImage(pickedFile);
//       if (croppedFile != null) {
//         imageFile.clear(); // If only one image allowed, clear the list
//         imageFile.add(croppedFile.path); // ✅ add path to list
//         imagePath = croppedFile.path; // ✅ save single image path

//         String? url = await imageUploader(croppedFile);
//         if (url != null) {
//           imageUrl = url; // ✅ Set the uploaded URL
//           log("Image uploaded: $url");
//           notifyListeners();
//         }
//       }
//     }
//   }

//   Future<XFile?> cropImage(XFile imageFile) async {
//     CroppedFile? croppedFile = await ImageCropper.platform.cropImage(
//       sourcePath: imageFile.path,
//       maxHeight: 800,
//       maxWidth: 70,
//       compressQuality: 70,
//       aspectRatio: CropAspectRatio(ratioX: 5, ratioY: 4),
//       uiSettings: [
//         AndroidUiSettings(
//           toolbarTitle: "JobHub Cropper",
//           toolbarColor: Color(kLight.value),
//           toolbarWidgetColor: Color(kLight.value),
//           initAspectRatio: CropAspectRatioPreset.ratio5x4,
//           lockAspectRatio: true,
//         ),
//         IOSUiSettings(title: "Jobhub Cropper"),
//       ],
//     );
//     if (croppedFile != null) {
//       notifyListeners();
//       return XFile(croppedFile.path);
//     } else {
//       return null;
//     }
//   }

//   Future<String?> imageUploader(XFile upload) async {
//     try {
//       log("Uploading Image....");
//       File image = File(upload.path);
//       final ref = FirebaseStorage.instance
//           .ref()
//           .child("jobhub")
//           .child("${uuid.v1()}.jpg");
//       await ref.putFile(image);
//       imageUrl = await ref.getDownloadURL();
//       log("$imageUrl");
//       return imageUrl;
//     } catch (err) {
//       log("$err");
//       return null;
//     }
//   }
// }
