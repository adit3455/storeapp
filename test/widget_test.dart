// ignore_for_file: public_member_api_docs, sort_constructors_first
// // This is a basic Flutter widget test.
// //
// // To perform an interaction with a widget in your test, use the WidgetTester
// // utility in the flutter_test package. For example, you can send tap and scroll
// // gestures. You can also use WidgetTester to find child widgets in the widget
// // tree, read text, and verify that the values of widget properties are correct.

// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';

// import 'package:storeapp/main.dart';

// void main() {
//   testWidgets('Counter increments smoke test', (WidgetTester tester) async {
//     // Build our app and trigger a frame.
//     await tester.pumpWidget(const MyApp());

//     // Verify that our counter starts at 0.
//     expect(find.text('0'), findsOneWidget);
//     expect(find.text('1'), findsNothing);

//     // Tap the '+' icon and trigger a frame.
//     await tester.tap(find.byIcon(Icons.add));
//     await tester.pump();

//     // Verify that our counter has incremented.
//     expect(find.text('0'), findsNothing);
//     expect(find.text('1'), findsOneWidget);
//   });
// }

// import 'package:dio/dio.dart';

// class User {
//   final int? id;
//   final String? email;
//   final String? firstName;
//   final String? lastName;
//   final String? avatar;

//   User({
//     this.id,
//     this.email,
//     this.firstName,
//     this.lastName,
//     this.avatar,
//   });

//   factory User.fromJson(Map<String, dynamic> json) {
//     return User(
//       email: json['email'],
//       avatar: json['avatar'],
//       firstName: json['first_name'],
//       id: json['id'],
//       lastName: json['last_name'],
//     );
//   }

//   static Future<User> getData() async {
//     var response = await Dio().get(
//       "https://reqres.in/api/users/2",
//       options: Options(
//         headers: {
//           "Content-Type": "application/json",
//         },
//       ),
//     );
//     Map<String, dynamic> json = response.data['data'];
//     print(User.fromJson(json));

//     return User.fromJson(json);
//   }
// }

// void main() async {
//   List listOfUser = ['Ditami', 'Adit', 'Aldi'];

//   listOfUser.map((e) => print(e)).toList();

//   var user = User.getData();

//   print(user);

//   Testi a = Testi();
//   Testi d = Testi();
//   var b = a.name.hashCode;
//   var c = d.name.hashCode;

//   print("b : $b, c : $c");
// }

// class Testi {
//   String? name;
//   int? age;
// }

// import 'package:equatable/equatable.dart';

// class Person extends Equatable {
//   String? name;
//   int? age;
//   String? address;

//   Person({
//     required this.name,
//     required this.age,
//     required this.address,
//   });

//   void printName() {
//     "Halo nama Saya $name";
//   }

//   @override
//   List<Object?> get props => [name, address, age];
// }

// class PersonSister extends Person {
//   String sister;
//   PersonSister({super.name, super.age, super.address, required this.sister});

//   @override
//   void printName() {
//     print(
//         "Halo nama Saya $name saya tinggal di $address dan umur $age nama kaka saya $sister");
//   }
// }

// class PersonBrother implements PersonSister {
//   String brotherName;

//   @override
//   String? address;

//   @override
//   int? age;

//   @override
//   String? name;

//   @override
//   String sister;
//   PersonBrother({
//     required this.brotherName,
//     this.address,
//     this.age,
//     this.name,
//     required this.sister,
//   });

//   @override
//   void printName() {
//     print("Halo nama saya $name, alamat saya $address, ");
//   }

//   @override
//   List<Object?> get props => [address, age, name, sister];

//   @override
//   bool? get stringify => false;
// }

// class Price {
//   List<double> listOfPrice = [20.0, 10.0, 40.0];

//   double get subTotal =>
//       listOfPrice.fold(0, (previousValue, element) => previousValue + element);

//   String get subTotalToString => subTotal.toStringAsFixed(2);
// }

// void main() {
//   Person a =
//       Person(name: "Adit", age: 22, address: "JLN EKA RASMI KOMP SPRINGVILLE");
//   Person b =
//       Person(name: "Adit", age: 22, address: "JLN EKA RASMI KOMP SPRINGVILLE");

//   PersonSister c = PersonSister(sister: "Ditami");
//   c.address = 'JL eka rasmi';
//   c.age = 22;
//   c.name = 'Adit';
//   c.printName();

//   var d = Price();
//   print(d.subTotalToString);

//   // print("${a.hashCode} dan ${b.hashCode}");
// }
