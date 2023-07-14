import 'package:finance/locator.dart';
import 'package:finance/services/auth_service.dart';
import 'package:finance/services/secure_storage.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with AutomaticKeepAliveClientMixin<ProfilePage> {
  /*
  with AutomaticKeepAliveClientMixin<StatsPage>:
  Imagina que eu tenho um pageView com 4 paginas
  pagina1 - pagina2 - pagina3 - pagina4,
  se eu estou na pagina1 o pageView vai criar ela, porém se eu navegar para a pagina2, o pageView vai destruir a pagina1 e construir a pagina2
  e assim por diante, se eu voltar para a pagina1 o pageView vai destruir a pagina2 e construir a pagina1 novamente, isso pode ser um problema (o flutter utiliza isso para evitar o consumo de memoria)
  para evitar isso eu posso utilizar o AutomaticKeepAliveClientMixin, ele vai manter a pagina viva, ou seja, se eu estou na pagina1 e vou para a pagina2, a pagina1 nao vai ser destruida, ela vai ficar viva

  Ou seja o AutomaticKeepAliveClientMixin vai persistir a pagina
*/
  // bool get wantKeepAlive => true; -> metodo do AutomaticKeepAliveClientMixin, se eu deixar TRUE ele mantem a pagina viva eu nao quero fazer o dispose dela

  //!quando usar:
  //é bom utilizar quando tem chamadas async nas telas !! para assim nao consumir recurso atoa do usuario
  //caso for só utilizar dados fixo não precisa por
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context); //-> metodo do AutomaticKeepAliveClientMixin
    return  Scaffold(
      body: Center( 
          child: Column(
        children: [
          TextButton(onPressed: () async {
            await locator.get<AuthService>().signOut();
            await const SecureStorage().deleteAll(); //-> ao fazer o logout vai limpar tudo
            if(mounted) { //-> se remover a navegação abaixo vai dar um erro de linter, e a ajuda que o dart da é colcoar esse mounted para verificar se a tela ta montada para ter context
            Navigator.of(context).popUntil(ModalRoute.withName('/'));
            }
          }, child: const Text("Sair"))
        ],
      )),
    );
  }
}
