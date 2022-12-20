import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:google_fonts/google_fonts.dart';

class BookDetail extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  var bookList;
  BookDetail({Key key, this.bookList}) : super(key: key);

  @override
  State<BookDetail> createState() => _BookDetailState();
}

class _BookDetailState extends State<BookDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Hero(
                 tag:widget.bookList.titulo,
                child: Image.asset(
                  widget.bookList.imagenFlor,
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.height * 0.3,
                ),
              ),
                            SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              FadeIn(
                child: Text(
                  widget.bookList.titulo,
                  style: GoogleFonts.rubik(
                      fontSize: MediaQuery.of(context).size.height * 0.02,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              FadeIn(
                child: Padding(
                  padding:  EdgeInsets.only(left:MediaQuery.of(context).size.height * 0.04, right: MediaQuery.of(context).size.height * 0.04),
                  child: SingleChildScrollView(
                    child: Text(
                      
                      widget.bookList.descripcion,
                      textAlign:  TextAlign.justify,
                      style: GoogleFonts.rubik(
                          fontSize: MediaQuery.of(context).size.height * 0.02,
                          color: Colors.grey,),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              BounceIn(
                child: AnimatedButton(
                  onPress: () {
                    Navigator.pop(context);
                  },
                  height:  MediaQuery.of(context).size.height * 0.06,
                  width:  MediaQuery.of(context).size.width * 0.4,
                  text: 'Volver',
                  isReverse: true,
                  selectedTextColor: Colors.black,
                  transitionType: TransitionType.LEFT_TO_RIGHT,
                  textStyle: GoogleFonts.rubik(
                      fontSize: MediaQuery.of(context).size.height * 0.02,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                  backgroundColor: Colors.orange,
                  borderColor: Colors.white,
                  borderRadius: 50,
                  borderWidth: 2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
