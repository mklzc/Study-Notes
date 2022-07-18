# BSGS 大步小步算法

$Baby~Step, Giant~Step$，大步小步算法（轻量级算法，求解高次同余方程）。

## 思路

先上例题：给定整数 $a,b,p$，其中 $\mathbf{a,p}$ **互质**，求一个非负整数 $x$，使得 $a^x\equiv b\pmod p$

朴素算法概述：

考虑一个暴力算法，在 $\bmod~p$ 的意义下，$a^x$ 显然有一个长度为 $\varphi(p)$ 的循环节，所以只需要考虑 $x\le varphi(p)$ 的情况即可。

暴力枚举 `x` 求解，时间复杂度 $O(\varphi(p))$，最坏 $O(p-1)$

而 $BSGS$ 则运用类似于 **拆半搜索** 的思想，将 `x` 表示成 $i\times t - j$ 的形式。

于是原式 $\to a^{i\times t}\equiv b\times a^{j}\pmod p$

固定 `t` 的值，预处理出右式所有可能的取值。

枚举计算左式可能的值，当枚举到某个在右边已经出现过的值时，此时 $i\times t - j$ 就是我们要求的 `x`。

`t` 的取值：

$j$ 的取值为 $\varphi(p) \bmod t$ 共计 $t-1$ 个，$i$ 的取值有 $\lceil\frac{\varphi(p)}{t}\rceil$ 个。

$t$ 取 $\sqrt{\varphi(p)}$ 时有最优复杂度（最平均），但为避免计算 $\varphi(p)$，近似取 $t=\sqrt{p}$ 即可。

时间复杂度 $O(\sqrt{p})$

## 练习题目

### [可爱的质数/[模板]BSGS](https://www.luogu.com.cn/problem/P3846)

模板。

```cpp
class BSGS{
public:
    LL mod, a, b, t, power;
    std::unordered_map<LL, LL> hash;
    BSGS(LL _a, LL _b, LL _mod){a = _a, b = _b, mod = _mod, t = std::ceil(std::sqrt(mod)) + 1, power = 1;};
    LL bsgs()
    {
        for (LL j = 0; j < t; j++)
            hash[b * power % mod] = j, power = power * a % mod;
        LL res = power;
        for (LL i = 1; i <= t; i++)
        {
            auto iter = hash.find(power);
            LL val = iter != hash.end() ? iter->second : mod;
            if (val != mod)
                return i * t - val;
            power = power * res % mod;
        }
        return -1;
    }
};
int main()
{
    BSGS work(/*a, b, p*/);
    std::cout << work.bsgs();
    return 0;
}
```

### [多少个1?](https://www.luogu.com.cn/problem/P4884)

再送一道模板。
