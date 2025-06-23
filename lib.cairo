#[starknet::interface]
trait IFibonacci<TContractState> {
    fn calculate_fib(self: @TContractState, n: u32) -> u128;
}

#[starknet::contract]
mod Fibonacci {
    #[storage]
    struct Storage {}

    #[external(v0)]
    fn calculate_fib(self: @ContractState, n: u32) -> u128 {
        // 基本边界情况
        if n == 0 {
            return 0;
        }
        if n == 1 {
            return 1;
        }
        let mut prev = 0;
        let mut curr = 1;
        let mut count = 2;
        while count <= n {
            let next = prev + curr;
            prev = curr;
            curr = next;
            count = count + 1;
        }
        curr
    }

    #[cfg(test)]
    mod tests {
        use super::calculate_fib;
        #[test]
        fn test_fibonacci() {
            assert(calculate_fib(@ContractState {}, 0) == 0, 'Fib(0) wrong');
            assert(calculate_fib(@ContractState {}, 1) == 1, 'Fib(1) wrong');
            assert(calculate_fib(@ContractState {}, 10) == 55, 'Fib(10) wrong');
            assert(calculate_fib(@ContractState {}, 16) == 987, 'Fib(16) wrong');
        }
    }
}
