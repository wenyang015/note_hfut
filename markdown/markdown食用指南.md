# markdown食用指南

# 一级标题 快捷键是ctrl + 1

## 二级标题  快捷键是ctrl + 2

### 三级标题 快捷键是 ctrl + 3

#### 四级标题快捷键是ctrl + 4

##### 五级标题快捷键是ctrl + 5

######  六级标题快捷键是ctrl + 6

零级标题快捷键是ctrl + 0

## 数学公式使用教程

### 数学公式是通过快捷键ctrl + shift + m生成代码公式块进而产生公式的

$$
f(t) = e^{at}
$$

#### 常见的公式的markdown源码形式

- 上标：^
  $$
  e^x
  $$

- 下标：_
  $$
  H_20
  $$

- 将多个两个字母连在一起进行输出:{}
  $$
  e^{xyz}
  $$

- markdown中的数学公式是支持Latex公式语法：

  - 分号:\frac{a}{b}->a/b的分式表达式

  $$
  \frac{2}{1}
  $$

  - 省略号:\cdots
    $$
    \cdots
    $$

  - 开根号:\sqrt{}
    $$
    \sqrt{4} = 2
    $$

  - 积分符号:一重积分\int^{a}_{b}{xdx}；二重积分\iint；三重积分\iiint
    $$
    \int^{4}_{3}{x}dx = 3.5
    $$

    $$
    \iint
    $$

    $$
    \iiint
    $$

    

  - 微分算符：\frac{\partial a}{\partial b}
    $$
    \frac{\partial x^2}{\partial y^2}
    $$

  - 向量算符：\vec{a}
    $$
    \vec{\alpha}
    $$

  - 求和算符：\sum_{下标}^{上标}{表达式}
    $$
    \sum_{k=1}^{n}\frac{1}{k^2}
    $$
    
  - 
  
  - 累乘符号：\prod_{下标}^{上标}{表达式}
    $$
    \prod_{n=1}^{n=k}n
    $$
  
  - 
  
  - 箭头符号：单尾箭头\leftarrow 双尾箭头\Leftarrow
    $$
    a\leftarrow{b}
    $$
  
    $$
    a\Rightarrow{b}
    $$
  
  - 常见的数学运算符号：
  
    - 小于，大于，不等于
      $$
      {a}\leq{b};{c}\geq{e};
      $$
  
    - 
  
    - 希腊字母\alpha,\beta,\delta,\gamma:
      $$
      \alpha;\beta;\delta;\gamma
      $$
  
    - 
  
    - 圆周率:\pi
      $$
      \pi
      $$
  
    - 无穷infty
      $$
      \infty
      $$
      
  
  - 注释:\text{}
    $$
    \text{helloworld}
    $$
  
  - 
  
  - 跟换颜色和字体:\color{颜色}{文字}
    $$
    \color{green}{whatever}
    $$
  
  - 
  
  - 公式块:
    $$
    f(n)= \begin{cases}
    n+2, & \text{if $n$ is even}\\
    3n+1, & \text{if $n$ is odd}
    \end{cases}
    $$
    
  
    
  
    

### 参考资料：[[markdown语法\]公式篇--整理总结了常用的公式语法全_markdown 语法 公式-CSDN博客](https://blog.csdn.net/m0_37769093/article/details/107732606)