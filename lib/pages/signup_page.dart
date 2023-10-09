import 'package:flutter/material.dart';
import 'package:flutter_login_ui/pages/home_page.dart';
import 'package:flutter_login_ui/pages/login_page.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final singUpEmailController = TextEditingController();
  final signUpPasswordController = TextEditingController();
  final signUpConfrimPasswordController =TextEditingController();
  final signUpVerificationCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const LogoAndPageName(pageName: "Sign Up"),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25,vertical: 10),
            child:Column(
              mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: LoginField(controller: singUpEmailController, hintText: "Enter your Email", prefixIcon: Icons.email),
                  ),
                  LoginField(controller: signUpPasswordController, hintText: "Enter your Password", prefixIcon: Icons.lock,hasObscureText: true,),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: LoginField(controller: signUpConfrimPasswordController, hintText: "Confrim your Password", prefixIcon: Icons.lock,hasObscureText: true,),
                  ),
                  VerificationField(controller:signUpVerificationCodeController , hintText: "Enter Email verification code", prefixIcon: Icons.verified_outlined),
                  Padding(padding: EdgeInsets.symmetric(vertical: 10),
                  child: LoginAndSignUpButton(onTap:(){
                    // Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));
                  },buttonName: "Sign Up",),
                  ),
                 const OrContinueWith(),
                const  Padding(
              padding: const EdgeInsets.only(top: 10,bottom: 15),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage("https://w7.pngwing.com/pngs/326/85/png-transparent-google-logo-google-text-trademark-logo.png"),
                  ),
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage("https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Facebook_Logo_%282019%29.png/1200px-Facebook_Logo_%282019%29.png"),
                  ),
                
                ],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
             const  Text("Already Have An Account?"),
               GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child:Text("Login",style: TextStyle(
                  color: Colors.red
                ),)
               )
              ],
            )
                ],
            ) ,
            )
        ],
      ),
    );
  }
}


class VerificationField extends StatefulWidget {
  const VerificationField({super.key, required this.controller, required this.hintText, required this.prefixIcon,});
  final TextEditingController controller ;
  final String hintText;
  final IconData prefixIcon;


  @override
  State<VerificationField> createState() => _VerificationFieldState();
}

class _VerificationFieldState extends State<VerificationField> {
   bool getCode = true;
  @override
  Widget build(BuildContext context) {
    return Container(
     height: MediaQuery.of(context).size.height*0.06,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
      ),
      child:Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 2),
        child: Row(
          children: [
            SizedBox(
              width: 280,
              child: TextField(
                autocorrect: false,
                controller: widget.controller,
                decoration: InputDecoration(
                  prefixIcon: Icon(widget.prefixIcon),
                  hintText: widget.hintText,
                  border: InputBorder.none
                ),
              ),
            ),
            GestureDetector(
                onTap: () {
                  setState(() {
                    getCode =!getCode;
                  });
                },
              child: Text(
                (getCode)?"Get Code": "Resend",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.red
                ),
              )
             ),
          ],
        ),
      ),
    )
     ;
  }
}