*** Settings ***
Resource    ../keywords/company_resources.robot
Resource    ../pages/company_variables.robot
Resource    ../pages/login_variables.robot
Resource    ../keywords/navigation_resource.robot
Variables   ../../fixtures/environments.yaml
Library    ../../libs/get_fake_company.py

Suite Setup     Abrir o navegador com chrome e realizar login   user=${MAIL}    password=${PASSWORD}    url=${LOGIN.url}${LOGIN.endpoint}    
Suite Teardown    Fechar o navegador

*** Test Cases ***
TC01 - Realizar cadastro de empresa com sucesso
    Navegar Para Página    url=${COMPANY.url}    url_complementar=${COMPANY.endpoint}
    Realizar cadastro de empresa    ${company}
    
TC02 - Realizar cadastro de empresa sem razão social
    Navegar Para Página    url=${COMPANY.url}    url_complementar=${COMPANY.endpoint}
    ${company}    Get Fake Company
    Cadastro de empresa com falha    corporateName=
    ...    fantasyName=${company}[fantasyName]
    ...    corporateEmail=${company}[corporateEmail]
    ...    cnpj=${company}[cnpj]
    ...    phone=${company}[phone]
    ...    serviceDescription=${company}[serviceDescription]
    ...    responsibleName=${company}[responsibleName]
    ...    zipCode=${company}[zipCode] 
    ...    city=${company}[city] 
    ...    state=${company}[state]
    ...    neighborhood=${company}[neighborhood]
    ...    street=${company}[street]
    ...    number=${company}[number]
    Wait Until Element Contains    locator=class:css-bbipig  text=O campo razão social é obrigatório
    Capture Page Screenshot    prints/cadastro-empresa-sem-razão-social.png

TC03 - Realizar cadastro de empresa com 10 dígitos no CNPJ
    Navegar Para Página    url=${COMPANY.url}    url_complementar=${COMPANY.endpoint}
    ${company}    Get Fake Company
    Cadastro de empresa com falha    corporateName=${company}[corporateName]
    ...    fantasyName=${company}[fantasyName]
    ...    corporateEmail=${company}[corporateEmail]
    ...    cnpj= ${cnpjInvalido} 
    ...    phone=${company}[phone]
    ...    serviceDescription=${company}[serviceDescription]
    ...    responsibleName=${company}[responsibleName]
    ...    zipCode=${company}[zipCode] 
    ...    city=${company}[city] 
    ...    state=${company}[state]
    ...    neighborhood=${company}[neighborhood]
    ...    street=${company}[street]
    ...    number=${company}[number]
    Wait Until Element Contains    locator=class:css-bbipig  text=CNPJ inválido
    Capture Page Screenshot    prints/cadastro-empresa-cnpj-invalido.png

TC04 - Realizar cadastro de empresa sem contato responsável
    Navegar Para Página    url=${COMPANY.url}    url_complementar=${COMPANY.endpoint}
    ${company}    Get Fake Company
    Cadastro de empresa com falha    corporateName=${company}[corporateName]
    ...    fantasyName=${company}[fantasyName]
    ...    corporateEmail=${company}[corporateEmail]
    ...    cnpj= ${company}[cnpj]
    ...    phone=${company}[phone]
    ...    serviceDescription=${company}[serviceDescription]
    ...    responsibleName=
    ...    zipCode=${company}[zipCode] 
    ...    city=${company}[city] 
    ...    state=${company}[state]
    ...    neighborhood=${company}[neighborhood]
    ...    street=${company}[street]
    ...    number=${company}[number]
    Wait Until Element Contains    locator=class:css-bbipig  text=O campo nome do responsável é obrigatório
    Capture Page Screenshot    prints/cadastro-empresa-sem-contato-responsável.png

TC05 - Consultar Lista de Empresas com sucesso
    Navegar Para Página    url=${COMPANY.url}    url_complementar=${COMPANY.endpoint}
    Wait Until Element Is Visible    class:css-nhyiur 
    Capture Page Screenshot    prints/listar-empresas-sucesso.png
   





