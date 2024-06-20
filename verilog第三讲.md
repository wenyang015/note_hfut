# 第四章运算符、赋值语句、结构说明
## 运算符：
### verilog中的操作数的大小(size)和符号
    module sign_size;
      reg[3:0]a, b;
      reg[15:0]c;
      initial
        begin
          a = -1; // a是无符号数，因此值是1111
          b = 8; // b = 1000
          c = 8; // c = 1000
        #10 b = b + a; // 结果是10111截断，n = 0111
        #10 c = c + a; // 结果是10111
      end
    endmodule
- verilog根据表达式中的变量的长度对表达式的值自动地进行调整
- verilog自动截断或者扩展赋值语句中右边的值以适应左边变量的长度
- 当一个负值赋给无符号变量时,比如reg时，verilog自动完成二进制补码的操作运算
### 逻辑运算符：
- ! not 非
- && and 与
- || or 或
- 逻辑操作符的结果为一位1, 0, 或x
- 逻辑操作符支队逻辑值运算
- 如操作数为全0，择期逻辑值为false
- 如果操作数有一位是1，则其逻辑值为false
- 如操作数有一位是1，则其逻辑值为true
- 若操作数只包含0,x,z，则其逻辑值为x
#### example 
    module logical();
      parameter five = 5;
      reg ans;
      reg[3:0] rega, regb, regc;
    initial
      begin
        rega = 4'b0011; // 逻辑值为1
        regb = 4'b10xz; // 逻辑值为1
        regc = 4'b0z0x; // 逻辑值为x
      end
    initial fork
      #10 ans = rega && 0; // ans = 0
      #20 ans = rega || 0; // ans = 1
      #30 ans = rega && five; // ans = 1
      #40 ans = rega && regb; // ans = 1
      #50 ans = regc || 0; // ans = x
      #60 $finish
    join
    endmodule
### 相等操作符：
 - = 赋值操作符
 - == 逻辑等
 - === case等（严格相等）只能用于行为级描述，不能用于RTL描述
-     a = 2'b1x;
      b = 2'b1x;
      if (a == b) 
        $display("a is equal to b");
      else
        $display("a is not equal to b");
      #################################
      a = 2'b1x;
      b = 2'b1x;
      if(a === b)
        $display("a is identical to b");
      else
        $display("a is not identical to b");
- 逻辑等 ==
- 逻辑不等 !=
#### example
    module equalities1();
      reg[3:0]rega, regb, regc;
      reg val;
      initial begin
        rega = 4'b0011;
        regb = 4'b1010;
        regc = 4'b1x10;
      end
      initial fork
        #10 val = rega == regb; //val = 0;
        #20 val = rega != regb; // val = 1;
        #30 val = regb != regc; // val = x
        #40 val = regc == reg c;// val = x
        #50 $finish;
        join
    endmodule
### 关系运算符：
- 大于 >
- 小于 <
- 大于等于 >=
- 小于等于 <=
#### example 
    module realtionals();
      reg[3:0] rega, regb, regc;
      reg val;
      initial begin
        rega = 4'b0011;
        regb = 4'b1010;
        regc = 4'b0x10;
      end
      initial fork
        #10 val = regc > rega; // val = x
        #20 val = regb < rega; // val = 0
        #30 val = regb >= rega; // val = 1
        #40 val =  regb > regc; // val = 1
        #50 $finish
    join
    endmodule
### 算术运算符
- 加、减、乘、除、取模运算符共五种
- 将负数赋给reg类型变量或者其他无符号的变量时，使用二进制补码进行表示
- 如果操作数的某一位是x或者z，则结果时x
- 在整数除法时，余数会被舍去
- 模运算中使用第一个操作的符号
- 如果结果与操作数等位宽，进位位会被丢弃
#### example
     module atrthors();
        parameter five = 5;
        integer ans, int;
        reg[3:0] rega, regb;
        reg[3:0] num;
        inital begin
          rega = 3;
          regb = 4'b1010;
          int = -3; // int = 1111
          end
        initial fork
        #10 ans = five * int; // ans = -15
        #20 ans = (int + 5) / 2; // ans = 1
        #30 ans = five / int; // ans = -1
        #40 num = rega + regb; // num = 1101
        #50 num = rega + 1; // num = 0100
        #60 num = int; // num = 1101
        #70 num = regb % rega; // num = 1
        #80 $finish
        join
        endmodul
### 按位操作符
- not ~
- and &
- or |
- xor ^
- xnot ~nor
- xnor ^nor
#### 按位操作操作符对矢量中相对应位操作
- regb = 4'b1010;
- regc = 4'b1x10
- num = regb & regc
     module bitwise();
       reg[3:0] rega, regb, regc;
       reg[3:0] num;
       initial begin
         rega = 4'b1001;
         regb = 4'b1010;
         regc = 4'b11x0;
      initial fork
        #10 num = reg & 0; // a =0
        #20 num = rega & regb; // 1000
        #30 num = rega | regb; // 1011
        #40 num = regb & regc; // 10x0
        #50 num = regb | regc; // 1110
        #60 $finish;
        join
      endmodule
### 移位操作符：
#### 逻辑右移 >>
#### 逻辑左移 <<
#### 移位操作符对其左边的操作数进行向左或向右的位移位操作
#### 第二个操作数(移位位数)是无符号数
#### 若第二个操作数是x或z则结果时x
#### example
    module shift();
      reg[9:0] num, num1;
      reg[7:0] rega, regb;
    initial rega = 8'b00001100;
    initial fork // 左移先补后移，右移先移后补
      #10 num <= rega << 5; // 01_1000_0000
      #10 regb <= rega << 5; // 1000_0000 
      #20 num <= rega >> 3; // 00_0000_0001
      #20 regb <= rega >> 3; // 0000_0001
      #30 num <= 10'11_1111_0000;
      #40 rega <= num << 2; // 1100_0000
      #40 num1 <= num << 2; // 11_1100_0000
      #50 rega <= num >> 2; // 1111_1100
      #50 num1 <= num >> 2; // 00_1111_1100
      #60 $finish;
      join
    endmodule
#### 在赋值语句中，如果右边RHS的结果位宽大于左边，则把最高位截去，位宽小于左边，则用零来拓展
### 条件操作符
#### 
     ?:
     module likebufif(in, en, out);
     input in, en;
     output out;
     assign out = (en == 1) ? in: 'bz;
     endmodule
     module like4to1(a, b, c, d, sel, out);
      input a, b, c, d;
      input [1:0] sel;
      output out;
      assign out = sel == 2'b00?a:
                   sel == 2'b01?b:
                   sel == 2'b10?c:d;
      endmodule
#### 如果条件值为x或z,则结果可能为x或z
#### 条件操作符的语法为：
     <LHS> = <condition> ? <true_expression> : <false_expression>
     // if condition is true, then LHS = true_expression,else LHS = false_expression
     for example:
     assign out = (sel == 0) ? a : b; 
#### 级联操作符：
- {}级联
- 可以从不同的矢量中选择位并用它们组成一个新的矢量
- 用于位的重组和矢量构造
- 在级联和复制时，必须指定位数，否则将产生错误
#### example
     module concatenation;
       reg[7:0] rega, regb, regc, regd;
       reg[7:0] new;
      inital begin
        rega = 8'b0000_0011;
        regb = 8'b0000_0100;
        regc = 8'b0001_1000;
        regd = 8'b1110_0000;
      end
      initial fork
      # 10 new = {regc[4:3], regd[7:5], regb[2], rega[1:0]}; // new = 8'b1111_1111
      #20 $finish
      join
    endmodule
#### 复制 {{}}
- 复制一个变量在{}中的值
- 前两个{符号之间的正整数指定复制的次数    
##### example
    module replicate();
      reg[3:0] rega; 
      reg[7:0] regb, regc
      reg[7:0] bus;
    initial begin
      rega = 4'1001;
      regb = 2'b11;
      regc = 2'b00;
    end
    initial fork
      #10 bus <= {4{regb}}; // bus = 1111_1111
      #20 bus <= {{2{regb}}, {2{regc}}};
      #30 bus <= {{4{rega[1]}}, rega};
      #40 $finish
      join
    endmodule
#### 缩减运算符&
- 缩减运算符：&
- a = 4'b1011 ,那么&a = (a[0] & a[1]) & a[2] & a[3]
## 赋值语句
- 语法：
  - LHS = RHS;（阻塞赋值） or LHS <= RHS;（非阻塞赋值）
### 过程赋值：
- 在always或者initial块中出现
- 执行与周围其他语句有关
- 驱动寄存器
- 使用"="或者"<="赋值符号
- 没有assign关键字
-     module Procedural;
      reg A, B, C;
      always@(B) begin
        Z = A;
        A = B;
      end
      endmodule
### 连续赋值
- 在模块中出现
- 与其他语句并行执行；在右端操作数发生变化时执行
- 驱动线网
- 使用"="赋值符号
- 有assign关键字
-     module Continuous;
        wire A, B, Z;
        assign Z = A;
        assign A = B;
      endmodule
      #####################
-     assign out = sel == 2'b00 ? a:
                   sel == 2'b01 ? b:
                   sel == 2'b10 ? c : d;
#### 连续赋值语句
- 功能：模拟组和逻辑功能
- 线网申明时执行连续赋值
- 或使用关键字assign
-     wire adder_out = mul_out + out;
      // 隐式连续复制
      // 相当于
      wire adder_out;
      assign adder_out = mul_out + out;
- 主要特征：
  - left-hand-side(LHS)必须是线网型
  - 语句时钟有效，RHS中的任意操作数发生变化，表达式被执行，LHS值会立即发生变化
  - RHS可以是线网型、寄存器型、或者函数
  - 可以使用门器件进行延迟
- 赋值延时
  - 连续赋值延时行为：
  -     assign #5 a = b;
        // 变量'b'发生变化后的第五个时间单位，输入'b'被采样赋值给'a'
### 过程赋值：
- 块语句用来将过个语句组织在一起，使得它们在语法上如同宇哥语句，分为两类：
- initial类：用于仿真中初始化行为状态
- always类：使用行为描述电路功能
- 每一个inital和always块分别表示一个独立的进程
- 进程间是并行执行，且仿真启动在0时刻
- 进程内的语句次序执行
- always和initial块不支持嵌套
#### 过程赋值
- 在过程块中的赋值成为过程赋值
- 在过程赋值语句中的表达式左侧的信号必须是寄存器类型(如reg类型)
- 在过程赋值语句中等式右侧的信号可以是任何有效的表达式，数据类型也没有限制
- 如果一个信号没有声明则缺省为wire类型。使用过程赋值语句中给wire类型赋值就会产生错误
-     module adder(out, a, b, cin);
        input a, b, cin;
        output [1:0] out;
        wire a, b, cin;
        reg half_sum;
        reg half_carry;
        reg [1:0] out;
      always @(a or b or cin)
      begin
        half_sum = a ^ b ^ cin;
        half_carry = a & b | a & !b & cin | !a & b & cin;
        out = {half_carry, half_sum};
      end
      endmodule
### 阻塞赋值与非阻塞赋值
- 阻塞赋值
- 阻塞赋值符号 =
-     initial begin
        #5 a = b;
        #10 c = d;
      end
      // 阻塞赋值执行完成后再执行顺序块内的下一条语句
- 非阻塞过程赋值
- 非阻塞赋值符号 <=
-     initial begin
        #5 a <= b;
        #10 c <= d;
      end
      // 非阻塞赋值不阻塞过程流，仿真器读入一条赋值语句并对它进行调度之后，就可以处理下一条赋值语句
- 如果过程块中的所有语句都是非阻塞的，复制按照一下两条语句进行执行：
  - 仿真器计算所有RHS表达式的值，保存结果，并进行调度在时序控制指定时间的赋值
  - 在进过相应的延迟之后，仿真器通过将保存的值赋给LHS表达式完成赋值
- 阻塞赋值
  -     initial begin
          a = b;
          c = d;
          e = f;
        end
  - 计算RHS表达式的值
  - 按照代码次序调度赋值的顺序
  - 阻塞后续操作，直至当前赋值结束
- 非阻塞赋值
-     inital begin
        a <= b;
      end
- 计算RHS表达式的值
- 安排赋值操作在队列底部
- 持续操作
- 当前时刻结束前执行赋值操作
## 结构说明语句
### initial块
- 由行为描述语句组成
- 如inital块内行为描述语句数量超过一条，则将其置于关键词beign和end之间
- 多个initial块，所有块同时在时刻0启动
  - 综合不支持
- inital块用于初始化、监视、波形等在仿真中仅仅执行一次的进程
  - 任意initial块启动于时刻0，并且在仿真中运行一次
  - initial块内行为描述语句顺序执行
-     module system;
      reg a, b, c, d;
      // initial内只有一条语句，就不需要begin end
      initial
        a = 1'b0;
      // initial 内有多条语句，就需要加上begin end
      initial begin
        b = 1'b1;
        #5 c = 1'b0;
        #10 d = 1'b0;
      end
      initial
      #20 $finish
      endmodule
### always块
- 由行为描述语句组成
- 块内行为描述语句数量超过一条则将其置于关键字begin 和end 之间
- 多个always独立并行工作
- 构造一个进程模拟一个数字电路持续工作
  - 块启动于时刻0，持续循环工作；
  - 块内行为描述语句顺序执行
  - LHS必须是reg型，可以是矢量或者标量
  - RHS可以是任意形式的表达形式
-     module clock_gen(clk);
      output clk;
      reg clk;
      parameter period = 50, duty_cycle = 50;
      initial
        clk = 1'b0;
      always
        #(duty_cycle*period/100) clk = ~clk;
      initial
      # 100 $finish
      endmodule     
### 敏感列表
- 敏感列表(Sensitivity List)
-     always @(sensitivity_list)
        begin
          ……
        end
- 当且仅当敏感列表中的任意信号发生变化后就会立即被执行
### 两类过程建模
- 组合逻辑的过程建模
  - 敏感列表为组合逻辑的所有输入信号
  - 如always @(a or b or sel)
- 时序逻辑的过程建模
  - 敏感列表为时钟或存储原件的控制信号
  - always @(posedge clk or negedge clr)
- 过程赋值
  - verilog定义2种块语句执行方式
    - 顺序块(sequential block):语句置于关键字begin和end之间，块中的语句以顺序进行执行
    - 并行块(Concurrent block):关键字fork和join之间的是并行块语句，块中的语句并行执行
  - 四种语句执行方式
    -     always @(sensitivity_list)
           begin 
           ……
           end
    -      always @(sensitivity_list)
           fork
           ……
           join
    -      initial
           begin
           ……
           end
    -      initial
           fork
           ……
           join
### 过程赋值
- 在顺序块中，语句一条一条的计算执行
- 在并行块中，所有语句在各自的延迟后立即计算执行
-     begin // 顺序执行
        a = 0;
        b = 1;
        #2 b = 0;
        #4 b = 1;
        #4 a = 1;
        #2 a = 0;
      end
-     fork // 并行执行
        a = 0;
        b = 1;
        #4 a = 1;
        #2 b = 0;
        #4 b = 1;
        #6 a = 0;
      join
### 延迟赋值
- 并行语句在同一时间步发生，但由仿真器在另一个时间执行
-     begin 
        a = #5 b;
        b = #5 a;
        #10 $display(a, b);
      end
-     fork  // a和b安全交换
        a = #5 b;
        b = #5 a;
        #10 $display(a, b);
      join
### 过程时序控制
- 简单延时(#delay):延迟指定时间步后执行
- 边沿敏感的时序控制:@(<signal>)
- 电平敏感的时序控制:wait(<expr>)
#### 简单延时：
- 在testbench中使用简单延时(#延时)施加激励，或者在行为模型中模拟实际延时
-     'timescale 10ns/1ns // 告诉仿真器默认时间单位是10ns，并且最小可以分辨的时间单位(时间精度)是1ns
       module muxtwo(out, a, b, sel);
         input a, b, c;
         output out;
         reg out;
         always @(a or b or sel)
           if (!sel) #10 out = a;
           else #12 out = b;
        endmodule
##### 在简单延时中可以使用模块参数
    module clock_gen(clk);
      output clk;
      reg clk;
      parmeter cycle = 20;
      initial clk = 0;
      always #(cycle/2)
        clk = ~clk;
    endmodule
##### 连续赋值延迟行为
-     assign #5 a = b;// 变量b发生变化后的第五个时间单位，输入b被采样并赋值给a
##### 过程块内阻塞语句中使用简单延迟
-     initial
        begin
        #1 a = b;
        end //计算RHS的延迟量，计算RHS表达式的值，调度复制，阻塞后续操作直至当前赋值结束 
      ###########
      initial 
        begin
         #1 a = b;
         #1 c = d;
         #1 e = f;
        end
##### 过程块内非阻塞语句中使用简单延迟
    initial
      begin 
        #1 a <=b;
      end
##### 过程块中阻塞语句使用块内延迟
    initial
      begin
       a = #1 b;
      end
      // 先计算右侧表达式的值，在通过调度复制到RHS延迟值的队列顶端，阻塞后续操作直至当前赋值操作，结构释放
##### 过程块中非阻塞语句中使用块内延迟
    initial
      begin
        a <=#1 b;
      end
      // 计算右侧表达式的值，通过调度复制到RHS延迟值的队列底端，在通过调度复制，在指定时刻结束前完成复制操作
##### 过程快中的非阻塞赋值语句中使用块内延迟
    initial
      begin
        a <= #1 b;
        b <= #1 c;
        e <= #1 f;
      end
### 边沿敏感时序：
- 边沿敏感的时序控制:@(<signal>)
  - 在信号发生翻转后执行
  - 可以说明信号有效沿是上升沿(posedge)还是下降沿(negedge)
  - 可以用关键字or 指定多个参数
- 时序控制@可以用在RTL级或者行为级组合逻辑或者时序逻辑描述中
-     module reg_adder(out, a, b, clk);
        input clk;
        input[2:0] a, b;
        output[3:0] out;
        reg[3:0] out;
        reg[3:0] sum;
        always @(a or b) // 若a或者b发生变化，执行
          #5 sum = a + b;
        always @(negedge clk)
          out = sum;
      endmodule
### wait语句
- 电平敏感的时序控制:wait(<expr>)
  - 直至expr值为真时(非零)才执行
  - 若expr已经为真就立即执行
- wait用于行为级代码中电平敏感的时序控制
-     module latch_adder(out, a, b, enable);
      input enable
      input [2:0] a, b;
      output [3:0] out;
      reg [3:0] out;
      always @(a or b)
      begin
        wait(!enable) // 当enable为低电平时就执行加法操作
        out = a + b;
      end
      endmodule  
### 阻塞与非阻塞：
- 在时序块RTL代码中使用非阻塞赋值
- 非阻塞赋值保存值直到时间片段的结束，从而避免仿真时的竞争情况与结果的不确定性
- 在组合的RTL代码中使用阻塞赋值
- 阻塞赋值立即执行：
- 阻塞赋值会立即执行
- 非阻塞赋值会并行执行,因此临时变量不可避免地在一个周期中被赋值，在下一个周期中被采样。
-     module bloc(clk, a, b)
      input a, clk;
      output b;
      reg y;
      reg b;
      always @(posedge clk)
      begin 
        y = a;// 阻塞赋值，此描述将被综合为一个D flip-flop
        b = y;
      end
      endmodule
-     module nonbloc(clk, a, b);
      input clk, a;
      output b;
      reg y;
      reg b;
      always @(posedge clk)
      begin
        y <= a; // 非阻塞赋值
        b <= y; // 此描述将会被综合为两个D flip-flop
      end
      endmodule
- 为时序逻辑建模使用非阻塞赋值
- 当为锁存器建模时，使用非阻塞赋值
- 当用always块为组合逻辑建模时，使用阻塞赋值
- 当在同一个always块里面既为组合逻辑又是时序逻辑建模，使用非阻塞赋值
- 不要在同一个always块中混合使用阻塞赋值和非阻塞赋值
- 不要在两个或两个以上always块中对一个变量进行赋值
- 使用$strobe以显示被“非阻塞赋值”的值
- 不要使用#0 延迟的赋值 
#### 用always块建立时序逻辑模型时，使用非阻塞赋值
    module pipeb1(q3, d, clk);
    output [7:0] q3;
    input [7:0] d;
    input clk;
    reg[7:0] q3, q2, q1;
    always @(posedge clk)
    begin
    q1 <= d;
    q2 <= q1;
    q3 <= q2;
    end
    endmodule// 流水线寄存器
#### 用always块建立组合逻辑模型时，用阻塞赋值
     module ao4(y, a, b, c, d);
     output y;
     input a, b, c, d;
     reg y, temp1, temp2;
     always @(a or b or c or d)
     begin
       temp1 = a & b;
       temp2 = c & d;
       y = temp1 | temp2;
     end
     endmodule
#### 在同一个always块中建立时序和组合逻辑电路时，采用非阻塞赋值
      module nbex2(q, a, b, clk, rst_n);
      output q;
      input clk, rst_n;
      reg q;
      always @(posedge clk or negedge rst_n)
      if (!res_n) q <= 1'b0;
      else q <= a^b;
      endmodule
-     module nbex2(q, a, b, clk, rst_n);
      output q;
      input clk, rst_n;
      input a, b;
      reg q, y;
      always @(a or b)
      y = a^b;
      always @(posedge clk or negedge rst_n)
      if (!rst_n) q <= 1'b0;
      else q <= y;
      endmoduel
#### 同一个always块中，不要既用非阻塞也用阻塞进行赋值操作
#### 不要在一个以上的always块中为同一个变量赋值
#### 使用$strob系统任务来显示用非阻塞赋值的变量值
     module display_cmds;
     reg a;
     initial $monitor("\$monitor:a = %b", a);
     initial begin
     $strobe("\$strobe:a = %b", a);
     a = 0;
     a <= 1;
     $display("\$display:a = %b", a);
     #1 finish
     end
     endmodule
#### 阻塞与非阻塞
    module non_block1;
       reg a, b, c;
      initial begin
       a = #10 1;
       b = #2 0;
       c = #4 1;
      end
      initial begin
       d <= #10 1;
       e <= #2 0;
       f <= #4 1;
      end
      initial begin
        $monitor($time, "a = %b, b = %b, d = %b,e = %b, f = %b",a, b, c, d, e, f);
        #100 $finish
      end

#### 
    moduel exchange;
      reg[3:0] a, b;
      initial begin
        a = 1;
        b = 4;
      #2 a =3;b = 2;
      #20 $finish
      end
    initial
    $monitor($time,"\t%h\t%h", a, b);
      initial begin
        #5 b <= a;// 中间变化会影响后面的赋值
        #5 a <= b;
        // b <= #5 a; // 中间变化不会影响b的值
      end
    endmodule
## 代码设计分析
### 01
    module blockingassignment(clk, q1, q2);
    input clk;
    output[2:0] q1, q2;
    reg[2:0] q1, q2;
    always @(posedge clk)
    begin
    q1 = q1 + 3'b1;
    q2 = q1;
    end
    endmodule// 每个时钟上升沿触发时，变量q2，q1的值是同步的，q2被赋予了q1更新后的值       
### 02
    module nonblockingassignment(clk, q1, q2);
      input clk;
      output[2:0] q1, q2;
      reg[2:0] q1, q2;
      always @(posedge clk)
      begin
      q1 <= q1 + 3'b1;
      q2 <= q1;
      end
      endmodule
      // 每个上升沿触发时，q2被赋予的q1值是上一个时钟周期生成的值
#### 
    always@(posedge clk)
    begin
      a = a + 1;
      b = a - c;
    end
    always@(posedge clk)
    begin
      c = a;
    end
    endmodule
#### 
    always@(posedge clk)
    begin
      a <= a + 1;
      b <= a - c;
    end
    always @(posedge clk)
    begin
      c <= a;
    end
    endmodule
#### 数值交换操作
    module fsm(Q1, Q0, in, clock);
    output Q1, Q0;
    input clock, in;
    reg Q1, Q0;
    always @(posedge clock)
    begin
    Q0 <= in | Q1;
    Q1 <= in & Q0;
    end
    endmodule