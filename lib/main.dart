import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:memorygame/wordsResponse.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NewPage(),
    );
  }
}

class NewPage extends StatefulWidget {
  const NewPage({super.key});

  @override
  State<NewPage> createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Firebase Attempt"),
        shadowColor: Colors.black45,
        backgroundColor: Colors.amber,
      ),
      body: const MainScreen(),
    );
  }
}


class MainScreen extends StatelessWidget {
  const MainScreen({super.key});
//daf
  @override
  Widget build(BuildContext context) {
    void callApi() async{
        String url = "http://10.0.2.2:4444/wordsgame/getwords"; //localhost for phone is -> 10.0.2.2
        var response = await http.get(Uri.parse(url));
        print(response.statusCode);
        print(response.body);
        List<String> words = wordsResponseFromJson(response.body);
        print("list $words");
        
    }
    return Container(
      child: ElevatedButton(
        onPressed: () => callApi(),
        child: const Text("asds"),
      ),
    );
  }
}
