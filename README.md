# Starknet 二次方不等式证明合约

本项目实现了 `x != y^2` 的二次方证明，并已在 Starknet Testnet 链上部署和完成全部测试。

## 合约功能简介

- 实现一个公开函数 `verify_not_equal_square(x: u128, y: u128) -> bool`
- 判断给定的 x 和 y 是否满足 `x ≠ y²`
- 支持 u128 大整数输入

## 主要文件

- `lib.cairo`  —— 合约主代码
- `Scarb.toml` —— 环境配置
- 三张测试和部署成功截图

## 合约部署成功截图

![合约部署成功](https://github.com/ljjathena/starknet-proof-not-equal/blob/main/%E5%90%88%E7%BA%A6%E9%83%A8%E7%BD%B2%E6%88%90%E5%8A%9F.png)

## 命令行本地调用测试成功

![测试成功](https://github.com/ljjathena/starknet-proof-not-equal/blob/main/%E6%B5%8B%E8%AF%95%E6%88%90%E5%8A%9F.png)

## 区块浏览器上的链上测试

![区块浏览器测试](https://github.com/ljjathena/starknet-proof-not-equal/blob/main/%E5%8C%BA%E5%9D%97%E6%B5%8F%E8%A7%88%E5%99%A8%E4%B8%8A%E7%9A%84%E6%B5%8B%E8%AF%95.png)

## 如何验证

1. 克隆本仓库并准备好 Starknet 环境
2. 查看 `lib.cairo` 合约源码
3. 部署到 Testnet 后可用命令行或区块浏览器传入不同 x, y 验证合约结果

## 测试用例举例

- verify_not_equal_square(5, 2) 返回 1 （true，5 ≠ 2²）
- verify_not_equal_square(4, 2) 返回 0 （false，4 = 2²）

---

如需复现测试，详情见截图。  
