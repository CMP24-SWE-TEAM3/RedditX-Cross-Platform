import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../../controllers/create_community_controller.dart';
import '../../../models/create_community_model.dart';
import '../../widgets/create_community/create_community_widgets.dart';

///screen for creating new communities
class CreateCommunityScreen extends StatelessWidget {
  ///Email Text field controller for create community name field
  final TextEditingController createCommunityTextFieldController =
      TextEditingController();

  ///Create Community screen screen route name
  static const routeName = '/Create_Community';

  ///create community form key needed in validation
  final _formKey = GlobalKey<FormState>();

  CreateCommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int? createCommunityIndex =
        Provider.of<CreateCommunityViewModelController>(context)
            .createCommunityIndex;
    bool? plus18 =
        Provider.of<CreateCommunityViewModelController>(context).plus18;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        leading: InkWell(
          child: const Icon(Icons.arrow_back),
          onTap: () => Navigator.pop(context),
        ),
        title: const Text("Create a community"),
      ),
      body: Container(
        color: Colors.white,
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const SizedBox(
                height: 15,
                width: double.infinity,
              ),
              const CreateCommunityLabel(title: "Community name"),
              const SizedBox(
                height: 5,
                width: double.infinity,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 18, 5),
                child: TextFormField(
                  key: const ValueKey('Community_name_Text'),
                  maxLength: 21,
                  controller: createCommunityTextFieldController,
                  cursorColor: Colors.blue,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[150],
                    prefixText: "r/",
                    helperMaxLines: 3,
                    helperStyle: const TextStyle(color: Colors.grey),
                    helperText:
                        "Community names must be between 3-21 characters,and can only contain letters,numbers or underscores",
                    hintText: 'community_name',
                    hintStyle: TextStyle(color: Colors.grey[500]),
                    suffixIcon: IconButton(
                      onPressed: createCommunityTextFieldController.clear,
                      icon: const Icon(Icons.clear_rounded),
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp("[a-zA-Z0-9_]")),
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a name first';
                    }
                    return null;
                  },
                ),
              ),
              const CreateCommunityLabel(
                title: "Community type",
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    InkWell(
                      key: const ValueKey('Community_Type_Button'),
                      onTap: () {
                        showModalBottomSheet(
                          constraints: BoxConstraints.tightFor(
                              height:
                                  createCommunitySheetDescription.length * 80),
                          context: context,
                          isScrollControlled: false,
                          builder: (context) => ListView(
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text("Community type"),
                              ),
                              const Divider(
                                thickness: 2,
                                color: Colors.black26,
                                indent: 20,
                                endIndent: 20,
                              ),
                              for (int i = 0;
                                  i < createCommunitySheetTitle.length;
                                  i++)
                                CreateCommunitySheetTile(
                                  title: createCommunitySheetTitle[i],
                                  subTitle: createCommunitySheetDescription[i],
                                  index: i,
                                  leadingIcon:
                                      Icon(createCommunitySheetIcons[i]),
                                  context: context,
                                ),
                            ],
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                  createCommunitySheetTitle[
                                      createCommunityIndex!],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold)),
                              const Icon(Icons.arrow_drop_down),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 1.2,
                                child: Text(
                                  createCommunitySheetDescription[
                                      createCommunityIndex],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey),
                                  maxLines: 7,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    ListTile(
                      title: const Text(
                        "18+ community",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      trailing: Switch(
                        key: const ValueKey('plus18_Button'),
                        value: plus18!,
                        onChanged: (_) =>
                            Provider.of<CreateCommunityViewModelController>(
                          context,
                          listen: false,
                        ).togglePlus18(),
                        activeColor: Colors.white,
                        inactiveTrackColor: Colors.grey,
                        activeTrackColor: Colors.blue,
                        splashRadius: 20,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 50,
                  child: OutlinedButton(
                    key: const ValueKey('Create_Community_Button'),
                    onPressed: () {
                      // Validate returns true if the form is valid, or false otherwise.
                      if (_formKey.currentState!.validate()) {
                        // If the form is valid, display a snackbar. In the real world,
                        // you'd often call a server or save the information in a database.
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')),
                        );
                        Provider.of<CreateCommunityViewModelController>(context,
                                listen: false)
                            .createCommunity(
                                createCommunityTextFieldController.text,
                                context);
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.blue[900]),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: const BorderSide(color: Colors.blue)),
                      ),
                    ),
                    child: const Text(
                      "Create community",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextButton(
                  key: const ValueKey('Community_rules_Button'),
                    onPressed: () => showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: const Text("Community rules"),
                              content: SizedBox(
                                width: MediaQuery.of(context).size.width / 1.3,
                                height:
                                    MediaQuery.of(context).size.height / 1.9,
                                child: ListView(
                                  children: [
                                    const Divider(
                                      height: 5,
                                      thickness: 3,
                                    ),
                                    Text(communityRules!),
                                    ElevatedButton(
                                      onPressed: () =>
                                          Navigator.of(context).pop(),
                                      child: const Text("I Understand"),
                                    )
                                  ],
                                ),
                              ),
                            )),
                    child: const Text("Rules")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
