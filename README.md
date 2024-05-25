# huff-puzzles by [RareSkills](https://www.rareskills.io)

A series of puzzles that go from very easy to more difficult so that you can have a hands-on introduction to the [huff language](https://huff.sh) and learn EVM bytecode while doing it.

## Pre-requisites

Make sure you've installed the Huff Compiler as outlined in the [Huff Docs](https://docs.huff.sh/get-started/installing/#installing-huff).

TLDR:

    curl -L get.huff.sh | bash

then:

     huffup

To verify your installation, run `huffc --help`. This should print a list of available commands for the huff compiler cli.

## Installation

To install dependencies, run:

    forge install

## How to play

Go to [Return1.huff](https://github.com/rareskills/huff-puzzles/blob/main/src/Return1.huff) in the src folder and edit it as follows

```c
#define macro MAIN() = takes(0) returns(0) {
    // store 1 in memory at offset 0
    0x01            // [1]
    0x00            // [0, 1]
    mstore          // []

    // return 1
    // return 32 bytes of memory starting at offset 0
    0x20            // [32]
    0x00            // [0, 32]
    return          // []
}
```

Then run the test with

    forge test -vvv --mc Return1Test

You should see something like this

    Running 1 test for test/Return1.t.sol:Return1Test
    [PASS] testReturn1() (gas: 5358)
    Test result: ok. 1 passed; 0 failed; finished in 4.56s

## Suggested order for other exercises

- [CallValue](./src/CallValue.huff)
- [CalldataLength](./src/CalldataLength.huff)
- [MyEtherBalance](./src/MyEtherBalance.huff)
- [Add1](./src/Add1.huff)
- [Multiply](./src/Multiply.huff)
- [NonPayable](./src/NonPayable.huff)
- [FooBar](./src/FooBar.huff)
- [SimpleStore](./src/SimpleStore.huff)
- [RevertCustom](./src/RevertCustom.huff)
- [RevertString](./src/RevertString.huff)
- [SumArray](./src/SumArray.huff)
- [Keccak](./src/Keccak.huff)
- [MaxOfArray](./src/MaxOfArray.huff)
- [Create](./src/Create.huff)
- [Emitter](./src/Emitter.huff)
- [Donations](./src/Donations.huff)
- [SendEther](./src/SendEther.huff)
- [BasicBank](./src/BasicBank.huff)
- [Distribute](./src/Distributor.huff)
- [SimulateArray](./src/SimulateArray.huff)

## More resources

- [Huff Documentation 🐴](https://docs.huff.sh/)
- [Evm codes](https://evm.codes)
- [Huffmate](https://github.com/huff-language/huffmate)
- [Huff Console.log](https://github.com/AmadiMichael/Huff-Console)

## Contributors

- [Michael Amadi](https://github.com/AmadiMichael)
- [Jesse Raymond](https://github.com/jesserc)
