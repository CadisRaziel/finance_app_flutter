// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:finance/services/auth_service.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphqlService {
  //vai inicializar o cliente para poder fazer chamadas da api
  final AuthService authService;
  GraphqlService({
    required this.authService,
  });

  late GraphQLClient client;

  Future<void> init() async {
    final token = await authService.userToken();

    final HttpLink httpLink = HttpLink(
      'https://concrete-leopard-63.hasura.app/v1/graphql',
    );

    final AuthLink authLink = AuthLink(
      getToken: () async => 'Bearer $token',   
    );

    final Link link = authLink.concat(httpLink);

    client = GraphQLClient(
      link: link,  
      cache: GraphQLCache(store: HiveStore()),
    );
  }
}
