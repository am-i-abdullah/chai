import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  bool isSingle = true;
  int quantity = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(35, 12, 2, 1),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/chai2.png'),
            Container(
              padding: const EdgeInsets.only(top: 25, left: 25, right: 25),
              width: double.infinity,
              color: const Color.fromRGBO(35, 12, 2, 1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Bister mein Special',
                    style: GoogleFonts.josefinSans(
                      fontSize: 25,
                      color: const Color.fromRGBO(238, 220, 198, 1),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Tea bag chai made with <3',
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: const Color.fromRGBO(238, 220, 198, 1),
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: isSingle ? Colors.white : Colors.white70,
                          borderRadius: const BorderRadiusDirectional.only(
                            topStart: Radius.circular(10),
                            bottomStart: Radius.circular(10),
                          ),
                        ),
                        child: MaterialButton(
                          splashColor: Colors.transparent,
                          onPressed: () {
                            setState(() {
                              isSingle = !isSingle;
                            });
                          },
                          child: Text(
                            'SINGLE  T  BAG',
                            style: GoogleFonts.poppins(
                              color: const Color.fromRGBO(35, 12, 2, 1),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 7),
                      Container(
                        decoration: BoxDecoration(
                          color: !isSingle ? Colors.white : Colors.white70,
                          borderRadius: const BorderRadiusDirectional.only(
                            bottomEnd: Radius.circular(10),
                            topEnd: Radius.circular(10),
                          ),
                        ),
                        child: MaterialButton(
                          splashColor: Colors.transparent,
                          onPressed: () {
                            setState(() {
                              isSingle = !isSingle;
                            });
                          },
                          child: Text(
                            'DOUBLE  T  BAG',
                            style: GoogleFonts.poppins(
                              color: const Color.fromRGBO(35, 12, 2, 1),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  // pricing
                  const SizedBox(height: 10),
                  Text(
                    'Rs ${isSingle ? '60' : '90'}',
                    style: GoogleFonts.poppins(
                      color: const Color.fromRGBO(238, 220, 198, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  const SizedBox(height: 10),

                  // instructions from the customer
                  const TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: 2,
                    cursorColor: Color.fromRGBO(238, 220, 198, 1),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(15),
                      fillColor: Color.fromRGBO(238, 220, 198, 1),
                      hintText: "Anything else?",
                      hintStyle: TextStyle(
                        color: Color.fromRGBO(238, 220, 198, 0.8),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    ),
                    style: TextStyle(
                      color: Color.fromRGBO(238, 220, 198, 1),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: const Color.fromRGBO(238, 220, 198, 1),
                      width: 1.5,
                    ),
                    color: Colors.transparent,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            quantity = quantity == 0 ? 0 : quantity - 1;
                          });
                        },
                        icon: const Icon(Icons.remove),
                      ),
                      Text(
                        quantity.toString(),
                        style: const TextStyle(
                          color: Color.fromRGBO(238, 220, 198, 1),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            quantity = quantity + 1;
                          });
                        },
                        icon: const Icon(Icons.add),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 15),
                Container(
                  width: MediaQuery.of(context).size.width * 0.45,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(238, 220, 198, 1),
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: const Color.fromRGBO(238, 220, 198, 1),
                      width: 1.5,
                    ),
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Place Order',
                      style: TextStyle(
                        color: Color.fromRGBO(35, 12, 2, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
