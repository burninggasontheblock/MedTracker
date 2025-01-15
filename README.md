# MedTracker

MedTracker is a decentralized application (DApp) built on Ethereum for tracking patient prescriptions and medication data. This smart contract provides a transparent and immutable ledger for managing patient medication records.

---

## Features

- **Store Prescription Details:** Allows the storage of prescription details for patients.
- **Patient Records Management:** Maintains a list of patients with their prescription details.
- **Mapping of Patient Names to Prescriptions:** Easily retrieve a patient's prescription by their name.

---

## Contract Details

### MedTracker.sol
```solidity
// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

contract MedTracker {
    string patientPrescribed;

    struct Patient {
        string Prescription;
        string Name;
        uint256 Amount;
        string PrescribedBy;
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
```

---

## Functions

### `store(string memory _prescription)`
- Stores a single prescription string for temporary retrieval.
- **Input:** `_prescription` - A string representing the prescription details.
- **Output:** None.

### `retrieve()`
- Retrieves the currently stored prescription.
- **Output:** A string representing the stored prescription.

### `addPatient(string memory _name, string memory _prescription, uint256 _amount, string memory _prescribeBy)`
- Adds a patient record to the ledger.
- **Inputs:**
  - `_name`: Name of the patient.
  - `_prescription`: Prescription details for the patient.
  - `_amount`: Amount of medication prescribed.
  - `_prescribeBy`: Name of the prescribing physician.
- **Output:** None.

---

## Data Structures

### Patient Struct
Stores details of each patient:
- `string Prescription`: Details of the medication prescribed.
- `string Name`: Patient's name.
- `uint256 Amount`: Amount of medication prescribed.
- `string PrescribedBy`: Name of the prescribing physician.

### Mappings
- **`nameToPatientList`:** Maps patient names to their prescription details for easy lookup.

---

## Deployment

### Prerequisites
- Solidity-compatible Ethereum wallet (e.g., MetaMask).
- Development environment like Hardhat or Remix.
- Access to an Ethereum network (testnet or mainnet).

### Steps
1. Deploy `MedTracker.sol` to the desired Ethereum network.
2. Use the contract's functions to store and retrieve patient data.

---

## Usage

1. **Store Prescription:**
   - Call `store()` with a prescription string to temporarily store a prescription.
2. **Retrieve Prescription:**
   - Call `retrieve()` to get the stored prescription.
3. **Add Patient:**
   - Use `addPatient()` to add a patient's details, including their prescription and the prescribing physician.

---

## Future Improvements

- **Patient Approval System:** Add functionality for patients to approve prescription records.
- **Integration with Frontend:** Create a user-friendly interface for managing patient records.
- **Role-Based Access Control:** Implement role restrictions for adding or modifying patient data.

---

## License

This project is licensed under the MIT License. See the `LICENSE` file for details.

---

Feel free to suggest improvements or expand this project further! 🚀
