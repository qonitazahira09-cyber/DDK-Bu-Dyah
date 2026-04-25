import 'package:flutter/material.dart';
import 'package:flutter_getx/app/routes/app_pages.dart';

import 'package:get/get.dart';


// Jika nama projectmu adalah flutter_getx
import 'package:flutter_getx/app/modules/home/controllers/home_controller.dart';
class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
     body: Center(
        child: InkWell(
          borderRadius: BorderRadius.circular(10), // Efek klik mengikuti bentuk box
          onTap: () {
            Get.toNamed(Routes.LOGIN);
          },
          child: Padding(
            padding: const EdgeInsets.all(20.0), // Memberi ruang agar mudah diklik
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.login, size: 50, color: Colors.blue),
                const SizedBox(height: 10),
                const Text(
                  'Pindah ke Login',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
