import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateOrderScreen extends StatefulWidget {
  static const String name ='create_order_page';
  static const String path ='/create_order_page';
  const CreateOrderScreen({super.key});

  @override
  State<CreateOrderScreen> createState() => _CreateOrderScreenState();
}

class _CreateOrderScreenState extends State<CreateOrderScreen> {
  final TextEditingController fromController =
  TextEditingController(text: "Usmon Nosir street(Tashkent), 6");
  final TextEditingController toController = TextEditingController();

  List<String> searchResults = [];

  void _searchPlaces(String query) {
    if (query.isNotEmpty) {
      setState(() {
        searchResults = [
          "Улица Усмона Носира, 6 | Tashkent",
          "Улица Ибн Сины, 25 | Bukhara",
          "Улица Заргарлик, 12 | Tashkent",
          "Улица Ислама Каримова, 25 | Tashkent",
          "Мечеть Абу Сахи | Чиланзарский район, 156A",
          "Станция метро Беруний | Узбекистанская линия, Tashkent",
        ];
      });
    } else {
      setState(() {
        searchResults.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Создать заказ",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.white,
        leading: Icon(Icons.arrow_back, color: Colors.black),
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(12.w),
            child: Column(
              children: [
                TextField(
                  controller: fromController,
                  readOnly: true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.radio_button_checked,
                        color: Colors.blue),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r)),
                    filled: true,
                    fillColor: Colors.grey.shade200,
                  ),
                ),
                SizedBox(height: 10.h),
                TextField(
                  controller: toController,
                  onChanged: _searchPlaces,
                  decoration: InputDecoration(
                    hintText: "Куда едем?",
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: TextButton(
                      onPressed: () {},
                      child: Text("Карта"),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r)),
                    filled: true,
                    fillColor: Colors.grey.shade200,
                  ),
                ),
              ],
            ),
          ),

          /// Qidiruv natijalari
          Expanded(
            child: ListView.builder(
              itemCount: searchResults.length,
              itemBuilder: (context, index) {
                final place = searchResults[index];
                final parts = place.split("|");
                final title = parts[0].trim();
                final subtitle = parts.length > 1 ? parts[1].trim() : "";

                return ListTile(
                  leading: Icon(Icons.location_on, color: Colors.red),
                  title: Text(title,
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.w500)),
                  subtitle: Text(subtitle,
                      style: TextStyle(fontSize: 14.sp, color: Colors.grey)),
                  onTap: () {
                    print("Tanlandi: $place");
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
