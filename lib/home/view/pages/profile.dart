import 'dart:io';

import 'package:camera/camera.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_application/home/widgets/customtextfield.dart';
import 'package:e_commerce_application/home/widgets/titlesection.dart';
import 'package:e_commerce_application/screens/camera_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  final String name;
  final String email;

  const Profile({super.key, required this.name, required this.email});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final _emailController = TextEditingController();
  final _pincodeController = TextEditingController();
  final _passwordController = TextEditingController();
  final _AddressController = TextEditingController();
  final _stateController = TextEditingController();
  final _cityController = TextEditingController();
  final _countryController = TextEditingController();
  final _bankController = TextEditingController();
  final _HoldernameController = TextEditingController();
  final _IFSCodeController = TextEditingController();
  String? _dataImage;
  final ImagePicker _picker = ImagePicker();
  var firstCamera;

  @override
  void initState() {
    super.initState();
    loadCamera();
    loadImageFromPrefs();
    loadUserDataAndInitializeControllers();
  }

  // Load camera
  Future<void> loadCamera() async {
    final cameras = await availableCameras();
    firstCamera = cameras.first;
  }

  // Load image from SharedPreferences
  Future<void> loadImageFromPrefs() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      _dataImage = preferences.getString('image');
    });
  }

  // Reusable method for loading user data from Firebase
  Future<Map<String, dynamic>> loadUserData() async {
    String userId = FirebaseAuth.instance.currentUser?.uid ?? 'default_user_id';
    DocumentSnapshot snapshot =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();

    if (snapshot.exists) {
      return snapshot.data() as Map<String, dynamic>;
    } else {
      return {};
    }
  }

  // Load user data and initialize controllers
  Future<void> loadUserDataAndInitializeControllers() async {
    Map<String, dynamic> data = await loadUserData();
    setState(() {
      _emailController.text = data['_email_id'] ?? '';
      _passwordController.text = data['_password'] ?? '';
      _pincodeController.text = data['_pincode'] ?? '';
      _AddressController.text = data['_address'] ?? '';
      _cityController.text = data['_city'] ?? '';
      _stateController.text = data['_state'] ?? '';
      _countryController.text = data['_country'] ?? '';
      _bankController.text = data['_bank_account_name'] ?? '';
      _HoldernameController.text = data['_bank_account_no'] ?? '';
      _IFSCodeController.text = data['_IFSC_code'] ?? '';
    });
  }

  // Pick image from gallery or camera
  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      final appDir = await getApplicationDocumentsDirectory();
      final fileName = path.basename(pickedFile.path);
      final savedImage = await File(pickedFile.path).copy('${appDir.path}/$fileName');
      SharedPreferences preferences = await SharedPreferences.getInstance();
      await preferences.setString('image', savedImage.path);
      
      setState(() {
        _dataImage = savedImage.path;
      });
    }
  }

  // Show bottom sheet for image selection
  void showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: SizedBox(
            height: 120,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _buildImageOption(
                  icon: Icons.camera,
                  label: 'Camera',
                  onTap: () async {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CameraScreen(camera: firstCamera)),
                    );
                  },
                ),
                _buildImageOption(
                  icon: Icons.photo_library,
                  label: 'Media',
                  onTap: () {
                    Navigator.pop(context);
                    pickImage(ImageSource.gallery);
                  },
                ),
                _buildImageOption(
                  icon: Icons.more_horiz,
                  label: 'More',
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Build image option widget
  Widget _buildImageOption(
      {required IconData icon, required String label, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 90,
        width: 90,
        child: Column(
          children: [
            Icon(icon),
            Text(label),
          ],
        ),
      ),
    );
  }

  // Profile save method to update Firebase
  Future<void> saveProfile() async {
    String userId = FirebaseAuth.instance.currentUser?.uid ?? 'default_user_id';
    try {
      await FirebaseFirestore.instance.collection('users').doc(userId).set(
        {
          '_email_id': _emailController.text,
          '_password': _passwordController.text,
          '_pincode': _pincodeController.text,
          '_address': _AddressController.text,
          '_city': _cityController.text,
          '_state': _stateController.text,
          '_country': _countryController.text,
          '_bank_account_name': _bankController.text,
          '_bank_account_no': _HoldernameController.text,
          '_IFSC_code': _IFSCodeController.text,
        },
      );
      print("Profile updated");
    } catch (error) {
      print("Error updating profile: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile'), centerTitle: true),
      body: FutureBuilder<Map<String, dynamic>>(
        future: loadUserData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text("Something went wrong"));
          }

 
          return Padding(
            padding: EdgeInsets.all(10.0),
            child: ListView(
              children: [
                Center(
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      SizedBox(
                        height: 140,
                        width: 140,
                        child: _dataImage == null
                            ? CircleAvatar(
                                radius: 60,
                                backgroundImage: AssetImage('assets/default_avatar.png'))
                            : CircleAvatar(
                                radius: 70,
                                backgroundColor: Colors.tealAccent,
                                child: ClipOval(
                                  child: Image.file(
                                    File(_dataImage!),
                                    fit: BoxFit.cover,
                                    width: 120,
                                    height: 120,
                                  ),
                                ),
                              ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(2),
                        child: InkWell(
                          onTap: () async {
                            showBottomSheet(context);
                            SharedPreferences preferences = await SharedPreferences.getInstance();
                            _dataImage = preferences.getString('image');
                            setState(() {});
                          },
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.white,
                            child: Icon(Icons.edit, color: Colors.blue),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SectionTitle(title: 'Personal Details'),
                CustomTextField(
                    controller: _emailController,
                    label: 'Email Address',
                  ),
                CustomTextField(
                    controller: _passwordController,
                    label: 'Password',
                     isPassword: true),
                SizedBox(height: 20),
                SectionTitle(title: 'Business Address Details'),
                CustomTextField(
                    controller: _pincodeController,
                    label: 'Pincode',
                     )
                    ,
                CustomTextField(
                    controller: _AddressController,
                    label: 'Address',
                     ),
                CustomTextField(
                    controller: _cityController, label: 'City', 
                     ),
                CustomTextField(
                    controller: _stateController, label: 'State',
                    ),
                CustomTextField(
                    controller: _countryController,
                    label: 'Country',
                   ),
                SectionTitle(title: 'Bank Account Details'),
                CustomTextField(
                    controller: _bankController,
                    label: 'Bank Account Number',
                   ),
                CustomTextField(
                    controller: _HoldernameController,
                    label: 'Account Holder\'s Name',
               ),
                CustomTextField(
                    controller: _IFSCodeController,
                    label: 'IFSC Code',
                 ),
                SizedBox(height: 20),
                SizedBox(
                  height: 52,
                  width: 327,
                  child: ElevatedButton(
                    onPressed: saveProfile,
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                    child: Text('Save', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
