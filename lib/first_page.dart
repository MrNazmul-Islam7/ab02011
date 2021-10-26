import 'package:ab02011/main.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

String name = '';
bool show = true;
bool changeButton = false;

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Log in',
                style: TextStyle(fontSize: 40),
              ),
              SizedBox(
                height: 200,
              ),
              Text(
                'Welcome $name',
                style: TextStyle(fontSize: 40),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter Your Name',
                    labelText: 'Name',
                  ),
                  onChanged: (value) {
                    setState(() {
                      name = value;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  obscureText: show,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    labelText: 'Password',
                    suffix: TextButton(
                      onPressed: () {
                        setState(() {
                          show = !show;
                        });
                      },
                      child: show ? Text('Show') : Text('Hide'),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 100,
              ),
              InkWell(
                onTap: () async {
                  setState(() {
                    changeButton = !changeButton;
                  });
                  await Future.delayed(Duration(seconds: 2));
                  Navigator.pushNamed(context, MyRoute.secondPage);
                },
                child: AnimatedContainer(
                  duration: Duration(seconds: 2),
                  width: changeButton ? 50 : 300,
                  padding: EdgeInsets.all(10),
                  child: changeButton
                      ? Icon(Icons.done_outlined)
                      : Text(
                          'Login',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                          ),
                        ),
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius:
                          BorderRadius.circular(changeButton ? 30 : 50)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
