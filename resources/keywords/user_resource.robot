*** Settings ***
Library    SeleniumLibrary
Library    ../../libs/get_fake_user.py
Resource    ../pages/user_variables.robot

*** Keywords ***

Realizar cadastro de usuario
    [Documentation]    Keyword usada para realizar cadastro de usuário
    [Arguments]    ${user}   
    Wait Until Element Is Visible    class:css-nhyiur
    Click Button    ${btnNovoCadastro}
    ${user}    Get Fake User
    Input Text    ${cadastroUsuario.nomeCompleto}    ${user}[name]    
    Input Text    ${cadastroUsuario.email}     ${user}[email]
    #Input Text    ${cadastroUsuario.perfilAcesso}     Administrador
    Input Text    ${cadastroUsuario.cpf}     ${user}[cpf]
    Input Text    ${cadastroUsuario.senha}     ${user}[password]
    Input Text    ${cadastroUsuario.confirmarSenha}     ${user}[password]
    Click Button    ${btnSalvarNovo}
Realizar cadastro de usuario com falha
    [Documentation]    Keyword usada para realizar cadastro de usuário
    [Arguments]    ${nomeCompleto}    ${email}    ${perfilAcesso}    ${cpf}    ${senha}    ${confirmarSenha}
    Wait Until Element Is Visible    class:css-1gibqcr
    Click Button    ${btnNovoCadastro}
    ${user}    Get Fake User
    Input Text    ${cadastroUsuario.nomeCompleto}  ${nomeCompleto}    
    Input Text    ${cadastroUsuario.email}    ${email}
    Input Text     ${cadastroUsuario.perfilAcesso}   Administrador
    Input Text    ${cadastroUsuario.cpf}     ${cpf}
    Input Text    ${cadastroUsuario.senha}    ${senha}
    Input Text    ${cadastroUsuario.confirmarSenha}     ${confirmarSenha}
    Click Button    ${btnSalvarNovo}


