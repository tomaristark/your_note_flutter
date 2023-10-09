

import 'package:flutter/material.dart';

import 'package:flutter_login_ui/pages/signup_page.dart'; 
 
 

class LoginPage extends StatelessWidget {
   LoginPage({super.key});
  final emailController = TextEditingController();
  final passwordController= TextEditingController();

  void onUserLogin(){
      
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color.fromARGB(255, 222, 220, 220),
      body: Column(
        children: [
          const LogoAndPageName(pageName: "Login",),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              LoginField(hintText: "Enter your Email",prefixIcon: Icons.email,controller: emailController,),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: LoginField(controller: passwordController, hintText: "Enter your Password", prefixIcon: Icons.lock,hasObscureText: true,),
              ),
              GestureDetector(
                onTap: (){},
                child: const Text("Forgot Password?",style: TextStyle(
                  color: Colors.red,
                ),),
              ),
              LoginAndSignUpButton(onTap: (){
                onUserLogin();
                // Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  HomePage()));
              } , buttonName: "login",),
           const OrContinueWith(),
           const Padding(
              padding: const EdgeInsets.only(top: 10),
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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Not a memeber?"),
                  GestureDetector(
                    child: GestureDetector(
                      onTap: (){
                         Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SignUpPage()));
                      },
                      child: Text("Sign up",style: TextStyle(
                        color: Colors.red
                      ),),
                    ),
                  )
                ],
              ),
            )
            ],
          ),
        )
        ],
      ),
    );
  }
}

class OrContinueWith extends StatelessWidget {
  const OrContinueWith({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const  Row(children: [
       Expanded(child: Divider(thickness: 2,)),
       Text("Or Continue with",style: TextStyle(
         fontSize: 18
       ),),
       Expanded(child: Divider(thickness: 2,))
     ],);
  }
}

class LogoAndPageName extends StatelessWidget {
  const LogoAndPageName({
    super.key, required this.pageName,
  });
  final String pageName;


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
        padding: const EdgeInsets.only(right: 20,bottom: 20),
        alignment: Alignment.bottomRight,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height*0.4,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: 
          [
            Colors.red,
            Colors.red.shade400,
            Colors.red.shade200,
           ],
           begin: Alignment.bottomRight,
           end: Alignment.topLeft,
            ),
          borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(100))
        ),
        child:  Text(pageName,style: const TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.white
        ),),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: 200,
            height: 200,
            child: Image.asset("assets/logo.png",fit: BoxFit.cover,)),
        ),
      )
      ]
    );
  }
}

class LoginAndSignUpButton extends StatelessWidget {
  const LoginAndSignUpButton({
    super.key, required this.onTap, required this.buttonName,
  });
  final Function onTap;
  final String buttonName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: onTap(),
        child: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height*0.06,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(25)
          ),
          child: Text(
            buttonName,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20
            ),
          ),
        ),
      ),
    );
  }
}

class LoginField extends StatefulWidget {
  const LoginField({
    super.key, required this.controller, required this.hintText, required this.prefixIcon, this.hasObscureText = false,
  });
    final TextEditingController controller;
    final String hintText;
    final IconData prefixIcon;
    final bool hasObscureText ;

  @override
  State<LoginField> createState() => _LoginFieldState();
}

class _LoginFieldState extends State<LoginField> {
   bool _hideText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.06,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 2),
        child: TextField(
          autocorrect: false,
          obscureText: (widget.hasObscureText)?_hideText:false,
          controller: widget.controller,
          decoration: InputDecoration(
            suffixIcon:(widget.hasObscureText)? GestureDetector(
              onTap: () {
                setState(() {
                  _hideText= !_hideText;
                });
              },
              child: Icon((_hideText)?Icons.visibility:Icons.visibility_off),
            ):null,
            prefixIcon: Icon(widget.prefixIcon),
            hintText: widget.hintText,
            border: InputBorder.none
          ),
        ),
      ),
    );
  }
}