import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigoAccent,
      appBar: AppBar(
        title: const Text(
          'Tài khoản',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: const SizedBox(),
        backgroundColor: Colors.indigoAccent,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        controller: ScrollController(),
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            infoBar(),
            financeBar(),
            financeBar(),
            financeBar(),
          ],
        ),
      ),
    );
  }

  // Partner info bar
  Widget infoBar() {
    return Center(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Thông tin cá nhân',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Colors.deepOrangeAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35),
                    ),
                  ),
                  child: const Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                CircleAvatar(
                  radius: 48,
                  backgroundColor: Colors.grey,
                  child: Image.asset(
                    'assets/images/profile.jpg',
                    height: 100,
                    width: 100,
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Nguyễn Văn A",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "Cộng tác viên",
                      style: TextStyle(fontSize: 14),
                    ),
                    Text(
                      "0123456789",
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Text(
                  "Dịch vụ chính:",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(width: 10),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: const Text(
                    "Nấu ăn, giặt là, dọn nhà, fjsdklfjsdkfhjsdkfhjskdhjf",
                    style: TextStyle(fontSize: 14),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                const SizedBox(height: 10),
              ],
            )
          ],
        ),
      ),
    );
  }

  // Partner Financial info bar
  Widget financeBar() {
    return Center(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Tài Chính',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Colors.deepOrangeAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35),
                    ),
                  ),
                  child: const Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Center(
              child: Text(
                "Tài khoản chính",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(12),
              width: MediaQuery.of(context).size.width * 0.5,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Text(
                  "1.000.000đ",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
  
}
