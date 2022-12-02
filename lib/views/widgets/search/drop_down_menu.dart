// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controllers/search_controller.dart';

///Menu of sort options
class DropDownMneu extends StatelessWidget {
  const DropDownMneu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ///Available options of sort
    List<String> itemsList = <String>[
      'relevance',
      'hot',
      'top',
      'new',
      'comments',
    ];
    return DropdownButton<String>(
      focusColor: Colors.white,
      iconEnabledColor: Colors.white,
      iconDisabledColor: const Color.fromRGBO(135, 138, 140, 0.1),
      disabledHint: const Text('sort'),
      hint: const Text('sort'),
      value: Provider.of<SearchController>(context).sortDropDownValue,
      items: itemsList.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          ///value is the text that will be sent to the BE
          value: value,
          child: Text(
            value == 'relevance'
                ? 'Relevance'
                : value == 'hot'
                    ? 'Hot'
                    : value == 'new'
                        ? 'New'
                        : value == 'top'
                            ? 'Top'
                            : 'Most Comments',
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),
        );
      }).toList(),
      onChanged: (String? newValue) {
        Provider.of<SearchController>(
          context,
          listen: false,
        ).changSortType(newValue);
      },
    );
  }
}
