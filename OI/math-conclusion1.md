# 数学知识总结

## 初等数论

### 同余式

- **基本概念**
  $a$ 与 $b$ 在模 $n$ 的意义下同余，记作 $a\equiv b\pmod n$

  也可简记为 $a\equiv b(n)$

- **同余类、剩余系**

  - **同余类：** 模 $n$ 同余的所有整数组成的集合称为同余类，共有 $n$ 个同余类。

  - **剩余系：** 对于某一个特定的正整数 $n$ ，一个整数集中的数模 $n$ 所得的余数域。

  - **完全剩余系：** 设 $m\in \mathbb{Z^+}$ ，若 $r_0,r_1\dots r_{m-1}$ 为 $m$ 个整数，并且两两模 $m$ 不同余，则 $r_0,r_1,\dots r_{m-1}$叫作模 $m$ 的一个完全剩余系。

  - **简化剩余系：** 也称既约剩余系或缩系，是 $m$ 的完系中与 $m$ 互质的数构成的子集。

### 欧拉定理和欧拉函数

#### 欧拉函数

- **概念**：
$\phi(n)$ 表示 $n$ 以内与 $n$ 互质的数的个数。
- **公式**：$\phi(N) = N\times\prod_{Prime\ p | N}{(1 - \frac{1}{p})}$
- **求法**：线性筛

```cpp
int phi[N], primes[N], v[N];
phi[1] = 1;
for (int i = 2; i <= n; i++)
{
    if (!v[i]) v[i] = i, primes[++cnt] = i, phi[i] = i - 1;
    for (int j = 1; j <= cnt; j++)
    {
        if (v[i] > primes[j]) break;
        v[primes[j] * i] = primes[j];
        phi[i * primes[j]] = (i % primes[j]) ? (primes[j] - 1) * phi[i] : primes[j] * phi[i];
    }
}
```

#### 欧拉定理

当 $a,n$ 互质时，$a^{\phi(n)}\equiv 1\pmod n$

- **证明**： 简单剩余系

- **推论**：
  - $a, n$ 互质时，$a^{b} \equiv a ^{b \bmod \phi(n)}\pmod n$
    $a, n$ 不互质且 $b >= \phi(n)$ 时：$a^{b} \equiv a^{b \bmod \phi(n) + \phi(n)}\pmod n$
  - 使得 $a^x\equiv 1\pmod n$ 的最小正整数解 $x$ 必定满足 $x|\phi(n)$ 。

### 费马小定理

一般形式：$a^{n} \equiv a\pmod n$，当 $n$ 为素数时成立。

常见形式：$a^{n-1}\equiv 1\pmod n$，当 $n$ 为素数且 $a$ 与 $n$ 互质时成立。

费马小定理是 $n$ 为素数的必要非充分条件。

**证明**：欧拉定理的特殊情况。

应用：

- **求逆元**
- ***费马检查配合二次探测定理：Miller Rabin算法**

### 威尔逊定理

- **证明**：逆元配对。
- **应用**

例题：
给出素数 $p$，求 $q!\mod p$，其中 $q$ 为比 p 小的最大素数，$p \in [1, 10^9]$。

### 裴蜀定理

一定 $\exists x, y\in Z\ \ s.t.\  a \times x + b \times y = gcd(a, b)$ 成立。

- **证明**
  - 数学归纳法
  - 完全剩余系

- **推论**
  - $a,b$ 互质的充分必要条件是存在整数 $x,y$ 使 $a \times x + b \times y=1$
  - 设 $a_1,a_2,a_3......a_n$ 为 $n$ 个整数，$d$ 是它们的最大公约数，那么存在整数$x_1......x_n$ 使得 $x_1*a_1+x_2*a_2+...x_n*a_n=d$ 。
  - $a \times x + b \times y = c$ 有解当且仅当 $c\ |\ gcd(a, b)$

**例题**：
给定 $K$，$M$ 求一个最小的正整数 $x$,使得 $K^x\equiv 1\pmod M$，如果无解输出 $-1$。（阶？）

数据范围：$2\leq K$，$M\le 2\times 10^9$。

### 逆元

- **概念**

```text
逆元素是指一个可以取消另一给定元素运算的元素
                                    ---百度百科
```

很好理解，比如，一个数和它的相反数互为加法逆元……。

- **应用：除法取模**

- **求法：**
  - 扩欧算法
  - 费马小定理（注意：仅在 p 为质数时成立）
  - 线性递推（证明）：

    ```cpp
    inv[1] = fac[1] = inv[0] = fac[0] = 1;
    for (int i = 2; i <= n; i++)
        inv[i] = (p - p / i) * inv[p % i] % p;
    ```

### 扩展欧几里得算法

求解 $a \times x + b \times y = gcd(a, b)$ 的一组特解 $(x_0, y_0)$。

- **通解**

对于形如 $a \times x + b  \times y = c, gcd(a,b)\ |\ c$ 的方程来说：

它的特解为 $(x^{'} = x_0 \times \frac{c}{gcd(a, b)}, y ^ {'} = y_0 \times \frac{c}{
gcd(a,b)})$；

它的通解为 $(x'+ k \times \frac{b}{gcd(a, b)}, y^{'} - k \times \frac{a}{gcd(a, b)})$ 。

```cpp
void exgcd(int a, int b, int &x, int &y) 
{
   if (b == 0)
       return void(x = 1), void(y = 0);
   exgcd(b, a % b, x, y);
   int z = x;
   x = y, y = z - y * (a / b);
}
```

### 中国剩余定理（CRT）

假设整数 $m_1, m_2\dots m_n$ 两两互素，则对于任意的整数 $a_1, a_2 \dots a_n$ ，方程组：

$$\begin{cases} x \equiv a_1\ ({\rm mod}\ m_1) \\ x\equiv a_2\ ({\rm mod}\ m_2) \\ ... \\ x \equiv a_n\ ({\rm mod}\ m_n)\end{cases}$$
存在整数解。

我们设 $M=\prod_{i=1}^{k}m_i$，$ M_i=\frac{M}{m_i}$，$M_it_i≡1\;\;(mod\;\;m_i)$。

可以构造出一个解 $x=\sum_{i=1}^{k}a_iM_it_i$

- **证明**： 展开即可。

```cpp
int a[], m[], M[];
int CRT()
{
    int MUL = 1, TJ = 0;
    for (int i = 1; i <= n; i++)
        MUL *= m[i];
    for (int i = 1; i <= n; i++)
    {
        int x, y;
        M[i] = MUL / m[i];
        exgcd(M[i], m[i], x, y);
        if (x < 0) x += m[i];
        TJ += x * M[i] * a[i];
    }
    return TJ;
}
```

## 组合数学

### 可重集排列和可重集组合

#### 多重集的排列数

设 $S = \{n_1\times a_1, n_\times a_2,\dots n_k\times a_k\}$ 是由$n_1$个$a_1$，$n_2$个$a_2\dots n_k$个$a_k$组成的可重集。

那么 $S$ 的全排列个数为 $\frac{n!}{n_1!\times n_2!\dots \times n_k!}$

#### 多重集的组合数

从 $n$ 个元素中选取 $m$ 个元素，同一元素允许重复选取，产生的组合数量为 $C_{n + m - 1}^{m - 1}$。

可重集组合： (不定方程的非负整数解)
$x_1 + x_2 + x_3 + \dots + x_n = m$
非负整数解的个数为：$C_{n + m - 1}^{m - 1}$

- **证明**

### 鸽巢原理

![GeChao](https://cdn.luogu.com.cn/upload/image_hosting/w05insir.png)

### 二项式定理

$(x+y)^n = \sum_{k = 0}^{n}{C_n^{k}\times x^k \times y^{n - k}}$

- **证明**：展开使用组合数分析。

### 容斥原理

- 并集形式
  $|A_1 \cup A_2 \cup A_3 \dots \cup A_n| = \sum_{1\le i\le n}{|A_i|}-\sum_{1\le i < j \le n} {|A_i \cap A_j|} + \dots + (-1)^{n + 1} \times |A_1 \cap A_2 \dots A_n |$

- 交集形式（筛法公式）
  $|\complement_{S}{A_1}\cup \complement_{S}{A_2} \dots \complement_{S}{A_n}| = |S| - \sum_{1\le i\le n}{|A_i|} + \sum_{1\le i < j \le n} {|A_i \cap A_j|} - \dots + (-1)^{n}\times |A_1 \cap A_2 \dots A_n |$

- 从筛法公式理解错排公式

### 卡特兰数

- **定义**

长度为 $n$ 的 $0, 1$ 序列，满足任意前缀中 $0$ 的个数不小于 $1$ 的个数的排列个数为 $Cat_n = \frac{C_n^{2n}}{n + 1}$

- **例子**
  - 括号匹配
  - 出栈统计
  - 欧拉剖分

### 组合杂项

- 组合数的线性预处理

```cpp
LL C(int x, int y) {
    return fac[x] * inv[x - y] % mod * inv[y] % mod;
}
void init()
{
    inv[0] = inv[1] = fac[0] = fac[1] = 1;
    for (int i = 2; i < N; i++)
    {
        inv[i] = (mod - mod / i) * inv[i] * inv[mod % i] % mod;
        fac[i] = fac[i - 1] * fac[i] % mod;
    }
    for (int i = 2; i < N; i++)
        inv[i] = inv[i] * inv[i - 1] % mod;
}

```

- 杨辉三角与组合数
- 组合数的性质
  - $\frac{i}{n}C_n^i = C_{n - 1}^{i - 1}$
  - $C_{n+1}^m=C_n^m+C_n^{m-1}$
  - $C_{m+r+1}^r=\sum_{i=0}^r C_{m+i}^i$
  - $\sum_{i=0}^m C_m^i=2^m$
  - $C_m^0+C_m^2+C_m^4...=C_m^1+C_m^3+C_m^5+...=2^{m-1}$
  - $\sum_{i=1}^n C_n^i*i^2=n*(n+1)*2^{n-2}$
  - $\sum_{i=0}^n (C_n^i)^2=C_{2n}^n$

## 线性代数

### 矩阵概念

**$X$ 阶矩阵**：行数与列数都等于 $n$ 的矩阵称为 $n$ 阶矩阵或 $n$ 阶方阵。

**单位矩阵**：主对角线上的元素都为 $1$ ，其余元素均为 $0$ 的 $n$ 阶方阵称为 $n$ 阶单位矩阵，记为 $E$。

**逆矩阵**：设 $A$ 是一个 $n$ 阶矩阵，若存在另一个 $n$ 阶矩阵 $B$ ，使得： $A \times B = E$

**矩阵的迹**：$n \times n$ 矩阵 $A$ 的对角元素之和称为矩阵A的迹( $trace$ ),记作 $tr(A)$

### 特殊矩阵

- **稀疏矩阵**
当一个矩阵的绝大部分数值为零，且非零元素呈不规律分布时，则称该矩阵为稀疏矩阵（ $Sparse\ Matrix$ ）
与它相对的一个概念叫稠密矩阵，，那些非零数值占大多数元素的矩阵即是稠密矩阵（ $Dense\ Matrix$ ）。

- **三角矩阵**
三角矩阵（ $TriangularMatrix$ ）分为上三角矩阵和下三角矩阵。
  - 上三角矩阵（ $UpperTriangularMatrix$ ）是指主对角线以下元素全为0的矩阵。
  - 下三角矩阵（ $LowerTriangularMatrix$ ）是指主对角线以上元素全为0的矩阵。

- **对称矩阵**
对称矩阵（$SymmetricMatrix$）是指元素以主对角线为对称轴对应相等的矩阵。

### 矩阵的初等变换

- 交换两行或两列
- 用一个数 $K$ 乘以某一行
- 用某个数乘以某一行

### 矩阵的加减乘和转置运算

矩阵的加减乘

- 加减法：对应的位置相加减
- 数乘：每个位置乘以常数
- 矩阵的转置运算：
  矩阵 $A$ 的转置矩阵记为 $A^T$
  它是将 $A$ 的第 $j$ 行变为第 $j$ 列，第 $k$ 列变为第 $k$ 行所得到的矩阵。

- **矩阵乘法**
  理解：(与线性方程组之间的关系)

### 线性方程组的高斯消元法

- 线性方程组求解
- 异或方程组求解
- 与线性空间

## 题目

### [妖梦拼木棒](https://www.luogu.com.cn/problem/P3799)

**Tag:**  组合数
注意数据范围，暴力枚举求解。

### [GCD](https://www.luogu.com.cn/problem/P2568)

**Tag:**  欧拉函数
将数拆分表示，观察到互质性质，利用欧拉函数求解。

### [Devu and flowers](https://www.luogu.com.cn/problem/CF451E)

**Tag:**  容斥原理，组合数

容斥原理，配上可重集组合数，通过状态压缩技巧实现容斥。

### [矩阵求逆](https://www.luogu.com.cn/problem/P4783)

**Tag:**  线性代数

### [球迷购票问题](https://www.luogu.com.cn/problem/P1754)

**Tag:**  卡特兰数

### [数学作业](https://www.luogu.com.cn/problem/P3216)

**Tag:**  矩阵乘法

### [按钮](https://www.luogu.com.cn/problem/P4861)

**Tag:**  欧拉定理，阶的概念

裴蜀定理判断有无整数解，利用欧拉定理的性质2求解。

### [TROKUTI](https://www.luogu.com.cn/problem/P7676)

**Tag:**  数学性质

斜率不同的三条线必定会构成一个三角形。
相同斜率归为一类，枚举每一个类，答案每次加上 $cnt[currentK] \times cnt[smallerK] \times cnt[largerK]$

### [因子和](https://www.luogu.com.cn/problem/P1593)

Tag: 约数和定理

正整数 $x$ 的所有约数的和为：
 $({p_1}^1+{p_1}^2+\dots+{p_1}^{c_1}) \times ({p_2}^1+{p_2}^2+\dots+{p_2}^{c_2}) \times \dots ({p_k}^1+{p_k}^2+\dots+{p_k}^{c_k})$

最后计算时再用等比数列求和公式即可。

注意特判逆元不存在的情况。

### [火柴排队](https://www.luogu.com.cn/problem/P1966)

**Tag:**  排序不等式

设有数列 $\{a_n\}$ 和 $\{b_n\}$ 按照升序排列。设 $\{c_n\}$ 是 $\{b_n\}$ 乱序排列构成的数列。

则有：

$\sum_{i=1}^{n}{a_i\times b_{n-i+1}}\le \sum_{i=1}^{n}{a_i\times c_i}\le \sum_{i=1}^{n}{a_i\times b_i}$

即`顺序排列乘积和` 大于等于`乱序排列乘积和`大于等于`错序排列乘积和`。

题目中的式子转化为 $\sum_{i=1}^{n}({a_i}^2 + {b_i}^2)+2\times \sum a_i\times b_i$

显然 $\sum_{i=1}^{n}({a_i}^2 + {b_i}^2)$ 始终不改变。

故问题转化为刚刚的排序不等式 。

由 $\{b_n\}$ 可以确定唯一对应的 $\{a_n\}$

然后求解 $\{b_n\}$ 对应后的下标所构成的序列的逆序对即可。

### [[模板]扩展欧拉定理](https://www.luogu.com.cn/problem/P5091)

**Tag:** 扩展欧拉定理

模板题。

前文欧拉定理的性质1。

### [方差](https://www.luogu.com.cn/problem/P1471)

**Tag:** 基础数学，线段树

思路比较简单的一道题。

暴力展开需要求的方差的式子，容易发现，只需要维护区间平方和与区间和，线段树或树状数组维护即可。

### [约数研究](https://www.luogu.com.cn/problem/P1403)

**Tag:** 整除分块

数据范围其实完全可以再大一点。

$1\sim n$ 中共有 $n/i$ 个 $i$ 的倍数。

故 $\sum_{i=1}^{n}f(n)=\sum_{i=1}^{n}{\lfloor \frac{n}{i}\rfloor}$

整除分块的标准形式，$O(\sqrt{n})$ 解决。

### [余数求和](https://www.luogu.com.cn/problem/P2261)

**Tag:**  整除分块

容易得到：原式$=k \times n-\sum_{i=1}^{n}{i\times \lfloor \frac{k}{i}\rfloor}$

上整除分块。

对于每一块 $[l,r]$ 都有 $\left[l+(l+1)+\dots +r\right]\times \lfloor \frac{k}{l}\rfloor=\frac{1}{2}\times (r-l+1)\times (l + r)\times \lfloor \frac{k}{l}\rfloor$

就可以做了。

### [回首过去](https://www.luogu.com.cn/problem/P6583)

形如 $\frac{x}{y}$ 能表示为十进制有限小数形式，当且仅当 $\frac{x}{y}$ 的最简分数形式的分母只含有质因子 $2,5$。

**证明**：设有一个分数 $\frac{x}{y}$ 满足上述条件。

- 任意十进制有限小数都可以表示成 $i \times 10^k,i、k\in \mathbb{Z}$ 的形式，$i$ 做分子，$10^k$ 做分母时，约分后显然可以表示成 $\frac{x}{y}$ 的形式。

- 任意 $\frac{x}{y}$ 也可以表示为 $i\times 10^k$ 的形式。

综上所述，$\frac{x}{y}$ 与十进制有限小数是一一对应的关系，于是命题得证。

**思路**：

将满足条件的分数表示为 $\frac{b\times c}{a\times c}$。

其中 $a$ 只含有质因子 $2,5$，$c$ 不含有质因子 $2,5$。

$a、b、c\in \mathbb{Z}$ 且 $a\times c \le n \&\& b\times c \le n$

预处理出 $a$。

考虑枚举 $c$，然后 `while` 枚举满足 $a\times c\le n$ 的 $a$ 。由于 $a$ 的个数始终单调递减，故每次 $while\ a[cnt]\le \lfloor\frac{n}{c}\rfloor:cnt-1$，$cnt$ 即为 $a$ 的个数。

对于每个这样的 $a,c$，$b$ 有 $\lfloor\frac{n}{c}\rfloor$ 种可能。于是 $ans+\lfloor\frac{n}{c}\rfloor \times cnt$。

但是 $n\le 10^{12}$。。。

设 $f(x)$ 表示 $[1,x]$ 内 $a$ 的个数。

将答案表示为 $\sum_{c}{f(\lfloor\frac{c}{n}\rfloor)}\times \lfloor \frac{n}{c}\rfloor$。

想到整除分块。但是 $c$ 并不连续，所以每一块的 `length` 即为 $[l,r]$ 内 $c$ 的个数。容斥 $2,5$ 计算即可。

$ans + length\times cnt\times \lfloor\frac{n}{c}\rfloor$
