#[starknet::contract]
mod proof_not_equal_square {
    #[storage]
    struct Storage {}

    // 判断 x 是否不等于 y 的平方
    #[external(v0)]
    fn verify_not_equal_square(self: @ContractState, x: u128, y: u128) -> bool {
        let y2 = y * y;
        x != y2
    }
}
