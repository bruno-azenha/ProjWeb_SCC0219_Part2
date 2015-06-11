# ProjWeb_SCC0219_Part2
Implementação da segunda parte do Projeto de Introdução ao Desenvolvimento Web da USP de São Carlos.

------------- // --------------

# Documentação

## Servlets

### UserServlet:
#### Get Method:
* Recebe as informações do form de login (email, password)
* Busca para ver se o usuário existe e se ele existir, testa a senha.
* Se encontrado o usuário, loga (Coloca o usuário na sessão) e redireciona para página do usuário.
* Caso contrário, incrementa um contador que impedirá mais tentativas de login se >= 5

#### Post Method:
* Recebe as informações do form de cadastro
* Verifica se já existe usuário cadastrado com o email
* Se existir, retorna `true` na variável de sessão "registrationOK";


### ReservationServlet:
#### Get Method:
* Diferentes "filtros" para retorno de reservas:
* P/ usuário comum - data inicio, data fim e rotorna todas as reservas do usuário no período 
* P/ adm - filtra por nome de usuário ou data de início e data de fim

#### Post Method:
* Recebe as informações do form de adição de reserva e pega usuário da sessão
* Adiciona reserva à lista de reservas da sessão
* Precisa verificar se há
* O administrador também pode consultar e remover usuários.
* Para consultar, pode passar data de início e fim de cadastro ou email.
* A seleção para remoção se dá através de checkbox e um botão vermelho remove.


### MessageServlet:
#### Get Method:
* Só o administrador pode ter acesso às mensagens.
* Retorna as mensagens na ordem contrária que elas foram enviadas (mais recentes primeiro).
* Precisa fazer paginação das mensagens.
* Precisa marcar as mensagens como lidas ou não.

