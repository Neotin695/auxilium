import 'package:auxilium2/config/preferences_helper.dart';
import 'package:auxilium2/config/style.dart';
import 'package:auxilium2/model/user_model.dart';
import 'package:chat_bubbles/bubbles/bubble_special_one.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/Material.dart';
import 'package:flutter/cupertino.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final fireStore = FirebaseFirestore.instance;
  UserModel? user;

  //obj from the package using singleton
  TextEditingController msgController = TextEditingController();
  final String collectionName = 'chat';

  addMsg() {
    fireStore
        .collection('users')
        .doc(user?.chatID ?? '')
        .collection("msgs")
        .add({
      'msg': msgController.text.trim(),
      'senderID': user?.email ?? '',
      'time': FieldValue.serverTimestamp(),
    });
    msgController.clear();
  }

  CollectionReference? col;

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    user = PreferencesHelper.instance.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: fireStore
          .collection('users')
          .doc(user?.chatID ?? '')
          .collection('msgs')
          .orderBy('time', descending: true)
          .snapshots(),
      builder: (context, snapshot) => snapshot.hasData
          ? chatBody(snapshot.data)
          : snapshot.hasData
              ? const Center(
                  child: Text(
                    'ERROR',
                  ),
                )
              : const CupertinoActivityIndicator(),
    );
  }

  Widget chatBody(dynamic data) {
    return Column(
      children: [
        Column(
          children: [
            Container(
              width: double.infinity,
              height: 110,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.teal,
                    Colors.indigoAccent,
                    Colors.indigo,
                  ],
                ),
                borderRadius: AppStyle.roundCorners,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SizedBox(height: 40),
                  Text(
                    "Chat Screen",
                    style: TextStyle(
                      // fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 20,
            ),
            child: Column(
              children: [
                ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: (data.docs ?? []).length,
                  reverse: true,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Align(
                      alignment: user?.email == data.docs[index]['senderID']
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            BubbleSpecialOne(
                              color: data.docs[index]['senderID'] == user?.email
                                  ? Colors.indigoAccent
                                  : Colors.blueGrey
                              ,
                              textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                              isSender:
                                  data.docs[index]['senderID'] == user?.email
                                      ? true
                                      : false,
                              // seen: true,
                              text: data.docs[index]['msg'] ?? '',
                            ),],),),);},),
                Expanded(
                    child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                          onFieldSubmitted: (value){
                            addMsg();
                          },
                          cursorColor: Colors.indigo[300],
                          controller: msgController,
                          decoration: const InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: ("Type a message"),
                            hintStyle: TextStyle(color: Colors.black87),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(60),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.indigo,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          onPressed: () {
                            addMsg();
                          },
                          icon: const Icon(
                            Icons.send,
                            color: Colors.white,
                          ),),)],),)),],),),),
      ],);}}
