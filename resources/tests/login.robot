*** Settings ***
Resource    ../keywords/login_resources.robot
Resource    ../pages/login_variables.robot
Resource    ../keywords/navigation_resource.robot
Variables   ../../fixtures/environments.yaml

Suite Setup    Abrir Navegador  url=${LOGIN.url}${LOGIN.endpoint}    browser=firefox      
Suite Teardown    Fechar o navegador

*** Test Cases ***
TC01 - Realizar login com sucesso Admin
   Realizar login   ${MAIL}    ${PASSWORD} 
   Realizar logout
      
TC02 - Realizar login com senha inválida
    Realizar login sem sucesso   ${MAIL}    ${PASSWORD_INVALID}
        
    
TC03 - Realizar login com email inválido
    Realizar login sem sucesso    ${MAIL_INVALID}   ${PASSWORD}
