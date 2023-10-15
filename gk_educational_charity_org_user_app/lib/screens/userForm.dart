import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gk_educational_charity_org_user_app/model/form_det.dart';
import '../controller/addForm_Controller.dart';

class UserForm extends StatefulWidget {
  const UserForm({super.key});

  @override
  UserFormState createState() {
    return UserFormState();
  }
}

class UserFormState extends State<UserForm> {
  final _formKey = GlobalKey<FormState>();
  FilePickerResult? filePickerResult;
  FilePickerFormController formController = FilePickerFormController();

  Future<void> pickFiles() async {
    filePickerResult = await FilePicker.platform.pickFiles(allowMultiple: true);
  }

  List<PlatformFile> selectedFiles = []; // Store the selected files

  Future<void> _pickFiles() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: true,
        type: FileType.custom, // Adjust the file types as per your requirements
        allowedExtensions: ['pdf', 'doc', 'xls'],
      );

      if (result != null) {
        setState(() {
          selectedFiles = result.files;
        });
      }
    } catch (e) {
      print('Error while picking files: $e');
    }
  }

  Widget buildSelectedFilesList() {
    if (filePickerResult != null && filePickerResult!.files.isNotEmpty) {
      return ListView.builder(
        itemCount: filePickerResult!.files.length,
        itemBuilder: (context, index) {
          final file = filePickerResult!.files[index];
          return ListTile(
            title: Text(file.name),
            subtitle: Text(file.path!),
          );
        },
      );
    } else {
      return Text('No files selected');
    }
  }

  _onSave() {
    formController.selectedFiles.isNotEmpty
        ? () async {
            await formController.saveFiles();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Files saved successfully')),
            );
          }
        : null;
    // // Save the selected files
    // for (var file in selectedFiles) {
    //   // Implement your saving logic here
    //   print('Saving file: ${file.path}');
    // }
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    // bool _useCustomFileViewer = true;
    final applicationController = Get.put(AddFormController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Enter the requiered details",
          style: (TextStyle(
            color: Colors.black,
            fontSize: 24,
            wordSpacing: 2,
          )),
        ),
      ),
      // backgroundColor: Color.fromARGB(164, 49, 185, 156),
      body: Center(
        child: SingleChildScrollView(
          child: Card(
            color: Colors.white,
            shadowColor: Colors.black,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    key: formKey,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 50),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          TextFormField(
                            cursorColor: Colors.black,
                            // name: 'Full Name',
                            controller: applicationController.nameController,

                            decoration: const InputDecoration(
                              labelText: 'Full Name',
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(width: 2.0)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(width: 2.0)),
                              labelStyle: TextStyle(),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter full name';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            // autovalidateMode: AutovalidateMode.always,
                            // name: 'email',
                            controller: applicationController.emailController,

                            decoration: const InputDecoration(
                              labelText: 'Email',
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(width: 2.0)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(width: 2.0)),
                              errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(width: 2.0),
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty ||
                                  !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(value)) {
                                return 'Enter a valid email!';
                              }
                              return null;
                            },
                            // validator: FormBuilderValidators.compose([
                            //   FormBuilderValidators.required(),
                            //   FormBuilderValidators.email(),
                            //   FormBuilderValidators.max(70),
                            // ]),
                            // initialValue: '12',
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            cursorColor: Colors.black,
                            // name: 'Full Name',
                            controller:
                                applicationController.locationController,

                            decoration: const InputDecoration(
                              labelText: 'Location',
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(width: 2.0)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(width: 2.0)),
                              labelStyle: TextStyle(),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter Loaction';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            cursorColor: Colors.black,
                            // name: 'Phone Number',

                            controller: applicationController.phoneController,

                            decoration: const InputDecoration(
                              labelText: 'Phone Number',
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(width: 2.0)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(width: 2.0)),
                              labelStyle: TextStyle(),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter phone number';
                              }
                              return null;
                            },

                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          FormBuilderRadioGroup<String>(
                            hoverColor: Colors.black,

                            decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 3,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 3,
                                ),
                              ),
                              labelText: "Select Type of Help",
                              labelStyle: TextStyle(
                                  // color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal),
                            ),

                            initialValue: null,
                            name: 'type of need',
                            onChanged: (String? newValue) {
                              // setState(() {
                              applicationController.req_typeController.text =
                                  newValue!;
                              // });
                            },
                            validator: FormBuilderValidators.compose(
                                [FormBuilderValidators.required()]),
                            options: [
                              'Children Education',
                              'School Infrastructure',
                              'Scholarships'
                            ]
                                .map((type) => FormBuilderFieldOption(
                                      value: type,
                                      child: Text(
                                        type,
                                        // style: TextStyle(color: Colors.white),
                                      ),
                                    ))
                                .toList(),
                            controlAffinity: ControlAffinity.trailing,
                            // controller:applicationController.req_typeController,
                            // activeColor: Colors.white,

                            // focusColor: Colors.white,
                            // hoverColor: Colors.white,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            // autovalidateMode: AutovalidateMode.always,
                            // name: 'Address',

                            controller: applicationController.adressController,

                            decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 2,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 2,
                                ),
                              ),
                              border: OutlineInputBorder(
                                  // borderRadius:
                                  //     BorderRadius.all(Radius.circular(00.0)),
                                  ),
                              labelText: 'Address',
                              // labelStyle: TextStyle(color: Colors.white),
                              // suffixIcon: ageHasError
                              //     ? const Icon(Icons.error, color: Colors.red)
                              //     : const Icon(Icons.check,
                              //         color: Colors.green),
                            ),
                            // style: TextStyle(color: Colors.white),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter full address';
                              }
                              return null;
                            },
                            // onChanged: (val) {
                            //   setState(() {
                            //     _ageHasError = !(_formKey
                            //             .currentState?.fields['address']
                            //             ?.validate() ??
                            //         false);
                            //   });
                            // },
                            // valueTransformer: (text) => num.tryParse(text!),
                            // validator: FormBuilderValidators.compose([
                            //   FormBuilderValidators.required(),
                            //   FormBuilderValidators.numeric(),
                            //   FormBuilderValidators.max(70),
                            // ]),
                            // initialValue: '12',
                            minLines: 3,
                            maxLines: 15,
                            keyboardType: TextInputType.multiline,
                            textInputAction: TextInputAction.next,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            // name: 'Description',
                            controller:
                                applicationController.descriptionController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter description';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 2,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 2,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                              ),
                              labelText: 'Description',
                            ),

                            minLines: 3,
                            maxLines: 15,
                            keyboardType: TextInputType.multiline,
                            textInputAction: TextInputAction.next,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          // Column(
                          //   children: [
                          //     ElevatedButton(
                          //       onPressed: _pickFiles,
                          //       child: Text('Pick Files'),
                          //     ),
                          //     Expanded(
                          //       child: ListView.builder(
                          //         itemCount: _selectedFiles.length,
                          //         itemBuilder: (context, index) {
                          //           return ListTile(
                          //             title: Text(_selectedFiles[index].path),
                          //           );
                          //         },
                          //       ),
                          //     ),
                          //     ElevatedButton(
                          //       onPressed: () {
                          //         // Handle saving the form data and selected files
                          //         // Here, you can store the form data and the file paths in a database or send them to an API
                          //         // For simplicity, we're just printing the file paths here
                          //         for (var file in _selectedFiles) {
                          //           print(file.path);
                          //         }
                          //       },
                          //       child: Text('Save'),
                          //     ),
                          //   ],
                          // ),

                          Form(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  onPressed: () async {
                                    await formController.pickFiles();
                                    setState(() {});
                                  },
                                  child: Text('Pick Files'),
                                ),
                                SizedBox(height: 20),
                                Text(
                                    'Selected Files: ${formController.selectedFiles.length}'),
                                SizedBox(height: 20),
                                // ElevatedButton(
                                //   onPressed:
                                //       formController.selectedFiles.isNotEmpty
                                //           ? () async {
                                //               await formController.saveFiles();
                                //               ScaffoldMessenger.of(context)
                                //                   .showSnackBar(
                                //                 SnackBar(
                                //                     content: Text(
                                //                         'Files saved successfully')),
                                //               );
                                //             }
                                //           : null,
                                //   child: Text('Save Files'),
                                // ),
                              ],
                            ),

                            // child: Column(
                            //   children: [
                            //     ElevatedButton(
                            //       onPressed: _pickFiles,
                            //       child: Text('Select Files'),
                            //     ),
                            //     SizedBox(
                            //       height: 100,
                            //       child: ListView.builder(
                            //         itemCount: selectedFiles.length,
                            //         itemBuilder:
                            //             (BuildContext context, int index) {
                            //           return ListTile(
                            //             title: Text(selectedFiles[index].name),
                            //             subtitle: Text(selectedFiles[index]
                            //                 .size
                            //                 .toString()),
                            //           );
                            //         },
                            //       ),
                            //     ),
                            //     ElevatedButton(
                            //       onPressed: () {},
                            //       child: Text('Save Files'),
                            //     ),
                            //   ],
                            // ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            // Addform();
                            if (formKey.currentState!.validate()) {
                              final formUpload = Form_props(
                                  // id: idController.text.trim(),
                                  fullname: applicationController
                                      .nameController.text
                                      .trim(),
                                  uploadFile: formController.selectedFiles
                                      .map((e) => e.path)
                                      .toList(),
                                  email: applicationController
                                      .emailController.text
                                      .trim(),
                                  phone: applicationController
                                      .phoneController.text
                                      .trim(),
                                  req_type: applicationController
                                      .req_typeController.text
                                      .trim(),
                                  description: applicationController
                                      .descriptionController.text
                                      .trim(),
                                  location: applicationController
                                      .locationController.text
                                      .trim(),
                                  adress: applicationController
                                      .adressController.text
                                      .trim());

                              AddFormController.instance
                                  .createApplicationForm(formUpload);
                            }
                          },
                          child: const Text(
                            'Submit',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: TextButton(
                          style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.blue),
                          onPressed: () {
                            formKey.currentState?.reset();
                          },
                          child: Text(
                            'Reset',
                            style: TextStyle(color: Colors.white),
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
  }
}

class FilePickerFormController {
  List<File> selectedFiles = [];

  Future<void> pickFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx', 'img'],
    );

    if (result != null) {
      selectedFiles = result.paths.map((path) => File(path!)).toList();
    }
  }

  Future<void> saveFiles() async {
    // Implement your saving logic here
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx', 'img'],
    );
    if (result != null) {
      selectedFiles = result.paths.map((path) => File(path!)).toList();
    }
  }
}

Future<void> Addform() async {
  await Firebase.initializeApp();

  FirebaseFirestore.instance
      .collection('applicationDetails')
      .add({'text': 'data added through app'});
}

Widget customFileViewerBuilder(
  List<PlatformFile>? files,
  FormFieldSetter<List<PlatformFile>> setter,
) {
  return ListView.separated(
    shrinkWrap: true,
    itemBuilder: (context, index) {
      final file = files[index];
      return ListTile(
        title: Text(file.name),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () {
            files.removeAt(index);
            setter.call([...files]);
          },
        ),
      );
    },
    separatorBuilder: (context, index) => const Divider(
        // color: Colors.blueAccent,
        ),
    itemCount: files!.length,
  );
}

Widget fileDetails(PlatformFile file) {
  final kb = file.size / 1024;
  final mb = kb / 1024;
  final size =
      (mb >= 1) ? '${mb.toStringAsFixed(2)} MB' : '${kb.toStringAsFixed(2)} KB';
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('File Name: ${file.name}'),
        Text('File Size: $size'),
        Text('File Extension: ${file.extension}'),
        Text('File Path: ${file.path}'),
      ],
    ),
  );
}

class FileList extends StatefulWidget {
  final List<PlatformFile> files;
  final ValueChanged<PlatformFile> onOpenedFile;
  const FileList({Key? key, required this.files, required this.onOpenedFile})
      : super(key: key);
  @override
  _FileListState createState() => _FileListState();
}

class _FileListState extends State<FileList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Selected Files'),
      ),
      body: ListView.builder(
          itemCount: widget.files.length,
          itemBuilder: (context, index) {
            final file = widget.files[index];
            return buildFile(file);
          }),
    );
  }

  Widget buildFile(PlatformFile file) {
    final kb = file.size / 1024;
    final mb = kb / 1024;
    final size = (mb >= 1)
        ? '${mb.toStringAsFixed(2)} MB'
        : '${kb.toStringAsFixed(2)} KB';
    return InkWell(
      onTap: () => widget.onOpenedFile(file),
      child: ListTile(
        leading: (file.extension == 'jpg' || file.extension == 'png')
            ? Image.file(
                File(file.path.toString()),
                width: 80,
                height: 80,
              )
            : Container(
                width: 80,
                height: 80,
              ),
        title: Text('${file.name}'),
        subtitle: Text('${file.extension}'),
        trailing: Text(
          '$size',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
