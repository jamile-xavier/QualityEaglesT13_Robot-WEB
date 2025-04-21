*** Settings ***
Library    SeleniumLibrary
Library    ../../libs/get_fake_client.py
Resource    ../pages/client_variables.robot

*** Keywords ***
Realizar cadastro de cliente
    [Documentation]    Keyword utilizada para cadastro de cliente
    [Arguments]      ${client} 
    Wait Until Element Is Visible    class:css-t7gv5b  timeout=30s 
    Click Button    ${btnNovoCadastro}
    Wait Until Element Is Visible    class:css-ffwpz9   timeout=30s 
    ${client}    Get Fake Client
    Input Text     ${cadastroCliente.nomeCompleto}    ${client}[name]
    Input Text     ${cadastroCliente.dataNascimento}    ${client}[birthday]
    Input Text     ${cadastroCliente.email}   ${client}[email]
    Input Text     ${cadastroCliente.telefone}    ${client}[phone]
    Input Text     ${cadastroCliente.cargo}    ${client}[job]
    Input Text     ${cadastroCliente.rg}   ${client}[rg]
    Input Text     ${cadastroCliente.cpf}    ${client}[cpf]
    Input Text     ${cadastroCliente.cep}     ${client}[zipCode]
    Input Text     ${cadastroCliente.pais}     Brasil
    Input Text     ${cadastroCliente.cidade}     ${client}[city]
    Input Text     ${cadastroCliente.estado}    ${client}[state]
    Input Text     ${cadastroCliente.bairro}    ${client}[neighborhood]
    Input Text     ${cadastroCliente.rua}    ${client}[street]
    Input Text     ${cadastroCliente.numero}     ${client}[number]
    Input Text     ${cadastroCliente.complemento}     Apto
    Click Button     ${btnSalvarNovo}
    

Realizar cadastro de cliente com falha
    [Documentation]    Keyword utilizada para cadastro de cliente sem sucesso
    [Arguments]       ${nomeCompleto}    ${dataNascimento}    ${email}    ${telefone}    ${cargo}    ${rg}    ${cpf}    ${cep}    ${cidade}    ${estado}    ${bairro}    ${rua}    ${numeroImovel}    ${complemento}
    Wait Until Element Is Visible    class:css-t7gv5b  timeout=30s 
    Click Button    ${btnNovoCadastro}
    Wait Until Element Is Visible    class:css-ffwpz9   timeout=30s 
    Input Text     ${cadastroCliente.nomeCompleto}    ${nomeCompleto}
    Input Text     ${cadastroCliente.dataNascimento}    ${dataNascimento}
    Input Text     ${cadastroCliente.email}   ${email}
    Input Text     ${cadastroCliente.telefone}    ${telefone}
    Input Text     ${cadastroCliente.cargo}    ${cargo}
    Input Text     ${cadastroCliente.rg}    ${rg}
    Input Text     ${cadastroCliente.cpf}    ${cpf}
    Input Text     ${cadastroCliente.cep}     ${cep}
    Input Text     ${cadastroCliente.pais}     Brasil
    Input Text     ${cadastroCliente.cidade}     ${cidade}
    Input Text     ${cadastroCliente.estado}    ${estado}
    Input Text     ${cadastroCliente.bairro}    ${bairro}
    Input Text     ${cadastroCliente.rua}    ${rua}
    Input Text     ${cadastroCliente.numero}      ${numeroImovel}
    Input Text     ${cadastroCliente.complemento}     Apto
    Click Button     ${btnSalvarNovo}
    

   