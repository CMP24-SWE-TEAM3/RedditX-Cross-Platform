import 'package:flutter/material.dart';

class DefaultDropDownButtonWidget extends StatelessWidget {
  final int optionsCount;
  final List<String> listValues;

  final Map<String, IconData> map;
  final double width;

  const DefaultDropDownButtonWidget(
      {super.key,
      required this.optionsCount,
      required this.listValues,
      required this.map,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      icon: const Icon(Icons.more_vert),
      //value: dropdownValue,
      items: listValues.map((name) {
        return DropdownMenuItem<String>(
            value: name,
            child: SizedBox(
              height: 20,
              width: width,
              child: Row(
                children: [
                  Icon(
                    map[name],
                    color: Colors.black,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    child: Text(
                      name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 15),
                    ),
                  )
                ],
              ),
            ));
      }).toList(),
      onChanged: (selectedName) {},
    );
  }
}
