# 动态规划 Dynamic Programming

蒟蒻的 `DP` 入门之路。

## 题目

### [Mr's Young's Picture Permutation](https://www.acwing.com/problem/content/273/)

#### 思路

考虑将人按身高降序安排。

状态表示：$f[a_1][a_2][a_3][a_4][a_5]$ 表示第 `i` 排有 $a_i$ 个人。

状态转移：

$if (a_i < a_{i - 1}\ and\ a_i < N_i): $
$\ \ \ f[a_1]\dots f[a_i + 1]\dots f[a_5]+=f[a_1][a_2][a_3][a_4][a_5]$

初始化：
$f[0][0][0][0][0] = 1$

### [LCIS](https://www.acwing.com/problem/content/274/)

思路：

综合 `LCS` 和 `LIS` 可以得出：

状态表示：`f[i][j]` 表示 $A[1 \sim i]$ 和以 $B[j]$ 结尾的 `LCIS`

转移方程：
$if (A[i] = B[j]) f[i][j] = \max_{1\le k\le j - 1,B_k < A_k}{\{f[i - 1][k]\}}$
$if (A[i] \neq B[j]) f[i][j] = f[i - 1][j]$

考虑到每次进行决策时 `i - 1` 始终不改变，造成了很多重复比较。

那么可以维护一个 `val` 当 $f[i][j] \to f[i][j + 1]$ 更新 `val` 的值。

时间复杂度：$O(N^2)$

### [最大食物链计数](https://www.luogu.com.cn/problem/P4017)

`f[x]` 表示以 `x` 结尾的最大食物链条数。

```text
动态规划对状态空间的遍历构成一张有向无环图，遍历顺序就是该有向无环图的一个拓朴序。
```

那么对于这道题而言，食物网构成一张有向无环图，遍历也应该是一个拓朴序。

考虑在拓朴排序时，用当前节点 `x` 更新其子节点 `y`，即 `f[y] += f[x]`。

### [石子合并](https://www.luogu.com.cn/problem/P1880)

区间 $DP$

`f[i][j] = f[i][k] + f[k + 1][j] + sum[i][j]`

枚举时，应枚举 $i-j$，否则无法完成对状态空间的拓扑序遍历。

### [棋盘分割](https://www.luogu.com.cn/problem/P1436)

二维区间 $DP$。

$F(k, i, j, x, y)$ 表示左上角坐标为 $(i, j)$，右下角坐标为 $(x, y)$ 的方阵割了 $k$ 次后的最小平方和。

转移即可。
