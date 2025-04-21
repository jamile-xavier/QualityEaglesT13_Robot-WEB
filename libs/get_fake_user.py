from faker import Faker
import unicodedata
import re
from robot.api.deco import keyword

faker = Faker('pt-BR')

def remover_acentos(texto):
    """Remove acentos e caracteres especiais do texto."""
    texto_sem_acentos = unicodedata.normalize('NFKD', texto)
    texto_limpo = re.sub(r'[^\w\s]', '', texto_sem_acentos)
    return texto_limpo

def remover_titulos(nome):
    """Remove títulos como sr, sra, srta do nome."""
    titulos = ('sr', 'sra', 'srta')
    nome_lower = nome.lower()
    for titulo in titulos:
        if nome_lower.startswith(titulo + ' '):
            return nome[len(titulo) + 1:]
    return nome

def limpar_ponto_nome(nome):
    """Remove pontos e caracteres especiais de uma string de nome."""
    nome_sem_titulos = remover_titulos(nome)
    nome_sem_acentos = remover_acentos(nome_sem_titulos)
    # Substitui underscore por espaço
    return nome_sem_acentos.replace('_', ' ')

def limpar_cpf(cpf):
    """Remove pontos e traços de uma string de CPF."""
    cpf_sem_acentos = remover_acentos(cpf)
    return cpf_sem_acentos.replace('.', '').replace('-', '')

@keyword("Get Fake User")
def get_fake_user():
    """Gera dados de pessoa fictícia com formatação adequada."""
    return {
        "name": limpar_ponto_nome(faker.name()),
        "email": faker.email(),
        "cpf": limpar_cpf(faker.cpf()),
        "password": faker.password(length=12)
            }