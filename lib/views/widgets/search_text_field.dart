import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/search_controller.dart';

class SearchTextFieldWidget extends StatelessWidget {
  const SearchTextFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      //MouseRegion widget to detect when the user hover with the mouse on the text field
      onHover: (_) {
        // when the user hover with the mouse on that region ==> to change the colors
        Provider.of<SearchController>(context, listen: false)
            .onHoverTextField();
      },
      onExit: (_) {
        // when the user move the mouse outside the text field region
        Provider.of<SearchController>(context, listen: false).onExitTextField();
      },
      child: TextField(
        //when the user tap on the text field
        onTap: () {
          Provider.of<SearchController>(
            context,
            listen: false,
          ).onTapTextField();
        },
        onTapOutside: (_) {
          //when the user tap outside the search field
          Provider.of<SearchController>(
            context,
            listen: false,
          ).onExitTapTextField();
        },
        //user input will be stored in this controller
        controller:
            Provider.of<SearchController>(context).searchTextFieldcontroller,
        decoration: InputDecoration(
          filled: true, //to can assign filled color
          fillColor: //color of the text field background
              Provider.of<SearchController>(context).fillColorTextField(),
          hoverColor: // color of the text field whrn it is hovered with the mouse
              Provider.of<SearchController>(context).hoverColorTextField(),
          focusedBorder: OutlineInputBorder(
              // when click inside the text field
              borderRadius: BorderRadius.only(
                //0 in App ==> rectangular
                //20 in top only in web ==> circular in the top
                //20 in the web bottom if the user clicked outside the field
                topLeft: Radius.circular(
                    //get the radius from the provider ==> according to the platform
                    Provider.of<SearchController>(context).borderRadius),
                topRight: Radius.circular(
                    Provider.of<SearchController>(context).borderRadius),
                bottomLeft: Radius.circular(
                    //get the radius from the provider ==> according to the platform
                    Provider.of<SearchController>(context).bottomborderRadius),
                bottomRight: Radius.circular(
                    Provider.of<SearchController>(context).bottomborderRadius),
              ),
              borderSide: BorderSide(
                color: Provider.of<SearchController>(context)
                    .focusBorderColorTextField(),
              )),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
                //0 in App==> rectangular
                //20 in web==> circular
                Provider.of<SearchController>(context).borderRadius),
            borderSide: BorderSide(
              color:
                  Provider.of<SearchController>(context).enabledBorderColor(),
            ),
          ),
          hintText: 'Search Reddit',
          //icon in the prefix of the text field
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.grey,
          ),
          //the icon at the end of the textField that allow to delete the text
          suffixIcon: IconButton(
            icon: Provider.of<SearchController>(context).closeIcon,
            onPressed: () {
              Provider.of<SearchController>(context, listen: false)
                  .textFieldSuffixOnPressed();
            },
          ),
        ),
        //the tupe of input in keyboard in the App == Enter key= search icon
        textInputAction: TextInputAction.search,
        keyboardType: TextInputType.text, // any type of text
        maxLines: 1,
        ////////////////////
        //check whether to make text appear from RTL or LTR
        //in web it is always RTL
        //in App it changes according to input language
        textDirection: Provider.of<SearchController>(context).isRTLText
            ? TextDirection.rtl
            : TextDirection.ltr,
        //The function that will be called when the user enter the text he want to search for
        onSubmitted: (_) {
          //check that the user is not sumbitted empty text
          if (Provider.of<SearchController>(context, listen: false)
              .searchTextFieldcontroller
              .text
              .isNotEmpty) {
            Provider.of<SearchController>(context, listen: false)
                .onSubmittingTextField();
          }
        },
        //the function that will be called when the text is changing
        onChanged: (_) {
          Provider.of<SearchController>(context, listen: false)
              .onChangeTextField();
        },
      ),
    );
  }
}
