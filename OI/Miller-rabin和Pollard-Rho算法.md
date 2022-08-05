# Miller-Rabin 和 Pollard-Rho 算法

## 前置知识

- 生日悖论

随机 $23$ 个人中，存在两个人生日相同的概率是 $\frac{1}{2}$ 。

更一般的：随机在 $[1, N]$ 中写一个数，期望在 $\sqrt{N}$ 个时会出现重复。

## Pollar-Rho 算法

考虑求 $n$ 的某个非平凡因子。

假设 $n$ 有一个因子 $q$ 。
若有两个数 $x_1\equiv x_2\pmod p$ ，且 $x_1\equiv x_2\pmod n$，那么 $\gcd(|x_1 - x_2|, n)$ 就是 $n$ 的一个非平凡因子。

