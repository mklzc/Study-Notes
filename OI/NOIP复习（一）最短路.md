# NOIP复习（一）最短路

## Dijkstra

复习一遍模板。[Dijkstra模板](https://www.luogu.com.cn/paste/hmj7h0y9)

适用性：适用于非负权图。

$dijkstra$ 算法的扩展应用：

1. 求最短路上的最大边权。

具体实现与 $Dijkstra$ 差别不大，每次更新时用边权更新 $dist$ 数组即可。

```cpp
int z = std::max(edge[i], dist[x]);
if (z < dist[y])
    dist[y] = z, q.emplace(-d[y], y);
```

例题：[海滩防御 - 洛谷](https://www.luogu.com.cn/problem/P1783)

## spfa

[spfa 模板](https://www.luogu.com.cn/paste/trup9bhf)

例题：[跑路 - 洛谷](https://www.luogu.com.cn/problem/P1613)

结合倍增考察。

预处理出每两个点是否只需一次跑路可以到达，连边后跑 $SPFA$ 即可。

具体地：设 $F(i,j,k)$ 表示 $i, j$ 之间是否存在一条长度为 $2^k$ 的路径，用 $F(i, j, k) = (F(i,t,k-1)~\mathrm{and}~F(t,j,k-1))$ 。

$SPFA$ 与负环：

定理 $2.1$ ：若最短路边数大于 $n-1$ ，则整张图存在负环。

判断负环：具体地，记录 $c_i$ 表示从源点到 $i$ 的最短路边数，松弛时，令 $c_y=c_x + 1$ ，并判断 $c_y$ 是否大于 $n-1$ 。

## FLoyd 算法
