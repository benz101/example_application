import 'dart:async';

import 'package:example_application/helper/formateted_string.dart';
import 'package:example_application/model/item_result.dart';
import 'package:example_application/service/api_service.dart';
import 'package:example_application/ui/save_item_page.dart';
import 'package:flutter/material.dart';

class ListItemPage extends StatefulWidget {
  const ListItemPage({Key? key}) : super(key: key);

  @override
  State<ListItemPage> createState() => _ListItemPageState();
}

class _ListItemPageState extends State<ListItemPage> {
  final TextEditingController _inputItemController =
      TextEditingController(text: '');
  final APIService _apiService = APIService();
  List<ItemResult> _lisItem = [];
  late List<String> _lisItemName;
  @override
  void initState() {
    super.initState();
    _apiService.getListItemResult().then((value) {
      if (value != null) {
        setState(() {
          _lisItem = value;
        });

        for (var item in value) {
          _lisItemName.add(item.name!);
        }

        Timer(Duration.zero, () {
          _inputItemController.text =
              FormattedString.formatted(_lisItemName.toString());
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Daftar Item',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Item'),
                    Container(
                      width: double.infinity,
                      height: 100,
                      color: Colors.transparent,
                      child: TextField(
                        controller: _inputItemController,
                        enabled: false,
                        decoration: const InputDecoration(
                          hintText: 'Masukkan Item',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: 50,
                color: Colors.transparent,
                padding: const EdgeInsets.symmetric(horizontal: 25),
                margin: const EdgeInsets.only(bottom: 15),
                child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(primary: Colors.orange[300]),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return  SaveItemPage(listItem: _lisItemName,);
                      }));
                    },
                    child: const Text(
                      'Simpan',
                      style: TextStyle(color: Colors.black),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
