import 'package:flutter/material.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class CreateSearchPage extends StatefulWidget {
  const CreateSearchPage({super.key});

  @override
  State<CreateSearchPage> createState() => _CreateSearchPageState();
}

class _CreateSearchPageState extends State<CreateSearchPage> {
  final TextEditingController _controller = TextEditingController();
  List<SuggestItem> _suggestions = [];

  Future<void> _getSuggestions(String query) async {
    if (query.isEmpty) {
      setState(() => _suggestions.clear());
      return;
    }

    final (session, resultFuture) = await YandexSuggest.getSuggestions(
      text: query,
      boundingBox: const BoundingBox(
        southWest: Point(latitude: 41.0, longitude: 68.0),
        northEast: Point(latitude: 45.0, longitude: 72.0),
      ),
      suggestOptions: const SuggestOptions(
        suggestType: SuggestType.geo,
        suggestWords: true,
      ),
    );

    final result = await resultFuture;

    if (result.items != null) {
      setState(() {
        _suggestions = result.items!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Создать заказ"), centerTitle: true),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search, color: Colors.black54),
                hintText: "Manzil kiriting...",
                suffixIcon: _controller.text.isNotEmpty
                    ? IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    _controller.clear();
                    setState(() => _suggestions.clear());
                  },
                )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onChanged: _getSuggestions,
            ),
          ),

          const Divider(),

          Expanded(
            child: ListView.builder(
              itemCount: _suggestions.length,
              itemBuilder: (context, index) {
                final item = _suggestions[index];
                return ListTile(
                  leading: const Icon(Icons.location_on, color: Colors.orange),
                  title: Text(item.displayText ?? "Noma’lum joy"),
                  subtitle: Text(item.subtitle ?? ""),
                  onTap: () {
                    _controller.text = item.displayText ?? "";
                    setState(() => _suggestions.clear());
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

