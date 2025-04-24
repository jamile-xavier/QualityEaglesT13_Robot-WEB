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
TC01 - Consultar lista de usuário com sucesso
    Navegar Para Página    url=${USER.url}    url_complementar=${USER.endpoint}
    Wait Until Element Is Visible    class:css-nhyiur
    Capture Page Screenshot    prints/consulta-lista-usuario-sucesso.png 

