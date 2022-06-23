import 'package:example_application/model/item_result.dart';
import 'package:example_application/service/api_service.dart';
import 'package:example_application/ui/send_item_page.dart';
import 'package:flutter/material.dart';

class SaveItemPage extends StatefulWidget {
  final List<String> listItem;
  SaveItemPage({Key? key, required this.listItem}) : super(key: key);

  @override
  State<SaveItemPage> createState() => _SaveItemPageState();
}

class _SaveItemPageState extends State<SaveItemPage> {
  final TextEditingController _inputItemController =
      TextEditingController(text: '');
  // Initial Selected Value
  late String dropdownvalue;



  @override
  void initState() {
    super.initState();
    dropdownvalue = widget.listItem[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Daftar Item Tersimpan',
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
                child: Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(
                          color: Colors.black,
                          style: BorderStyle.solid,
                          width: 1)),
                  child: DropdownButton(
                    value: dropdownvalue,
                    underline: const SizedBox(),
                    icon: const Icon(Icons.keyboard_arrow_down),
                    isExpanded: true,
                    itemHeight: 60,
                    items: widget.listItem.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: (String? value) {
                      setState(() {
                        dropdownvalue = value!;
                      });
                    },
                  ),
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
                        return  SendItemPage(item: dropdownvalue,);
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
