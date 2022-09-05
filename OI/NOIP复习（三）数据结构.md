# NOIP复习（三）数据结构

## 线段树

例题 $1.1$：[你能回答这些问题吗 - AcWing](https://www.acwing.com/problem/content/description/246/)

维护 `dat, lx, rx, sum` 数组分别保存区间最大子段和，区间左侧最大子段和，区间右侧最大子段和，区间和。

向上 $pushup$ 时转移即可。

例题 $1.2$：[旅馆 - AcWing](https://www.acwing.com/problem/content/263/)

类似于最大子段和，也可以使用上题方法维护。

维护区间以左端为起点的最长空段的长度，以右端为起点的最长空段的长度。最后用上二者更新区间最长空段。

查询时，每次先进入左端区间即可。

例题 $1.3$ ：[区间方差 - 洛谷](https://www.luogu.com.cn/problem/P5142)

这道题思路比较简单，就是将所求式子化简开来，转变成维护区间和与区间平方和即可。

[评测记录 - 洛谷](https://www.luogu.com.cn/record/77020948)

例题 $1.4$：[[TJOI2018]数学计算 - 洛谷](https://www.luogu.com.cn/problem/P4588)

基于操作建立线段树维护乘积，根节点保存答案。

[评测记录 - 洛谷](https://www.luogu.com.cn/record/85616957)

例题 $1.5$：校内模拟
