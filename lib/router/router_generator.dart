// ignore_for_file: body_might_complete_normally_nullable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/presentation/business_logic/cubit/get_used_languages_cubit.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/presentation/pages/find_personal_assistant_page.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/presentation/pages/personal_assistant_profile.dart';
import 'package:staff_breeze/features/customer/hire_personal_assistant/presentation/pages/contact_personal_asistant.dart';
import 'package:staff_breeze/features/customer/hire_personal_assistant/presentation/pages/payment_page.dart';
import 'package:staff_breeze/features/customer/hire_personal_assistant/presentation/pages/pick_a_date.dart';
import 'package:staff_breeze/features/customer/presentation/pages/customer_profile_page.dart';
import 'package:staff_breeze/features/personal_assistant/presentation/pages/personal_assistant_home_page.dart';
import 'package:staff_breeze/features/personal_assistant/presentation/widgets/job_history_page.dart';
import 'package:staff_breeze/features/personal_assistant/presentation/widgets/notifications/notifications.dart';
import 'package:staff_breeze/features/personal_assistant/presentation/widgets/schedule/schedule_page.dart';
import 'package:staff_breeze/features/registration/presentation/pages/complete_registration_page.dart';
import 'package:staff_breeze/features/registration/presentation/pages/forget_password.dart';
import 'package:staff_breeze/features/registration/presentation/pages/register_page.dart';
import 'package:staff_breeze/features/registration/presentation/pages/reset_new_password.dart';
import 'package:staff_breeze/features/welcoming_pages/presentation/pages/get_started.dart';
import 'package:staff_breeze/features/welcoming_pages/presentation/pages/welcome_page_one.dart';

import '../features/customer/find_personal_assistant/presentation/business_logic/cubit/get_assistants_cubit.dart';
import '../features/customer/hire_personal_assistant/presentation/pages/summary_page.dart';
import '../features/personal_assistant/presentation/widgets/contact_support.dart';
import '../features/registration/presentation/business_logic/cubit/complete_registration_cubit.dart';
import '../features/registration/presentation/business_logic/cubit/forgot_password_cubit.dart';
import '../features/registration/presentation/business_logic/cubit/reset_password_cubit.dart';
import '../features/registration/presentation/business_logic/cubit/sign_in_cubit.dart';
import '../features/registration/presentation/business_logic/cubit/sign_up_cubit.dart';
import '../features/registration/presentation/pages/enter_code_page.dart';
import '../injection_container/injection.dart';
import 'app_routes.dart';

class RouteGenerator {
  static Route? routeGenerator(RouteSettings settings) {
    switch (settings.name) {
      case GET_STARTED:
        return MaterialPageRoute(builder: (context) => const GetStartedPage());
      case WELCOME_PAGE:
        return MaterialPageRoute(builder: (context) => WelcomePage());
      case REGISTER:
        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(
                  providers: [
                    BlocProvider(create: (context) => getIt<SignInCubit>()),
                    BlocProvider(create: (context) => getIt<SignUpCubit>()),
                  ],
                  child: const RegisterPage(),
                ));
      case COMPLETE_REGISTRATION:
        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                        create: (context) => getIt<AllLanguagesCubit>()),
                    BlocProvider(create: (context) => getIt<CountriesCubit>()),
                    BlocProvider(create: (context) => getIt<EducationsCubit>()),
                    BlocProvider(create: (context)=>getIt<EditDetailsCubit>(),)
                  ],
                  child: const CompleteRegistrationPage(),
                ));
      case FORGOT_PASSWORD:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => getIt<ForgotPasswordCubit>(),
                  child: const ForgotPasswordPage(),
                ));
      case ENTER_CODE:
        return MaterialPageRoute(
          builder: (context) => const EnterCodePage(),
        );
      case NEW_PASSWORD:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => getIt<ResetPasswordCubit>(),
                  child: const ResetPasswordPage(),
                ));
      case FIND_PERSONAL_ASSISTANT:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                  create: (context) =>
                      getIt<GetAssistantsCubit>()..getAllAssistants()),
              BlocProvider(create: (context) => getIt<GetUsedLanguagesCubit>()),
            ],
            child: const FindPersonalAssistant(),
          ),
        );
      case PERSONAL_ASSISTANT_PICKED_FROM_LIST:
        return MaterialPageRoute(
            builder: (context) => const PersonalAssistantProfile());
      case PICK_A_DATE:
        return MaterialPageRoute(builder: (context) => const PickDatePage());
      case SUMMARY_PAGE:
        return MaterialPageRoute(builder: (context) => const SummaryPage());
      case PAYMENT_PAGE:
        return MaterialPageRoute(builder: (context) => PaymentPage());
      case PERSONAL_ASSISTANT_HOMEPAGE:
        return MaterialPageRoute(
            builder: (context) => PersonalAssistantHomePage());
      case NOTIFICATIONS:
        return MaterialPageRoute(
            builder: (context) => const NotificationsPage());
      case SCHEDULE:
        return MaterialPageRoute(builder: (context) => const SchedulePage());
      case JOB_HISTORY:
        return MaterialPageRoute(builder: (context) => const JobHistoryPage());
      case CONTACT_SUPPORT:
        return MaterialPageRoute(
            builder: (context) => const ContactSupportPage());
      case CONTACT_WITH_PERSONAL_ASSISTANT:
        return MaterialPageRoute(
            builder: (context) => ContactPersonalAssistant());
      case CUSTOMER_PROFILE:
        return MaterialPageRoute(
            builder: (context) => const CustomerProfilePage());
    }
  }
}
