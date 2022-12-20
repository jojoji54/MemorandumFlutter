import 'package:flutter/material.dart';
import 'package:flutter_animator/widgets/fading_entrances/fade_in.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:test1/bookDetail.dart';
import 'package:test1/data/memorandumList.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Memorandum test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var dataListAux = [];
  static var savedData = [];
  static TextEditingController searchcontroller =
      TextEditingController(text: null);

  void _runFilter(String enteredKeyword) {
    var results = [];
    if (enteredKeyword.isEmpty) {
      results = memData;
    } else {
      results = memData
          .where((data) =>
              data.titulo.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      dataListAux = results;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dataListAux = memData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/logo/Memorandu.png',
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.height * 0.3,
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.height * 0.08,
                    right: MediaQuery.of(context).size.height * 0.08),
                child: Center(
                  child: TextField(
                    controller: searchcontroller,
                    onChanged: (value) => _runFilter(value),
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black.withOpacity(0.2),
                        ),
                      ),
                      hintText: "Buscar",
                      suffixIcon: Icon(
                        FontAwesomeIcons.magnifyingGlass,
                        size: MediaQuery.of(context).size.height * 0.025,
                        color: Colors.black.withOpacity(0.5),
                      ),
                      hintStyle: GoogleFonts.alike(
                          textStyle: Theme.of(context).textTheme.displayMedium,
                          fontSize: MediaQuery.of(context).size.width * 0.04,
                          color: Colors.grey.shade400),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.04,
              ),
              Expanded(
                child: FadeIn(
                  child: ListView.builder(
                      itemCount: dataListAux.length,
                      itemBuilder: (BuildContext context, int index) {
                        final data = dataListAux[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return BookDetail(bookList: data);
                            }));
                          },
                          child: Padding(
                            padding: EdgeInsets.only(
                                right: MediaQuery.of(context).size.height * 0.03,
                                left: MediaQuery.of(context).size.height * 0.03),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  color: Colors.orange.withOpacity(0.5),
                                ),
                                borderRadius:
                                    BorderRadius.circular(20.0), 
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(
                                    MediaQuery.of(context).size.height * 0.03),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween, //Center Row contents horizontally,
                                  crossAxisAlignment: CrossAxisAlignment
                                      .center, //Center Row contents vertically,
                                  children: [
                                    Hero(
                                      tag: data.titulo,
                                      child: SimpleShadow(
                                        opacity: 0.6, // Default: 0.5
                                        color: Colors.black, // Default: Black
                                        offset:
                                            Offset(5, 5), // Default: Offset(2, 2)
                                        sigma: 7, // Default: 2
                
                                        child: Image.asset(
                                          data.imagenFlor,
                                          height:
                                              MediaQuery.of(context).size.height *
                                                  0.1,
                                          width:
                                              MediaQuery.of(context).size.height *
                                                  0.1,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.height *
                                          0.2,
                                      height: MediaQuery.of(context).size.height *
                                          0.1,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment
                                            .center, //Center Column contents vertically,
                                        crossAxisAlignment: CrossAxisAlignment
                                            .center, //Center Column contents horizontally,
                                        children: [
                                          Text(
                                            data.titulo,
                                            style: GoogleFonts.rubik(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.02,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.2,
                                            child: Text(
                                              data.descripcion,
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.rubik(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.015,
                                                color: Colors.black,
                                              ),
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
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
