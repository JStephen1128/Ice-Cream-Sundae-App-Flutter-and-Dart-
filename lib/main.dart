import 'package:flutter/material.dart';
import 'about_screen.dart';
import 'orders_screen.dart';

void main() {
  runApp(const MyApp());
  home: _MyAppState();
}


class MyApp extends StatefulWidget {
  const MyApp ({Key? key}) : super (key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  var _peanuts = false;
  var _almonds = false;
  var _strawberries = false;
  var _gummybears = false;
  var _mms = false;
  var _brownies = false;
  var _oreos = false;
  var _marshmallows = false;

  var _sliderVal = 0;
  var _size = 'Small';
  var _flavor = 'Vanilla';

  var _finalPrice = 0.00;
  var _toppingsPrice = 0.00;
  var _sizePrice = 0.00;
  var _sliderPrice = 0.00;
  static var orders = [];

  void gotoAboutScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AboutScreen(),
      ),
    );
  }

  void gotoOrdersScreen() {
    makeOrder();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OrdersScreen(
          orders: orders,
        ),
      ),
    );
  }

  final _textController = TextEditingController();

  void choiceAction(String choice){
   print(choice);
  }

  void calcPrice() {
    _sizePrice = 0.00;
    _sliderPrice = 0.00;
    _toppingsPrice = 0.00;
    _finalPrice = 0.00;


    if(_size == 'Small'){
      _sizePrice = 2.99;
    }
    if(_size == 'Medium'){
      _sizePrice = 3.99;
    }
    if(_size == 'Large'){
      _sizePrice = 4.99;
    }
    if(_peanuts == true) {
      _toppingsPrice = _toppingsPrice + 0.15;
    }
    if(_almonds == true) {
      _toppingsPrice = _toppingsPrice + 0.15;
    }
    if(_strawberries == true) {
      _toppingsPrice = _toppingsPrice + 0.20;
    }
    if(_mms == true) {
      _toppingsPrice = _toppingsPrice + 0.25;
    }
    if(_brownies == true) {
      _toppingsPrice = _toppingsPrice + 0.20;
    }
    if(_oreos == true) {
      _toppingsPrice = _toppingsPrice + 0.20;
    }
    if(_gummybears == true) {
      _toppingsPrice = _toppingsPrice + 0.20;
    }
    if(_marshmallows == true) {
      _toppingsPrice = _toppingsPrice + 0.15;
    }
    if(_sliderVal == 1) {
      _sliderPrice = 0.15;
    }
    if(_sliderVal == 2) {
      _sliderPrice = 0.25;
    }
    if(_sliderVal == 3) {
      _sliderPrice = 0.30;
    }

    _finalPrice = _sizePrice + _toppingsPrice + _sliderPrice;
  }

  void makeOrder() {
    var date = DateTime.now();
    var size = _size;
    var flavor = _flavor;
    var price = _finalPrice;

    orders.add(date);
    orders.add(size);
    orders.add(flavor);
    orders.add(price);
  }

  @override
    Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            backgroundColor: Color(0xfff1c232),
          title: Text('Josh\u0027s Ice Cream Sundae App'),
          actions: [
            PopupMenuButton<String>(
              onSelected: (choice){
                if (choice == 'About') {
                gotoAboutScreen();
                } else if (choice == 'Friends') {
                gotoOrdersScreen();
                }
              },
              itemBuilder: (BuildContext context){
                return [
                  PopupMenuItem(
                    child: Text('About'),
                    value: 'About',
                  ),
                  PopupMenuItem(
                    child: Text('Order History'),
                    value: 'Order History',
                  ),
                ];
              }
            )
          ]
        ),
        body: SafeArea(
          child: Column( mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Image.asset('assets/images/Sundae.png'),
                  const Text('Sundae',
                  style: TextStyle(
                    fontSize: 24.0,
                  )),
                ],
              ),
              Container(
                child: Text('\$$_finalPrice', style: TextStyle(fontSize: 24.0)),
              ),
              Column(
                  children :[
                  DropdownButton(
                      items:[
                        DropdownMenuItem(
                          child: Text('Small'),
                          value: "Small", onTap: () {calcPrice();}
                        ),
                        DropdownMenuItem(
                          child: Text('Medium'),
                          value: "Medium", onTap: () {calcPrice();}
                        ),
                        DropdownMenuItem(
                          child: Text('Large'),
                          value: "Large", onTap: () {calcPrice();}
                        ),
                      ],
                      value: _size,
                      onChanged: (String? str){
                        setState(() {
                          _size = str!;
                        });
                      }),
                    DropdownButton(
                        items:[
                          DropdownMenuItem(
                            child: Text('Vanilla'),
                            value: "Vanilla",
                          ),
                          DropdownMenuItem(
                            child: Text('Chocolate'),
                            value: "Chocolate",
                          ),
                          DropdownMenuItem(
                            child: Text('Strawberry'),
                            value: "Strawberry",
                          ),
                        ],
                        value: _flavor,
                        onChanged: (String? str){
                          setState(() {
                            _flavor = str!;
                          });
                        })
              ]),

              Column(
                children : [
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  value: _peanuts,
                  onChanged: (bool? val){
                    setState(() {
                    _peanuts = val!;
                    calcPrice();
                  });
                },
                  title: Text('Peanuts'),
                ),

                  CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    value: _almonds,
                    onChanged: (bool? val){
                      setState(() {
                        _almonds = val!;
                        calcPrice();
                      });
                    },
                    title: Text('Almonds'),
                  ),
                  CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    value: _strawberries,
                    onChanged: (bool? val){
                      setState(() {
                        _strawberries = val!;
                        calcPrice();
                      });
                    },
                    title: Text('Strawberries'),
                  ),
                  CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    value: _gummybears,
                    onChanged: (bool? val){
                      setState(() {
                        _gummybears = val!;
                        calcPrice();
                      });
                    },
                    title: Text('Gummy Bears'),
                  ),

                  CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    value: _mms,
                    onChanged: (bool? val){
                      setState(() {
                        _mms = val!;
                        calcPrice();
                      });
                    },
                    title: Text('M&Ms'),
                  ),

                  CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    value: _brownies,
                    onChanged: (bool? val){
                      setState(() {
                        _brownies = val!;
                        calcPrice();
                      });
                    },
                    title: Text('Brownies'),
                  ),
                  CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    value: _oreos,
                    onChanged: (bool? val){
                      setState(() {
                        _oreos = val!;
                        calcPrice();
                      });
                    },
                    title: Text('Oreos'),
                  ),
                  CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    value: _marshmallows,
                    onChanged: (bool? val){
                      setState(() {
                        _marshmallows = val!;
                        calcPrice();
                      });
                    },
                    title: Text('Marshmallows'),
                  ),
              ]

              ),
              Column (
                children : [
                  Text("Fudge"),
                  Slider(
                    value: _sliderVal.toDouble(),
                    min: 0.0,
                    max: 3.0,
                    label: _sliderVal.toString(),
                    onChanged: (double val){
                      setState((){
                        _sliderVal = val.toInt();
                        calcPrice();
                      });
                    }
                  )
                ]
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                    onPressed: () {
                      _size = 'Large';
                      _flavor = 'Vanilla';
                      _mms = true;
                      _almonds = true;
                      _peanuts = true;
                      _strawberries = true;
                      _gummybears = true;
                      _brownies = true;
                      _oreos = true;
                      _marshmallows = true;
                      setState(() {});
                      calcPrice();

                    },
                        child: Text('The Works',
                          style: TextStyle(
                          fontSize: 20.0,
                        )),),
                    TextButton(
                        onPressed: () {
                          _mms = false;
                          _almonds = false;
                          _peanuts = false;
                          _strawberries = false;
                          _gummybears = false;
                          _brownies = false;
                          _oreos = false;
                          _marshmallows = false;
                          setState(() {});
                          _sliderVal = 0;
                          _finalPrice = 0.00;
                        },
                        child: Text('Reset',
                            style: TextStyle(
                              fontSize: 20.0,
                            )),),
                    TextButton(
                        onPressed: () {

                          makeOrder();
                          print(orders);

                        },
                        child: Text('Order',
                            style: TextStyle(
                              fontSize: 20.0,
                            )),),
                  ]
                )
              ),
            ]
          )
        )
      )
    );
  }
}

