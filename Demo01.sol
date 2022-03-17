// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;


contract Demo01 {

    uint[2][3] grades = [ [1,2],[3,4],[5,6] ];

    function getArray() public view returns(uint[2][3] memory) {
        return grades;
    }

    function getElement() public view returns(uint) {
        return grades[2][1];
    }

    uint[][] grades2;
    function initArray() public {
        grades2 = new uint[2][](3);
    }


    function getArray2() public view returns(uint[][] memory) {
        return grades2;
    }

    function pushOne() public {
        grades2.push([20,30]);
    }


	
    mapping(uint => string) students;
    function setStudent(uint id, string memory name) public {
        students[id] = name;
    }

    function getStudent(uint id) public view returns(string memory) {
        return students[id];
    }


    //struct示例
    struct Student {
        string name;
        uint age;
        mapping(string => uint) grade;
    }


    Student public stu;
    function initStudent() public pure returns(string memory, uint) {
        Student memory st;
        return (st.name, st.age);
    }

    function initStudent2() public pure returns(string memory, uint) {
        Student memory st = Student('lisi2', 10);
        return (st.name, st.age);
    }

    function initStudent3() public pure returns(string memory, uint) {
        Student memory st = Student({name:'lisi3', age:10});
        return (st.name, st.age);
    }

    Student st = Student({name:'lisi4', age:10});
    function initStudent4() public returns(string memory, uint, uint) {
        st.grade['lisi4'] = 90;
        return (st.name, st.age, st.grade['lisi4']);
    }


    //Enum 示例
    enum Request {GET, POST, DELETE, PUT, PATCH}
    Request req;
    Request def = Request.GET;

    function setReq() public {
        req = Request.DELETE;
    }


    function getReq() public view returns(Request) {
        return req;
    }
	
	
    //Exception
    uint public counter  = 0;
    function testRevert() public {
        counter++;
        if(counter<3) {
            revert('throws exception testRevert');
        }
        counter++;
    }


    function testRequire() public {
        counter++;
        require(counter < 13, "throws exception testRequire");
        counter++;
    }


    function testAssert() public {
        counter++;
        assert(counter < 23);
        counter++;
    }

    //Event示例
    string public name;
    uint public age;
    event demoEvent(string _name, uint _age);
    function emitEvent() public {
        name = 'jack';
        age = 22;
        emit demoEvent(name, age);
    }

    function toKeccak(string memory _str) public pure returns(bytes32) {
        return keccak256(abi.encodePacked(_str));
    }

    //Log 示例
    function testLog() public {
        log0("demo message");
        log2("demo message","abc","123");
    }
}



