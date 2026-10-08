import 'package:flutter/material.dart';

void main() {
  runApp(const SlicingOVO());
}

class SlicingOVO extends StatelessWidget {
  const SlicingOVO({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Slicing OVO",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF5F5FA),
        useMaterial3: true,
      ),
      home: const MainNavigationPage(),
    );
  }
}

class MainNavigationPage extends StatefulWidget {
  const MainNavigationPage({super.key});

  @override
  State<MainNavigationPage> createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage> {
  int _index = 0; // 0 = Home, 4 = Profile

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _index == 0 ? const HomePage() : const ProfilePage(),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, -2)),
          ],
        ),
        child: SafeArea(
          top: false,
          child: SizedBox(
            height: 64,
            child: Stack(
              clipBehavior: Clip.none, // supaya tombol Pay boleh keluar dari bar
              children: [
                Row(
                  children: [
                    Expanded(
                      child: NavItem(
                        icon: Icons.home_rounded,
                        label: "Home",
                        selected: _index == 0,
                        onTap: () => setState(() => _index = 0),
                      ),
                    ),
                    Expanded(
                      child: NavItem(
                        icon: Icons.currency_exchange,
                        label: "Finance",
                        selected: false,
                        onTap: () {},
                      ),
                    ),
                    // slot tengah: hanya label "Pay", tombolnya di Positioned
                    Expanded(
                      child: GestureDetector(
                        onTap: () {},
                        behavior: HitTestBehavior.opaque,
                        child: const Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 8),
                            child: Text(
                              "Pay",
                              style: TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: NavItem(
                        icon: Icons.notifications_rounded,
                        label: "Inbox",
                        selected: false,
                        badge: "36",
                        onTap: () {},
                      ),
                    ),
                    Expanded(
                      child: NavItem(
                        icon: Icons.person_rounded,
                        label: "Profile",
                        selected: _index == 4,
                        onTap: () => setState(() => _index = 4),
                      ),
                    ),
                  ],
                ),

                // Tombol Pay yang menonjol
                Positioned(
                  top: -26,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 62,
                        height: 62,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: const Color(0xFF4A2FB0),
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 4),
                          boxShadow: const [
                            BoxShadow(color: Colors.black26, blurRadius: 6),
                          ],
                        ),
                        child: const Text(
                          "QRIS",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ),
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

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 216, 200, 255),
      body: SafeArea(
        child: Column(
          children: [
            // ===== HEADER: tetap diam, tidak ikut scroll =====
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 4, left: 5),
                    child: Image.asset("assets/logo_ovo.png", height: 30),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 242, 242, 255),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 23,
                            height: 23,
                            decoration: const BoxDecoration(
                              color: Color(0xFF4A2FB0),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.percent,
                              size: 14,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            "Promo",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF4A2FB0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // ===== BAGIAN YANG BISA DI-SCROLL =====
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: OvoCash(),
                    ),
                    SizedBox(height: 16),
                    HomeSheet(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OvoCash extends StatefulWidget {
  const OvoCash({super.key});

  @override
  State<OvoCash> createState() => _OvoCashState();
}

class _OvoCashState extends State<OvoCash> {
  bool _hidden = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [
            Color.fromARGB(255, 0, 39, 146),
            Color.fromARGB(255, 133, 99, 189),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.3), blurRadius: 10),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                "assets/logo_ovo.png",
                height: 15,
                color: Colors.white,
              ),
              const SizedBox(width: 5),
              const Text(
                "Cash",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 3),
          Row(
            children: [
              const Text(
                "Total Saldo",
                style: TextStyle(color: Colors.white54, fontSize: 14),
              ),
              const SizedBox(width: 8),
              Text(
                _hidden ? "Rp ••••••" : "Rp 1.250.000",
                style: const TextStyle(
                  color: Colors.white54,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 6),
              GestureDetector(
                onTap: () => setState(() => _hidden = !_hidden),
                behavior: HitTestBehavior.opaque,
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: Icon(
                    _hidden
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    size: 16,
                    color: Colors.white54,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10), 
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Tap untuk lihat",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const CircleAvatar(
                        radius: 10,
                        backgroundColor: Color(0xFF4A2FB0),
                        child: Text(
                          "P",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 6),
                      Image.asset(
                        "assets/logo_ovo.png",
                        height: 12,
                        color: const Color(0xFF4A2FB0),
                      ),
                      const SizedBox(width: 4),
                      const Text(
                        "Points",
                        style: TextStyle(
                          color: Color(0xFF4A2FB0),
                          fontWeight: FontWeight.w800,
                          fontSize: 13,
                        ),
                      ),
                      const Icon(
                        Icons.chevron_right_rounded,
                        size: 20,
                        color: Color(0xFF4A2FB0),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 25),
          const Row(
            children: [
              Expanded(
                child: CashMenuItem(
                  icon: Icons.add_circle_rounded,
                  label: "Top Up",
                ),
              ),
              Expanded(
                child: CashMenuItem(
                  icon: Icons.arrow_circle_up_rounded,
                  label: "Transfer",
                ),
              ),
              Expanded(
                child: CashMenuItem(
                  icon: Icons.download_rounded,
                  label: "Tarik Tunai",
                ),
              ),
              Expanded(
                child: CashMenuItem(
                  icon: Icons.list_alt_rounded,
                  label: "History",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CashMenuItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const CashMenuItem({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      behavior: HitTestBehavior.opaque,
      child: Column(
        children: [
          Icon(icon, color: Colors.white, size: 28),
          const SizedBox(height: 5),
          Text(
            label,
            style: const TextStyle(color: Colors.white, fontSize: 13.5),
          ),
        ],
      ),
    );
  }
}

class HomeSheet extends StatelessWidget {
  const HomeSheet({super.key});

  static const tabs = ["Favorit", "Finansial", "Hiburan", "Pilihan Lain"];

  static const services = [
    ServiceData(
      "Nabung by\nSuperbank",
      Icons.savings_rounded,
      Color(0xFF7B5CE0),
      "BARU",
    ),
    ServiceData("Pinjaman", Icons.payments_rounded, Color(0xFF5B3FD0), "100JT"),
    ServiceData(
      "Uang\nElektronik",
      Icons.account_balance_wallet_rounded,
      Color(0xFFE64A19),
      "Rp 1",
    ),
    ServiceData(
      "Angsuran\nKredit",
      Icons.receipt_long_rounded,
      Color(0xFFE91E63),
      null,
    ),
    ServiceData(
      "Pulsa/Paket\nData",
      Icons.phone_android_rounded,
      Color(0xFF1E88E5),
      "PROMO",
    ),
    ServiceData("PLN", Icons.bolt_rounded, Color(0xFFFB8C00), "PROMO"),
    ServiceData("Air PDAM", Icons.water_drop_rounded, Color(0xFF039BE5), null),
    ServiceData(
      "Internet &\nTV Kabel",
      Icons.tv_rounded,
      Color(0xFFE64A19),
      null,
    ),
  ];

  static const banners = [
    "assets/promo1.jpg",
    "assets/promo2.jpg",
    "assets/promo3.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: ListView(
        shrinkWrap: true, // <- supaya ikut scroll bareng halaman
        physics: const NeverScrollableScrollPhysics(), // <- hanya 1 yang scroll
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.2),
                  blurRadius: 10,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.track_changes_rounded,
                      color: Color(0xFF4A2FB0),
                      size: 50,
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        "Cek data kamu demi kelancaran pemakaian akun OVO Premier kamu",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4A2FB0),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 36),
                    ),
                    child: const Text("Cek"),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(tabs.length, (i) {
                final selected = i == 0;
                return Container(
                  margin: const EdgeInsets.only(right: 8),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: selected
                        ? const Color(0xFFEFEAFB)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    tabs[i],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: selected ? const Color(0xFF4A2FB0) : Colors.grey,
                    ),
                  ),
                );
              }),
            ),
          ),
          const SizedBox(height: 12),

          GridView.count(
            crossAxisCount: 4,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            childAspectRatio: 0.95,
            mainAxisSpacing: 8,
            children: services.map((s) => ServiceItem(data: s)).toList(),
          ),

          // ===== Banner promo yang bisa digeser =====
          const SizedBox(height: 16),
          SizedBox(
            height: 200, // sesuaikan dengan ukuran gambarmu
            child: PageView(
              padEnds: false,
              controller: PageController(viewportFraction: 0.88),
              children: banners.map((path) {
                return GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: const EdgeInsets.only(right: 12),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        path,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class ServiceData {
  final String label;
  final IconData icon;
  final Color color;
  final String? badge;

  const ServiceData(this.label, this.icon, this.color, this.badge);
}

class ServiceItem extends StatelessWidget {
  final ServiceData data;

  const ServiceItem({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      behavior: HitTestBehavior.opaque,
      child: Column(
        children: [
          const SizedBox(height: 8),
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topCenter,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: data.color.withValues(alpha: 0.12),
                child: Icon(data.icon, color: data.color, size: 35),
              ),
              if (data.badge != null)
                Positioned(
                  top: -6,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      data.badge!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 9,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            data.label,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 24, 20, 24),
          children: [
            const Text(
              "Profile",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 20),

            // Kartu nama
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFE0E0E0)),
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 20,
                    backgroundColor: Color(0xFFEFEAFB),
                    child: Icon(Icons.person, color: Color(0xFF4A2FB0)),
                  ),
                  const SizedBox(width: 14),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Janeeta Samahat Nowa",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text("0821-5850-9705", style: TextStyle(fontSize: 14)),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Ubah",
                        style: TextStyle(
                          color: Color(0xFF1565C0),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Tombol Loyalty Code
            InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(12),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 18),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFE0E0E0)),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.view_week_rounded, size: 30),
                    SizedBox(width: 10),
                    Text(
                      "Loyalty Code",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const ProfileSectionTitle("Akun"),
            ProfileMenuItem(
              leading: const Icon(
                Icons.track_changes_rounded,
                color: Color(0xFF4A2FB0),
                size: 26,
              ),
              label: "OVO Premier",
              trailing: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4A2FB0),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                ),
                child: const Text(
                  "Upgrade",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const ProfileMenuItem(
              leading: BlackCircleIcon(child: Text("P", style: _pStyle)),
              label: "OVO Points",
            ),
            const ProfileMenuItem(
              leading: BlackCircleIcon(
                child: Icon(Icons.star_rounded, color: Colors.white, size: 16),
              ),
              label: "OVO Stamp",
            ),
            ProfileMenuItem(
              leading: const Icon(Icons.link_rounded, size: 26),
              label: "Aplikasi Terhubung",
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE91E4D),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text(
                      "NEW",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(Icons.chevron_right_rounded),
                ],
              ),
            ),

            const ProfileSectionTitle("Bantuan"),
            const ProfileMenuItem(
              leading: BlackCircleIcon(
                child: Icon(
                  Icons.question_mark_rounded,
                  color: Colors.white,
                  size: 16,
                ),
              ),
              label: "Pusat Bantuan",
            ),

            const ProfileSectionTitle("Keamanan"),
            const ProfileMenuItem(
              leading: Icon(Icons.lock_outline_rounded, size: 26),
              label: "PIN OVO",
            ),
            const ProfileMenuItem(
              leading: Icon(Icons.shield_outlined, size: 26),
              label: "Keamanan Akun",
            ),
          ],
        ),
      ),
    );
  }
}

const _pStyle = TextStyle(
  color: Colors.white,
  fontSize: 13,
  fontWeight: FontWeight.bold,
);

// Judul section (Akun, Bantuan, Keamanan)
class ProfileSectionTitle extends StatelessWidget {
  final String title;
  const ProfileSectionTitle(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 28, bottom: 6),
      child: Text(
        title,
        style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
      ),
    );
  }
}

// Ikon bulat hitam (OVO Points, Stamp, Pusat Bantuan)
class BlackCircleIcon extends StatelessWidget {
  final Widget child;
  const BlackCircleIcon({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 26,
      height: 26,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
      ),
      child: child,
    );
  }
}

// Satu baris menu
class ProfileMenuItem extends StatelessWidget {
  final Widget leading;
  final String label;
  final Widget? trailing;

  const ProfileMenuItem({
    super.key,
    required this.leading,
    required this.label,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Color(0xFFEEEEEE))),
        ),
        child: Row(
          children: [
            SizedBox(width: 28, child: Center(child: leading)),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                label,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
            trailing ?? const Icon(Icons.chevron_right_rounded),
          ],
        ),
      ),
    );
  }
}

class NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;
  final String? badge;
  final VoidCallback onTap;

  const NavItem({
    super.key,
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
    this.badge,
  });

  @override
  Widget build(BuildContext context) {
    final color = selected ? const Color(0xFF4A2FB0) : Colors.grey;
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Icon(icon, color: color, size: 26),
              if (badge != null)
                Positioned(
                  top: -4,
                  right: -10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      badge!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 9,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 2),
          Text(label, style: TextStyle(fontSize: 12, color: color)),
        ],
      ),
    );
  }
}