import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fun_dev_project/core/widget/custom_button.dart';


class ErrorContainer extends StatelessWidget {
  final GestureTapCallback onTap;
  final String? msg;

  const ErrorContainer({super.key, required this.onTap, this.msg});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        MediaQuery.of(context).size.width * 0.05581395348,
        (MediaQuery.of(context).size.height * 0.47639484978) * 0.05144694533,
        MediaQuery.of(context).size.width * 0.05581395348,
        (MediaQuery.of(context).size.height * 0.47639484978) * 0.05144694533,
      ),
      width: MediaQuery.of(context).size.width,
      decoration: ShapeDecoration(
        color: Theme.of(context).colorScheme.background,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.01663201663),
          SvgPicture.asset("assets/images/wrong.svg"),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01663201663),
          Text(
            msg == null
                ? AppLocalizations.of(
                  context,
                )!.something_went_wrong_please_try_again
                : msg!,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayMedium,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01663201663),
          CustomButton(
            text: AppLocalizations.of(context)!.try_again,
            onTap: onTap,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.04989604989),
        ],
      ),
    );
  }
}
