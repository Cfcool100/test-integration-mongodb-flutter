import 'package:flutter/material.dart';
import 'package:mongodb_test/config/mongodb.dart';
import 'package:mongodb_test/models/categories.model.dart';

class DisplayData extends StatefulWidget {
  const DisplayData({super.key});

  @override
  State<DisplayData> createState() => _DisplayDataState();
}

class _DisplayDataState extends State<DisplayData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Categories'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: StreamBuilder(
          stream: Stream.fromFuture(DataBase.fetchData()),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    final data = Categories.fromJson(snapshot.data![index]);
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 15.0),
                      child: Card(
                        child: ListTile(
                          leading: CircleAvatar(
                            child: Icon(IconData(data.icon,
                                fontFamily: 'MaterialIcons')),
                          ),
                          title: Text(data.title),
                          subtitle: Text(data.category),
                          trailing: Text(data.cost.toString()),
                        ),
                      ),
                    );
                  });
            } else {
              return const Center(
                child: Text('No Data found'),
              );
            }
          },
        ),
      ),
    );
  }
}
