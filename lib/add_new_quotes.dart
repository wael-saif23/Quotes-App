import 'package:flutter/material.dart';
import 'package:quotes_app/custom_text_field.dart';

class AddNewQuotes extends StatelessWidget {
  const AddNewQuotes(
      {super.key,
      required this.quote,
      required this.auther,
      required this.addQuote,
      required this.myQutoesControl,
      required this.myAutherControl});
  final String quote;
  final String auther;
  final Function addQuote;
  final TextEditingController myQutoesControl;
  final TextEditingController myAutherControl;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showModelBottomSheet(context);
        });
  }

  Future<dynamic> showModelBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        isScrollControlled: true,
        clipBehavior: Clip.hardEdge,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        context: context,
        builder: (context) => Container(
              color: Colors.blue,
              child: Padding(
                padding: EdgeInsets.only(
                    left: 16,
                    right: 16,
                    top: 16,
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: SingleChildScrollView(
                  child: Column(
                    
                    children: [
                      const SizedBox(
                        height: 24,
                      ),
                      CustomTextfiled(
                        maxLines: 5,
                          myControl: myQutoesControl,
                          addIcon: Icons.add,
                          hintText: "Add Quote",
                          title: quote),
                      const SizedBox(
                        height: 24,
                      ),
                      CustomTextfiled(
                          myControl: myAutherControl,
                          addIcon: Icons.person,
                          hintText: "The Auther",
                          title: auther),
                      const SizedBox(
                        height: 24,
                      ),
                      textBottom(context),
                      const SizedBox(
                        height: 24,
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }

  TextButton textBottom(BuildContext context) {
    return TextButton(

                      onPressed: () {
                        addQuote();
                        Navigator.pop(context);
                        myQutoesControl.clear();
                        myAutherControl.clear();

                      },
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.white,
                          fixedSize: const Size.fromWidth(150)),
                      child: const Text("add"),
                    );
  }
}
