import 'dart:math';

import 'package:example_application/service/api_service.dart';
import 'package:example_application/ui/save_item_page.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SendItemPage extends StatefulWidget {
  final String item;
  SendItemPage({Key? key, required this.item}) : super(key: key);

  @override
  State<SendItemPage> createState() => _SendItemPageState();
}

class _SendItemPageState extends State<SendItemPage> {
  final TextEditingController _inputItemController =
      TextEditingController(text: '');
  final APIService _apiService = APIService();
  Random random = new Random();

  void _sendProcess() {
    _apiService.createItem(random.nextInt(100), _inputItemController.text).then((value){
      if (value.message == 'Request Success') {
        Fluttertoast.showToast(msg: value.message!);
      } else {
        Fluttertoast.showToast(msg: value.message!);
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
              alignment: Alignment.center,
              child: Container(
                  width: double.infinity,
                  height: 100,
                  color: Colors.transparent,
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    children: [
                      const Text('Item dipilih'),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(widget.item.toUpperCase())
                    ],
                  )),
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
                      _sendProcess();
                    },
                    child: const Text(
                      'Kirim',
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
