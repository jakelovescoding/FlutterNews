import 'package:flutter/material.dart';
import 'package:flutter_application_1/newsScreen.dart';
import 'singleton.dart';

class EditTopics extends StatefulWidget {
  const EditTopics({super.key});

  @override
  State<EditTopics> createState() => _EditTopicsState();
}

class _EditTopicsState extends State<EditTopics> {
  final singleton = Singleton();
  List<String> topics = [
    'Agriculture',
    'Animals',
    'Architecture',
    'Arts',
    'Auto',
    'Aviation',
    'Banking',
    'Biotechnology',
    'Boating',
    'Books',
    'Building',
    'Business',
    'Charity',
    'Community',
    'Disability',
    'Economics',
    'Education',
    'Employment',
    'Energy',
    'Engineering',
    'Environment',
    'Fitness',
    'Food',
    'Games',
    'Government',
    'Medical',
    'Photography',
    'Religion',
    'Science',
    'Sport',
    'Technology',
    'Travel'
  ];
  List<Color> tileColors = [];

  @override
  void initState() {
    super.initState();
    // Initialize the tileColors list based on initial selection state
      tileColors = List.generate(topics.length, (index) {
      return singleton.topics.contains(topics[index]) ? Colors.green : Colors.white;
    });
  }

  void _changeColor(bool selected, int i) {
    setState(() {
      tileColors[i] = selected ? Colors.green : Colors.white;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding:
                const EdgeInsets.only(left: 30, top: 50, bottom: 30, right: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(bottom: 0.0),
                  child: Text(
                    'Choose your topics',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: topics.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(topics[index]),
                        onTap: () async {
                          if (singleton.topics.contains(topics[index])) {
                            singleton.removeTopic(topics[index]);
                            _changeColor(false, index);
                          } else {
                            singleton.addTopic(topics[index]);
                            _changeColor(true, index);
                          }
                        },
                        tileColor: tileColors[index],
                      );
                    },
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NewsScreen()));
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
            )));
  }
}
