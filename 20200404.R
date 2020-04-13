# 3.2벡터와 연산자
# (1) 벡터
score <- 70
score

score <- c(70,85,90)
score
print(score)

score[4] <- 100
score[3] <- 95
score

name <- c("알라딘","자스민","지니")
name

x <- seq(1, 10, by=3)
x
x <- 1:10
x
x <- 10:1
x
x <- seq(1, 10, length.out=5)
x

x <- c(1,2,3)
y <- rep(x, times=2)
y

y <- rep(x, each=2)
y
터
# (2) 연산자
# 산술연산
2^3

x <- c(10, 20, 30, 40)
y <- c(2, 4, 6, 8)
z <- c(2, 4)

x+5
x+y
x+z

# 비교연산자
3 < 10

x <- c(10, 20, 30)
x <= 10

x[x>15]

x <- c(10, 20, 30)
any(x <= 10)

all(x <= 10)

# 논리연산자
x <- c(TRUE, TRUE, FALSE, FALSE)
y <- c(TRUE, FALSE, TRUE, FALSE)
x&y
x|y
xor(x,y) # 둘중에 하나만 TRUE인 경우에만 TRUE

#(3) 결측치와 널
x <- NULL
is.null(x)

y <- c(1,2,3,NA, 5)
y

z <- 10/0
z

u <- 0/0
u

gender <- c("남","여","남")
gender

gender.factor<- factor(gender)
gender.factor

x <- c(70, 80, 95)
arr <- array(x)
arr

x <- list("알라딘", 20, c(70,80))
x

x[1]
x[[1]]

x <- list(성명="알라딘", 나이=20, 성적=c(70,80))
x

x[1]

x[[1]]

df <- data.frame(성명=c("알라딘",""))