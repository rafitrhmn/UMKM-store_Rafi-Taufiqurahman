// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';

// class ChatPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ChatScreen(),
//     );
//   }
// }

// class ChatMessage extends StatelessWidget {
//   ChatMessage({required this.text, required this.isMe});

//   final String text;
//   final bool isMe;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 10.0),
//       alignment: Alignment.topCenter,
//       padding: EdgeInsets.only(bottom: 20),
//       child: Row(
//         mainAxisAlignment:
//             isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
//         children: [
//           isMe
//               ? Container()
//               : Container(
//                   margin: const EdgeInsets.only(right: 16.0),
//                   child: CircleAvatar(
//                     radius: 20,
//                     backgroundImage:
//                         NetworkImage('https://via.placeholder.com/150'),
//                   ),
//                 ),
//           Container(
//             constraints: BoxConstraints(
//               maxWidth: MediaQuery.of(context).size.width * 0.7,
//             ),
//             padding: const EdgeInsets.all(10),
//             decoration: BoxDecoration(
//               color: isMe ? Colors.blue : Colors.grey.shade200,
//               borderRadius: isMe
//                   ? BorderRadius.only(
//                       topLeft: Radius.circular(15),
//                       bottomLeft: Radius.circular(15),
//                       topRight: Radius.circular(15),
//                     )
//                   : BorderRadius.only(
//                       topLeft: Radius.circular(15),
//                       bottomRight: Radius.circular(15),
//                       topRight: Radius.circular(15),
//                     ),
//             ),
//             child: Text(text),
//           ),
//           isMe
//               ? Container(
//                   margin: const EdgeInsets.only(left: 16.0),
//                   child: CircleAvatar(
//                     radius: 20,
//                     backgroundImage:
//                         NetworkImage('https://via.placeholder.com/150'),
//                   ),
//                 )
//               : Container(),
//         ],
//       ),
//     );
//   }
// }

// class ChatScreen extends StatefulWidget {
//   @override
//   State createState() => ChatScreenState();
// }

// class ChatScreenState extends State<ChatScreen> {
//   final List<ChatMessage> _messages = <ChatMessage>[];
//   final TextEditingController _textController = TextEditingController();

//   void _handleSubmitted(String text) {
//     _textController.clear();
//     ChatMessage message = ChatMessage(
//       text: text,
//       isMe: true,
//     );
//     setState(() {
//       _messages.insert(0, message);
//     });
//     // Simulate replying from the chat bot after a short delay
//     Future.delayed(Duration(seconds: 1), () {
//       ChatMessage reply = ChatMessage(
//         text: 'This is a reply from the chat bot',
//         isMe: false,
//       );
//       setState(() {
//         _messages.insert(0, reply);
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       verticalDirection: VerticalDirection.down,
//       children: [
//         SizedBox(
//           height: 63,
//         ),
//         Text(
//           'Tanyakan ke Robot 🤖',
//           style: TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 18,
//               fontFamily: 'Montserrat'),
//         ),
//         Flexible(
//           child: ListView.builder(
//             padding: const EdgeInsets.all(8.0),
//             dragStartBehavior: DragStartBehavior.start,
//             reverse: true,
//             itemBuilder: (_, int index) => _messages[index],
//             itemCount: _messages.length,
//           ),
//         ),
//         Divider(height: 1.0),
//         Container(
//           decoration: BoxDecoration(color: Theme.of(context).cardColor),
//           child: _buildTextComposer(),
//         ),
//         SizedBox(
//           height: 15,
//         )
//       ],
//     );
//   }

//   Widget _buildTextComposer() {
//     return IconTheme(
//       data: IconThemeData(),
//       child: Container(
//         margin: const EdgeInsets.symmetric(horizontal: 8.0),
//         child: Row(
//           children: [
//             Flexible(
//               child: Container(
//                 // margin: const EdgeInsets.symmetric(horizontal: 20),
//                 // padding: const EdgeInsets.symmetric(horizontal: 15),
//                 height: 50,
//                 width: 500,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(10),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.withOpacity(0.4),
//                       spreadRadius: 5,
//                       blurRadius: 7,
//                       offset: const Offset(0, 3),
//                     )
//                   ],
//                 ),
//                 child: Row(
//                   children: [
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     Container(
//                       width: 250,
//                       child: TextField(
//                         controller: _textController,
//                         onSubmitted: _handleSubmitted,
//                         decoration: const InputDecoration(
//                             contentPadding: EdgeInsets.only(left: 14),
//                             border: InputBorder.none,
//                             hintText: "Masukkan Pertanyaan",
//                             hintStyle: TextStyle(fontFamily: 'Montserrat')),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Container(
//               margin: const EdgeInsets.symmetric(horizontal: 4.0),
//               child: IconButton(
//                 icon: Icon(Icons.send),
//                 iconSize: 30,
//                 onPressed: () => _handleSubmitted(_textController.text),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// void main() {
//   runApp(MaterialApp(
//     title: 'Chat Bot AI',
//     theme: ThemeData(
//       primaryColor: Colors.blue,
//     ),
//     home: ChatPage(),
//   ));
// }

import 'package:dio/dio.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MaterialApp(
    title: 'Chat Bot AI',
    theme: ThemeData(
      primaryColor: Colors.blue,
    ),
    home: ChatPage(),
  ));
}

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChatScreen(),
    );
  }
}

class ChatMessage extends StatelessWidget {
  ChatMessage({required this.text, required this.isMe});

  final String text;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      alignment: Alignment.topCenter,
      padding: EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment:
            isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          isMe
              ? Container()
              : Container(
                  margin: const EdgeInsets.only(right: 16.0),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.amber,
                  ),
                ),
          Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.7,
            ),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: isMe ? Colors.blue : Colors.grey.shade200,
              borderRadius: isMe
                  ? BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    )
                  : BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
            ),
            child: Text(text),
          ),
          isMe
              ? Container(
                  margin: const EdgeInsets.only(left: 16.0),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.black,
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  State createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textController = TextEditingController();

  void ask() async {
    String apikey = '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';
    Dio dio = Dio(
        BaseOptions(baseUrl: 'https://api.openai.com/v1/completions', headers: {
      'Authorization': 'Bearer $apikey',
      'Content-Type': 'application/json',
    }));

    final pertanyaan = _textController;
    Map<String, dynamic> data = {
      "model": 'text-davinci-003',
      "messages": [
        {
          "role": 'system',
          "content":
              'mie ayam seharga 11.000, bakso seharga 11.000 dan servis ban mobil seharga 300'
        },
        {"role": 'user', "content": '$pertanyaan'}
      ]
    };
  }

  Future<String> getChatbotResponse(String message) async {
    final response = await http.post(
      Uri.parse('https://api.openai.com/v1/completions'),
      headers: {
        'Authorization': 'Bearer ',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({'prompt': message}),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body)['choices'][0]['text'];
    } else {
      throw Exception('Failed to load response from API');
    }
  }

  void _handleSubmitted(String text) async {
    _textController.clear();
    ChatMessage message = ChatMessage(
      text: text,
      isMe: true,
    );
    setState(() {
      _messages.insert(0, message);
    });

    String botResponse = await getChatbotResponse(text);

    Future.delayed(Duration(seconds: 1), () {
      ChatMessage reply = ChatMessage(
        text: botResponse,
        isMe: false,
      );
      setState(() {
        _messages.insert(0, reply);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      verticalDirection: VerticalDirection.down,
      children: [
        SizedBox(
          height: 63,
        ),
        Text(
          'Tanyakan ke Robot 🤖',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              fontFamily: 'Montserrat'),
        ),
        Flexible(
          child: ListView.builder(
            padding: const EdgeInsets.all(8.0),
            dragStartBehavior: DragStartBehavior.start,
            reverse: true,
            itemBuilder: (_, int index) => _messages[index],
            itemCount: _messages.length,
          ),
        ),
        Divider(height: 1.0),
        Container(
          decoration: BoxDecoration(color: Theme.of(context).cardColor),
          child: _buildTextComposer(),
        ),
        SizedBox(
          height: 15,
        )
      ],
    );
  }

  Widget _buildTextComposer() {
    return IconTheme(
      data: IconThemeData(),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Flexible(
              child: Container(
                height: 50,
                width: 500,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    )
                  ],
                ),
                child: Row(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 250,
                      child: TextField(
                        controller: _textController,
                        onSubmitted: _handleSubmitted,
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.only(left: 14),
                            border: InputBorder.none,
                            hintText: "Masukkan Pertanyaan",
                            hintStyle: TextStyle(fontFamily: 'Montserrat')),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                icon: Icon(Icons.send),
                iconSize: 30,
                onPressed: () => _handleSubmitted(_textController.text),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
