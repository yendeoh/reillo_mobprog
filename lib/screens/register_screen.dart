import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants.dart';
import '../widgets/custom_font.dart';
import '../widgets/custom_inkwell_button.dart';
import '../widgets/custom_textformfield.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController mobilenumController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();

  void register() {
    String firstname = firstnameController.text.trim();
    String lastname = lastnameController.text.trim();
    String mobilenum = mobilenumController.text.trim();
    String username = usernameController.text.trim();
    String password = passwordController.text;
    String confirmpassword = confirmpasswordController.text;

    // Validate empty fields
    if (firstname.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('First name is required')),
      );
      return;
    }
    
    if (lastname.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Last name is required')),
      );
      return;
    }
    
    if (mobilenum.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Mobile number is required')),
      );
      return;
    }
    
    if (mobilenum.length != 11) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Mobile number must be 11 digits')),
      );
      return;
    }

    
    if (password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Password is required')),
      );
      return;
    }
    
    // Validate password strength
    if (password.length < 5) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Password must be at least 8 characters')),
      );
      return;
    }
    
    if (confirmpassword.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Confirm password is required')),
      );
      return;
    }
    
    if (password != confirmpassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Passwords do not match')),
      );
      return;
    }
    
    // All validations passed
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Registration successful!')),
    );
    
    // Send registration data to backend/database
    _sendRegistrationData(firstname, lastname, mobilenum, username, password);
    
    // Clear all fields
    firstnameController.clear();
    lastnameController.clear();
    mobilenumController.clear();
    usernameController.clear();
    passwordController.clear();
    confirmpasswordController.clear();
    
    // Navigate to home screen after successful registration
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        Navigator.pushReplacementNamed(context, '/Home');
      }
    });
  }

  void _sendRegistrationData(String firstname, String lastname, 
      String mobilenum, String username, String password) {
    // TODO: Implement API call to send registration data to backend
    // Example structure:
    // final registrationData = {
    //   'firstName': firstname,
    //   'lastName': lastname,
    //   'mobileNumber': mobilenum,
    //   'username': username,
    //   'password': password,
    // };
    // 
    // You can use:
    // - http package for HTTP requests
    // - dio package for more advanced HTTP features
    // - Firebase for authentication
    // - Your custom backend API
    //
    // For now, just logging the registration attempt
    //print('Registration Data: firstName=$firstname, lastName=$lastname, '
        //'mobileNum=$mobilenum, username=$username');
  }
  //}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: ScreenUtil().screenHeight,
          width: ScreenUtil().screenWidth,
          padding: EdgeInsets.fromLTRB(
            ScreenUtil().setWidth(25),
            ScreenUtil().setHeight(40),
            ScreenUtil().setWidth(25),
            ScreenUtil().setHeight(10),
          ),
          child: Column(
            children: [
              SizedBox(
                height: ScreenUtil().setHeight(25),
              ),
              CustomFont(
                text: 'Register Here',
                fontSize: ScreenUtil().setSp(50),
                fontWeight: FontWeight.bold,
                color: FB_DARK_PRIMARY,
              ),
              SizedBox(
                height: ScreenUtil().setHeight(25),
              ),
              CustomTextFormField(
                height: ScreenUtil().setHeight(10),
                width: ScreenUtil().setWidth(10),
                onSaved: null,
                fontColor: null,
                hintText: 'First name',
                validator: (value) => null,
                hintTextSize: ScreenUtil().setSp(15),
                fontSize: ScreenUtil().setSp(15),
                controller: firstnameController,
              ),
              SizedBox(
                height: ScreenUtil().setHeight(10),
              ),
              CustomTextFormField(
                height: ScreenUtil().setHeight(10),
                width: ScreenUtil().setWidth(10),
                onSaved: null,
                fontColor: null,
                hintText: 'Last name',
                validator: (value) => null,
                hintTextSize: ScreenUtil().setSp(15),
                fontSize: ScreenUtil().setSp(15),
                controller: lastnameController,
              ),
              SizedBox(
                height: ScreenUtil().setHeight(10),
              ),
              CustomTextFormField(
                maxLength: 11,
                keyboardType: TextInputType.number,
                height: ScreenUtil().setHeight(10),
                width: ScreenUtil().setWidth(10),
                onSaved: null,
                fontColor: null,
                hintText: 'Mobile Num',
                validator: (value) => null,
                hintTextSize: ScreenUtil().setSp(15),
                fontSize: ScreenUtil().setSp(15),
                controller: mobilenumController,
              ),
              SizedBox(
                height: ScreenUtil().setHeight(10),
              ),
              CustomTextFormField(
                isObscure: true,
                height: ScreenUtil().setHeight(10),
                width: ScreenUtil().setWidth(10),
                onSaved: null,
                fontColor: null,
                hintText: 'Password',
                validator: (value) => null,
                hintTextSize: ScreenUtil().setSp(15),
                fontSize: ScreenUtil().setSp(15),
                controller: passwordController,
              ),
              SizedBox(
                height: ScreenUtil().setHeight(10),
              ),
              Text(
                '(Password should be 8 characters, a mixture of letter and numbers consisting of at least one special character with Uppercase and Lowercase letters.)',
                style: TextStyle(
                  color: Colors.black45,
                  fontSize: ScreenUtil().setSp(10),
                ),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(10),
              ),
              CustomTextFormField(
                isObscure: true,
                hintText: 'Confirm Password',
                height: ScreenUtil().setHeight(10),
                width: ScreenUtil().setWidth(10),
                onSaved: null,
                fontColor: null,
                validator: (value) => null,
                hintTextSize: ScreenUtil().setSp(15),
                fontSize: ScreenUtil().setSp(15),
                controller: confirmpasswordController,
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'You have an account? ',
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: ScreenUtil().setSp(15),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.popAndPushNamed(context, '/login'),
                    child: Text(
                      'Login here',
                      style: TextStyle(
                        color: FB_DARK_PRIMARY,
                        fontSize: ScreenUtil().setSp(15),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: ScreenUtil().setHeight(10),
              ),
              CustomInkwellButton(
                onTap: () => register(),
                height: ScreenUtil().setHeight(45),
                width: ScreenUtil().screenWidth,
                fontSize: ScreenUtil().setSp(15),
                fontWeight: FontWeight.bold,
                buttonName: 'Submit',
              ),
            ],
          ),
        ),
      ),
    );
  }
}