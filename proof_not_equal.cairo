#[starknet::interface]
trait IProofNotEqual<TContractState> {
    fn verify_not_equal(self: @TContractState, x: u128, y: u128) -> bool;
}

#[starknet::contract]
mod ProofNotEqual {
    #[storage]
    struct Storage {}

    #[external(v0)]
    fn verify_not_equal(self: @ContractState, x: u128, y: u128) -> bool {
        let (y2, overflow) = y.overflowing_mul(y);
        if overflow {
            panic_with_felt252('Arithmetic overflow detected');
        }
        x != y2
    }

    #[cfg(test)]
    mod tests {
        use super::verify_not_equal;
        #[test]
        fn test_not_equal() {
            assert(!verify_not_equal(@ContractState {}, 4, 2), '4 == 2^2');
            assert(verify_not_equal(@ContractState {}, 5, 2), '5 != 2^2');
        }
    }
}
