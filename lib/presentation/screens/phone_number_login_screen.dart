// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:login_system/logic/blocs/login_bloc/login_bloc.dart';
// import 'package:login_system/presentation/widgets/snackbar.dart';
// import 'package:login_system/presentation/widgets/submit_button.dart';
// import 'package:login_system/presentation/widgets/textfield.dart';

// class PhoneNumberLoginScreen extends StatefulWidget {
//   const PhoneNumberLoginScreen({super.key});

//   @override
//   _PhoneNumberLoginScreenState createState() => _PhoneNumberLoginScreenState();
// }

// class _PhoneNumberLoginScreenState extends State<PhoneNumberLoginScreen> {
//   final _phoneController = TextEditingController();
//   final _smsController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Phone Number Login'),
//       ),
//       body: BlocProvider(
//         create: (context) => LoginUserBloc(),
//         child: BlocListener<LoginUserBloc, LoginUserState>(
//           listener: (context, state) {
//             if (state is LoginUserWithPhoneNumberSuccessState) {
//               Navigator.pushReplacementNamed(context, '/home');
//               snackBar(context, content: 'Logged in successfully!');
//             } else if (state is LoginUserWithPhoneNumberCodeSentState) {
//               snackBar(
//                 context,
//                 content: 'Code sent to ${_phoneController.text}',
//               );
//             } else if (state is LoginUserWithPhoneNumberFailureState) {
//               snackBar(context, content: 'Failed to login. Try again later.');
//             } else if (state
//                 is LoginUserWithPhoneNumberFailureEmptyFieldsState) {
//               snackBar(context, content: 'Phone cannot be empty!');
//             }
//           },
//           child: Column(
//             children: [
//               const SizedBox(height: 36),
//               textField(
//                 controller: _phoneController,
//                 hintText: 'Phone Number..',
//               ),
//               const SizedBox(height: 16),
//               submitButton(
//                 context,
//                 label: 'Send Code',
//                 onTap: () {
//                   final phoneNumber = _phoneController.text.trim();
//                   if (phoneNumber.isNotEmpty) {
//                     BlocProvider.of<LoginUserBloc>(context).add(
//                       LoggedInUserWithPhoneNumberEvent(
//                         phoneNumber: _phoneController,
//                       ),
//                     );
//                   } else {
//                     snackBar(context, content: 'Phone number cannot be empty!');
//                   }
//                 },
//               ),
//               // const SizedBox(height: 36),
//               // textField(
//               //   controller: _smsController,
//               //   hintText: 'SMS Code..',
//               // ),
//               // const SizedBox(height: 16),
//               // submitButton(
//               //   context,
//               //   label: 'Verify Code',
//               //   onTap: () {
//               //     final smsCode = _smsController.text.trim();
//               //     if (smsCode.isNotEmpty) {
//               //       BlocProvider.of<LoginUserBloc>(context).add(
//               //         VerifyPhoneNumberEvent(
//               //           verificationId: BlocProvider.of<LoginUserBloc>(context)
//               //               .verificationId,
//               //           smsCode: smsCode,
//               //         ),
//               //       );
//               //     } else {
//               //       snackBar(context, content: 'SMS code cannot be empty!');
//               //     }
//               //   },
//               // ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
