# 二次元座標におけるRotate matrix
rotate <- function(theta){
  r = c(cos(theta), sin(theta), -sin(theta), cos(theta))
  R = matrix(r, 2, 2)
  R
  }

rotate_x <- function(theta, x, y){
  (rotate(theta) %*% c(x, y))[1, 1]
}

rotate_y <- function(theta, x, y){
  (rotate(theta) %*% c(x, y))[2, 1]
}


# rotate_x(pi/4, sqrt(2), 0)
# rotate_y(pi/2, sqrt(2), 0)


