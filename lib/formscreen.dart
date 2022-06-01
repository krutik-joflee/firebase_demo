import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_demo/user_collection_repo.dart';
import 'package:firebase_demo/user_model.dart';
import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController salarycontroller = TextEditingController();
  TextEditingController mobilenumbercontroller = TextEditingController();

  @override
  void initState() {
    namecontroller.text = '';
    emailcontroller.text = '';
    salarycontroller.text = '';
    mobilenumbercontroller.text = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("FORM"),
          centerTitle: true,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextFormField(
                  controller: namecontroller,
                  decoration: const InputDecoration(
                    hintText: "Enter the name",
                    labelText: "Name",
                  ),
                ),
                TextFormField(
                  controller: emailcontroller,
                  decoration: const InputDecoration(
                    hintText: "Enter email",
                    labelText: "Email",
                  ),
                ),
                TextFormField(
                  controller: salarycontroller,
                  decoration: const InputDecoration(
                    hintText: "Enter salary",
                    labelText: "Salary",
                  ),
                  keyboardType: TextInputType.number,
                ),
                TextFormField(
                  controller: mobilenumbercontroller,
                  decoration: const InputDecoration(
                    hintText: "Enter mobilenumber",
                    labelText: "Mobilenumber",
                  ),
                  keyboardType: TextInputType.phone,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    child: const Text("Submit"),
                    onPressed: () {
                      UserCollectionRepo.addUser(
                          user: MyUser(
                        name: namecontroller.text,
                        email: emailcontroller.text,
                        salary: int.parse(salarycontroller.text),
                        mobile: int.parse(mobilenumbercontroller.text),
                      ));
                      Navigator.pop(context);
                    },
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
