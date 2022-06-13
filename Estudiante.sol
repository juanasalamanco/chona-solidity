// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract Estudiante{
    string private _nombre;
    string private _apellido;
    string private _curso;
    address private _docente;
    mapping(string => uint) private _notas_materias;
    string[] private _materias;

    constructor(string memory nombre_, string memory apellido_, string memory curso_){ // esto es una poesia
        _nombre = nombre_;
        _apellido = apellido_;
        _curso = curso_;
        _docente = msg.sender;
    }

    function apellido() public view returns (string memory){ // Quiasamo
        return _apellido;
    }
    
  function nombre_completo() public view returns (string memory){
        return string(abi.encodePacked(_nombre,'',_apellido));
    }
    
    function curso()public view returns (string memory){ 
        return _curso;
    }

    function set_nota_materia(uint nota, string memory _materia) public {
        require(msg.sender == _docente, "Solo el docente puede cambiar las notas");
        _notas_materias[_materia] = nota;
        _materias.push(_materia);
    }
    
    function nota_materia(string memory _materia)public view returns(uint) {
        
        return _notas_materias[_materia];
    }
    
    function aprobo(string memory materia_)public view returns(bool) {
        uint nota = _notas_materias[materia_];
        if(nota >= 60 && nota <= 100){
            return true;
        }
        else{
            return false;
        }
    }
    
    function promedio()public view returns(uint){
        uint total = 0;
        uint tfinal;
        for(uint i = 0; i < _materias.length; i++){
            total += _notas_materias[_materias[i]];
        }
        tfinal = total/_materias.length;
        return tfinal;
    }
    
}