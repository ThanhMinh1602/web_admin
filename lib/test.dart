// import 'package:flutter/material.dart';
// import 'package:flutter_mail_server/flutter_mail_server.dart';

// class MailApp extends StatelessWidget {
//   TextEditingController name = TextEditingController();
//   TextEditingController email = TextEditingController();
//   TextEditingController emailmessage = TextEditingController();

//   MailApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text("Mail app"),
//       ),
//       body: SafeArea(
//         child: Column(
//           children: [
//             TextFormField(
//               controller: name,
//               decoration: const InputDecoration(
//                 hintText: "Username",
//               ),
//             ),
//             TextFormField(
//               controller: email,
//               decoration: const InputDecoration(
//                 hintText: "Email",
//               ),
//             ),
//             TextFormField(
//               controller: emailmessage,
//               decoration: const InputDecoration(
//                 hintText: "Message",
//               ),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 Mailer().sendEmail(

//                   name.text,
//                   email.text,
//                   emailmessage.text,
//                   "youremail@gmail.com",
//                   "yourDomainEmail@yourDomainName.whateverDNSyouUse",

//                   // error message
//                   const AlertDialog(
//                     title: Text("Message"),
//                     content: Text(
//                       "failed to send email",
//                       style: TextStyle(
//                         color: Colors.red,
//                       ),
//                     ),
//                   ),

//                   // success message
//                   const AlertDialog(
//                     title: Text("Message"),
//                     content: Text(
//                       "email sent successfuly",
//                       style: TextStyle(
//                         color: Colors.green,
//                       ),
//                     ),
//                   ),
//                 );
//               },
//               child: Row(
//                 children: const [Text("Send email")],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }