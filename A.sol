//SPDX-License-Identifier: OBSD
pragma solidity ^0.8.7;
contract A{
    uint private var1 = 200;
    uint internal var2 ;
    uint public var3 = 300;

    constructor () {
        var2 = 150;
    }//Here value is in constructor so it gets it in run time. Only when this contract is executed will 
    //var2 be assigned a value
    function callin() view internal virtual returns(uint) {
        uint b = var2;
        return var1;
    }
    function callpu() view public returns(uint){
        return var1;
    }
}

contract B is A {
    uint public in_var2 = var2;
    //As said in contract A under the constructor
    //When only contract B is run, var2 does not have any value assigned to it
    //So when we click on in_var2 getter, we get 0
    //We can change this if we call a constructor in contract B and assign the value

    string public goody;
    constructor () A(){
         goody = "goody";
    } 
    //Above constructor will call the current constructor as well as the things defined in constructor of contract A
    //It is best not to define a variable inside constructor

    function callin() pure internal override returns (uint) {
        uint a = 3+2;
        return a;
    }
    function public1 () pure public returns (uint){
        return callin();
    }
}
