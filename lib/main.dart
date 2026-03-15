import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const CartaoVisita());
}

class LinkSocial extends StatefulWidget {
  final String texto;
  final String url;

  const LinkSocial({super.key, required this.texto, required this.url});

  @override
  State<LinkSocial> createState() => _LinkSocialState();
}

class _LinkSocialState extends State<LinkSocial> {
  bool isHovered = false;

  Future<void> _abrirLink() async {
    final Uri uri = Uri.parse(widget.url);
    if (!await launchUrl(uri)) {
      throw Exception('Não foi possível abrir: ${widget.url}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _abrirLink,
      onHover: (hovering) {
        setState(() {
          isHovered = hovering;
        });
      },
      child: Text(
        widget.texto,
        style: TextStyle(
          fontFamily: 'Source Sans Pro',
          fontSize: 15.0,
          fontWeight: FontWeight.bold,
          color: isHovered ? Colors.blue.shade900 : Colors.white,
        ),
      ),
    );
  }
}

class CartaoVisita extends StatelessWidget {
  const CartaoVisita({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 50.0,
                
                backgroundImage: AssetImage('images/lain.png'),
              ),
              const Text(
                'Felipe Hlatki Vieira',
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 40.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Desenvolvimento Front-end/Back-end',
                style: TextStyle(
                  fontFamily: 'Source Sans Pro',
                  color: Colors.teal.shade100,
                  fontSize: 20.0,
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20.0,
                width: 150.0,
                child: Divider(
                  color: Colors.tealAccent,
                ),
              ),
              Container(
                margin: const EdgeInsets.all(25),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 25.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: ListTile(
                        leading: const Icon(
                          Icons.phone,
                          color: Colors.teal,
                        ),
                        title: Text(
                          '+55 (47) 9 8466-2331',
                          style: TextStyle(
                            color: Colors.teal.shade900,
                            fontFamily: 'Source Sans Pro',
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 25.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: ListTile(
                        leading: const Icon(
                          Icons.email,
                          color: Colors.teal,
                        ),
                        title: Text(
                          'felipe.hlvieira@gmail.com',
                          style: TextStyle(
                            color: Colors.teal.shade900,
                            fontFamily: 'Source Sans Pro',
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 25.0),
                      child: Row(
                        children: [
                          Text("Links: ",
                              style: TextStyle(
                                fontFamily: 'Source Sans Pro',
                                fontSize: 20.0,
                              )),
                          Icon(Icons.insert_link, color: Colors.teal),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          LinkSocial(
                            texto: "Linkedin",
                            url: "https://www.linkedin.com/in/felipe-hlatki-vieira-6081b2243/",
                          ),
                          const SizedBox(width: 20.0),
                          LinkSocial(
                            texto: "Github",
                            url: "https://github.com/Felipe-Vieira15",
                          ),
                          const SizedBox(width: 20.0),
                          LinkSocial(
                            texto: "Instagram",
                            url: "https://instagram.com/",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                  
              ),
            ],
          ),
        ),
      ),
    );
  }
}