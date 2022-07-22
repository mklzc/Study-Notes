# 二次剩余与 cipolla 算法

## 概述

$cipolla$ 算法用于求解 $x^2\equiv n\pmod p$ 此类同余方程。（这里只讨论模数 $p$ 为奇素数的情况）

若该方程有解，那么 $n$ 就称为模 $p$ 的二次剩余，否则 $n$ 为 $\bmod~p$ 意义下的二次非剩余。

## 几个定理

**定理 $1.1$：** $n^{\frac{n-1}{2}}\equiv \pm 1\pmod p$

证明：

由费马小定理可知：

$
\displaystyle
n^{p-1}\equiv 1\pmod p\\
\to (n^{\frac{p-1}{2}})^2\equiv 1\pmod p\\
\to n^{\frac{n-1}{2}}\equiv \pm 1\pmod p
$

证毕。

**定理 $1.2$：（欧拉准则)** $n^{\frac{p-1}{2}}\equiv -1\pmod p\to n$ 为非二次剩余。

证明：

若存在 $x$ 满足 $x^2\equiv n\pmod p$

那么：$x^{p-1}\equiv (x^2)^{\frac{p-1}{2}}\equiv n^{\frac{p-1}{2}}\equiv -1\pmod p$

与费马小定理矛盾，于是 $n^{\frac{p-1}{2}}\equiv -1\pmod p\to n$ 为非二次剩余。

**定理 $1.3$：（欧拉准则)** $n$ 为非二次剩余 $\to$ $n^{\frac{p-1}{2}}\equiv 1\pmod 1$

证明：弃疗了。甩个链接：[二次剩余 - OI Wiki](https://oi.wiki/math/number-theory/quad-residue/#euler)

**定理 $1.4$：** 若 $x^2\equiv n\pmod p$ 有解，那么必定有两解。

证明：

显然，若存在解 $x\text{ s.t. } x^2\equiv n\pmod p$ 成立，那么必定存在 $p-x\text{ s.t. }(p-x)^2\equiv x^2\equiv n\pmod p$ 成立。

那么，如果存在多个解的话，是否会多余两个解呢？

设 $x_1$ 和 $x_2$ 是 $x^2\equiv n\pmod p$ 的两个解。

于是 ${x_1}^2\equiv n\equiv{x_2}^2\pmod p$，

$\to (x_1-x_2)(x_1+x_2)\equiv 0$

由于 $x_1\not\equiv x_2\pmod p$ ，所以 $x_1$ 必定与 $x_2$ 互为相反数，在 $\bmod~p$ 的意义下。

所以，若 $x^2\equiv n\pmod p$ 有解，那么必定有两解。

**定理 $1.5$：** 在 $\bmod~p$ 意义下 $p$ 的非二次剩余有 $\frac{p-1}{2}$ 个。

证明：

由于 $\text{ s.t }x^2\equiv n\pmod p$ 有解的两个 $x_1$ 和 $x_2$ 在 $\bmod~p$ 的意义下互为相反数。

任意一对相反数都对应一个二次剩余，而在 $\bmod~p$ 的意义下共有 $\frac{p-1}{2}$ 个形如 $x^2$ 的数。

于是有 $\frac{p-1}{2}$ 个二次剩余，$\to$ 有非二次剩余 $\frac{p-1}{2}$ 个。

证毕。

## cipolla 算法

解二次剩余方程 $x^2\equiv n\pmod p$ 。定义 $i^2\equiv a^2-n\pmod p$ 且 $a^2-n$ 是非二次剩余。这样的 $a^2-n$ 可以通过随机枚举 $a$ 来寻找，因为二次剩余的数量恰为 $\frac{p-1}{2}$ ，所以找到符合条件的 $a$ 的期望次数为两次。

但 $a^2-n$ 不是二次剩余，对于方程 $i^2\equiv a^2-n\pmod p$ 的 $i$ 于是无在 $\bmod~p$ 意义下的解。那么如何求 $i$ 呢？

可以把 $i$ 理解为虚数，将每个数表示为 $a+b\times i$ 的形式（类比于复数运算，但稍有不同）。

例如：关于$i$ 的乘法运算应为 $(a+bi)(x+yi)=(ax+byi^2)+(ay+bx)i$。

**定理 $2.1$：** 对于 $i^2\equiv a^2-n$ 且 $a^2-n$ 为二次非剩余，必有 $n\equiv (a+i)^{p+1}\pmod p$ ，即 $x\equiv (a+i)^{\frac{p-1}{2}}\pmod p$

证明：

引理 $2.1.1$：$(a+b)^p\equiv a^p+b^p\pmod p$

证：二项式定理展开后可得，$(a+b)^p\equiv \sum_{j=0}^{p}{{p\choose j}a^p}\times b^{p-j}$

由 $Lucas$ 定理可得：${p\choose j}\equiv {{p/p}\choose{j/p}}\times {p\bmod p\choose {j\bmod p}}$

上式仅在 $j=p$ 或 $j=0$ 的时候为 $1$ ，否则为 $0$ 。

引理 $2.1.2$ ：$i^p=-i$

$\to i^{p-1}\times i\equiv (a+n)^{\frac{p-1}{2}}\times i$

因为 $a+n$ 是二次非剩余，由欧拉准则可知上式为 $-i$ 。

---

于是，$(a+1)^{p+1}\equiv (a+i)^p\times (a+i)\pmod p$

由引理 $2.1.1$ 可知上式 $\equiv (a^p+i^p)\times(a+i)$

由引理 $2.1.2$ 和费马小定理知：上式 $\equiv (a-i)(a+i)\equiv a^2-i^2$

带入 $i^2$ 得：$a^2-i^2\equiv a^2-(a^2-n)\equiv n\pmod n$

命题得证。

## 题目

### [[模板]二次剩余 - 洛谷](https://www.luogu.com.cn/problem/P5491)

```cpp
#include <algorithm>
#include <cstdio>
#include <iostream>
using LL = long long;
int mod, c;
LL isq;
struct CP
{
    LL x, y;
    CP operator*(CP const &B) 
    const {return (CP){(x * B.x + y * B.y % mod * isq) % mod, (x * B.y + y * B.x) % mod};}
    CP qpow(CP a, int b)
    {
        CP res = (CP){1, 0};
        for (; b; b >>= 1) {
            if (b & 1) res = res * a;
            a = a * a;
        }return res;
    }
};
void cipolla(int c, int mod)
{
    auto qpow = [](LL a, int b, int mod)->int{
        int res = 1;
        for (; b; b >>= 1) {
            if (b & 1) res = 1ll * res * a % mod;
            a = a * a % mod;
        }return res;
    };
    auto check = [&](LL a, int mod)
    ->bool{return qpow(a, (mod - 1) >> 1, mod) == mod - 1;};
    if (!c) return void(puts("0"));
    if (check(c, mod)) return void(puts("Hola!"));
    int a;
    while (true)
    {
        a = rand() % mod;
        isq = (1ll * a * a - c + mod) % mod;
        if (check(isq, mod)) break;
    }
    CP i = (CP){a, 1};
    i = i.qpow(i, (mod + 1) >> 1);
    if (i.x > mod - i.x) printf("%lld %lld\n", mod - i.x, i.x);
    else printf("%lld %lld\n", i.x, mod - i.x);
}
int main()
{
    int T;
    scanf("%d", &T);
    while (T--)
        scanf("%d %d", &c, &mod), cipolla(c, mod);
    return 0;
}
```
