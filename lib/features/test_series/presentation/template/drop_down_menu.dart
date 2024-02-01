import 'package:flutter/material.dart';

class DropdownMenuExample extends StatefulWidget {
  final List<String> itemList;
  final String dropDownText;
  const DropdownMenuExample(
      {super.key, required this.itemList, required this.dropDownText});

  @override
  State<DropdownMenuExample> createState() => _DropdownMenuExampleState();
}

class _DropdownMenuExampleState extends State<DropdownMenuExample> {
  String? dropdownValue;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(
              color: const Color.fromRGBO(
                121,
                119,
                119,
                1,
              ),
            ),
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: DropdownButton(
            underline: const SizedBox(),
            hint: Text(
              widget.dropDownText,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            // hint: Text("sgkjdsg"),
            icon: const Icon(
              Icons.keyboard_arrow_down_rounded,
              size: 40,
              color: Color.fromRGBO(
                121,
                119,
                119,
                1,
              ),
            ),
            items: widget.itemList.map((String val) {
              return DropdownMenuItem(
                value: val,
                child: Text(val),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                dropdownValue = value!;
              });
            },
            value: dropdownValue,
          ),
        ));
  }
}
