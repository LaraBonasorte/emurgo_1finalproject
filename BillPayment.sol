// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BillPayment{

    address payable contractOwner;

    address payable[] private billstoPay;

    uint private previousPayment;
    address private previousPayer;

    uint private totalPayments;

    constructor(address payable[] memory adresstopay) {
        contractOwner = payable(msg.sender);
        billstoPay = adresstopay;
        totalPayments = 0;
    }

    modifier ownerOnly {
      require(msg.sender == contractOwner);
      _;
    }

    event PaymentEvent(address payer, uint paymentAmount);

    function verifyBillID(uint8 inputBillID) private view {
        require(inputBillID >= 0 && inputBillID < billstoPay.length, "Input bill ID is invalid");
    }

    function checkIfFundsExist(uint userBalance, uint amountToSend) private pure {
        require(userBalance >= amountToSend, "Check if user has the amount of ETH specified to send");
    }

    function alterPreviousPayer(uint currentPaymentAmount, uint _previousPayment) private {
        if (_previousPayment < currentPaymentAmount) {
            previousPayer = msg.sender;
        }
    }

    function increasePaymentTotal(uint amountPayed) private {
        totalPayments = totalPayments + amountPayed;
    }

    function makeTransactions(uint amountToPay, address payable destinationAddress, uint amountToSend, uint8 billID) private {
        billstoPay[billID].transfer(amountToPay);
        destinationAddress.transfer(amountToSend);

        emit PaymentEvent(msg.sender, amountToPay);
    }

    function sendFunds(address payable destinationAddress, uint8 billID, uint amountToPay) public payable{
        verifyBillID(billID);
        checkIfFundsExist(msg.sender.balance, msg.value);
         
        require(amountToPay >= msg.value && amountToPay > msg.value, "Payment amount must comply with the bill value");
        uint amountToSend = msg.value - amountToPay;

        alterPreviousPayer(amountToPay, previousPayment);

        increasePaymentTotal(amountToPay);

        makeTransactions(amountToPay, destinationAddress, amountToSend, billID);
    }

    function getOverallPaymentInfo() public view returns (uint) {
        return totalPayments;
    }

    function getPreviousPayer() public ownerOnly view returns (uint, address) {
        return (previousPayment, previousPayer);
    }
}