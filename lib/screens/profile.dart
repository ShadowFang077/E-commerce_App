import 'dart:io';

import 'package:e_commerce_application/screens/camera_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

class Profile extends StatefulWidget {
  final String name;
  final String email;

  const Profile({super.key, required this.name, required this.email});

  Future<bool> check() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool('profileData') ?? false;
  }

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

  //  final ImagePicker _picker = ImagePicker();
  // XFile? _imageFile;
    @override
  void initState() {
    super.initState();
    loaddata();
    loadcamera();
    _loadImageFromPrefs();
  }

  Future<void> _loadImageFromPrefs() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      _dataImage = preferences.getString('image');
    });
  }



  var firstCamera;
  loadcamera() async {
    // Obtain a list of the available cameras on the device.
    final cameras = await availableCameras();

    // Get a specific camera from the list of available cameras.
    firstCamera = cameras.first;
  }

  loaddata() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    _dataImage = preferences.getString('image');
                        setState(() {});
    _emailController.text = preferences.getString(
          'email',
        ) ??
        'no data';

    _pincodeController.text = preferences.getString(
          'pincode',
        ) ??
        'no data';

    _AddressController.text = preferences.getString(
          'address',
        ) ??
        'no data';

    _cityController.text = preferences.getString(
          'city',
        ) ??
        'no data';

    _stateController.text = preferences.getString(
          'state',
        ) ??
        'no dta';
    _countryController.text = preferences.getString(
          'country',
        ) ??
        'no dta';


  }


   Future<void> _pickImage(ImageSource source) async {
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



  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: SizedBox(
            height: 120,
            child: Container(
              width: MediaQuery.of(context).size.width -02,
              height: 110,
              
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  InkWell(
                         onTap: () async{
                            Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CameraScreen(camera: firstCamera),
                        ),
                      );
                          },
                    child: Container(
                      height: 90,
                      width: 90,
                      child:
                       Column(
                         children: [
                          Icon(Icons.camera),
                           Text('Camera'),
                         
                         ],
                       )
                                  
                    ),
                  ),
                  InkWell(
                        onTap: () {
                           Navigator.pop(context);
                  _pickImage(ImageSource.gallery);
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => ));
                      },
                    child: Container(
                      height: 90,
                      width: 90,
                      child:
                       Column(
                         children: [
                    
                          Icon(Icons.photo_library),
                         Text('Media')
                         ],
                       ),
                    
                    ),
                  ),
                  InkWell(
                         onTap: () {
                        Navigator.pop(context);
                      },
                    child: Container(
                      height: 90,
                      width: 90,
                      child:
                       Column(
                         children: [
                     
                          Icon(Icons.more_horiz),
                           Text('More')
                         ],
                       ),
                    
                    
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }




@override
  void didUpdateWidget(covariant Profile oldWidget)async {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
        SharedPreferences preferences = await SharedPreferences.getInstance();

    setState(() {
         _dataImage = preferences.getString('image');
                        setState(() {});
    });
  }

  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
      ),
      body: Padding(
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
                            backgroundImage: AssetImage(
                                'assets/Screenshot 2025-03-03 114401.png'),
                          )
                        : CircleAvatar(
                            radius: 70,
                            backgroundColor: Colors.tealAccent,
                            child: ClipOval(
                            child: Image.file(File(_dataImage!),
                            fit: BoxFit.cover,
                            width: 120,
                            height: 120,),
                            ),
                          ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(2),
                    child: InkWell(
                      onTap: () async {
                        _showBottomSheet(context);                
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => CameraScreen(
                        //               camera: firstCamera,
                        //             )));

                        SharedPreferences preferences =
                            await SharedPreferences.getInstance();
                        _dataImage = preferences.getString('image');
                        setState(() {});
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        child: CircleAvatar(
                          radius: 100,
                          backgroundColor: Colors.white,
                          child: Container(
                              height: 32,
                              width: 32,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.blue,
                              ),
                              child: Icon(
                                Icons.edit,
                                color: Color(0xffFFFFFF),
                              )),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SectionTitle(title: 'Personal Details'),
            CustomTextField(
              controller: _emailController,
              label: 'Email Address ${widget.email}',
              initialValue: ' ',
            ),
            SizedBox(height: 20),
            CustomTextField(
                controller: _passwordController,
                label: 'Password',
                initialValue: '',
                isPassword: true),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: Text('Change Password'),
              ),
            ),
            SizedBox(height: 20),
            SectionTitle(title: 'Business Address Details'),
            CustomTextField(
                controller: _pincodeController,
                label: 'Pincode',
                initialValue: ' '),
            SizedBox(height: 20),
            CustomTextField(
                controller: _AddressController,
                label: 'Address',
                initialValue: ' '),
            SizedBox(height: 20),
            CustomTextField(
                controller: _cityController, label: 'City', initialValue: ' '),
            SizedBox(height: 20),
            CustomTextField(
                controller: _stateController,
                label: 'State',
                initialValue: ' '),
            SizedBox(height: 20),
            CustomTextField(
                controller: _countryController,
                label: 'Country',
                initialValue: ' '),
            SizedBox(height: 20),
            SectionTitle(title: 'Bank Account Details'),
            SizedBox(height: 20),
            CustomTextField(
                controller: _bankController,
                label: 'Bank Account Number',
                initialValue: ' '),
            SizedBox(height: 20),
            CustomTextField(
                controller: _HoldernameController,
                label: 'Account Holder\'s Name',
                initialValue: '  '),
            SizedBox(height: 20),
            CustomTextField(
                controller: _IFSCodeController,
                label: 'IFSC Code',
                initialValue: ' '),
            SizedBox(height: 20),
            SizedBox(
              height: 52,
              width: 327,
              child: ElevatedButton(
                onPressed: () async {
                  // _saveData

                  SharedPreferences preferences =
                      await SharedPreferences.getInstance();
                  var status =
                      preferences.setString('email', _emailController.text);
                  preferences.setString('pincode', _pincodeController.text);
                  preferences.setString('Address', _AddressController.text);
                  preferences.setString('city', _cityController.text);
                  preferences.setString('state', _stateController.text);
                  preferences.setString('country', _countryController.text);
                  preferences.setString('bank', _bankController.text);
                  preferences.setString(
                      'holdername', _HoldernameController.text);
                  preferences.setString('IFSC code', _IFSCodeController.text);
                  preferences.setBool('profileData', true);
                  print(status);
                },
                child: Text(
                  'Save',
                  style: TextStyle(color: Color(0xffFFFFFF)),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xffF83758),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String initialValue;
  final bool isPassword;

  CustomTextField(
      {required this.controller,
      required this.label,
      required this.initialValue,
      this.isPassword = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        // initialValue: initialValue,
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
