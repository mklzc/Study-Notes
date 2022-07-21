# BSGS 大步小步算法

$Baby~Step, Giant~Step$，大步小步算法（轻量级算法，求解高次同余方程）。

## 思路

先上例题：给定整数 $a,b,p$，其中 $\mathbf{a,p}$ **互质**，求一个非负整数 $x$，使得 $a^x\equiv b\pmod p$

朴素算法概述：

考虑一个暴力算法，在 $\bmod~p$ 的意义下，$a^x$ 显然有一个长度为 $\varphi(p)$ 的循环节，所以只需要考虑 $x\le \varphi(p)$ 的情况即可。

暴力枚举 `x` 求解，时间复杂度 $O(\varphi(p))$，最坏 $O(p-1)$

而 $BSGS$ 则运用类似于 **拆半搜索** 的思想，将 `x` 表示成 $i\times t - j$ 的形式。

于是原式 $\to a^{i\times t}\equiv b\times a^{j}\pmod p$

固定 `t` 的值，预处理出右式所有可能的取值。

枚举计算左式可能的值，当枚举到某个在右边已经出现过的值时，此时 $i\times t - j$ 就是我们要求的 `x`。

`t` 的取值：

$j$ 的取值为 $\varphi(p) \bmod t$ 共计 $t-1$ 个，$i$ 的取值有 $\lceil\frac{\varphi(p)}{t}\rceil$ 个。

$t$ 取 $\sqrt{\varphi(p)}$ 时有最优复杂度（最平均），但为避免计算 $\varphi(p)$，近似取 $t=\sqrt{p}$ 即可。

时间复杂度 $O(\sqrt{p})$

## exBSGS

求解 $a^x\equiv b\pmod p$ 需要满足条件 $a\perp p$ ，而 $exBSGS$ （扩展 $BSGS$）主要解决 $a\not\perp p$ 的情况。

设 $d=gcd(a,p)$，若我们把同余式两边同时除以 $d$ ，如此可以构造互质。

因为 $d\mid a^x\bmod p$，所以 $b\neq 1$ 时，必然有 $d\mid b$ ，否则原同余式无解。

于是原式 $\to a^{x-1}\frac{a}{d}\equiv \frac{b}{d}\pmod {\frac{p}{d}}$

运用 $exgcd$ ，原式 $\to a^{x-1}\equiv \frac{b}{d}(\frac{a}{d})^{-1}\pmod {\frac{p}{d}}$

但是 $a$ 不一定与 $\frac{p}{d}$ 互质，于是递归进入子问题求解，直到 $a$ 与模数互质（$d=1$）为止。

完美解决，撒花。

## 练习题目

### [可爱的质数/[模板]BSGS](https://www.luogu.com.cn/problem/P3846)

模板。

```cpp
class BSGS{
public:
    LL mod, a, b, t, power;
    std::unordered_map<LL, int> hash;
    BSGS(LL _a, LL _b, LL _mod){a = _a, b = _b, mod = _mod, t = std::ceil(std::sqrt(mod)) + 1, power = 1;};
    int work()
    {
        for (int j = 0; j < t; j++)
            hash[b * power % mod] = j, power = power * a % mod;
        LL res = power;
        for (int i = 1; i <= t; i++)
        {
            auto iter = hash.find(power);
            int val = iter != hash.end() ? iter->second : mod;
            if (val != mod)
                return i * t - val;
            power = power * res % mod;
        }
        return -1;
    }
};
int main()
{
    BSGS bsgs(/*a, b, p*/);
    std::cout << bsgs.work();
    return 0;
}
```

### [多少个1?](https://www.luogu.com.cn/problem/P4884)

再送一道 $bsgs$ 模板。

### [[ 模板]扩展 BSGS/exBSGS](https://www.luogu.com.cn/problem/P4195)

$exbsgs$ 的模板题。

```cpp
#include <bits/stdc++.h>
using LL = long long;
class BSGS{
public:
    LL mod, a, b, t, power;
    std::unordered_map<LL, int> hash;
    BSGS(LL _a, LL _b, int _mod){a = _a, b = _b, mod = _mod, t = std::ceil(std::sqrt(mod)), power = 1;};
    int work()
    {
        hash.clear();
        for (int j = 0; j < t; j++)
            hash[b * power % mod] = j, power = power * a % mod;
        LL res = power;
        for (int i = 1; i <= t; i++)
        {
            auto iter = hash.find(power);
            int val = iter != hash.end() ? iter->second : mod;
            if (val != mod)
                return i * t - val;
            power = power * res % mod;
        }
        return -10000;
    }
}bsgs(0, 0, 0);
void exgcd(LL a, LL b, LL &x, LL &y)
{
    if (b == 0)
        return void(x = 1), void(y = 0);
    exgcd(b, a % b, x, y);
    LL z = x;
    x = y, y = z - y * (a / b);
}
LL inv(LL a, int mod)
{
    LL x, y; exgcd(a, mod, x, y);
    return (x % mod + mod) % mod;
}

LL dfs(LL a, LL b, LL mod)
{
    if (a == b) return 1;
    LL d = std::__gcd(a, mod);
    if (d == 1) return void(bsgs = BSGS(a, b, mod)), bsgs.work();
    if (b % d) return -10000;
    mod /= d;
    return dfs(a % mod, (b / d) * inv(a / d, mod) % mod, mod) + 1;
}

int main()
{
    LL a, b;
    int mod;
    auto work = [](LL a, LL b, int mod)->LL{
        if (b == 1 || mod == 1) return 0;
        if (!a) return b ? -1 : 1;
        if (b == 1) return 0;
        return dfs(a, b, mod);
    };
    while (1)
    {
        scanf("%lld %d %lld", &a, &mod, &b);
        if (!mod) break;
        a %= mod, b %= mod;
        LL ans = work(a, b, mod);
        if (ans >= 0) printf("%lld\n", ans);
        else puts("No Solution");
    }
    return 0;
}
```
