import 'package:flutter/material.dart';
import 'package:kalliyath_villa/Screens/villadetails_page/reviewbox_tile/add_review/add_rating.dart';

Future<void> writereviewdialogue(
    {required BuildContext context,
    required Size size,
    required Map<String, dynamic> details}) async {
  TextEditingController reviewcontroller = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: AlertDialog(
            backgroundColor: Colors.black,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            title: const Center(
              child: Text(
                'Write a Review',
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 15,
                  fontFamily: 'Kalliyath2',
                  fontWeight: FontWeight.w200,
                ),
              ),
            ),
            content: SizedBox(
              width: size.width,
              height: size.height / 10,
              child: Form(
                  key: formkey,
                  child: TextFormField(
                    controller: reviewcontroller,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please write a review';
                      }
                      return null;
                    },
                    maxLines: null,
                    style: const TextStyle(
                        color: Colors.white), // Set text color to white
                    decoration: InputDecoration(
                      fillColor: const Color.fromARGB(255, 240, 238, 238),
                      labelText: 'Review',
                      labelStyle: const TextStyle(
                        fontSize: 13,
                        fontFamily: 'Kalliyath',
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 2.0,
                        ),
                      ),
                    ),
                  )),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Cancel',
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 13,
                    fontFamily: 'Kalliyath2',
                    fontWeight: FontWeight.w200,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  submit(reviewcontroller.text.trim(), formkey, details['id'],
                      context, size, details);
                },
                child: const Text(
                  'Submit',
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 13,
                    fontFamily: 'Kalliyath2',
                    fontWeight: FontWeight.w200,
                  ),
                ),
              ),
            ],
          ),
        );
      });
}

submit(String review, GlobalKey<FormState> key, String id, context, Size size,
    Map<String, dynamic> details) {
  if (key.currentState!.validate()) {
    Navigator.pop(context);
    addstardialogue(
        context: context, size: size, id: id, review: review, details: details);
  } else {
    return;
  }
}
