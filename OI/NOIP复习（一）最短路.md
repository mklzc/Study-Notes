# NOIP复习（一）最短路

## Dijkstra

复习一遍模板。[Dijkstra模板](https://www.luogu.com.cn/paste/hmj7h0y9)

适用性：适用于非负权图。

例题 $1.1$：[海滩防御 - 洛谷](https://www.luogu.com.cn/problem/P1783)

$dijkstra$ 算法的扩展应用：

1. 求最短路上的最大边权。

具体实现与 $Dijkstra$ 差别不大，每次更新时用边权更新 $dist$ 数组即可。

```cpp
int z = std::max(edge[i], dist[x]);
if (z < dist[y])
    dist[y] = z, q.emplace(-d[y], y);
```

例题 $1.2$：[通往奥格瑞玛的道路 - 洛谷](https://www.luogu.com.cn/problem/P1462)

$Dijkstra$ 加二分，易发现答案具有单调性，二分答案，$Dijkstra$ 判断可行性。

例题 $1.3$：[[JLOI2011] 飞行路线](https://www.luogu.com.cn/problem/P4568)

分层图最短路模板。

思路：将一个节点扩展成 $k$ 个节点，每个节点与相应的其它节点称为一层，每层之间连边权为零的边即可。

更简洁的，可以用 $dp$ 实现。

例题 $1.4$：[[GXOI/GZOI2019]旅行者 - 洛谷](https://www.luogu.com.cn/problem/P5304)

比较巧妙的一道题，或许可以称作多源最短路？

在原图和反图上分别跑一遍最短路，分别求出，兴趣城市到其它所有点的最短距离和其他点到兴趣城市的最短距离。

初始时，将所有兴趣城市入队。（正确性：想象一个虚拟原点，其与每个兴趣城市都有一条边权为 $0$ 的边）

最终答案为 $\min_{u,v}\{df(u)+ds(v)+edge(u,v)\}$

$df, ds$ 分别表示兴趣城市到其它点的最短距离和其他点到兴趣城市的最短距离。

例题 $1.5$：[[ICPC-Beijing 2006] 狼抓兔子 - 洛谷](https://www.luogu.com.cn/problem/P4001)

[题解-[ICPC-Beijing 2006] 狼抓兔子](https://www.cnblogs.com/mklzc/p/16639948.html)

## spfa

[spfa 模板](https://www.luogu.com.cn/paste/trup9bhf)

例题：[跑路 - 洛谷](https://www.luogu.com.cn/problem/P1613)

结合倍增考察。

预处理出每两个点是否只需一次跑路可以到达，连边后跑 $SPFA$ 即可。

具体地：设 $F(i,j,k)$ 表示 $i, j$ 之间是否存在一条长度为 $2^k$ 的路径，用 $F(i, j, k) = (F(i,t,k-1)~\mathrm{and}~F(t,j,k-1))$ 。

$SPFA$ 与负环：

定理 $2.1$ ：若最短路边数大于 $n-1$ ，则整张图存在负环。

判断负环：具体地，记录 $c_i$ 表示从源点到 $i$ 的最短路边数，松弛时，令 $c_y=c_x + 1$ ，并判断 $c_y$ 是否大于 $n-1$ 。

## FLoyd

$floyd$ 很短很好记忆。

```cpp
for (int i = 1; i <= n; i++)
    for (int j = 1; j <= n; j++)
        d[i][j] = (i == j) ? 0 : INF;
for (int k = 1; k <= n; k++)
    for (int i = 1; i <= n; i++)
        for (int j = 1; j <= n; j++)
            d[i][j] = std::min(d[i][j], d[i][k] + d[k][j]);
```

$Floyd$ 与传递闭包：
