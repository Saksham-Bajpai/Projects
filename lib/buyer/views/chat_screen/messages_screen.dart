import 'package:charity_reads_1/buyer/consts/consts.dart';
import 'package:charity_reads_1/buyer/services/firestore_services.dart';
import 'package:charity_reads_1/buyer/views/chat_screen/chat_screen.dart';
import 'package:charity_reads_1/buyer/services/store_services.dart';
import 'package:charity_reads_1/buyer/widgets_common/loading_indicator.dart';
import 'package:charity_reads_1/buyer/widgets_common/text_style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as intl;

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: whiteColor,
            )),
        title: "My Messages"
            .text
            .color(whiteColor)
            .fontFamily(semibold)
            .size(16)
            .make(),
        backgroundColor: blackColor,
      ),
      body: StreamBuilder(
        stream: FirestoreServices.getAllMessages(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: loadingIndicator());
          } else if (snapshot.data!.docs.isEmpty) {
            return "No Messages yet!".text.color(darkFontGrey).makeCentered();
          } else {
            var data = snapshot.data!.docs;
            return
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(
                      child: ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                              child: ListTile(
                                onTap: () {
                                  Get.to(() => ChatScreen(),arguments: [data[index]['friend_name'], data[index]['toId']],);
                                },
                                leading: CircleAvatar(
                                  backgroundColor: blackColor,
                                  child: Icon(
                                    Icons.person,
                                    color: whiteColor,
                                  ),
                                ),
                                title: "${data[index]['friend_name']}"
                                    .text
                                    .fontFamily(semibold)
                                    .color(redColor)
                                    .make(),
                                subtitle: "${data[index]['last_msg']}".text.make(),
                              ),
                            );
                          }))
                ],
              ),
            );
            //
            // Padding(
            //       padding: const EdgeInsets.all(8.0),
            //       child: SingleChildScrollView(
            //         physics: const BouncingScrollPhysics(),
            //         child: Column(
            //           children: List.generate(
            //               data.length,
            //               (index) {
            //                 var t =
            //                 data[index]['created_on'] == null ? DateTime.now() : data[index]['created_on'].toDate();
            //                 var time = intl.DateFormat("h:mma").format(t);
            //                 return ListTile(
            //                     onTap: () {
            //                       Get.to(() => const ChatScreen());
            //                     },
            //                     leading: const CircleAvatar(
            //                       backgroundColor: whiteColor,
            //                       child: Icon(
            //                         Icons.person,
            //                         color: blackColor,
            //                       ),
            //                     ),
            //                     title: boldText(text: "${data[index]['sender_name']}", color: fontGrey),
            //                     subtitle: normalText(
            //                         text: "${data[index]['last_msg']}", color: darkFontGrey),
            //                     trailing:
            //                         normalText(text: time, color: darkFontGrey),
            //                   ); }),
            //         ),
            //       ),
            //     );
          }
        },
      ),
    );
  }
}
