# FFT, NTT

写的比较简略。

前置知识：**复数的基本运算**。

**多项式的点值表达**：给定 $n+1$ 个点即可确定唯一一个 n 次多项式 $F(x)$。

这里的点是指有序数对 $(x_i, F(x_i))$

**单位根**：$n$次单位根是 $n$ 次幂为 $1$ 的复数，$n\in \mathbb{N^*}$ 。

容易知道，只有模长为 $1$ 的复数才可能成为 $n$ 次单位根。

由于复数相乘，幅角相加，那么在复数单位圆中，$n$ 等分圆周的点均为 $n$ 次单位根（因为相乘过后均是圆周的整数倍）。

于是 $n$ 次单位根会有 $n$ 个，分别记为 $\omega_{n}^{1},\omega_{n}^{2}\dots \omega_{n}^{k}$ 。

$FFT$ 过程：

设有 $n-1$ 次多项式 $F(x)$，这里保证 $n$ 是 $2$ 的整数次幂。

$L(x)=(F[0]+F[2]x^2+F[4]x^4+\dots F[n-2]^{\frac{n}{2}-1})$

$R(x)=(F[1]+F[3]x+\dots +F[n-1]^{\frac{n}{2}-1})$

于是 $F(x)=L(x^2)+xR(x^2)$

1. 向其中代入 $\omega_{n}^{k}$：$F(\omega_{n}^{k})=L(\omega_{n/2}^{k})+\omega_{n}^{k}R(\omega_{n/2}^{k})$
2. 向其中带入 $\displaystyle \omega_{n}^{k+\frac{n}{2}}$：$F(\omega_{n}^{k+\frac{n}{2}})=L(\omega_{n/2}^{k})-R(\omega_{n/2}^{k})$

带入单位根后即可求的 $F(x)$ 的点值表达，上述过程就是 $DFT$ 的过程。

要将点值表达还原为一个多项式，就需要用到 $IDFT$。

$IDFT$ 的本质就是单位根反演，这里不做过多论述，实现时，只需要将求单位根 $\omega_{n}^{k}$ 变为求 $\omega_{n}^{-k}$ 即可。

```cpp
#include <bits/stdc++.h>
const int N = int(1350000) << 1;
const double pi = acos(-1);
struct Node
{
    double x, y;
    Node(double _x = 0, double _y = 0) { x = _x, y = _y; }
    Node operator+(Node const &B) const {
        return Node(x + B.x, y + B.y);
    }
    Node operator-(Node const &B) const {
        return Node(x - B.x, y - B.y);
    }
    Node operator*(Node const &B) const {
        return Node(x * B.x - y * B.y, x * B.y + y * B.x);
    }
} f[N], g[N], sav[N];
int n, m, tr[N];
void fft(Node *f, double st)
{
    for (int i = 0; i <= n; i++)
        if (i < tr[i]) std::swap(f[i], f[tr[i]]);
    for (int p = 2; p <= n; p <<= 1)
    {
        Node e(cos(2*pi/p), st*sin(2*pi/p));
        int len = p >> 1;
        for (int k = 0; k < n; k += p)
        {
            Node buf(1, 0);
            for (int l = k; l < k + len; l++)
            {
                Node tmp = buf * f[len + l];
                f[len + l] = f[l] - tmp;
                f[l] = f[l] + tmp;
                buf = buf * e;
            }
        }
    }
}
int main()
{
    scanf("%d %d", &n, &m);
    for (int i = 0; i <= n; i++)
        scanf("%lf", &f[i].x);
    for (int i = 0; i <= m; i++)
        scanf("%lf", &g[i].x);
    for (m += n, n = 1; n <= m; n <<= 1);
	for (int i = 0; i < n; i++)
		tr[i] = (tr[i >> 1] >> 1) | ((i & 1) ? n >> 1 : 0);
    fft(f, 1.0), fft(g, 1.0);
    for (int i = 0; i < n; i++)
        f[i] = f[i] * g[i];
    fft(f, -1);
    for (int i = 0; i <= m; ++i)
        printf("%d ", (int)(f[i].x / n + 0.49));
    return 0;
}
```

---

$FFT$ 过程中会使用正余弦函数，进而引发精度问题。

$NTT$ 则找到了单位根的替代品：原根。

可以证得：$g^{\frac{n-1}{p}}$ 恰好满足单位根所具有的性质。

```cpp
const int N = 2700000, mod = 998244353, G = 3;
int n, m, tr[N];
LL f[N], g[N];
LL qpow(LL x, LL y = mod - 2)
{
    LL res = 1;
    for (; y; y >>= 1) {
        if (y & 1) res = res * x % mod;
        x = x * x % mod;
    } return res;
}
const LL invG = qpow(G);
void ntt(LL *f, bool st)
{
    rep(i, 0, n - 1)
        if (i < tr[i]) std::swap(f[i], f[tr[i]]);
    for (int p = 2; p <= n; p <<= 1)
    {
        int len = p >> 1, e = qpow(st ? G : invG, (mod - 1) / p);
        for (int k = 0; k < n; k += p)
        {
            LL buf = 1;
            rep(l, k, k + len - 1)
            {
                int tt = buf * f[len + l] % mod;
                f[l + len] = f[l] - tt;
                if (f[l + len] < 0) f[len + l] += mod;
                f[l] = f[l] + tt;
                if (f[l] > mod) f[l] -= mod;
                buf = buf * e % mod;
            }
        }
    }
}
int main()
{
    scanf("%d %d", &n, &m);
    rep(i, 0, n)
        scanf("%lld", &f[i]);
    rep(i, 0, m)
        scanf("%lld", &g[i]); 
    n++, m++;
    for (m += n, n = 1; n < m; n <<= 1) continue;
    rep(i, 0, n - 1)
        tr[i] = (tr[i >> 1] >> 1) | ((i & 1) ? n >> 1 : 0);
    ntt(f, 1), ntt(g, 1);
    rep(i, 0, n - 1)
        f[i] = f[i] * g[i] % mod;
    ntt(f, 0); LL invn = qpow(n);
    rep(i, 0, m - 2)
        printf("%d ", (int)(f[i] * invn % mod));
    return 0;
}
```

可以发现，$NTT$ 代码和 $FFT$ 差别并不大。
