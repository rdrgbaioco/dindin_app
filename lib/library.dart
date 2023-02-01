library dindin;

// DART
export 'dart:async';
export 'dart:convert';

// FLUTTER
export 'package:flutter/material.dart';
export 'package:flutter/services.dart';
export 'package:flutter/foundation.dart';

// PACKAGES
export 'package:flutter_bloc/flutter_bloc.dart';
export 'package:hive/hive.dart';
export 'package:dio/dio.dart';
export 'package:fl_chart/fl_chart.dart';
export 'package:crypto/crypto.dart';
export 'package:hive/hive.dart';
export 'package:hive_flutter/hive_flutter.dart';
export 'package:flutter_svg/flutter_svg.dart';
export 'package:google_fonts/google_fonts.dart';

// DATABASE - HIVE
export 'package:dindin_app/sources/database/storage/storage_service.dart';
export 'package:dindin_app/sources/database/storage/storage.dart';
export 'package:dindin_app/sources/database/hive_adapters.dart';

// SECURITY - TOKENS - JWT
export 'package:dindin_app/sources/security/security_service.dart';
export 'package:dindin_app/sources/security/security.dart';

// ENUMS - TYPEDEF - EXTENSIONS
export 'package:dindin_app/sources/resource/enums/enums.dart';
export 'package:dindin_app/sources/resource/typedef/typedef.dart';
export 'package:dindin_app/sources/resource/extension/extensions.dart';

// MODELS
export 'package:dindin_app/sources/resource/models/usuario/usuario.dart';
export 'package:dindin_app/sources/resource/models/token/token.dart';
export 'package:dindin_app/sources/resource/models/transacao/transacao.dart';
export 'package:dindin_app/sources/resource/models/categoria/categoria.dart';
export 'package:dindin_app/sources/resource/models/extrato/extrato.dart';

// API REQUESTS
export 'package:dindin_app/sources/api/dio_config.dart';
export 'package:dindin_app/sources/api/auth/auth_impl.dart';
export 'package:dindin_app/sources/api/auth/auth.dart';
export 'package:dindin_app/sources/api/user/usuario_impl.dart';
export 'package:dindin_app/sources/api/user/usuario.dart';
export 'package:dindin_app/sources/api/transacoes/transacoes_impl.dart';
export 'package:dindin_app/sources/api/detalhes/detalhes.dart';
export 'package:dindin_app/sources/api/detalhes/detalhes_impl.dart';
export 'package:dindin_app/sources/api/transacoes/transacoes.dart';
export 'package:dindin_app/sources/api/transacoes/transacoes_impl.dart';

// REPOSITORIES
export 'package:dindin_app/sources/repository/parser/parser_json.dart';
export 'package:dindin_app/sources/repository/auth/auth_repository_impl.dart';
export 'package:dindin_app/sources/repository/auth/auth_repository.dart';
export 'package:dindin_app/sources/repository/user/user_repository_impl.dart';
export 'package:dindin_app/sources/repository/user/user_repository.dart';
export 'package:dindin_app/sources/repository/detalhes/detalhes_repository.dart';
export 'package:dindin_app/sources/repository/detalhes/detalhes_repository_impl.dart';
export 'package:dindin_app/sources/repository/transacoes/transacoes_repository.dart';
export 'package:dindin_app/sources/repository/transacoes/transacoes_repository_impl.dart';

// THEME - COLORS - ASSETS
export 'package:dindin_app/generated/assets.dart';
export 'package:dindin_app/sources/widgets/components/theme/colors.dart';
export 'package:dindin_app/sources/widgets/components/theme/theme.dart';

// COMPONENTS
export 'package:dindin_app/sources/widgets/components/custom/actions/unfocus_widget.dart';
export 'package:dindin_app/sources/widgets/components/custom/textform/textformfield.dart';
export 'package:dindin_app/sources/widgets/components/custom/dialog/login_dialog.dart';
export 'package:dindin_app/sources/widgets/transaction/modules/dropdown/dropdown.dart';
export 'package:dindin_app/sources/widgets/transaction/modules/datetime_picker/datetime_picker.dart';

// BLOCS
export 'package:dindin_app/sources/widgets/login/bloc/login_bloc.dart';
export 'package:dindin_app/sources/widgets/register/bloc/register_bloc.dart';
export 'package:dindin_app/sources/widgets/home/bloc/home_bloc.dart';

// WIDGETS
export 'package:dindin_app/sources/app.dart';
export 'package:dindin_app/sources/widgets/splash/splash_screen.dart';
export 'package:dindin_app/sources/widgets/login/modules/formulario_login.dart';
export 'package:dindin_app/sources/widgets/home/home_screen.dart';
export 'package:dindin_app/sources/widgets/login/modules/background_component.dart';
export 'package:dindin_app/sources/widgets/login/modules/logo_and_texts_widget.dart';
export 'package:dindin_app/sources/widgets/register/register.dart';
export 'package:dindin_app/sources/widgets/register/modules/formulario_register.dart';
export 'package:dindin_app/sources/widgets/home/modules/top_home.dart';
export 'package:dindin_app/sources/widgets/home/modules/bottom_home.dart';
export 'package:dindin_app/sources/widgets/login/modules/error.dart';
export 'package:dindin_app/sources/widgets/home/modules/custom_nav_bar.dart';
export 'package:dindin_app/sources/widgets/movimentacoes/modules/movimentacao_tile.dart';
export 'package:dindin_app/sources/widgets/transaction/register_transaction.dart';
export 'package:dindin_app/sources/widgets/transaction/bloc/transaction_bloc.dart';
export 'package:dindin_app/sources/widgets/transaction/modules/custom_keyboard/keyboard.dart';
export 'package:dindin_app/sources/widgets/transaction/modules/custom_keyboard/key_number.dart';
export 'package:dindin_app/sources/widgets/profile/change_name.dart';
export 'package:dindin_app/sources/widgets/profile/change_password.dart';
export 'package:dindin_app/sources/widgets/profile/profile.dart';
export 'package:dindin_app/sources/widgets/graphics/graphics.dart';
export 'package:dindin_app/sources/widgets/home/fade_indexed_stack.dart';

