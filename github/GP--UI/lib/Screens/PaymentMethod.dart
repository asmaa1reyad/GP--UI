// import 'package:flutter/material.dart';
// import 'package:foodhub/Screens/Dashboard.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;

// class Paymentmethod extends StatelessWidget {
//   const Paymentmethod({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Payment Methods'),
//       ),
//       body: ListView(
//         padding: EdgeInsets.all(20),
//         children: [
//           PaymentCard(
//             paymentType: 'Credit Card',
//             description: 'Pay with your credit card',
//             onTap: (
//               // _handlePayment(context, 'Credit Card');
//             ) {
//               // Handle credit card payment
//             },
//           ),
//           SizedBox(height: 20),
//           PaymentCard(
//             paymentType: 'Cash',
//             description: 'Pay with cash upon delivery',
//             onTap: (
//               // _handlePayment(context, 'Cash');
//             ) {
//               // Handle cash payment
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }



// Future<void> _handlePayment(BuildContext context, String paymentType) async {
//     // إجراء طلب HTTP هنا
//     final response = await http.post(
//       Uri.parse('YOUR_API_ENDPOINT_HERE'),
//       body: json.encode({'paymentType': paymentType}),
//       headers: {'Content-Type': 'application/json'},
//     );

//     // التحقق من حالة الاستجابة
//     if (response.statusCode == 200) {
//       // إذا كان الاستجابة ناجحة، يمكنك تنفيذ أي عمليات إضافية هنا
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Payment Successful!')),
//       );
//     } else {
//       // في حالة فشل الطلب
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Payment Failed!')),
//       );
//     }
//   }



// class PaymentCard extends StatelessWidget {
//   final String paymentType;
//   final String description;
//   final String? cardNumber;
//   final String? expiryDate;
//   final String? cvv;
//   final String? cardHolderName;
//   final VoidCallback onTap;

//   const PaymentCard({
//     required this.paymentType,
//     required this.description,
//     this.cardNumber,
//     this.expiryDate,
//     this.cvv,
//     this.cardHolderName,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       child: Card(
//         elevation: 4,
//         child: Padding(
//           padding: EdgeInsets.all(20),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 paymentType,
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(height: 10),
//               Text(description),
//               if (cardNumber != null) Text('Card Number: $cardNumber'),
//               if (expiryDate != null) Text('Expiry Date: $expiryDate'),
//               if (cvv != null) Text('CVV: $cvv'),
//               if (cardHolderName != null) Text('Card Holder Name: $cardHolderName'),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

