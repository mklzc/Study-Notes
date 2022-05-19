# 图论总结

## 二分图

### 概念

- **二分图**
  - 二分图
  - 完全二分图

- **匹配**
  - 极大匹配
  - 最大匹配
  - 完美匹配
  - 准完美匹配

### 匈牙利算法

应用：

<details>
<summary><a href = "https://www.luogu.com.cn/problem/P3386">二分图的最大匹配</a></summary>

```cpp
vector<int> G[N];
bitset<N> vis;
int match[N], n, m, e, ans;
bool check(int u)
{
    for (auto v : G[u])
        if (!vis[v])
        {
            vis[v] = 1;
            if (!match[v] || check(match[v]))
                return match[v] = u, true;
        }
    return false;
}
int main()
{
    n = read(), m = read(), e = read();
    for (int i(1), u(read()), v(read()); i <= e; i++)
        G[u].push_back(v);
    for (int i(1); i <= n; i++, vis.reset())
        if (check(i)) ans++;
    printf("%d\n", ans);
    return 0;
}
```

</details>

<details>
<summary><a href = "https://www.luogu.com.cn/problem/P1640">连续攻击游戏</a></summary>

```cpp
vector<int> G[N];
bitset<N> vis;
int n, ans, match[N];
bool check(int x)
{
    for (auto y : G[x])
        if (!vis[y])
        {
            vis[y] = 1;
            if (!match[y] || check(match[y]))
                return match[y] = x, true;
        }
    return false;
}
int main()
{
    n = read();
    for (int i(1), u(read()), v(read()); i <= n; i++)
        G[u].push_back(i), G[v].push_back(i);
    for (int i(1); i <= 10000; i++, vis.reset())
        if (check(i)) ans++;
        else break;
    printf("%d\n", ans);
    return 0;
}
```

</details>

## ST表
