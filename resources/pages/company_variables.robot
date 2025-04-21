*** Variables ***
&{cadastroEmpresa}
...    razaoSocial=id:corporateName
...    nomeFantasia=id:fantasyName
...    email=id:mail
...    cnpj=id:matriz
...    telefone=id:telephone
...    descricaoServico=id:serviceDescription
...    nomeResponsavel=id:fullName
...    cep=id:zipCode
...    pais=id:country
...    cidade=id:city
...    estado=id:state
...    bairro=id:district
...    rua=id:street
...    numero=id:number
...    complemento=id:complement

  
${btnNovoRegistro}    class=css-k66aq0
${btnSalvarNovo}    id=save   

${cnpjInvalido}    1236598741
