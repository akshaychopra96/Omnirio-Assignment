import 'package:assignment/constants.dart';
import 'package:assignment/homepage/homepage.dart';
import 'package:assignment/login/login_screen.dart';
import 'package:assignment/signup/widgets/fullname_container.dart';
import 'package:assignment/signup/widgets/textfieldHeaderText.dart';
import 'package:assignment/size_config.dart';
import 'package:assignment/widgets/email_container.dart';
import 'package:assignment/widgets/password_container.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key key}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool isReferralChecked = false;
  bool isTermsAndConditionsChecked = false;

  String phoneNumber;
  String phoneIsoCode;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
        child: ListView(
          children: [
            //Sign UP Text
            Text(
              "Sign Up",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
            ),

            TextFieldHeaderText(
              headerText: "Full Name",
            ),

            //Full Name Input Field
            FullnameContainer(),

            TextFieldHeaderText(
              headerText: "Email",
            ),

            //Email Input Field
            EmailContainer(),

            TextFieldHeaderText(
              headerText: "Password",
            ),

            // Password Input Field
            PasswordContainer(),

            TextFieldHeaderText(
              headerText: "Mobile Number ",
            ),

            //Mobile Number (Dropdown)
            IntlPhoneField(
              decoration: InputDecoration(
                //decoration for Input Field
                labelText: 'Phone Number',
                border: OutlineInputBorder(
                  borderSide: BorderSide(),
                ),
              ),
              initialCountryCode: 'IN', //default contry code, NP for Nepal
              onChanged: (phone) {
                //when phone number country code is changed
                print(phone.completeNumber); //get complete number
                print(phone.countryCode); // get country code only
                print(phone.number); // only phone number
              },
            ),

            //Checkbox Do you have a referral code
            CheckboxListTile(
              title: Text(
                "Do you have a referral code?",
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              value: isReferralChecked,
              onChanged: (newValue) async {
                setState(() {
                  isReferralChecked = newValue;
                });
                // await SharePreferenceHelper().setLoggedInStatus(newValue);
              },
              controlAffinity:
                  ListTileControlAffinity.leading, //  <-- leading Checkbox
            ),

            Visibility(
              visible: isReferralChecked,
              child: Container(
                decoration: inputFileldContainerDecoration(),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.name,
                  decoration:
                      buildInputDecoration(hintText: "Enter Referral Code"),
                  validator: (input) =>
                      input.isEmpty ? "Invalid Referral Code" : null,
                ),
              ),
            ),

            //Checkbox I agree with terms and conditions
            CheckboxListTile(
              title: Text(
                "I agree with the terms and conditions",
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              value: isTermsAndConditionsChecked,
              onChanged: (newValue) async {
                setState(() {
                  isTermsAndConditionsChecked = newValue;
                });
                // await SharePreferenceHelper().setLoggedInStatus(newValue);
              },
              controlAffinity: ListTileControlAffinity.leading,
            ),

            //Sign Up button & Login
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: getProportionateScreenWidth(100),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: TextButton(
                      onPressed: () => {
                        if (_formKey.currentState.validate() &&
                            isTermsAndConditionsChecked)
                          {
                            print("Sign Up Successful"),
                            Navigator.pushNamedAndRemoveUntil(
                                context,
                                Homepage.routeName,
                                (Route<dynamic> route) => false)
                          }
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Have an account?',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                      children: <TextSpan>[
                        TextSpan(
                            text: ' Login',
                            style: TextStyle(color: Colors.blue, fontSize: 16),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    LoginScreen.routeName,
                                    (Route<dynamic> route) => false);
                              }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onPhoneNumberChange(
      String number, String internationalizedPhoneNumber, String isoCode) {
    setState(() {
      phoneNumber = number;
      phoneIsoCode = isoCode;
    });
  }
}
