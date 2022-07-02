
# 母函数

## 引入(母函数的意义)

$(x_1+x_2+\dots x_k)^n$ 的多项式展开。

- **形成 ${x_1}^{n_1}\times {x_2}^{n_2}\times \dots \times{x_k}^{n_k}$ 的方案数。（满足 $n_1+n_2+\dots +n_k=n$，下同）**

$n$ 个盒子，每个盒子有 $k$ 种球，从每个盒子选一种球，选 $n_1$ 个 $x_1$，$n_2$ 个 $x_2\dots$ 所形成的方案数。

解：

${n\choose n_1}\times {n-n_1\choose n_2}\times {n-n_1-n_2\choose n_3}\dots \times {n-\sum_{i=1}^{n-1}n_i\choose n_k}$

- **${x_1}^{n_1}\times {x_2}^{n_2}\times \dots \times{x_k}^{n_k}$ 的系数。**

多重集的组合数。

- **所有系数之和。**

解：$n^k$。

由此可见，多项式展开后，其系数序列能让我们研究许多问题。

## 概念构建

### 幂级数型母函数

对于序列 $a_0,a_1,a_2\dots ,a_n\dots$，构建函数：

$F(x)=a_0+a_1\times x^{1}+a_2\times x^2+\dots + a_n\times x^n+\dots$

则称 $F(x)$ 是序列 $a_1,a_2\dots$ 的母函数（生成函数）。

比如，$F(x) = (1+x)^n= {n\choose 0} + {n\choose 1} + {n\choose 2} + \dots {n\choose n}$

则 $F(x)$ 是序列 $\{{n\choose 0},{n\choose 1},{n\choose 2}\dots {n\choose n}\}$ 的母函数。

---

例 $1$：（**无穷递缩等比数列求和公式**）

求 $1,1,1,1\dots 1,\dots$ 的母函数。

解：

$F(x)=1+x^1+x^2+x^3+\dots x^n = \frac{1}{1-x}$

练 $1$：求 $1,0,1,0,1,0\dots$ 的母函数。

---
牛顿广义二项式定理：

$$
(x+y)^{\alpha}=\sum_{n=0}^\infty{\alpha \choose n}x^{n}y^{\alpha-n}
$$
其中 $\alpha\choose n$ 为牛顿二项式系数：

$${a\choose n}=\frac{\alpha(\alpha-1) \ldots(\alpha-n+1)}{n!}
$$

例 $2$：求 $a_0,a_1,a_2,\dots a_n\dots$ 的母函数，$a_n$ 是 $k>0$ 时的无限重集的 $n$ 组合数。

具体地，$a_n={n+k-1\choose n}$。

解：$F(x)=(1-x)^{-k}$

练 $2$：确定平方数列 $0, 1, 4, \dots n^2$ 的母函数。

### 指数型母函数

## 应用

用生成函数求解计数问题通常分为三步：

1. 构造生成函数
2. 化简生成函数
3. 展开，得到指定项的系数

### 常见模型

### 求解递归式通项公式

不常用

例：

求满足 $a_n=2\times a_{n-1} + 1$ 的 $a_n$ 的通项公式。
