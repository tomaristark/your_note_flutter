import 'package:flutter/material.dart';
import 'package:flutter_login_ui/pages/home_page.dart';
import 'package:flutter_login_ui/pages/private_note_page.dart';
import 'package:local_auth/local_auth.dart';

class PrivateNoteAuth extends StatefulWidget {
  const PrivateNoteAuth({super.key});

  @override
  State<PrivateNoteAuth> createState() => _PrivateNoteAuthState();
}

class _PrivateNoteAuthState extends State<PrivateNoteAuth> {
  bool _authSuccess = false;
  late LocalAuthentication _localAuth;

  @override
  void initState() {
    this._localAuth = LocalAuthentication();
    super.initState();
  }
  Future<bool> _auth() async{
    setState(() {
      this._authSuccess =false;
    });
    if(await this._localAuth.canCheckBiometrics == false){
      if(context.mounted){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("your device is not support"))
        );
      }
     return false;
    }
    try{
      final authSuccess = await this._localAuth.authenticate(
        localizedReason: "Need Your FingerPrint To Open Your Private Note",
        options: const AuthenticationOptions(biometricOnly: true)
        );
      if(mounted){
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Success")),
        );
      }
      return authSuccess;
    }catch (e){
      if(context.mounted){
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Failed"))
        );
      }
      return false;
    }
  }
  Widget build(BuildContext context) {
    return 
    GestureDetector(
      onTap: () async{
          final authSuccess = await this._auth();
          setState(() {
            this._authSuccess = authSuccess;
          });
          if(this._authSuccess){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const PrivateNotePage()));
          }
      },
      child: Category(
        categoryColor: Colors.blueAccent,
        categoryIcon: Icons.lock_outline,
        categoryName: "Private Notes",
    
        ),
    );
  }
}