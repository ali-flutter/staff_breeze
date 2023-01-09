// ignore_for_file: body_might_complete_normally_nullable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:staff_breeze/features/customer/domain/use_case/edit_name_profile_image_use.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/presentation/business_logic/cubit/add_about_cubit.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/presentation/business_logic/cubit/add_review_cubit.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/presentation/business_logic/cubit/get_reviews_cubit.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/presentation/business_logic/cubit/get_used_languages_cubit.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/presentation/pages/find_personal_assistant_page.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/presentation/pages/personal_assistant_profile.dart';
import 'package:staff_breeze/features/customer/hire_personal_assistant/presentation/pages/contact_personal_asistant.dart';
import 'package:staff_breeze/features/customer/hire_personal_assistant/presentation/pages/payment_page.dart';
import 'package:staff_breeze/features/customer/hire_personal_assistant/presentation/pages/pick_a_date.dart';
import 'package:staff_breeze/features/customer/presentation/business_logic/cubit/edit_name_profile_image_cubit.dart';
import 'package:staff_breeze/features/customer/presentation/business_logic/cubit/get_customer_reservation_cubit.dart';
import 'package:staff_breeze/features/customer/presentation/pages/customer_profile_page.dart';
import 'package:staff_breeze/features/personal_assistant/presentation/business_logic/cubit/add_languages_cubit.dart';
import 'package:staff_breeze/features/personal_assistant/presentation/business_logic/cubit/get_free_days_cubit.dart';
import 'package:staff_breeze/features/personal_assistant/presentation/pages/personal_assistant_home_page.dart';
import 'package:staff_breeze/features/personal_assistant/presentation/widgets/assistant_job_history_page.dart';
import 'package:staff_breeze/features/personal_assistant/presentation/widgets/notifications/notifications.dart';
import 'package:staff_breeze/features/personal_assistant/presentation/widgets/schedule/schedule_page.dart';
import 'package:staff_breeze/features/registration/presentation/business_logic/cubit/add_device_token_cubit.dart';
import 'package:staff_breeze/features/registration/presentation/business_logic/cubit/remove_device_token_cubit.dart';
import 'package:staff_breeze/features/registration/presentation/pages/complete_registration_page.dart';
import 'package:staff_breeze/features/registration/presentation/pages/forget_password.dart';
import 'package:staff_breeze/features/registration/presentation/pages/register_page.dart';
import 'package:staff_breeze/features/registration/presentation/pages/reset_new_password.dart';
import 'package:staff_breeze/features/welcoming_pages/presentation/pages/get_started.dart';
import 'package:staff_breeze/features/welcoming_pages/presentation/pages/welcome_page_one.dart';

import '../features/customer/find_personal_assistant/presentation/business_logic/cubit/get_assistants_cubit.dart';
import '../features/customer/find_personal_assistant/presentation/business_logic/get_customer_info_cubit.dart';
import '../features/customer/hire_personal_assistant/presentation/pages/summary_page.dart';
import '../features/customer/presentation/pages/customer_job_history_page.dart';
import '../features/personal_assistant/presentation/business_logic/cubit/get_assistant_reservation_cubit.dart';
import '../features/personal_assistant/presentation/business_logic/cubit/insert_free_days_cubit.dart';
import '../features/personal_assistant/presentation/business_logic/cubit/personal_assistant_home_page_cubit.dart';
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
                    BlocProvider(
                        create: (context) => getIt<AddDeviceTokenCubit>()),
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
                    BlocProvider(
                        create: (context) => getIt<EditDetailsCubit>()),
                    BlocProvider(
                        create: (context) => getIt<GetAllServicesCubit>()),
                    BlocProvider(
                        create: (context) => getIt<GetCitiesInCountryCubit>()),
                    BlocProvider(
                        create: (context) => getIt<AddLanguagesCubit>()),
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

              BlocProvider(create: (context) =>getIt<GetAssistantsCubit>()),
              BlocProvider(create: (context) => getIt<GetUsedLanguagesCubit>()),
              BlocProvider(create: (context)=>getIt<RemoveDeviceTokenCubit>()),
              BlocProvider(create: (context)=>getIt<GetCustomerInfoCubit>()),
            ],
            child: const FindPersonalAssistant(),
          ),
        );
      case PERSONAL_ASSISTANT_PICKED_FROM_LIST:
        return MaterialPageRoute(
            builder: (context) =>  MultiBlocProvider(
              providers: [
                BlocProvider(create:(context) =>getIt<AddReviewCubit>(),),
                BlocProvider(create:(context) =>getIt<GetReviewsCubit>(),),
              ],

                child:const PersonalAssistantProfile()
            ));
      case PICK_A_DATE:
        return MaterialPageRoute(builder: (context) => BlocProvider(
          create: (context) =>getIt<GetFreeDaysCubit>(),
            child: const PickDatePage(),
        ));
      case SUMMARY_PAGE:
        return MaterialPageRoute(builder: (context) => const SummaryPage());
      case PAYMENT_PAGE:
        return MaterialPageRoute(builder: (context) => PaymentPage());
      case CUSTOMER_JOB_HISTORY_PAGE:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
              create: (context) => getIt<GetCustomerReservationCubit>(),
              child: const CustomerJobHistoryPage()),
        );
      case PERSONAL_ASSISTANT_HOMEPAGE:
        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) =>
                          getIt<PersonalAssistantHomePageCubit>(),
                    ),
                    BlocProvider(create: (context)=>getIt<GetAllServicesCubit>()),
                    BlocProvider(create: (context)=>getIt<GetCitiesInCountryCubit>()),
                    BlocProvider(create: (context)=>getIt<EditDetailsCubit>()),
                    BlocProvider(create: (context)=>getIt<RemoveDeviceTokenCubit>())
                  ],
                  child: const PersonalAssistantHomePage(),
                ));
      case NOTIFICATIONS:
        return MaterialPageRoute(
            builder: (context) => const NotificationsPage());
      case SCHEDULE:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => getIt<InsertFreeDaysCubit>(),
                  child: const SchedulePage(),
                ));
      case JOB_HISTORY:
        return MaterialPageRoute(builder: (context) =>  BlocProvider(
          create: (context) =>getIt<GetAssistantReservationCubit>(),
            child: const AssistantJobHistoryPage(),
        ));
      case CONTACT_SUPPORT:
        return MaterialPageRoute(
            builder: (context) => const ContactSupportPage());
      case CONTACT_WITH_PERSONAL_ASSISTANT:
        return MaterialPageRoute(
            builder: (context) => ContactPersonalAssistant());
      case CUSTOMER_PROFILE:
        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(
             providers: [
               BlocProvider(create: (context) =>getIt<GetCustomerInfoCubit>(),),
               BlocProvider(create:(context)=>getIt<AddAboutCubit>()),
               BlocProvider(create: (context)=>getIt<EditNameProfileImageCubit>())
             ],
            child:const CustomerProfilePage()));
    }
  }
}
/* create: (context) =>getIt<GetCustomerInfoCubit>(),*/