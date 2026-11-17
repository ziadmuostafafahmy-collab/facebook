import 'package:facebook/customTextField.dart';
import 'package:facebook/screen_colors.dart';
import 'package:flutter/material.dart';
import 'homeScreen.dart';
class   LoginScreen  extends StatefulWidget
{
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     backgroundColor: Colors.white,
     body: SafeArea(
       child: SingleChildScrollView(
         child: Padding(
             padding: const EdgeInsets.symmetric( horizontal: 16),
         child: Form(
           key: formKey,
           child: Column( spacing: 30,
             children: [
                SizedBox(height: 70,),
                Image.asset("assets/images/Logo.jpg",width: 90,),
         
               CustomTextField(
                   hint: "Mobile Number or Email address",
                   controller: emailController,
                 keyboardType: TextInputType.emailAddress,
                 validator: (value)
                 {
                     if (value == null || value.trim().isEmpty){
                       return 'Please enter your email';
         
                     }
                      final emailRegex = RegExp(r'^[\w.\-]+@[\w\-]+\.[A-Za-z]{2,}$');
                     if(!emailRegex.hasMatch(value.trim())){
                       return  'Invalid email, example: ziad@gmail.com';
                     }
                     return null;
                 },
         
               ),
         
           CustomTextField(
             hint: "Password",
             controller:passwordController,
             isPassword: true,
             validator: (value){
               if (value == null || value.isEmpty){
                 return  'Please enter your password';
         
               }
               if (value.length<6){
                 return  'Password must be at least 6 characters';
               }
               return null;
             },
         
           ),
         
               SizedBox(
                 width: double.infinity,
                 height:  50,
                 child: ElevatedButton(onPressed:(){
                   if (formKey.currentState!.validate()) {
                     Navigator.pushReplacement(
                       context,
                       MaterialPageRoute(builder: (_) => const Homescreen()),
                     );
         
                   }
                 } ,
                     style: ElevatedButton.styleFrom(
                       backgroundColor: ScreenColors.lightBlueColor,
                       shape: RoundedRectangleBorder(
                           borderRadius: BorderRadiusGeometry.circular(16)
                       ),
                     ),
                     child: Text("Login" ,
                       style: TextStyle(
                       color: ScreenColors.whitColor,
                         fontSize: 20,
                       ),
                       )
                 ),
               ),
             TextButton(onPressed: (){},
                 child:Text("Forget Password",
                   style:TextStyle(
                       fontSize: 16,
                       color: ScreenColors.lightBlueColor
                   )
                 )
             ),
               SizedBox( height: 130,),

               SizedBox(
                 width: double.infinity,
                 height:  50,
                 child: OutlinedButton(onPressed:(){} ,
                     style: OutlinedButton.styleFrom(
                       side: BorderSide(
                           color: ScreenColors.grayColor
                       ),
                       shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(16)
                       ),
                     ),
                     child: Text(
                       "Create Account" ,
                       style: TextStyle(
                         color: ScreenColors.blackColor,
                         fontSize: 18,
                       ),
                     )
                 ),
               ),
               Image.asset('assets/images/Meta.jpg', width: 70)
           ]
           ),
         
         ) ,
         ),
       ),
     ),
   );
  }
}