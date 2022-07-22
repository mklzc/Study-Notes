# 阶，原根和指数

## 阶

若对于 $n\in \mathbb{N}^{+}, n\neq 1, a\in \mathbb{Z}，$ 满足 $\gcd(a, n) = 1$。

则必定 $\exists~r\in \mathbb{N}^{+}, \text{ s.t. } a^r\equiv 1\pmod n$

满足 $a^r\equiv 1\pmod n$ 的最小 $r$ 称为 $a$ 模 $r$ 的阶。

对于 $\forall b\in \mathrm{N}^{+}$ 满足 $a^b\equiv 1\pmod n$，都有 $r\mid b$。

特别地，

- 由欧拉定理知，$r\mid \phi(n)$
- 当 $n$ 为质数时，由费马小定理知：$r\mid n-1$

## 原根

定义：设 $m$ 是正整数，$a$ 是整数，若 $a$ 模 $m$ 的阶等于 $\varphi(m)$，则称 $a$ 为模  $m$ 的一个原根。

### 判定

然而，不是任何数都有原根，正整数有原根的充要条件为：

它能表示为下列形式之一：$2,4,p^n,2\times p^n$，其中 $p$ 为奇素数。
