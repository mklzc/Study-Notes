# NOIP复习（二）二分算法

提供一种二分写法，不太用考虑边界的问题。

```cpp
int l = st, r = ed, ans = ed + 1;
while (l <= r)
{
    int mid = (l + r) >> 1;
    if (check(mid)) ans = mid, l = mid + 1;
    else r = mid - 1;
}
if (ans == ed + 1)
    printf("No Solution!");
else
    printf("%d", ans);
```

正确性分析：

每次 $r$ 与 $l$ 必有一个变化，因此不会陷入死循环。

$ans$ 始终保存的是满足条件的 $mid$ ，所以答案永远是当前情况下的最优解。

例题 $1$：[[NOIP2001 提高组] 一元三次方程求解 - 洛谷](https://www.luogu.com.cn/problem/P1024)

考虑三次函数的曲线形式，找到在 $x$ 轴两侧的点，二分答案即可。

[评测记录 - 洛谷](https://www.luogu.com.cn/record/85581581)

例题 $2$：[寻找段落 - 洛谷](https://www.luogu.com.cn/problem/P1419)

通过二分答案，转化为判定性问题。

欲判定当前平均值 $mid$ 是否可能可行：即是否有 $\sum{(a_i - mid)} >= 0(len\in [s,t])$

考虑将 $a_i$ 全部减去 $mid$ ，做一遍前缀和。对于当前 $i$ ，$sum[i+s]\sim sum[i+t]$ 的最大值是最优的情况，于是上单调队列即可。

[评测记录 - 洛谷](https://www.luogu.com.cn/record/85577923)

例题 $3$：[[NOIP2015 提高组] 跳石头 - 洛谷](https://www.luogu.com.cn/problem/P2678)

二分答案，判定可行性：在 $m$ 次操作内是否能使每段距离都大于 $mid$ 。

直接遍历即可，每次遇到 $<mid$ 的距离，就对它进行操作直到它 $>mid$ 为止。

**陷入的一个误区**：

二分判定可行性的时候，误以为需要找到最优方案，来判断是否能使当前理想解成立。

于是想尽办法构造了最优方案，其实完全没有必要，每一次只用贪心地去除任何能导致当前解不成立的情况即可。

[评测记录 - 洛谷](https://www.luogu.com.cn/record/85594873)（仅供参考，代码构造了最优判定方案，常数较大，不够优秀）

例题 $4$ ：[进击的奶牛 - 洛谷](https://www.luogu.com.cn/problem/P1824)

类似于例题 $3$ 。

[评测记录 - 洛谷](https://www.luogu.com.cn/record/85604931)

例题 $5$：[刺杀大使 - 洛谷](https://www.luogu.com.cn/problem/P1902)

比较板，二分 $+BFS$ 判定。

[评测记录 - 洛谷](https://www.luogu.com.cn/record/85618584)

例题 $6$：[[NOIP2011 提高组] 聪明的质监员 - 洛谷](https://www.luogu.com.cn/problem/P1314)

考虑 $y$ 的单调性：随 $W$ 增大而单调递减。

将 $y$ 看做函数，考虑二分的数学意义，类似于求二次方程的解，找到最接近于 $s$ 的解即可。

考虑如何快速求解 $y$ ，发现记录前缀和即可。

时间复杂度 $O(N\log N)$

[评测记录 - 洛谷](https://www.luogu.com.cn/record/85669751)

例题 $7$：[[NOIP2012 提高组] 借教室 - 洛谷](https://www.luogu.com.cn/problem/P1083)

发现订单的满足二分条件，二分需要修改的订单即可。

[评测记录 - 洛谷](https://www.luogu.com.cn/record/85672538)

例题 $8$：[[SHOI2015]自动刷题机 - 洛谷](https://www.luogu.com.cn/problem/P4343)

非常显然的一道二分，刷题数明显随答案增大而减小。但是我非常脑抽的把二分 $r$ 上界设成了 $\max{x_i}$ ，调了很久才过。

要注意的一点是，这道题更新边界的条件是 $cnt>=k$ ，而更新答案的条件是 $cnt==k$ 。

[评测记录 - 洛谷](https://www.luogu.com.cn/record/85684476)
