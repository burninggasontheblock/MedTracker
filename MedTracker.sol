// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

contract MedTracker{
    string patientPrescribed;

    struct Patient {
        string Prescription;
        string Name;
        uint256 Amount;
        string PrescribedBy;
        // bool Approved;
    }
    Patient[] public listofPatients;

    mapping(string => string) public nameToPatientList;

    function store(string memory _prescription) public virtual {
        patientPrescribed = _prescription;
    }

    function retrieve() public view returns (string memory) {
        return patientPrescribed;
    }
    function addPatient(string memory _name, string memory _prescription, uint256 _amount, string memory _prescribeBy) public {
        listofPatients.push(Patient(_prescription, _name, _amount, _prescribeBy));
        nameToPatientList[_name] = _prescription; 
    }
}