import 'package:flutter/material.dart';
import 'package:currency_app/components/api_client.dart';
import 'package:currency_app/components/drop_down.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiClient client = ApiClient();
  late List<String> currencies;
  late String from;
  late String to;
  late double rate;
  String result = "";
  @override
  void initState(){
    super.initState();
    (() async{
      List<String> list = await client.getCurrencies();
      setState((){
        currencies = list;
      });
    })();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                padding: const EdgeInsets.all(8.0),
                child: const Text('Currency Converter', style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,))),
          ],

        ),
        backgroundColor: const Color(0xFF00796B),
      ),
      backgroundColor: const Color(0xFF00796B),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextField(
                      onSubmitted: (value) async {
                        rate = await client.getRate(from,to);
                        setState(() {
                          result =
                              (rate * double.parse(value)).toStringAsFixed(3);
                        });
                      },
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                          labelText:"The value you want to convert..",
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 18,
                          color: Colors.black
                        )
                      ),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        customDropDown(currencies, from, (val) {
                          setState((){
                            from = val;
                          });
                        }),
                        FloatingActionButton(
                          onPressed: (){
                            String temp = from;
                            setState(() {
                              from = to;
                              to = temp;
                            });
                          },
                          child:const Icon(Icons.swap_horiz),
                          elevation:0.0,
                          backgroundColor: const Color(0xFF00796B),
                        ),
                        customDropDown(currencies, to, (val){
                          setState(() {
                            to = val;
                          });
                        }),
                      ],
                    ),
                    const SizedBox(height: 15.0),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Column(
                        children: [
                          const Text("result",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                              )),
                          Text(result,
                              style: const TextStyle(
                                color: Color(0xFF00796B),
                                fontSize: 36.0,
                                fontWeight: FontWeight.bold,
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}

