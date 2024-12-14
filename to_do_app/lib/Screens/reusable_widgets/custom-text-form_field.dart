
import 'package:flutter/material.dart';
String? email;
TextFormField TextFormFieldForEmail({required String hint,required TextEditingController controller,}){
  return TextFormField(
     keyboardType: TextInputType.emailAddress,
    validator: (value){
       if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              // Regular expression for validating email
              const String emailPattern =
                  r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
              final RegExp regex = RegExp(emailPattern);
              if (!regex.hasMatch(value)) {
                return 'Please enter a valid email address';
              }
              return null;
    },
    
            onSaved: (value) {
              email = value;
            },
            decoration: InputDecoration(
              suffixIcon: const Icon(Icons.email), 
              border: const OutlineInputBorder(),
             hintText: hint
            ),
          );
}

String? password;
TextFormField customTextFieldFOrPassword({required String hint,required TextEditingController controller,}){
 
  return TextFormField(
    keyboardType: TextInputType.number,
    obscureText: true,
    
    validator: (value){
       if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              if (value.length < 8) {
                return 'Password must be at least 8 characters long';
              }
              return null;
    },
    onSaved: (value) {
              password = value;
            },
            decoration: InputDecoration(
               prefixIcon: const Icon(Icons.lock),
              border: const OutlineInputBorder(),
             hintText: hint
            ),
          );
}


// class LoginForm extends StatefulWidget {
//   @override
//   _LoginFormState createState() => _LoginFormState();
// }

// class _LoginFormState extends State<LoginForm> {
//   final _formKey = GlobalKey<FormState>();
//   String? email;
//   String? password;

//   // Method to create a password TextFormField
//   Widget _buildPasswordField() {
//     bool _isPasswordVisible = false; // Local state for password visibility

//     return StatefulBuilder(
//       builder: (BuildContext context, StateSetter setState) {
//         return TextFormField(
//           decoration: InputDecoration(
//             labelText: 'Password',
//             prefixIcon: const Icon(Icons.lock), // Prefix icon for password
//             suffixIcon: IconButton(
//               icon: Icon(
//                 _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
//               ),
//               onPressed: () {
//                 setState(() {
//                   _isPasswordVisible = !_isPasswordVisible; // Toggle visibility
//                 });
//               },
//             ),
//           ),
//           obscureText: !_isPasswordVisible, // Toggle obscureText based on state
//           validator: (value) {
//             if (value == null || value.isEmpty) {
//               return 'Please enter your password';
//             }
//             if (value.length < 8) {
//               return 'Password must be at least 8 characters long';
//             }
//             return null; // Return null if the input is valid
//           },
//           onSaved: (value) {
//             password = value;
//           },
//         );
//       },
//     );
//   }
  
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     throw UnimplementedError();
//   }}



