import 'package:all_in_one_m/components/text_box.dart';
import 'package:all_in_one_m/common/utils/style_manager.dart';
import 'package:all_in_one_m/user/screens/user_dashboard.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController emailAddress = TextEditingController();
  TextEditingController userAddress = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController dateOfBirth = TextEditingController();
  TextEditingController bvn = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            color: StyleManager.primaryColor,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(25.0, 0, 25.0, 25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  const Center(
                    child: Column(
                      children: [
                        SizedBox(height: 35),
                        Text(
                          'User Profile',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Please fill in the correct information below',
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  CustomTextBox(
                    controller: firstName,
                    label: "First Name",
                  ),
                  const SizedBox(height: 15),
                  CustomTextBox(
                    controller: lastName,
                    label: "Last Name",
                  ),
                  const SizedBox(height: 15),
                  CustomTextBox(
                    controller: phoneNumber,
                    label: "Phone Number",
                  ),
                  const SizedBox(height: 15),
                  CustomTextBox(
                    controller: emailAddress,
                    label: "Email Address",
                  ),
                  const SizedBox(height: 15),
                  CustomTextBox(
                    controller: userAddress,
                    label: "User Address",
                  ),
                  const SizedBox(height: 15),
                  CustomTextBox(
                    controller: gender,
                    label: "Gender",
                  ),
                  const SizedBox(height: 15),
                  CustomTextBox(
                    controller: dateOfBirth,
                    label: "Date of Birth",
                  ),
                  const SizedBox(height: 15),
                  CustomTextBox(
                    controller: bvn,
                    label: "BVN",
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UserDashboard()));
                      },
                      child: const Text(
                        'Register',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
