// ignore_for_file: sort_child_properties_last

import 'package:agendaa/services/boxService.dart';
import 'package:flutter/material.dart';
import 'package:easy_debounce/easy_debounce.dart';
import '../models/client.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Clients>? clients;
  var isLoaded = false;
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late HomeModel _model;

  @override
  void initState() {
    super.initState();

    getClient();
  }

  getClient() async {
    clients = await BoxService().getClients();
    if (clients != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('FloatingActionButton pressed ...');
        },
        backgroundColor: const Color.fromARGB(255, 0, 180, 255),
        elevation: 10,
        // ignore: prefer_const_constructors
        child: Icon(
          Icons.add_box_outlined,
          color: Colors.white,
          size: 30,
        ),
      ),
      appBar: AppBar(
        title: const Text('Agendaª'),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16, 25, 16, 12),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: TextFormField(
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.textController',
                              const Duration(milliseconds: 2000),
                              () => setState(() {}),
                            ),
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Search members...',
                              enabledBorder: OutlineInputBorder(
                                // ignore: prefer_const_constructors
                                borderSide: BorderSide(
                                  color: const Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              focusedBorder: OutlineInputBorder(
                                // ignore: prefer_const_constructors
                                borderSide: BorderSide(
                                  color: const Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              errorBorder: OutlineInputBorder(
                                // ignore: prefer_const_constructors
                                borderSide: BorderSide(
                                  color: const Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                // ignore: prefer_const_constructors
                                borderSide: BorderSide(
                                  color: const Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              filled: true,
                            ),
                            maxLines: null,
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                          child: IconButton(
                            // ignore: prefer_const_constructors
                            icon: Icon(
                              Icons.search_rounded,
                              size: 24,
                            ),
                            onPressed: () {
                              print('IconButton pressed ...');
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  // ignore: prefer_const_constructors
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                    child: const Text(
                      'Customers',
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 44),
                    child: ListView.builder(
                        padding: EdgeInsets.zero,
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: clients?.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16, 4, 16, 8),
                            child: Container(
                              width: double.infinity,
                              height: 50,
                              decoration: BoxDecoration(
                                // ignore: prefer_const_literals_to_create_immutables
                                boxShadow: [
                                  // ignore: prefer_const_constructors
                                  BoxShadow(
                                    blurRadius: 4,
                                    color:
                                        const Color.fromARGB(49, 152, 152, 152),
                                    offset: const Offset(0, 2),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    8, 0, 8, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(26),
                                      child: SvgPicture.network(
                                        'https://upload.wikimedia.org/wikipedia/commons/9/93/Google_Contacts_icon.svg',
                                        width: 36,
                                        height: 36,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        // ignore: prefer_const_constructors
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12, 0, 0, 0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              clients![index].name,
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  clients![index].email,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    // ignore: prefer_const_constructors
                                    Icon(
                                      Icons.arrow_circle_right,
                                      size: 44,
                                      color: const Color.fromARGB(
                                          255, 0, 180, 255),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeModel {
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  void initState(BuildContext context) {}

  void dispose() {
    textController?.dispose();
  }
}
