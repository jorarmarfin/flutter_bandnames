import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_band_names/models/models.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static String routerName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<BandModel> bands = [
    BandModel(id: '1', name: 'Metalica', votes: 5),
    BandModel(id: '2', name: 'Queen', votes: 1),
    BandModel(id: '3', name: 'Heroes del silencio', votes: 2),
    BandModel(id: '4', name: 'Bon Jove', votes: 5),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Bandas',
          style: TextStyle(color: Colors.black87),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: bands.length,
        itemBuilder: (context, index) => _bandTile(index),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: addNewBand, child: const Icon(Icons.add)),
    );
  }

  Widget _bandTile(int index) {
    return Dismissible(
      key: Key(bands[index].id),
      direction: DismissDirection.startToEnd,
      onDismissed: (direction) {
        print('direccion : $direction');
      },
      background: Container(
          padding: const EdgeInsets.all(8.0),
          color: Colors.red,
          child: const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Eliminar',
                style: TextStyle(color: Colors.white),
              ))),
      child: ListTile(
        leading: CircleAvatar(child: Text(bands[index].name.substring(0, 2))),
        title: Text(bands[index].name),
        trailing:
            Text('${bands[index].votes}', style: const TextStyle(fontSize: 20)),
        onTap: () {
          print(bands[index].name);
        },
      ),
    );
  }

  addNewBand() {
    final textController = TextEditingController();
    if (Platform.isAndroid) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Nueva banda'),
              content: TextField(controller: textController),
              actions: [
                MaterialButton(
                  elevation: 5,
                  textColor: Colors.blue,
                  onPressed: () => addBandToList(textController.text),
                  child: const Text('Agregar'),
                )
              ],
            );
          });
    }
  }

  void addBandToList(String name) {
    print(name);
    if (name.length > 1) {
      bands.add(BandModel(id: DateTime.now().toString(), name: name, votes: 0));
      setState(() {});
    }
    Navigator.pop(context);
  }
}
