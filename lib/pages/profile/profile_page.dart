import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dash/flutter_dash.dart';

import '../../bloc/logout/logout_bloc.dart';
import '../../common/constants/colors.dart';
import '../../common/constants/icons.dart';
import '../../common/widgets/custom_scaffold.dart';
import '../../common/widgets/row_text.dart';
import '../../data/datasources/auth_local_datasource.dart';
import '../auth/auth_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          const SizedBox(height: 60.0),
          Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              color: ColorName.white,
              boxShadow: [
                BoxShadow(
                  color: ColorName.black.withOpacity(0.25),
                  offset: const Offset(0, 3),
                  spreadRadius: 0,
                  blurRadius: 4.0,
                  blurStyle: BlurStyle.outer,
                ),
              ],
            ),
            child: Column(
              children: [
                const SizedBox(height: 22.0),
                FutureBuilder(
                  future: AuthLocalDatasource().getUser(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50.0)),
                              child: Icon(
                                Icons.account_circle_outlined,
                                size: 50,
                                color: Colors.red,
                              )),
                          const SizedBox(width: 10.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 11.0, vertical: 2.0),
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(16.0)),
                                  border: Border.all(color: ColorName.primary),
                                ),
                                child: Text(
                                  snapshot.data!.roles,
                                  style: const TextStyle(
                                    color: ColorName.primary,
                                    fontSize: 8,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Text(
                                snapshot.data!.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: ColorName.primary,
                                ),
                              ),
                              const Text(
                                "Senin, 28 Agustus 2023",
                                style: TextStyle(
                                  fontSize: 8,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    } else {
                      return const Center(
                        child: Text('Tidak ada data'),
                      );
                    }
                  },
                ),
                const SizedBox(height: 5.0),
                Dash(
                  length: MediaQuery.of(context).size.width - 60.0,
                  dashColor: const Color(0xffD5DFE7),
                ),
                const SizedBox(height: 16.0),
              ],
            ),
          ),
          const SizedBox(height: 60.0),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              color: ColorName.white,
              boxShadow: [
                BoxShadow(
                  color: ColorName.black.withOpacity(0.25),
                  offset: const Offset(0, 3),
                  spreadRadius: 0,
                  blurRadius: 4.0,
                  blurStyle: BlurStyle.outer,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RowText(
                  icon: const ImageIcon(IconName.profileLine),
                  label: 'Edit Informasi Profil',
                  value: '',
                  valueColor: ColorName.primary,
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const EditProfilePage(),
                    //   ),
                    // );
                  },
                ),
                const SizedBox(height: 12.0),
                RowText(
                  icon: const Icon(Icons.notifications),
                  label: 'Notifikasi',
                  value: 'ON',
                  valueColor: ColorName.primary,
                  onTap: () {},
                ),
                const SizedBox(height: 12.0),
                RowText(
                  icon: const Icon(Icons.translate),
                  label: 'Bahasa',
                  value: 'Indonesia',
                  valueColor: ColorName.primary,
                  onTap: () {},
                ),
              ],
            ),
          ),
          const SizedBox(height: 24.0),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              color: ColorName.white,
              boxShadow: [
                BoxShadow(
                  color: ColorName.black.withOpacity(0.25),
                  offset: const Offset(0, 3),
                  spreadRadius: 0,
                  blurRadius: 4.0,
                  blurStyle: BlurStyle.outer,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RowText(
                  icon: const ImageIcon(IconName.projector2Line),
                  label: 'Keamanan',
                  value: '',
                  valueColor: ColorName.primary,
                  onTap: () {},
                ),
                const SizedBox(height: 12.0),
                RowText(
                  icon: const ImageIcon(IconName.mentalHealthLine),
                  label: 'Tema',
                  value: 'Mode Terang',
                  valueColor: ColorName.primary,
                  onTap: () {},
                ),
              ],
            ),
          ),
          const SizedBox(height: 24.0),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              color: ColorName.white,
              boxShadow: [
                BoxShadow(
                  color: ColorName.black.withOpacity(0.25),
                  offset: const Offset(0, 3),
                  spreadRadius: 0,
                  blurRadius: 4.0,
                  blurStyle: BlurStyle.outer,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RowText(
                  icon: const ImageIcon(IconName.contactsLine),
                  label: 'Help & Support',
                  value: '',
                  valueColor: ColorName.primary,
                  onTap: () {},
                ),
                const SizedBox(height: 12.0),
                RowText(
                  icon: const ImageIcon(IconName.chatQuoteLine),
                  label: 'Contact us',
                  value: '',
                  valueColor: ColorName.primary,
                  onTap: () {},
                ),
                const SizedBox(height: 12.0),
                RowText(
                  icon: const Icon(Icons.lock),
                  label: 'Privacy policy',
                  value: '',
                  valueColor: ColorName.primary,
                  onTap: () {},
                ),
                const SizedBox(
                  height: 12,
                ),
                Center(
                  child: BlocProvider(
                    create: (context) => LogoutBloc(),
                    child: BlocConsumer<LogoutBloc, LogoutState>(
                      listener: (context, state) {
                        state.maybeWhen(
                          orElse: () {},
                          loaded: () {
                            AuthLocalDatasource().removeAuthData();
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) {
                              return const AuthPage();
                            }));
                          },
                          error: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('logout error'),
                              ),
                            );
                          },
                        );
                      },
                      builder: (context, state) {
                        return state.maybeWhen(
                          orElse: () {
                            return ElevatedButton(
                              onPressed: () {
                                context
                                    .read<LogoutBloc>()
                                    .add(const LogoutEvent.logout());
                              },
                              child: const Text('Logout'),
                            );
                          },
                          loaded: () {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
