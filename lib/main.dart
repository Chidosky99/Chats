// ignore_for_file: prefer_const_constructors
import 'package:intl/intl.dart';
import 'package:flutter/material.dart'; // Import material.dart for Flutter icons

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chats',
      home: WhatsAppHomePage(),
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black, //Set scaffold background color
      ),
    );
  }
}

class WhatsAppHomePage extends StatelessWidget {
  // List of contact names
  final List<String> contactNames = [
    "Obiechina",
    "Fiber Team",
    "Softwork",
    "Flutter Developers Naija \u{1F1F3}\u{1F1EC}",
    "THE SANHEDRIN \u{1F389}\u{1F38A}",
    "Uchenna Snow \u{1F605}\u{1F605}",
    "Jerry Arickmum",
  ];

  // List of last messages corresponding to each contact
  final List<String> lastMessages = [
    "Martin \u{1F451}: Remind me early oo",
    "You: Remove keyboard when you start tutorial",
    "You: https://www.instagram.com/reel/C3Y1UqRgyzH/?igsh=MzRIODBiNWFIZA...",
    "~Owen: cmd shift p reload window",
    "Osagie: On my forearm along my ulnar bone",
    "Lol",
    "www.awafim.tv",
  ];

  // List of last message timestamps corresponding to each contact
  final List<DateTime> lastMessageTimestamps = [
    DateTime(2024, 2, 20, 19, 24), // Adjust timestamps as needed
    DateTime(2022, 5, 30, 20, 05),
    DateTime(2024, 2, 18, 18, 45),
    DateTime(2024, 2, 17, 21, 14),
    DateTime(2024, 2, 16, 21, 05),
    DateTime(2024, 2, 15, 20, 28),
    DateTime(2024, 2, 14, 20, 11),
  ];
  // List of contact names and their corresponding unread message counts
  final List<Map<String, dynamic>> contacts = [
    {"name": "Obiechina", "unreadCount": null},
    {"name": "Fiber Team", "unreadCount": null},
    {"name": "Softwork", "unreadCount": null},
    {"name": "Flutter Developers Naija \u{1F1F3}\u{1F1EC}", "unreadCount": 777},
    {"name": "THE SANHEDRIN \u{1F389}\u{1F38A}", "unreadCount": 4},
    {"name": "Uchenna Snow \u{1F605}\u{1F605}", "unreadCount": null},
    {"name": "Jerry Arickmum", "unreadCount": null},
  ];

  // List of image URLs corresponding to each contact name
  final List<String> contactImages = [
    "https://c8.alamy.com/comp/E7590M/3d-render-of-golden-digit-zero-simbol-0-isolated-on-white-background-E7590M.jpg", // Replace with image URL for Obiechina
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTu0Cwed_gPIXca3DGjn_88imx7FoXutkzPPg&usqp=CAU", // Replace with image URL for Fiber Team
    "https://play-lh.googleusercontent.com/q_bqjk9azklHKouzP84nFcfG7lxWyIgD2PiHx0TYan7SWgDuoV9VkhIF1ErYC6nQq1Y", // Replace with image URL for Softwork
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQwpPJQTui5QBRTSEorVPnhwouhuIfEfsVx8VTQK1wpFQ&s", // Replace with image URL for Flutter Developers Naija
    "https://static.wixstatic.com/media/6fc1ce_41b0bc78bd10489ca1534e0249133162~mv2.png/v1/fit/w_2500,h_1330,al_c/6fc1ce_41b0bc78bd10489ca1534e0249133162~mv2.png", // Replace with image URL for THE SANHEDRIN
    "https://upload.wikimedia.org/wikipedia/en/thumb/c/cc/Chelsea_FC.svg/1200px-Chelsea_FC.svg.png", // Replace with image URL for Uchenna Snow
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSo16K54ungVVCMVEmwi39ReSFfFPIzBT9vzX90XbD3Tg&s", // Replace with image URL for Jerry Arickmum
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Your Scaffold widget code
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120.0),
        child: AppBar(
          title: Text(
            'Chats',
            style: TextStyle(
              color: Colors.white, // Set the text color to white
              fontWeight: FontWeight.bold, // Make the text bold
            ),
          ),
          backgroundColor: Colors.black, // Set the color of the app bar here
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.all(0.0),
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey, // Set the inside color to grey
                    hintText: 'Search',
                    border: OutlineInputBorder(),
                    prefixIcon: Container(
                      width: 0, // Adjust the width as needed
                      height: 10, // Adjust the height as needed
                      child: Icon(
                        Icons.search,
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Row(
                    children: [
                      Icon(
                        Icons.archive, // Your archived logo icon
                        size: 20, // Adjust the size as needed
                        color: Colors.grey, // Adjust the color as needed
                      ),
                      SizedBox(
                          width:
                              53), // Add some spacing between the icon and text
                      Text(
                        'Archived 3',
                        style: TextStyle(
                          color: Colors.white, // Set the color to white
                          fontSize: 12, // Adjust the font size as needed
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: contactNames.length,
          itemBuilder: (context, index) {
            var contact = contacts[index];
            var name = contact["name"];
            var lastMessageTimestamp = "lastMessageTimestamp"[index];
            var unreadCount = contact["unreadCount"];

            // Check if the contact name needs the "Pin chat logo"
            bool shouldPin = name == "Obiechina" ||
                name == "Fiber Team" ||
                name == "Softwork";

            // Check if the contact name needs the "Mute logo"
            bool shouldMute = name == "Flutter Developers Naija 🇳🇬";

            // Display "Yesterday" instead of a specific time for Softwork
            if (name == "Softwork") {
              if (contactNames[index] == "Fiber Team") {}

              return Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 30.0), // Adjust vertical padding as needed
                child: ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: Colors.white70,
                    // You can add profile images here
                  ),
                  title: Text(
                    name, // Display contact names
                    style: const TextStyle(
                      color: Colors.white, // Set text color to white
                      fontSize: 0.0, // Adjust font size as needed
                      fontWeight:
                          FontWeight.bold, // Adjust font weight as needed
                    ),
                  ),
                  subtitle: Text(lastMessages[index]), // Display last message
                  trailing: const Text(
                      'Yesterday'), // Display "Yesterday" instead of time
                ),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 2.0), // Adjust vertical padding as needed
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(contactImages[index]),
                    // You can add profile images here
                  ),
                  title: Text(
                    contactNames[index], // Display contact names
                    style: const TextStyle(
                      color: Colors.white, // Set text color to white
                      fontSize: 10, // Adjust font size as needed
                      fontWeight:
                          FontWeight.bold, // Adjust font weight as needed
                    ),
                  ),
                  subtitle: Text(
                    lastMessages[index], // Dispaly last message
                    style: const TextStyle(
                      color:
                          Colors.white70, // Set text color to a ligther shade
                      fontSize: 12, // Adjust font size as needed
                    ),
                  ),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment
                        .end, // Align the contact name to the right
                    children: [
                      if (shouldPin) // Check if pin logo should be displayed
                        Icon(
                          Icons.push_pin_sharp, // Pin chat icon
                          color: Colors.blueGrey, // Pin chat icon color
                        ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (shouldMute) // Check if mute logo should be displayed
                            Icon(
                              Icons.volume_off_sharp, // Mute chat icon
                              color: Colors.blueGrey, // Mute chat icon color
                            ),
                          if (unreadCount != null)
                            Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                '$unreadCount unread',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 8,
                                ),
                              ),
                            ),
                        ],
                      ),
                      Text(
                        '${DateFormat('HH:mm').format(lastMessageTimestamps[index])}', // Display current time
                      ),
                    ],
                  ),
                ),
              );
            }
          },
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blueGrey[500], // Set the background color here
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.all(0.0),
                child: Stack(
                  children: [
                    IconButton(
                      key: Key(
                          'updates_icon_button'), // Add a unique key identifier
                      icon: Image.network(
                        'data:image/png;base64,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',
                        // Replace with the URL of your image
                        width: 24, // Adjust width as needed
                        height: 24, // Adjust height as needed
                      ),
                      onPressed: () {
                        // Add action for camera
                      },
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                    top: 2.0), // Adjust the top padding as needed
                child: Text('Updates', style: TextStyle(fontSize: 10)),
              ),
            ],
          ),
          const Spacer(), // Add a spacer to push the updates icon to the left
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 1.0),
                child: Theme(
                  data: ThemeData(
                      iconTheme: IconThemeData(
                          color: Colors.white)), // Set text color to white
                  child: IconButton(
                    icon: const Icon(Icons.call),
                    onPressed: () {
                      // Add action for calls
                    },
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                    top: 0.0), // Adjust the top padding as needed
                child: Text(
                  'Calls',
                  style: TextStyle(fontSize: 10),
                ),
              ),
            ],
          ),
          const Spacer(), // Add a spacer to push the calls icon to the left
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 1.0),
                child: Theme(
                  data: ThemeData(
                      iconTheme: IconThemeData(
                          color: Colors.white)), // Set text color to white
                  child: IconButton(
                    icon: const Icon(Icons.group),
                    onPressed: () {
                      // Add action for communities
                    },
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                    top: 0.0), // Adjust the top padding as needed
                child: Text('Communities', style: TextStyle(fontSize: 10)),
              ),
            ],
          ),
          const Spacer(), // Add a spacer to push the communities icon to the left
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 0.0), // Adjust the top padding as needed
                child: Stack(
                  children: [
                    IconButton(
                      key: const Key(
                          'chats_icon_button'), // Naming the IconButton using a key
                      icon: Image.network(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTALb8kPxy-79UsYqZSlvtEl5hcrDFyKIZVuQ&usqp=CAU',
                        // Replace with the URL of your image
                        width: 24, // Adjust width as needed
                        height: 24, // Adjust height as needed
                      ),
                      onPressed: () {
                        // Add action for chats
                      },
                    ),
                    Positioned(
                      right: 0,
                      child: Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          '145',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 8,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                    top: 1.0), // Adjust the top padding as needed
                child: Text('Chats', style: TextStyle(fontSize: 10)),
              ),
            ],
          ),
          const Spacer(), // Add a spacer to push the chats  icon to the left
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 0.0), // Adjust the top padding as needed
                child: Theme(
                  data: ThemeData(
                      iconTheme: IconThemeData(
                          color: Colors.white)), // Set text color to white
                  child: IconButton(
                    key: const Key(
                        'settings_icon_button'), // Naming the IconButton using a key

                    icon: const Icon(Icons.settings),
                    onPressed: () {
                      // Add action for settings
                    },
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                    top: 1.0), // Adjust the top padding as needed
                child: Text(
                  'Settings', // Naming the IconButton using a tooltip
                  textAlign: TextAlign.center, // Center the text horizontal
                  style:
                      TextStyle(fontSize: 10), // Apply the desired text style
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
