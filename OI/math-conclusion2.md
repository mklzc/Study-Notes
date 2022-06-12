# NOI 数学学习笔记 Editing

## 初等数论

### 阶，原根和指数

#### 阶

若对于 $n\in \mathbb{N}^{+}, n\neq 1, a\in \mathbb{Z}，$ 满足 $gcd(a, n) = 1$。

则必定 $\exists r\in \mathbb{N}^{+}, \mathrm{ s.t.\ } a^r\equiv 1\pmod n$

满足 $a^r\equiv 1\pmod n$ 的最小 $r$ 称为 $a$ 模 $r$ 的阶。

对于 $\forall b\in \mathrm{N}^{+}$ 满足 $a^b\equiv 1\pmod n$，都有 $r\mid b$。

特别地，

- 由欧拉定理知，$r\mid \phi(n)$
- 当 $n$ 为质数时，由费马小定理知：$r\mid n-1$

#### 原根

### 狄利克雷卷积

狄利克雷卷积是定义在数论函数间的一种二元运算。

对于两个数论函数 $f,g$

定义它们的狄利克雷卷积为：$(f*g)(n)=\sum_{x\times y=n}{f(x)\times g(y)}$

一般写为：$(f*g)(n)=\sum_{d\mid n}{f(d)\times g(\frac {n}{d})}$

狄利克雷卷积