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

### [完全数](https://baike.sogou.com/v774869.htm)   

### 狄利克雷卷积

**数论函数:** 定义域为正整数的函数。

**积性函数:** 积性函数指对于所有互质的整数 $a$ 和 $b$ 有性质 $f(a\times b)=f(a)\times f(b)$ 的数论函数。

**完全积性函数:** 对于任意的整数 $a$ 和 $b$ 有 $f(a\times b) = f(a) \times f(b)$

狄利克雷卷积是定义在数论函数间的一种二元运算。

对于两个数论函数 $f,g$，

定义它们的狄利克雷卷积为：$(f*g)(n)=\sum_{x\times y=n}{f(x)\times g(y)}$

一般写为：$(f*g)(n)=\sum_{d\mid n}{f(d)\times g(\frac {n}{d})}$

两个数论函数的狄利克雷卷积是一个新函数。

#### 积性函数的性质

设 $f(x)$ 是一个积性函数，则有：

$\mathbf{f(1)=1}$：由 $f(1)=f(1)\times f(1)$ 可知。

$\mathbf{}$

#### 常见的数论函数

##### 元函数

$e(x)=[x=1]$

当 $n=1$ 时，函数值为 $1$，否则为 $0$。

被称作元函数是因为它是卷积的单位元：$e*g=g$。

##### 欧拉函数

$\varphi(x)$ 模 `x` 域下的简化剩余系大小。

##### 除数函数

$\sigma_{k}(x)~=~\sum_{d \mid x} d^k$

特别地：

当省略 `k` 时，$\sigma(x)$ 默认为 $\sigma_{1}(x)$

- $k=1$ 时表示 $x$ 的因子之和。
- $k=0$ 时表示 $x$ 的因子个数。

**性质:** $\sigma_{k}(x)$ 都是积性函数，但不是完全积性。

##### 莫比乌斯函数

设 `x` 由算数基本定理表示为 $p_{1}^{c_1}~p_{2}^{c_2}~\dots~p_k^{c_k}$。

$
\mu(x)~=~\begin{cases}
1 &x=1
\\
(-1)^m &\forall i\in[1,k],c_i=1
\\
0 &\forall i\in [1,k],c_i\neq 1\end{cases}
$

显然 $\mu(x)~=~\prod_{i=1}^k \mu(p_{i}^{c_i})$。

于是可以得到莫比乌斯函数是一个积性函数。

##### 