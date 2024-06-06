// import 'package:flutter/material.dart';
// import 'package:foodhub/Screens/Dashboard.dart';
// import 'package:foodhub/Screens/Cart.dart';
// import 'package:foodhub/Widgets/CategoriesCard.dart';
// import 'package:foodhub/Widgets/card.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:page_transition/page_transition.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';
// import 'package:http/http.dart' as http;
// class CategoriesScreen extends StatelessWidget {
//   const CategoriesScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(

//       floatingActionButton: FloatingActionButton(
//          onPressed: () {
//         // استدعاء الدالة لإرسال الريكويست
//              sendRequest();
//          },
//         child: Icon(Icons.send),
//        ),
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Column(children: [
//           Row(
//             children: [
//               Container(
//                 height: MediaQuery.of(context).size.height * 0.5,
//                 width: MediaQuery.of(context).size.width * 0.5,
//                 alignment: Alignment.topLeft,
//                 child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Padding(
//                         padding:
//                             EdgeInsets.symmetric(horizontal: 20, vertical: 30),
//                         child: GestureDetector(
//                           onTap: () {
//                             Navigator.pop(
//                                 context,
//                                 PageTransition(
//                                     type: PageTransitionType.fade,
//                                     child: Dashboard()));
//                           },
//                           child: Container(
//                             height: 38,
//                             width: 38,
//                             decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 borderRadius: BorderRadius.circular(12),
//                                 boxShadow: const [
//                                   BoxShadow(
//                                       color: Color.fromARGB(255, 236, 234, 234),
//                                       blurRadius: 20,
//                                       spreadRadius: 1)
//                                 ]),
//                             child: const Icon(
//                               Icons.arrow_back,
//                               color: Colors.black,
//                             ),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 20),
//                         child: Row(children: [
//                           Text(
//                             "Fast",
//                             style: GoogleFonts.poppins(
//                                 fontSize: 23.sp,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.black87),
//                           ),
//                         ]),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 20),
//                         child: Row(children: [
//                           Text(
//                             "Food",
//                             style: GoogleFonts.poppins(
//                                 fontSize: 26.sp,
//                                 fontWeight: FontWeight.bold,
//                                 color: Color.fromARGB(255, 248, 79, 0)),
//                           ),
//                         ]),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 20),
//                         child: Row(children: [
//                           Text(
//                             "80 types of pizza",
//                             style: GoogleFonts.poppins(
//                                 fontSize: 16.sp,
//                                 fontWeight: FontWeight.w400,
//                                 color: Color.fromARGB(255, 139, 139, 139)),
//                           ),
//                         ]),
//                       ),
//                     ]),
//               ),
//               Spacer(),
//               Container(
//                 height: MediaQuery.of(context).size.height * 0.3,
//                 width: MediaQuery.of(context).size.width * 0.5,
//                 decoration: const BoxDecoration(
//                   image: DecorationImage(
//                     image: AssetImage("assets/images/pizza.jpg"),
//                     fit: BoxFit
//                         .contain, // This ensures the image covers the entire container
//                     alignment:
//                         Alignment.topRight, // Aligns the image to the top right
//                   ),
//                 ),
//               )
//             ],
//           ),
//           const SizedBox(
//             height: 40,
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 22),
//             child: Row(
//               children: [
//                 Text(
//                   "Sort by:",
//                   style: GoogleFonts.nunito(
//                     fontSize: 15.sp,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 const SizedBox(
//                   width: 10,
//                 ),
//                 Text(
//                   "Popular",
//                   style: GoogleFonts.nunito(
//                       fontSize: 15.sp,
//                       fontWeight: FontWeight.w700,
//                       color: Colors.orange.shade800),
//                 ),
//                 Icon(
//                   Icons.arrow_drop_down,
//                   color: Colors.orange.shade800,
//                 ),
//                 Spacer(),
//                 Container(
//                   height: MediaQuery.of(context).size.height * 0.05,
//                   width: MediaQuery.of(context).size.width * 0.1100,
//                   decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(6),
//                       boxShadow: const [
//                         BoxShadow(
//                             color: Color.fromARGB(115, 202, 202, 202),
//                             offset: Offset(0, 14),
//                             blurRadius: 20,
//                             spreadRadius: 1)
//                       ]),
//                   child: Icon(Icons.tune, color: Colors.orange.shade800),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(
//             height: 25,
//           ),
//           Expanded(
//             child: Container(
//               height: 200,
//               child: ListView(
//                   scrollDirection: Axis.vertical,
//                   physics: BouncingScrollPhysics(),
//                   children: [
//                     GestureDetector(
//                         onTap: () {
//                           Navigator.push(
//                               context,
//                               PageTransition(
//                                   type: PageTransitionType.fade,
//                                   child: Cart()));
//                         },
                        
//                         child: CategoriesCard()),
//                     CategoriesCard(),
//                     CategoriesCard(),
//                   ]),
//             ),
//           )
//         ]),
//       ),
//     );
//   }
// }

// Future<void> sendRequest() async {
//   // عنوان الخادم الذي سيتم إرسال الريكويست إليه
//   const String url = 'http://example.com/api/categories';

//   try {
//     // إرسال الريكويست
//     final response = await http.get(Uri.parse(url));

//     // التحقق من رمز الاستجابة
//     if (response.statusCode == 200) {
//       // يمكنك تنفيذ أي إجراءات إضافية هنا بعد الاستجابة الناجحة
//       print('Request sent successfully');
//     } else {
//       // في حالة فشل الريكويست
//       print('Failed to send request: ${response.reasonPhrase}');
//     }
//   } catch (e) {
//     // في حالة حدوث خطأ أثناء إرسال الريكويست
//     print('Error sending request: $e');
//   }
// }