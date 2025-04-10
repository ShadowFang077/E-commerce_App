import 'package:shared_preferences/shared_preferences.dart';

import 'package:e_commerce_application/home/view/home_screen.dart';

import 'package:flutter/material.dart';

class SplashLogin extends StatefulWidget {
  const SplashLogin({super.key});

  @override
  State<SplashLogin> createState() => _SplashLoginState();
}

class _SplashLoginState extends State<SplashLogin> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(9),
          child: Form(
            key: _formkey,
            child: Column(
              spacing: 10,
              children: [
                SizedBox(height: 40),
              
                SizedBox(height: 40),
                SizedBox(
                  height: 85,
                  width: 317,
                  child: TextFormField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      prefixIcon: Icon(Icons.person),
                      labelText: 'Username or Email',
                      // hintText: 'Username or Email'
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please entered the Email id';
                      }
                      String pattern =
                          r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$';
                      RegExp regExp = RegExp(pattern);
                      if (!regExp.hasMatch(value)) {
                        return 'enter the correct email id';
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 85,
                  width: 317,
                  child: TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      prefixIcon: Icon(Icons.lock),
                      labelText: 'Password',
                      //   hintText: 'Password',fillColor: Color(676767),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please entered the correct Password';
                      }
                      String pattern = r'^[a-zA-Z0-9]';
                      RegExp regExp = RegExp(pattern);
                      if (regExp.hasMatch(value) && value.length < 8) {
                        return 'enter the correct Password';
                      }
                    },
                    onChanged:(value) {
                      print(value);
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Row(
                    children: [
                      SizedBox(width: 200),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: Color(0xffF83758),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
                SizedBox(height: 40),
                TextButton(
                  onPressed: () async {
                 
                    if (_formkey.currentState!.validate()) {
                      SharedPreferences preferences =
                          await SharedPreferences.getInstance();
                      preferences.setString(
                          'username', _usernameController.text);
                      preferences.setBool('loggedin', true);
                         Navigator.push<void>(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => HomeNavBarScreen(),
                      ),
                    );
                    }
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Color(0xffF83758),
                    minimumSize: Size(317, 55), // Width: 200, Height: 60
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: Text(
                    'Login',
                    style: TextStyle(color: Color(0xffFFFFFF), fontSize: 20),
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  '- OR Continue with -',
                  style: TextStyle(color: Color(0xff575757)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 54,
                      height: 54,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xffF83758),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(2),
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                            'https://static.vecteezy.com/system/resources/previews/011/598/471/original/google-logo-icon-illustration-free-vector.jpg',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      width: 54,
                      height: 54,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xffF83758),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(2),
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                            'https://tse2.mm.bing.net/th?id=OIP.HKoDLEf2PVCQK500SS4TAwHaHa&pid=Api&P=0&h=180',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      width: 54,
                      height: 54,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xffF83758),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(2),
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                            'https://static.vecteezy.com/system/resources/previews/004/263/114/original/meta-logo-meta-by-facebook-icon-editorial-logo-for-social-media-free-vector.jpg',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Create An Account',
                    ),
                    SizedBox(width: 5),
                 
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
