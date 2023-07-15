import 'package:flutter/material.dart';
import 'editTopicsScreen.dart';
import 'singleton.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final singleton = Singleton();
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController ageController = TextEditingController();
    TextEditingController genderController = TextEditingController();
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Name',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              TextField(
                  controller: nameController,
                  keyboardType: TextInputType.name,
                  decoration:
                      const InputDecoration(hintText: "Enter your name.")),
              const Text(
                'Age',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              TextField(
                  controller: ageController,
                  keyboardType: TextInputType.number,
                  decoration:
                      const InputDecoration(hintText: "Enter your age")),
              const Text(
                'Gender',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              TextField(
                  controller: genderController,
                  keyboardType: TextInputType.text,
                  decoration:
                      const InputDecoration(hintText: "Enter your gender.")),
              ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      singleton.nameFunc(nameController.text);
                      singleton.ageFunc(ageController.text);
                      singleton.genderFunc(genderController.text);
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const EditTopics()));
                  },
                  child: const Text(
                    'Save',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )),
              const ElevatedButton(
                  onPressed: null,
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ))
            ],
          )),
    );
  }
}
