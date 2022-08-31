# NOIP复习（二）二分算法

例题 $1$：[[NOIP2001 提高组] 一元三次方程求解 - 洛谷](https://www.luogu.com.cn/problem/P1024)

考虑三次函数的曲线形式，找到在 $x$ 轴两侧的点，二分答案即可。

[评测记录 - 洛谷](https://www.luogu.com.cn/record/85581581)

例题 $2$：[寻找段落 - 洛谷](https://www.luogu.com.cn/problem/P1419)

通过二分答案，转化为判定性问题。

欲判定当前平均值 $mid$ 是否可能可行：即是否有 $\sum{(a_i - mid)} >= 0(len\in [s,t])$

考虑将 $a_i$ 全部减去 $mid$ ，做一遍前缀和。对于当前 $i$ ，$sum[i+s]\sim sum[i+t]$ 的最大值是最优的情况，于是上单调队列即可。

[评测记录 - 洛谷](https://www.luogu.com.cn/record/85577923)
