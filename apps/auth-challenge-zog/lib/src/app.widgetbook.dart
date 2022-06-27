// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// WidgetbookGenerator
// **************************************************************************

import 'dart:core';
import 'package:auth_challenge_zog/auth_challenge_zog.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

void main() {
  runApp(const HotReload());
}

class HotReload extends StatelessWidget {
  const HotReload({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      appInfo: AppInfo(
        name: 'Meal App',
      ),
      themes: [
        WidgetbookTheme(
          name: 'Light',
          data: getLightTheme(),
        ),
      ],
      devices: [
        const Device(
          name: 'iPhone 12',
          resolution: Resolution(
            nativeSize: DeviceSize(
              height: 2532.0,
              width: 1170.0,
            ),
            scaleFactor: 3.0,
          ),
          type: DeviceType.mobile,
        ),
      ],
      frames: [
        const WidgetbookFrame(
          name: 'Widgetbook',
          allowsDevices: true,
        ),
        const WidgetbookFrame(
          name: 'None',
          allowsDevices: false,
        ),
      ],
      textScaleFactors: [
        1.0,
        2.0,
        3.0,
      ],
      categories: [
        WidgetbookCategory(
          name: 'use cases',
          folders: [
            WidgetbookFolder(
              name: 'features',
              widgets: [],
              folders: [
                WidgetbookFolder(
                  name: 'authentication',
                  widgets: [],
                  folders: [
                    WidgetbookFolder(
                      name: 'presentation',
                      widgets: [],
                      folders: [
                        WidgetbookFolder(
                          name: 'sign',
                          widgets: [
                            WidgetbookComponent(
                              name: 'SignInPage',
                              useCases: [
                                WidgetbookUseCase(
                                  name: 'Default',
                                  builder: (context) => signInPage(context),
                                ),
                              ],
                              isExpanded: true,
                            ),
                            WidgetbookComponent(
                              name: 'SignUpPage',
                              useCases: [
                                WidgetbookUseCase(
                                  name: 'Default',
                                  builder: (context) => signUpPage(context),
                                ),
                              ],
                              isExpanded: true,
                            ),
                          ],
                          folders: [],
                          isExpanded: true,
                        ),
                      ],
                      isExpanded: true,
                    ),
                  ],
                  isExpanded: true,
                ),
                WidgetbookFolder(
                  name: 'dashboard',
                  widgets: [],
                  folders: [
                    WidgetbookFolder(
                      name: 'presentation',
                      widgets: [
                        WidgetbookComponent(
                          name: 'DashboardPage',
                          useCases: [
                            WidgetbookUseCase(
                              name: 'Default',
                              builder: (context) => dashboardPage(context),
                            ),
                            WidgetbookUseCase(
                              name: 'Long Username',
                              builder: (context) =>
                                  dashboardPageLongUsername(context),
                            ),
                          ],
                          isExpanded: true,
                        ),
                      ],
                      folders: [],
                      isExpanded: true,
                    ),
                  ],
                  isExpanded: true,
                ),
              ],
              isExpanded: true,
            ),
            WidgetbookFolder(
              name: 'common_widgets',
              widgets: [
                WidgetbookComponent(
                  name: 'EmptyPlaceholderWidget',
                  useCases: [
                    WidgetbookUseCase(
                      name: 'Default',
                      builder: (context) => emptyPlaceholderWidget(context),
                    ),
                  ],
                  isExpanded: true,
                ),
                WidgetbookComponent(
                  name: 'PrimaryButton',
                  useCases: [
                    WidgetbookUseCase(
                      name: 'Enabled',
                      builder: (context) => enabledPrimaryButton(context),
                    ),
                    WidgetbookUseCase(
                      name: 'Disabled',
                      builder: (context) => disabledPrimaryButton(context),
                    ),
                    WidgetbookUseCase(
                      name: 'Long Text',
                      builder: (context) => longTextPrimaryButton(context),
                    ),
                  ],
                  isExpanded: true,
                ),
                WidgetbookComponent(
                  name: 'CustomTextFormField',
                  useCases: [
                    WidgetbookUseCase(
                      name: 'Default',
                      builder: (context) => defaultCustomTextFormField(context),
                    ),
                    WidgetbookUseCase(
                      name: 'Disabled',
                      builder: (context) =>
                          disabledCustomTextFormField(context),
                    ),
                    WidgetbookUseCase(
                      name: 'Error',
                      builder: (context) => errorCustomTextFormField(context),
                    ),
                    WidgetbookUseCase(
                      name: 'Obscure',
                      builder: (context) => obscureCustomTextFormField(context),
                    ),
                  ],
                  isExpanded: true,
                ),
                WidgetbookComponent(
                  name: 'AppIconWidget',
                  useCases: [
                    WidgetbookUseCase(
                      name: 'Default',
                      builder: (context) => appIconWidget(context),
                    ),
                  ],
                  isExpanded: true,
                ),
              ],
              folders: [],
              isExpanded: true,
            ),
          ],
          widgets: [],
        ),
      ],
    );
  }
}
