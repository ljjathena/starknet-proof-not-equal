%lang starknet

// 使用新版接口宏
#[starknet::interface]
trait IProofNotEqual {
    fn prove_not_equal(x: u128, y: u128) -> Result<u8, RevertReason>;
}

// 引入算术安全模块
use zeroable::Zeroable;
use integer::CheckedMul;

#[starknet::contract]
mod ProofNotEqual {
    #[external]
    #[embeddable_as(prove_not_equal)]
    fn prove_not_equal(self: @ContractState, x: u128, y: u128) -> Result<u8, RevertReason> {
        // 安全乘法（防溢出）
        let y2 = y.checked_mul(y).unwrap_or(RevertReason::ArithmeticOverflow);
        
        // 结果转换为可序列化类型
        let result = if x == y2 { 0u8 } else { 1u8 };
        Ok(result)
    }
}