import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './person.dart';
import './animal.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget{
  // final RxInt _counter = 0.obs;
  final RxInt _counter = RxInt(0);
  final RxString _username = 'zhangSan'.obs;
  final RxList _list=['1','2'].obs;
  Rx<String> _sex =Rx<String>('男');

  var p =Person();
  var a=  Animal('xiao mao', 2).obs;
  
   MyHomePage({super.key}); 
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body:Center  (
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text('${_counter.value}',style: Theme.of(context).textTheme.headlineLarge,),),
            const SizedBox(),
            Obx(() => Text(_username.value,style: Theme.of(context).textTheme.headlineLarge,),),
            const SizedBox(),
            Obx(() =>  Column(
    children: _list.map((v) =>  ListTile(title: Text(v),)).toList(),
    )),
            const SizedBox(),
            Obx(() => Text(_sex.value,style: Theme.of(context).textTheme.headlineLarge,)),
            const SizedBox(),
            Obx(() => Text(p.username.value,style: Theme.of(context).textTheme.headlineLarge,)),
            const SizedBox(),
            Obx(() => Text(a.value.username,style: Theme.of(context).textTheme.headlineLarge,))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: (){
          _counter.value++;
          _username.value+='1';
          _list.add('3');
          _sex.value='girl';
          p.username.value=p.username.value.toUpperCase();

            //第一种，方式，比较繁琐
          // a.value.username='xiao gou';
          // a.value=a.value;
          //第二章方式，简单，直接Animal赋值
            a.value = Animal('xiao zhu', 5);
        },
      ),
    );
  }

}
// class MyHomePage extends StatelessWidget {
//   final RxInt _counter = RxInt(0);
//   final RxString _username = "zhangsan".obs;
//   final RxList _list = ["张三", "李四"].obs;
//   final Rx<String> _sex = Rx<String>("男");
//
//   //实例化lei
//
//   var p =  Person();
//
//   var a= Animal("xiao mao", 2).obs;
//
//   MyHomePage({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Title'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Obx(() => Text(
//                   "${_counter.value}",
//                   style: Theme.of(context).textTheme.headline1,
//                 )),
//             const SizedBox(),
//             Obx(() {
//               return Text(_username.value,
//                   style: Theme.of(context).textTheme.subtitle2);
//             }),
//             const SizedBox(),
//             Obx(() {
//               return Column(
//                 children: _list.map((v) {
//                   return ListTile(title: Text(v));
//                 }).toList(),
//               );
//             }),
//             const SizedBox(),
//             Obx(() =>
//                 Text(_sex.value, style: Theme.of(context).textTheme.headline6)),
//             const SizedBox(),
//             Obx(() => Text("${p.username}",
//                 style: Theme.of(context).textTheme.headline4)),
//
//                   const SizedBox(),
//             Obx(() => Text(a.value.username,
//                 style: Theme.of(context).textTheme.headline4))
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: const Icon(Icons.add),
//         onPressed: () {
//           _counter.value++;
//
//           _username.value = "lisi";
//
//           _list.add("王五"); //注意
//
//           p.username.value=p.username.value.toUpperCase();
//
//
//           a.value=Animal("小狗", 3);
//         },
//       ),
//     );
//   }
// }
