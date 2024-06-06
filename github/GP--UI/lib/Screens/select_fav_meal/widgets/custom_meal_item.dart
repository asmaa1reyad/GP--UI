import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class CustomMealItem extends StatefulWidget {
  const CustomMealItem({
    Key? key,
    required this.meal,
  }) : super(key: key);

  final String meal;

  @override
  State<CustomMealItem> createState() => _CustomMealItemState();
}

class _CustomMealItemState extends State<CustomMealItem> {
  bool tapped = false;

  Future<void> _sendRequest() async {
    try {
      final response = await http.post(
        Uri.parse('https://example.com/api/meal'),
        body: {'meal': widget.meal},
      );

      if (response.statusCode == 200) {
        // تم التواصل مع الخادم بنجاح
        // يمكنك التعامل مع الاستجابة هنا
      } else {
        // فشل التواصل مع الخادم
        print('Failed to send request: ${response.reasonPhrase}');
      }
    } catch (error) {
      // حدث خطأ ما أثناء الاتصال بالخادم
      print('Error sending request: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 50,
      backgroundColor: tapped ? const Color(0xfffc9c84) : const Color.fromARGB(255, 255, 105, 36),
      child: GestureDetector(
        onTap: () {
          setState(() {
            tapped = !tapped;
          });
          // إرسال الطلب عند النقر على البند
          _sendRequest();
        },
        child: Center(
          child: Text(
            widget.meal,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}