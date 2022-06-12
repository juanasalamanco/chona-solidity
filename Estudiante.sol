// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract Estudiante{
    string private _nombre;
    string private _apellido;
    string private _curso;
    address private _docente;
    mapping(string => uint) private _notas_materias;

    constructor(string memory nombre_, string memory apellido_, string memory curso_){
        _nombre = nombre_;
        _apellido = apellido_;
        _curso = curso_;
        _docente = msg.sender;
    }

    function apellido() public view returns (string memory){
        return _apellido;
    }
    /*
    function nombre_completo() public view returns (string memory){
        
    }
    */
    function curso()public view returns (string memory){
        return _curso;
    }

    function set_nota_materia(uint nota, string memory materia) public {
        require(msg.sender == _docente, "Solo el docente puede cambiar las notas");
        _notas_materias[materia] = nota;
    }
    
    function nota_materia()public view returns(string memory materia) {
        _notas_materias[materia];
    }
    
    function aprobo()public view returns(string memory materia) {
        uint nota = _notas_materias[materia];
        if(nota >= 60 && nota <= 100){
            true;
        }
        else{
            false;
        }
    }
    
    function promedio()public view returns(uint){
        uint total = 0;
        uint tfinal;
        uint numMaterias;
        for(uint i = 0; i < _notas_materias; i++){
            total += _notas_materias;
            numMaterias = i;
        }
        tfinal = total/numMaterias;
        return tfinal;
    }
    
}