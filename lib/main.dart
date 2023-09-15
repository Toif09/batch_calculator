import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApps());
}

class MyApps extends StatefulWidget {
  const MyApps({super.key});

  @override
  State<MyApps> createState() => _MyAppsState();
}

class _MyAppsState extends State<MyApps> {
  //kontroler digunakan untuk mendapatkan data user
  final _textController = TextEditingController();
  final _textController1 = TextEditingController();
  final _textController2 = TextEditingController();
  final _textController3 = TextEditingController();

  //List<String> ListGramasi = ["1x", "2x", "3x"];
  //String selectedDropDown = "1x";

  double hasilPerCharge = 0;
  double hasilTotalCharge = 0;

  //void onDropDownChanged(Object? value) {
  //  return setState(() {
  //    selectedDropDown = value.toString();
  //  });
  //}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Batch Calculator"),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                //display hasil hitung
                Expanded(
                  child: Center(
                    child: Text(
                      "1 Charge = " + "$hasilPerCharge" + " menit",
                      style: const TextStyle(fontSize: 25),
                    ),
                  ),
                ),

                Expanded(
                  child: Center(
                    child: Text(
                      "" +
                          _textController2.text +
                          " Charge = " +
                          "$hasilTotalCharge" +
                          " Jam",
                      style: const TextStyle(fontSize: 25),
                    ),
                  ),
                ),

                //input dari user
                // DropdownButton(
                //   isExpanded: true,
                //  value: selectedDropDown,
                //   items: ListGramasi.map((String value) {
                //     return DropdownMenuItem<String>(
                //      value: value,
                //      child: Text(value),
                //     );
                //   }).toList(),
                //   onChanged: (value) {
                //     onDropDownChanged(value);
                //  }),

                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: TextField(
                    controller: _textController,
                    autofocus: true,
                    enableInteractiveSelection: true,
                    keyboardType: TextInputType.number,
                    //cursor
                    showCursor: true,
                    //cursorColor: Colors.black,
                    //cursorHeight: 20,
                    //cursorWidth: 2,
                    //textAlign
                    textAlign: TextAlign.center,
                    textAlignVertical: TextAlignVertical.center,
                    //textStyle
                    style: const TextStyle(
                      //backgroundColor: Colors.black,
                      fontSize: 20,
                    ),
                    //decoration
                    decoration: const InputDecoration(
                        icon: Icon(
                          Icons.line_weight_outlined,
                          size: 35,
                        ),
                        border: OutlineInputBorder(),
                        hintText: "e.g. 3x, 2x, 1x",
                        labelText: "Gramasi"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: TextField(
                    controller: _textController1,
                    enableInteractiveSelection: true,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    textAlignVertical: TextAlignVertical.center,
                    style: const TextStyle(
                      //backgroundColor: Colors.black,
                      fontSize: 20,
                    ),
                    decoration: const InputDecoration(
                        icon: Icon(
                          Icons.bar_chart,
                          size: 35,
                        ),
                        border: OutlineInputBorder(),
                        hintText: "total dus sesuai rps..",
                        labelText: "Total Dus"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: TextField(
                    controller: _textController2,
                    enableInteractiveSelection: true,
                    keyboardType: TextInputType.number,
                    showCursor: true,
                    //cursorColor: Colors.black,
                    //cursorHeight: 20,
                    //cursorWidth: 2,
                    //textAlign
                    textAlign: TextAlign.center,
                    textAlignVertical: TextAlignVertical.center,
                    //textStyle
                    style: const TextStyle(
                      //backgroundColor: Colors.black,
                      fontSize: 20,
                    ),
                    //decoration
                    decoration: const InputDecoration(
                        icon: Icon(
                          Icons.add_chart,
                          size: 35,
                        ),
                        border: OutlineInputBorder(),
                        hintText: "total charge sesuai rps..",
                        labelText: "Total charge"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: TextField(
                    controller: _textController3,
                    enableInteractiveSelection: true,
                    keyboardType: TextInputType.number,
                    showCursor: true,
                    //cursorColor: Colors.black,
                    //cursorHeight: 20,
                    //cursorWidth: 2,
                    //textAlign
                    textAlign: TextAlign.center,
                    textAlignVertical: TextAlignVertical.center,
                    //textStyle
                    style: const TextStyle(
                      //backgroundColor: Colors.black,
                      fontSize: 20,
                    ),
                    //decoration
                    decoration: const InputDecoration(
                        icon: Icon(
                          Icons.speed,
                          size: 35,
                        ),
                        border: OutlineInputBorder(),
                        hintText: "speed mesin filling..",
                        labelText: "Speed"),
                  ),
                ),

                //button proses
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: MaterialButton(
                          onPressed: () {
                            //proses hitung
                            setState(() {
                              if (_textController.text.isNotEmpty &&
                                  _textController1.text.isNotEmpty &&
                                  _textController2.text.isNotEmpty &&
                                  _textController3.text.isNotEmpty) {
                                hasilPerCharge =
                                    (int.parse(_textController1.text) *
                                        int.parse(_textController.text) /
                                        int.parse(_textController2.text) /
                                        int.parse(_textController3.text));
                                hasilTotalCharge =
                                    (int.parse(_textController1.text) *
                                        int.parse(_textController.text) /
                                        int.parse(_textController3.text) /
                                        60);
                              }
                            });
                          },
                          color: Colors.blue.shade400,
                          child: const Text("Hitung",
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),

                      //button clear data
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: MaterialButton(
                          onPressed: () {
                            _textController.clear();
                            _textController1.clear();
                            _textController2.clear();
                            _textController3.clear();
                          },
                          color: Colors.red.shade400,
                          child: const Text("Clear",
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
