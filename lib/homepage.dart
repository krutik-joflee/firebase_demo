// ignore_for_file: avoid_print, prefer_const_constructors_in_immutables, prefer_const_constructors

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_demo/formscreen.dart';
import 'package:firebase_demo/user_collection_repo.dart';
import 'package:firebase_demo/user_model.dart';
import 'package:flutter/material.dart';

class Myhomepage extends StatefulWidget {
  Myhomepage({Key? key}) : super(key: key);

  @override
  State<Myhomepage> createState() => _MyhomepageState();
}

class _MyhomepageState extends State<Myhomepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Cloud"),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => FormScreen()));
          },
          child: Icon(Icons.add),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            await UserCollectionRepo.getUsers();
            setState(() {});
          },
          child: FutureBuilder(
              future: UserCollectionRepo.getUsers(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<QueryDocumentSnapshot>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.data == null) {
                  return Center(
                    child: Text("No data"),
                  );
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final user = myUserModelFromJson(
                            jsonEncode(snapshot.data![index].data()));
                        return Card(
                          child: ListTile(
                            title: Text(user.name ?? "N/A"),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("${user.mobile ?? 0}"),
                                Text("${user.salary ?? 0}"),
                                Text(user.email ?? ''),
                              ],
                            ),
                          ),
                        );
                      });
                }
              }),
        ));
  }
}
