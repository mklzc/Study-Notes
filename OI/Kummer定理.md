# Kummer定理

定理：$\displaystyle \binom{n+m}{m}$ 素因子 $p$ 的幂次为 $p$ 进制下 $n+m$ 需要进位的次数。

证明：

引理 $1$：$n!$ 中 $p$ 的幂次是 $\displaystyle \sum_{i=0}{\lfloor\frac{n}{p^i}\rfloor}$ 。（显然）

因为 $\displaystyle \binom{n+m}{m}=\frac{(n+m)!}{m!~n!}$

于是 $\displaystyle \binom{n+m}{m}$ 中 $p$ 的幂次为 $\displaystyle \sum_{i=0}{\lfloor\frac{n+m}{p^i}\rfloor-\lfloor\frac{n}{p^i}\rfloor-\lfloor\frac{m}{p^i}\rfloor}$

考虑到 $\displaystyle \lfloor\frac{m}{p^i}\rfloor$ 的意义： $p$ 进制下 $m$ 去掉后 $i$ 位。

在 $p$ 进制下的加法中，$m+n$ 进位的充要条件是 $\displaystyle \lfloor\frac{n+m}{p^i}\rfloor-\lfloor\frac{n}{p^i}\rfloor-\lfloor\frac{m}{p^i}\rfloor$

所以 $\displaystyle \binom{n+m}{m}$ 素因子 $p$ 的幂次为 $p$ 进制下 $n+m$ 进位的次数。

证毕。

推论 $1$ ：$Kummer$ 定理转化一下，得到结论：

$\displaystyle \binom{n}{m}$ 中 $p$ 的幂次恰好是 $p$ 进制下 $m-n$ 需要借位的次数。
