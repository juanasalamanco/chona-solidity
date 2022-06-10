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
    }

    function apellido() public view returns (string memory){
        return _apellido;
    }
    /*
    function nombre_completo() public view returns (string memory){
        return _nombre; _apellido;
    }
    */
    function curso()public view returns (string memory){
        return _curso;
    }

    function set_nota_materia(uint nota, string memory materia) public {
        require(msg.sender == _docente, "Solo el docente puede cambiar las notas");
        _notas_materias[materia] = nota;
    }
    /*
    function nota_materia(string memory materia){
        //devuelve la nota del estudiante dada una materia
    }

    function aprobo(string memory materia){
        //devuelve true solo si el alumno esta aprobado en la materia. La materia se aprueba con 60/10 o mas
    }

    function promedio(){
        //devuelve un entero con el promedio
    }
    */
}