*** Settings ***
Library    SeleniumLibrary
Resource    ./login_resources.robot
Variables      ../../fixtures/environments.yaml

*** Keywords ***

*** Keywords ***
#Abrir Navegador
 #   [Documentation]    Abre o navegador na página especificada
 #   [Arguments]    ${url}    ${browser}=chrome
 #   Open Browser    url=${url}    browser=${browser}  options=add_argument("--headless")
   
Abrir Chrome Com Opcoes
    [Arguments]    ${url}
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Call Method    ${options}    add_argument    --headless
    Call Method    ${options}    add_argument    --incognito
    Create WebDriver    Chrome    options=${options}
    Go To    ${url}
    
Fechar o navegador
    [Documentation]    Fecha o navegador 
    Close Browser

Navegar Para Página
    [Documentation]    Navega para a página especificada
    [Arguments]    ${url}    ${url_complementar}
    Go To    ${url}${url_complementar}

#Abrir o navegador e realizar login
#    [Documentation]    Abre o navegador e realiza o login
#    [Arguments]    ${user}    ${password}    ${url}    ${browser}
#    Abrir Navegador    ${url}    ${browser}
#    Navegar Para Página    ${LOGIN.url}    ${LOGIN.endpoint}
#    Realizar login    ${user}    ${password} 

Abrir o navegador com chrome e realizar login
    [Documentation]    Abre o navegador e realiza o login
    [Arguments]    ${user}    ${password}    ${url}   
    Abrir Chrome Com Opcoes   ${url}   
    Navegar Para Página    ${LOGIN.url}    ${LOGIN.endpoint}
    Realizar login    ${user}    ${password} 
