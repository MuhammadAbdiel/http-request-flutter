import 'package:flutter/material.dart';
import 'package:http_request/list_user_model.dart';
import 'package:http_request/post_result_model.dart';
import 'package:http_request/user_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LisData(),
      // home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PostResultModel? postResultModel;
  UserModel? userModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              userModel != null
                  ? userModel!.id.toString() + ' | ' + userModel!.name
                  : 'Tidak ada data',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 227, 227, 227),
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              ),
              onPressed: () {
                UserModel.connectToApi(5).then((value) {
                  setState(() {
                    userModel = value;
                  });
                });
              },
              child: const Text(
                'GET',
                style: TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              postResultModel != null
                  ? postResultModel!.id +
                      ' \n ' +
                      postResultModel!.name +
                      ' \n ' +
                      postResultModel!.job +
                      ' \n ' +
                      postResultModel!.created
                  : 'Tidak ada data',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 227, 227, 227),
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              ),
              onPressed: () {
                PostResultModel.connectToApi('Muhammad Abdiel Firjatullah',
                        'Chief Technology Officer')
                    .then(
                  (value) {
                    setState(() {
                      postResultModel = value;
                    });
                  },
                );
              },
              child: const Text(
                'POST',
                style: TextStyle(color: Colors.black),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class LisData extends StatefulWidget {
  const LisData({Key? key}) : super(key: key);

  @override
  State<LisData> createState() => _LisDataState();
}

class _LisDataState extends State<LisData> {
  String output = 'No Data';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              output,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 227, 227, 227),
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              ),
              onPressed: () {
                ListUserModel.getUsers(1).then((users) {
                  setState(() {
                    output = '';
                    for (var data in users) {
                      output += data.id.toString() + ' | ' + data.name + '\n';
                    }
                  });
                });
              },
              child: const Text(
                'GET',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
