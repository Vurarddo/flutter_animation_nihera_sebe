import 'package:flutter/material.dart';

import 'package:self_education/carwash/entities/client.dart';

class ClientsScreen extends StatefulWidget {
  @override
  _ClientsScreenState createState() => _ClientsScreenState();
}

class _ClientsScreenState extends State<ClientsScreen> {
  final _formStateKey = GlobalKey<FormState>();
  String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clients'),
        centerTitle: true,
      ),
      body: Form(
        key: _formStateKey,
        child: SizedBox.expand(
          child: DraggableScrollableSheet(
            initialChildSize: 0.08,
            minChildSize: 0.08,
            maxChildSize: 0.5,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                color: Colors.blue[100],
                child: ListView(
                  controller: scrollController,
                  children: <Widget>[],
                ),
              );
            },
          ),
        ),
        // Column(
        //   children: <Widget>[
        //     Expanded(
        //       child: ListView.builder(
        //         itemCount: _clients.length,
        //         itemBuilder: (context, i) {
        //           final client = _clients[i];
        //           return Text(client.name);
        //         },
        //       ),
        //     ),
        //     DraggableScrollableSheet(
        //       maxChildSize: MediaQuery.of(context).size.height,
        //       builder: (context, scrollController) {
        //         return ListView(
        //           controller: scrollController,
        //           children: <Widget>[
        //             TextFormField(
        //               onSaved: (value) {
        //                 name = value;
        //               },
        //             ),
        //             RaisedButton(
        //               onPressed: () {
        //                 _formStateKey.currentState.save();
        //                 setState(() {
        //                   _clients.add(
        //                     Client(
        //                       id: _clients.length + 1,
        //                       name: name,
        //                     ),
        //                   );
        //                 });
        //               },
        //             ),
        //           ],
        //         );
        //       },
        //     ),
        //   ],
        // ),
      ),
    );
  }
}

List<Client> _clients = [
  Client(id: 1, name: 'Client 1'),
  Client(id: 2, name: 'Client 2'),
  Client(id: 3, name: 'Client 3'),
];
