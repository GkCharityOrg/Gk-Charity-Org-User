import 'package:flutter/material.dart';

class Status extends StatelessWidget {
  const Status({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Status",
          style: TextStyle(color: Colors.black, letterSpacing: 1),
        ),
      ),
      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.all(5),
              child: Card(
                child: ListTile(
                  title: Text(
                    "Request No: 567892",
                  ),
                  subtitle: Text(
                    "Under processing",
                    style: TextStyle(color: Colors.red.shade400),
                  ),
                  trailing: Text("26-3-2023"),
                ),
              ),
            );
          }),
    );
  }
}
