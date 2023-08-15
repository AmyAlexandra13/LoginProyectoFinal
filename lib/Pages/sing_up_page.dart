import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
  }

  class _LoginPageState extends State<LoginPage>{ 
   
    final _formKey = GlobalKey<FormState>();
    bool isLoading = false;
    final TextEditingController _email = TextEditingController();
        final TextEditingController _password = TextEditingController();

        createUserWithEmailAndPassword() async{
          try {
            setState((){
              isLoading=true;
            });
   await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: _email.text,
    password: _password.text,
  );
   setState((){
              isLoading=false;
            });
} on FirebaseAuthException catch (e) {
  setState((){
              isLoading=false;
            });
  if (e.code == 'weak-password') {
    return ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Contraseña pobre"),
      ),
     );
  } else if (e.code == 'email-already-in-use') {
     return ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Contraseña existe"),
      ),
     );
  }
} catch (e) {
  print(e);
  setState((){
              isLoading=false;
            });
}
        }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: OverflowBar(
            overflowSpacing: 20,
            children: [
              TextFormField(
                controller: _email,
                validator: (text){
                  if(text == null || text.isEmpty){
                    return 'Email esta vacio';
                  }
                  return null;
                },
                decoration: const InputDecoration(hintText: "Email"),
              ),
              TextFormField(
                controller: _password,
                validator: (text){
                  if(text == null || text.isEmpty){
                    return 'Password esta vacia';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  hintText: "Password",
                  ),

              ),
                 SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                     createUserWithEmailAndPassword();
                    }
                  },
                  child:  isLoading ? Center(child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                   ) 
                 : const Text("Registrate"),
             
                ),
              ),

              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                  onPressed: (){
                    
                  },
                  child: const Text("Login"),
                ),
              ),

           
            ],
          ),

        ),
         ),
      ),
    );
  }
  }