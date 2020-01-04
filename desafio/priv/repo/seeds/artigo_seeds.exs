alias Desafio.Repo
alias Desafio.Management.Artigo

Repo.insert! %Artigo{
    nome: "Artigo 1 do desafio",
    resumo: "O primeiro artigo foi o primeiro lançado.",
    publicado: true,
    evento_id: 1
}
Repo.insert! %Artigo{
    nome: "Artigo 2 do desafio" ,
    resumo: "O segundo artigo foi o que fez maior suceso no evento.",
    publicado: true,
    evento_id: 2
}
Repo.insert! %Artigo{    
    nome: "Artigo 3 do desafio",
    resumo: "O terceiro artigo não chegou a ser publicado por rejeição dos editores do evento 3.",
    publicado: false,
    evento_id: 3 
}
Repo.insert! %Artigo{    
    nome: "Artigo 4 do desafio",
    resumo: "O quarto artigo chegou a ser publicado por aceitação dos editores do evento 3.",
    publicado: true,
    evento_id: 3
}