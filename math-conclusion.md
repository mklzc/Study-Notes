## 初等数论
#### 同余式
- **基本概念**

- **一些性质**

- **同余类、剩余系**

#### 欧拉定理和欧拉函数
欧拉函数：

- **概念**

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

欧拉定理：

- **证明** （简单剩余系）

- **推论**
 $a ^ {b} \equiv a ^{b \mod \phi(n)}\pmod n$

例题：
给定一个整数 $N$，请你求出 $\sum_{1 \le i \le N}gcd(1, i)$的值。


#### 费马小定理:

$a^{p - 1} \equiv 1\pmod p$，当 p 为素数时成立。

欧拉定理的特殊情况。

**求逆元**

***费马检查配合二次探测定理：Miller Rabin算法**

#### 威尔逊定理

- **证明**

- **应用**

例题：

给出素数 p，求 $q!\mod p$，其中 $q$ 为比 p 小的最大素数，$p \in [1, 10^9]$。

#### 裴蜀定理

一定 $\exists x, y\in Z\ \ s.t.\  a * x + b * y = gcd(a, b)$ 成立。

- **证明**

两种证明方法。

- **推论**

	- $a,b$ 互质的充分必要条件是存在整数 $x,y$ 使 $a * x + b * y=1$
    - 设 $a_1,a_2,a_3......a_n$ 为 $n$ 个整数，$d$ 是它们的最大公约数，那么存在整数$x_1......x_n$ 使得 $x_1*a_1+x_2*a_2+...x_n*a_n=d$ 。
    - $a \times x + b \times y = c$ 有解当且仅当 $c\ |\ gcd(a, b)$

例题：

给定 $K$，$M$ 求一个最小的正整数 $x$,使得 $K^x\equiv 1\pmod M$，如果无解输出 -1 。

数据范围：$2\leq K$，$M\le 2\times 10^9$。

#### 逆元

- **概念**

如果您到百度上搜索逆元，您会看到如下定义：（这里逆元素是逆元的全称）
```
    逆元素是指一个可以取消另一给定元素运算的元素
    													---百度百科
```

理解：

举个例子，如果一个数 $F$ 乘一个数 $a$ 后，再乘它的倒数 $\frac {1} {a}$，相当于没有乘 $a$，换句话说，我们乘上 $\frac {1} {a}$ 后，取消了代数式 $F$ 乘 $a$ 后值增大的影响。

不难发现这符合逆元的定义，故我们可以说一个数和其倒数互为乘法逆元。除此之外，我们还能发现一个数和其相反数互为加法逆元等等……

- **应用：除法取模**

- **求法：**

	- 扩欧算法
    - 费马小定理（注意：仅在 p 为质数时成立）
    - 线性递推:
    	- 证明
```cpp
inv[1] = fac[1] = inv[0] = fac[0] = 1;
for (int i = 2; i <= n; i++)
    inv[i] = (p - p / i) * inv[p % i] % p;
```

#### 扩展欧几里得算法
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
#### CRT 中国剩余定理
假设整数 $m_1, m_2\dots m_n$ 两两互素，则对于任意的整数 $a_1, a_2 \dots a_n$ ，方程组

$$\begin{cases} x \equiv a_1\ ({\rm mod}\ m_1) \\ x\equiv a_2\ ({\rm mod}\ m_2) \\ ... \\ x \equiv a_n\ ({\rm mod}\ m_n)\end{cases}$$
存在整数解。

我们设 $M=\prod_{i=1}^{k}m_i$，$ M_i=\frac{M}{m_i}$，$M_it_i≡1\;\;(mod\;\;m_i)$。

可以构造出一个解$x=\sum_{i=1}^{k}a_iM_it_i$

- **证明** 展开即可。
```cpp
int a[], m[], M[];
int CRT()
{
	int MUL = 1, TJ = 0;
	for (int i = 1; i <= n; i++)
		MUL *= m[i], M[i] = MUL / m[i];
	for (int i = 1; i <= n; i++)
	{
		int x, y;
		exgcd(M[i], m[i], x, y);
		if (x < 0) x += m[i];
		TJ += x * M[i] * a[i];
	}
	return TJ;
}
```


## 组合数学

#### 可重集排列和可重集组合
![](https://cdn.luogu.com.cn/upload/image_hosting/w9gkg3ok.png)

- **证明**

#### 鸽巢原理
![](https://cdn.luogu.com.cn/upload/image_hosting/w05insir.png)
**证明**

#### 二项式定理
- **证明**

#### 容斥原理
- **理解**

#### 卡特兰数
- **定义**

- **例子**

## 线性代数

#### 矩阵概念

#### 特殊矩阵

- **稀疏矩阵**

- **三角矩阵**

- **对称矩阵**

#### 矩阵的初等变换

#### 矩阵的加减乘和转置运算

#### 线性方程组的高斯消元法

历年NOIP的数学题
- [P7962 [NOIP2021] 方差 紫](https://www.luogu.com.cn/problem/P7962)
- [P7960 [NOIP2021] 报数 黄](https://www.luogu.com.cn/problem/P7960)
- [P7116 [NOIP2020] 微信步数 紫](https://www.luogu.com.cn/problem/P7116)
- [P5023 [NOIP2018 提高组] 填数游戏 紫](https://www.luogu.com.cn/problem/P5023)
- [P5020 [NOIP2018 提高组] 货币系统 绿](https://www.luogu.com.cn/problem/P5020)
- [P3951 [NOIP2017 提高组] 小凯的疑惑 黄](https://www.luogu.com.cn/problem/P3951)
- [P2822 [NOIP2016 提高组] 组合数问题 绿](https://www.luogu.com.cn/problem/P2822)
- [P2312 [NOIP2014 提高组] 解方程 蓝](https://www.luogu.com.cn/problem/P2312)
- [P1965 [NOIP2013 提高组] 转圈游戏 黄](https://www.luogu.com.cn/problem/P1965)
- [P1082 [NOIP2012 提高组] 同余方程 绿](https://www.luogu.com.cn/problem/P1082)
- [P1314 [NOIP2011 提高组] 聪明的质监员 绿](https://www.luogu.com.cn/problem/P1314)
- [P1313 [NOIP2011 提高组] 计算系数 黄](https://www.luogu.com.cn/problem/P1313)
- [P1072 [NOIP2009 提高组] Hankson 的趣味题 绿](https://www.luogu.com.cn/problem/P1072)
- [P1066 [NOIP2006 提高组] 2^k进制数 蓝](https://www.luogu.com.cn/problem/P1066)
- [P1092 [NOIP2004 提高组] 虫食算 蓝](https://www.luogu.com.cn/problem/P1092)
- [P1033 [NOIP2002 提高组] 自由落体 黄](https://www.luogu.com.cn/problem/P1033)
- [P1024 [NOIP2001 提高组] 一元三次方程求解 橙](https://www.luogu.com.cn/problem/P1024)
- [P1017 [NOIP2000 提高组] 进制转换 黄](https://www.luogu.com.cn/problem/P1017)
- [P1011 [NOIP1998 提高组] 车站 橙](https://www.luogu.com.cn/problem/P1011)
