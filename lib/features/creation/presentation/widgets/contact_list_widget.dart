import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';

class ContactBottomSheetDemo extends StatefulWidget {
  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => ContactBottomSheetDemo(),
    );
  }

  @override
  _ContactBottomSheetDemoState createState() => _ContactBottomSheetDemoState();
}

class _ContactBottomSheetDemoState extends State<ContactBottomSheetDemo> {
  List<Contact> contacts = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchContacts();
  }

  Future<void> _fetchContacts() async {
    try {
      // Permission tekshirish
      final permission = await FlutterContacts.requestPermission();
      print('Permission status: $permission'); // Debug uchun
      
      if (permission) {
        // Barcha kontaktlarni olish
        final allContacts = await FlutterContacts.getContacts(
          withProperties: true,
          withPhoto: false, // Rasm kerak emas
        );
        
        print('Total contacts found: ${allContacts.length}'); // Debug uchun
        
        setState(() {
          // Faqat ism va telefon raqami bor kontaktlarni olish
          contacts = allContacts.where((contact) {
            final hasName = contact.displayName.isNotEmpty;
            final hasPhone = contact.phones.isNotEmpty;
            print('Contact: ${contact.displayName}, hasPhone: $hasPhone'); // Debug uchun
            return hasName && hasPhone;
          }).toList();
          
          print('Filtered contacts: ${contacts.length}'); // Debug uchun
          isLoading = false;
        });
      } else {
        print('Permission denied'); // Debug uchun
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      print('Error fetching contacts: $e'); // Debug uchun
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          // Handle bar
          Container(
            margin: EdgeInsets.only(top: 12),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          // Header
          Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                Text(
                  'Выберите контакт',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                Spacer(),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.close, color: Colors.grey[600]),
                ),
              ],
            ),
          ),

          // Content
          Expanded(
            child: isLoading
                ? Center(child: CircularProgressIndicator())
                : contacts.isEmpty
                ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Контакты не найдены',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _fetchContacts,
                    child: Text('Обновить'),
                  ),
                ],
              ),
            )
                : ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 20),
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                final contact = contacts[index];
                final phone = contact.phones.isNotEmpty
                    ? contact.phones.first.number
                    : "raqam yo‘q";

                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.blue[100],
                    child: Text(
                      contact.displayName.isNotEmpty
                          ? contact.displayName[0].toUpperCase()
                          : "?",
                      style: TextStyle(
                        color: Colors.blue[800],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  title: Text(
                    contact.displayName,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  subtitle: Text(
                    phone,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context, contact);
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
