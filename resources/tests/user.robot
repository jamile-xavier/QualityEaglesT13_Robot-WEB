*** Settings ***
Resource    ../keywords/user_resource.robot
Resource    ../pages/user_variables.robot
Resource    ../pages/login_variables.robot
Resource    ../keywords/navigation_resource.robot
Variables   ../../fixtures/environments.yaml
Library    ../../libs/get_fake_user.py

Suite Setup     Abrir o navegador e realizar login  user=${MAIL}    password=${PASSWORD}    url=${LOGIN.url}${LOGIN.endpoint}    browser=firefox   
Suite Teardown    Fechar o navegador   

*** Test Cases ***
#TC01 - Realizar cadastro de usuário com sucesso
#    Navegar Para Página    url=${USER.url}    url_complementar=${USER.endpoint}
#    Realizar cadastro de usuario    ${user}
   
#TC02 - Realizar cadastro de usuário sem nome completo
#    Navegar Para Página    url=${USER.url}    url_complementar=${USER.endpoint} 
#    ${user}    Get Fake Person
#    Realizar cadastro de usuario    nomeCompleto=    email=${user}[email]  perfilAcesso=Administrador    cpf=${user}[cpf]    senha=${user}[password]   confirmarSenha=${user}[password] 
#    Capture Page Screenshot    prints/cadastro-usuario-sem-nome-completo.png   
#    Fechar o navegador
#
#TC03 - Realizar cadastro de usuário sem cpf
#    Navegar Para Página    url=${USER.url}    url_complementar=${USER.endpoint}
#    ${user}    Get Fake Person
#    Realizar cadastro de usuario com falha    nomeCompleto=${user}[name]     email=${user}[email]  perfilAcesso=Administrador    cpf=   senha=${user}[password]   confirmarSenha=${user}[password] 
#    Capture Page Screenshot    prints/cadastro-usuario-sem-cpf.png   
#    Fechar o navegador   


TC04 - Consultar lista de usuário com sucesso
    Navegar Para Página    url=${USER.url}    url_complementar=${USER.endpoint}
    Wait Until Element Is Visible    class:css-nhyiur
    Capture Page Screenshot    prints/consulta-lista-usuario-sucesso.png 

