*** Variables ***
&{cadastroCliente}
...   nomeCompleto=id:fullName
...   dataNascimento=id:birthDate
...   email=id:mail
...   telefone=id:phone
...   cargo=id:currentRole
...   rg=name:rg
...   cpf=name:cpf
...   cep=id:zipCode
...   pais=id:country
...   cidade=id:city
...   estado=id:state
...   bairro=id:district
...   rua=id:street
...   numero=id:number
...   complemento=id:complement

   
${btnNovoCadastro}    class=css-k66aq0
${btnSalvarNovo}    id=save   
