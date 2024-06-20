# 状态机
## 时序电路
- 输出依赖于当前和前继输入序列
- 存储位默认为状态
## d触发器
### flip-flop：位存储器在时钟边沿执行存储操作
     // D flip-flop
     module dff(clk, d, q);
     input clk, d;
     output q;
     reg d;
     always @(posedge clk) // 上升沿触发，negedge clk 下降沿触发
       q = d;
    endmodule
### 同步/异步 复位/置位
- 受时钟控制的单一进程
- 三个独立进程- 仅一个受时钟控制
-     module dff(clk, q, d, s, r);
      input clk, d, s, r;
      output q;
      reg q;
      always @(posedge clk)// 同步
        if(r) q = 1'b0;
        else if(s) q = 1'b1;
        else q = d;
     endmodule
-     module dff(clk, s, r, d, q)
        input clk, s, r, d;
        output q;
        reg q;
        always @(posedge r)
          q = 1'b0;
        always @(posedge s)
          q = 1'b1;
        always @(posedge clk)
          q = d;
      endmodule
- 异步:
-     module dff(clk, r, s, d, q);
      input clk, r, s, d;
      output q;
      reg q;
      always @(posedge clk or posedge r or posedge s)
        if (r) q = 1'b0;
        else if (s) q = 1'b1;
        else q = d;
      endmodule
### 寄存器基础：
- 保存多位数据：存储一些四位二进制数
- 寄存器：一组共享时钟信号的D触发器
-     module d_ff(q, l, clk);
        input clk;
        input [3:0]q;
        output [3:0]1;
        reg [3:0] q;
        always @(posedge clk)
         begin
           a <= data;
         end
        endmodule
-     module Dff_RST(q, l, clk);
      input clk, rst;
      input [3:0];
      output [3:0] q;
      reg [3:0] q;
      always @(posedge clk or negedge ret) // 带复位端，低电平有效
        begin
         if(~rst) q<= 4'b0;
         else q<= data;
         end
      endmodule
### 时序(Timing)
- 时钟周期：相邻两个脉冲间时间间隔
- 时钟周期数：信号持续时间
- 时钟频率：1/周期
## 状态机定义与分类：
- 有限状态机：FSM
- 一种数字系统的控制部分的描述方法，任何有存储期间的电路都是一个有限状态机
- 状态机设计内容：
  - 定义状态、定义状态转移、状态优化或者最小化
- 人工仅能优化/最小化一个小型的状态机
- 有限状态机广泛应用于任何需要描述时序行为的场合：
  - 序列检测、Fancy计数器，数据流控制，设备接口
  - 计算机(一种大型复杂的FSM)
- FSM的结构组成：
  - 实现next state logic的组合逻辑&保持当前current值的寄存器
### 时序电路的描述方法：
- fsm
  - 时序电路行为描述方法
    - 类似组合逻辑中的布尔表达式
  - 状态列表和状态转移
    - 状态:OFF,On
    - 转移:Off->On,On->Off
### FSM包括：
- 状态集合
- 输入集合，输出集合
- 初始状态
- 状态转移集合
- 行为集合
### 时序逻辑分类
- 异步FSM
- 同步FSM：时钟边沿触发的状态改变
- 标准结构
  - 状态寄存器-存储当前状态
  - 组合逻辑-计算输出和下一个状态
### FSM分类：
#### Moore型FSM模型
- I:输入信号
- PS:FSM当前状态
- NS = f(PS,I)
- O = h(PS)
- PS = NS
#### Mealy型FSM模型
- I:输入信号
- PS:FSM当前信号
- NS = f(PS, I)
- O = h(PS)
- PS = NS
#### Mealy型和Moore型混合型FSM模型
### 状态机verilog建模
### FSM的设计流程
- 决定那些是需要被记录的
  - 存储元件记录的状态数量
- 对输入和输出信号进行编码
- 构造基于器件行为的状态转移图
  - 考虑状态数量最小化
- 选择寄存器数量
- 状态编码方式：
  - 顺序编码
  - Gray编码
  - One-hot编码
  - Johnson编码
  - 自定义方式
- 顺序编码、gray码使用最少的Flip-flop
- one-hot编码使用最多的flip-flop
- fsm的编码方式、各个具体的编码形式决定了fsm所需flip-flop数目以及fsm的输出逻辑，状态转移逻辑的复杂性
- 采用顺序编码、gray码、johnson编码,fsm的状态转换逻辑、输出逻辑比较复杂，逻辑延时技术比较多
- 采用one-hot编码，fsm的状态转移逻辑，输出逻辑比较简单，速度快，但是flip-flop的使用数量比较多
- 必要时，需要对fsm的状态数量加以划分
- fsm状态描述：
  - 直接使用整数编码进行描述
  - 利用parameter进行声明// 可读性比较好
  - 利用'define进行声明
- fsm状态转移图的设计要素
  - 抽象出电路有哪些状态
  - 说明fsm初启动时进入的状态
  - 状态转移的关系和条件
  - 排除fsm不可能进入的状态
  - 预防fsm进入死锁
- fsm设计描述的hdl编码风格
  - fsm的初始状态必须加以规定
  - fsm的状态转移由时序逻辑结构实现，下一状态NS计算由组合逻辑结构进行实现
  - 组合逻辑结构可以单独进行描述，也可以分开进行描述，但最好不要在时序块中进行描述，否则可能会产生多余的触发器
  - 在描述不同状态是，利用parameter将状态编码定义为有意义的符号名
  - 不能使用initial语句来规定fsm的初始状态
   -     always @(posedge clk or negedge reset)
          begin
           if (~clk) ps <= fsm_initial_state
           else ps <= ns;
         end
