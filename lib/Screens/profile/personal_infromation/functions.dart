import 'dart:developer';
import 'dart:io';

import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kalliyath_villa/Screens/profile/functions.dart';
import 'package:kalliyath_villa/Screens/splash_login/bloc/splash_login_bloc.dart';
import 'package:kalliyath_villa/Screens/splash_login/login_signup/login/functions.dart';
import 'package:kalliyath_villa/Screens/splash_login/splash/splash.dart';
import 'package:kalliyath_villa/widget/snackbar_widget/snackbar.dart';

File? image;
String? imagepath;
bool buttoncolor = false;
final picker = ImagePicker();

Future pickImage(context) async {
  final pickedFile = await picker.pickImage(source: ImageSource.gallery);

  if (pickedFile != null) {
    image = File(pickedFile.path);
    if (image != null) {
      imagepath = image!.path;

      await buttoncolortracker();
    }
  } else {
    snackbarAlert(context, 'Image not selected');
  }
}

buttoncolortracker({String? name, String? address, String? gender}) {
  if (personalinfromation['Username'] != name ||
      image != null ||
      gender != personalinfromation['gender'] ||
      address != personalinfromation['address']) {
    buttoncolor = true;
    bloc1.add(LoginUpdateEvent());
  } else {
    buttoncolor = false;
    bloc1.add(LoginUpdateEvent());
  }
}

updatebutton(
    {required String name,
    required BuildContext context,
    String? address,
    String? gender}) async {
  final CollectionReference firedata =
      FirebaseFirestore.instance.collection('signup');
  String? imageurl;
  if (image != null) {
    if (personalinfromation['Image'] != null && isemail == false) {
      await firebaseimagedeletesingle(personalinfromation['Image']);
    }
    imageurl = await addimageTofirebase(image!.readAsBytesSync());
  }

  await firedata.doc(userData['Userid']).update({
    'Username': name,
    'Image': imageurl ?? userData['Image'],
    'address': address ?? '',
    'gender': gender ?? ''
  });
  await getprofiles(userData['Userid']);
  await adduserdata(
      personalinfromation['Phone Number'] ?? '',
      personalinfromation['Password'] ?? '',
      personalinfromation['Username'],
      personalinfromation['Image'],
      personalinfromation['id']);

  Navigator.of(context).pop();

  snackbarSucess(context, 'Updated');
}

Future<String> addimageTofirebase(Uint8List? result) async {
  String imageUrl = '';
  if (result != null) {
    final bytes = result;
    try {
      final fileName = 'image-${DateTime.now().millisecondsSinceEpoch}.jpg';
      final referenceRoot = FirebaseStorage.instance.ref();
      final referenceDireFiles = referenceRoot.child('files');
      final referenceFileToUpload = referenceDireFiles.child(fileName);
      final metadata = SettableMetadata(contentType: 'image/jpeg');
      await referenceFileToUpload.putData(bytes, metadata);
      imageUrl = await referenceFileToUpload.getDownloadURL();
    } catch (error) {
      log(error.toString());
    }
  } else {}
  return imageUrl;
}

firebaseimagedeletesingle(path) async {
  Reference reference = FirebaseStorage.instance.refFromURL(path);

  await reference.delete();
}
