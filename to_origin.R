library(tidyverse)

## 乱数を発生させてデータテーブルを作る
x = cumsum(rnorm(10, 2, 1))
y = cumsum(rnorm(10, 2, 10))
df <- tibble::tibble(x, y)

# 原点からの距離が最小となるx, y座標を返す関数
min_dist_xy <- function(x, y){
  dist <- sqrt(x**2 + y**2)
  min_dist_index <- which(dist == min(dist))
  return(c(x[min_dist_index], y[min_dist_index]))
}

mx <- min_dist_xy(x, y)[[1]]
my <- min_dist_xy(x, y)[[2]]

#　原点に並行移動
(df <- 
  df %>% 
  mutate(x_ori = x - mx, 
         y_ori =y - my
         )
)

# 元のxy座標
ggplot(df, aes(x, y)) + 
  geom_point()

# 原点に平行移動したことを確認
ggplot(df, aes(x_ori, y_ori)) + 
<<<<<<< HEAD
  geom_point() + 
  geom_smooth(method = "lm")
=======
  geom_point()
>>>>>>> dea80a3b896a2ef0a1d166f2c6b9f2e8bf1495d8
