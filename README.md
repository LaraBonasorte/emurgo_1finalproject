# Emurgo Ethereum Project: a Bill Payment simplifier
Solidity Smart Contract for the Associate Dev Course on EMURGO

# What is a Bill?
_noun_
1. an amount of money owed for goods supplied or services rendered, set out in a printed or written statement of charges.
_"the bill for their car came to $175"_

A bill is used to require the payment of Utility services offered by the State or some type of government to and for its citizens (tax payers).

# What is an Event?
It is defined as "A thing that happens, especially one of importance," specified during a period of time.
_"a historical event occurs every 10 centuries!"_

# Payer
The payer is they who, after a determined event, needs to transfer their personal funds in order to comply with the law (bill payment).

# The Simplification
This smart contract was written and created with a goal of simplifying the Utility Bills payment by using the Ethereum Blockchain Technology. It is hereby stated that this Smart Contract is not official and/or created for/by Utility Services Companies worldwide. DO NOT USE THIS CONTRACT WITHOUT PREVIOUS ANALYSIS.

# Contract
Contract is enabled when:
- The total Funds required to pay the utility bill are the same as the Funds found in the userBalance;
- When the BillID is the same as the one presented by the Utility Services Company;
- When the contractOwner is not the msg.sender.
