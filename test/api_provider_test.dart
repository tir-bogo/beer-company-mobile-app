// import 'package:flutter_test/flutter_test.dart';
// import 'package:http/http.dart';
// import 'package:http/testing.dart';
// import 'dart:convert';
// import '/Users/jonas/beer-company-mobile-app/lib/src/resources/api_provider.dart';

// void main(){
// test("Testing the network call", () async{
//   //setup the test
//   final apiProvider = ApiProvider();
//   apiProvider.client = MockClient((request) async {
//     final mapJson = {'id':12};
//     return Response(json.encode(mapJson),200);
//   });
//   final item = await apiProvider.fetchPosts();
//   expect(item.id, 1);
// });
// }