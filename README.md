# Blog da comunidade AmazonRails

Para ajudar a desenvolver basta:

* Criar um fork
* Realizar as alterações necessárias
* Criar um pull-request

Para executar o projeto e acessar o admin basta:

* Baixe o projeto
* Na pasta do projeto execute `bundle install` e em seguida `rake db:migrate`
* Inicie o servidor com `rails s` e acesse `0.0.0.0:3000`
* Ao acessar a aplicação será pedido que se crie um cadastro, este será o administrador do blog
* Logo em seguida é pedido para se criar um site:
  * O campo `title` pode ser preenchido como quiser
  * O campo `domain` deve ser preenchido com `0.0.0.0`
  * O campo `email` pode ser preenchido com qualquer email
  * O último campo também pode ser prenchido como quiser
* Feito isto será pedido um login e então aparecerá a interface administrativa
* Para mais informações sobre o CMS basta acessar https://github.com/CultivateLabs/storytime
