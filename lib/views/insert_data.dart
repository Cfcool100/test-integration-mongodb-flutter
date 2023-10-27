import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart' as M;
import 'package:mongodb_test/views/display_data.dart';
import '../config/mongodb.dart';
import '../models/categories.model.dart';

class InsertData extends StatefulWidget {
  const InsertData({super.key});

  @override
  State<InsertData> createState() => _InsertDataState();
}

class _InsertDataState extends State<InsertData> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController costController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Mongodb test'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              const Text('title'),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: titleController,
                decoration: const InputDecoration(
                  hintText: 'Enter the title',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Text('Cost'),
              const SizedBox(
                height: 10,
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: costController,
                decoration: const InputDecoration(
                  hintText: 'Enter the cost',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Text('Category'),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: categoryController,
                decoration: const InputDecoration(
                  hintText: 'Enter the category title',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DisplayData(),
                          )),
                      child: const Text('Data view'),
                    ),
                    ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.blueAccent)),
                      onPressed: () async {
                        await _insertData(titleController.text,
                            costController.text, categoryController.text);
                      },
                      child: const Text(
                        'Push',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  IconData categoryIcon() {
    if (categoryController.text == 'food') {
      return Icons.fastfood;
    } else if (categoryController.text == 'subscription') {
      return Icons.subscriptions;
    } else if (categoryController.text == 'transport') {
      return Icons.directions_walk;
    } else {
      return Icons.wallet;
    }
  }

  Future<void> _insertData(String title, String cost, String category) async {
    final id = M.ObjectId();
    final data = Categories(
      id: id,
      icon: categoryIcon().codePoint,
      title: titleController.text,
      cost: int.parse(costController.text),
      date: DateTime.now(),
      category:
          categoryController.text.isEmpty ? 'other' : categoryController.text,
    );
    await DataBase.insert(data);

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Id insert: ${id.$oid}'),
        ),
      );
    }
    _clearInput();
  }

  void _clearInput() {
    titleController.text = '';
    costController.text = '';
    categoryController.text = '';
  }
}
