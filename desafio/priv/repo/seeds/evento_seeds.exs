alias Desafio.Repo
alias Desafio.Management.Evento

Repo.insert! %Evento{
    titulo: "Evento 1 do desafio",
    descricao: "O primeiro evento criado com seed pelo phoenix"
}
Repo.insert! %Evento{
    titulo: "Evento 2 do desafio",
    descricao: "O segundo evento criado com seed pelo phoenix"
}
Repo.insert! %Evento{
    titulo: "Evento 3 do desafio",
    descricao: "O terceirp evento criado com seed pelo phoenix"
}