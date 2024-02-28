// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

// Declaração do contrato chamado Anac
contract Anac {
    // Variável de estado para armazenar a idade, inicialmente não definida explicitamente
    uint idade;

    // Variável de estado privada para armazenar o endereço do proprietário do contrato
    address private owner;

    // Evento que será emitido quando a idade for alterada
    event IdadeAlterada(uint novaIdade);

    // Construtor do contrato, chamado uma vez na implantação do contrato
    constructor() { 
        // Define o endereço do proprietário como o endereço que está implantando o contrato
        owner = msg.sender;

        // Inicializa a idade com 18
        idade = 18; 
    }

    // Função para alterar a idade, acessível apenas pelo proprietário do contrato
    function setIdade(uint256 _novaIdade) public  {
        // Verifica se o chamador da função é o proprietário, se não for, a transação é revertida
        require(msg.sender == owner, "Only contract owner can perform this action");

        // Atualiza a variável idade com o novo valor fornecido
        idade = _novaIdade;

        // Emite o evento IdadeAlterada com o novo valor da idade
        emit IdadeAlterada(idade);
    }

    // Função para obter o valor atual da idade
    function getIdade() public view returns (uint256) {
        // Retorna o valor atual da variável idade
        return idade;
    }

}
