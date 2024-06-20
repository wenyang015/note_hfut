# 条件语句、循环语句、块语句、生成语句
## 条件语句：
### 分支结构：
- if
- if - else
- case, casex,casez
#### if分支语句
- if 和 if-else语句
-      always #20
         if(index > 0)
          begin
           if(rega > regb) result = rega;  
            else result = 0;//结束第一层循环  
          end
         else
           if(index == 0)
             begin
               $display("Note:Index is zero");
               result = regb;
             end
           else
              $display("Note:Index is negative");
#### 条件语句(case语句)
- case(z/x)语句：一个多路条件语句
  - 测试表达式与另外一系列语句分支是否匹配
  - case语句进行逐位比较以求完全匹配(包括x和z)
  - default语句为可选项
    - 在没有任何条件成立时执行，如果未说明default语句，不执行任何动作
    - 多个default语句是非法的
    - 使用default语句时，特别是用于检测x和z
  - casez和casex为case语句的变体，允许比较无关(don't-care)值
    - case表达式或case项中的任何位为无关位时，再比较过程中该位不予考虑
    - casez语句中，?和z被当做无关值
    - casex语句中，?和z和x被当做无关值
#### case 语句
     case<表达式>
     <表达式><表达式>:赋值语句或者空语句;
     <表达式><表达式>:赋值语句或者空语句;
            default:赋值语句或者空语句;
- 控制表达式:通常表示为控制信号的某些位
- 分支表达式:(或者常量表达式)控制表达式的具体状态值来表示；
- 分支表达式的值：
  - 等于控制表达式的值，执行分支表达式后的值，结束这个case
  - 全部不匹配，执行default后面的语句
  - 多分支表达式值同时满足，执行最先满足表达式的分支项，然后跳出case语句，不在检测其余分支项目
- 所有表达式的值的位宽：
  - 必须相等，对应位的值能够明确进行比较;
  - 禁用'bx,'bz来代替n'bx,n'bz，缺省宽度是机器的字节宽度(通常是32位)
##### case举例
    'timescale 10ns/1ns
    module test_case;
    reg[1:0] select;
      initial
      begin
        select = 2'b01;
        case(selcet)
          2'b01:$display("second 2b01");// 执行最先满足表达式的分支项，然后跳出case语句，不在检测其余分支项目
          2'b01:$display("third 2b01");
          2'b01,
          2'b00: $display("2b00");
          2'b11: $display("2b11");
          default: $display("default");
        endcase
      end
    endmodule
##### case列举
    'timescale 10ns/1ns
    module exb5_1;
    reg[1:2] select;
    reg[3:0] result;
    always @(select)
    begin
      case(select[1:2])
        2'b00:result = 0;
        2'b01:result = 4'b0001;
        2'b0x,
        2'b0z:result = 4'b0x0z;
        2'b10:result = 4'b0010;
        2'bx0,
        2'bz0:result = 4'bx0z0;
        default:result = 4'bxxxx;
      endcase
    end
    initial begin
      select = 2'b00;
      #100
      select = 2'b01;
      #100
      select = 2'b00;
      #100
      select = 2'b0x;
      #100
      select = 2'b0z;
      #100
      select = 2'bx0;
      #100
      select = 2'b11;
    end
    endmodule
##### case语句
    modult compute(result, rega, regb, opcode);
    input [7:0] rega, regb;
    input [2:0] opcode;
    output [7:0] result;
    reg [7:0] result;
    always @(rega or regb or opcode)
      case (opcode)
        3'b000:result = rega + regb;
        3'b001:result = rega - regb;
        3'b010
        3'b100:result = rega/regb;
        default:begin
          result = 'bx;
          $display("no match");
        end
      endcase
    endmodule
### casex和casez语句
- case语句将表达式中或者候选表达式中的z作为无关值
- case语句将条件表达式或候选表达式中的x作为无关值
#### case分支全列举
#### case非常量分支
#### 综合指令parallel case/full case

## 循环语句
### 共有四种循环语句：
- repeat:将一块语句循环执行确定次数
  -     repeat(次数表达式) <语句>;
- while:在条件表达式为真时一直循环执行
  -     while(条件表达式) <语句>;
- forever:重复执行直至仿真结束
  -     forever<语句>;
- for:在执行过程中对变量进行计算和判断，在条件满足时执行
  -     for(赋初值;条件表达式;计算)<语句>
### repeat:将一块语句重复循环执行确定次数
     // parameterizable shift and add multipliter
    module multipliter(result, op_a, op_b);
      parameter size = 8; // 说明参数size 为8
      input [size:1] op_a, op_b;
      output [2*size:1] shift_opa, result;
      reg [size:1] shift_opb;
      always @(op_a, op_b)begin
        result = 0;
        shift_opa = op_a;
        shift_opb = op_b;
        repeat(size) begin
          #10 if (shift_opb[1]) result = result + shift_opa;
          shift_opa = shift_opa << 1;
          shift_opa = shift_opb >> 1;
        end
      end
    endmodule
### while:只要表达式为真(非零)，就重复执行一条语句(或语句块)
    ……
    reg[7:0] tempreg;
    reg[3:0] count;
    ……
      count = 0;
      while(tempreg) // 统计tempreg中的1的个数
      begin
        if(tempreg[0]) count = count + 1;
        tempreg = tempreg >> 1; // shiftright
      end
    end
### forever语句：一直执行到仿真结束
- forever应该是过程块中的最后一条语句，其后的语句将永远不会不会执行
- forever语句不可综合，通常用于testbench进行描述
-     ……
      reg clk;
      initial 
        begin
        clk = 0;
        forever
          begin
            #10 clk = 1;
            #10 clk = 0;
          end
        end
      ……
#### 这种行为描述可以非常灵活的描述时钟，可以控制时钟的开始时间以及周期占空比，仿真效率也高
    forever
      begin
        #10 clk = 1;
        #20 clk = 0;
      end
### for循环语句:只要条件一直为真，语句就一直执行
#### 条件表达式若是简单的与0比较通常处理的更快一些，但是综合工具不支持与0进行比较
    // X检测
    for(index = 0; index < size; index = index + 1)
      if(val[index] === 1'bx)
        $display("found a X");
    // 存储器初始化
    for(i = size; i !=0 ;i = i - 1)
      memory[i-1] = 0;
    // 阶乘序列
    factorial = 1;
    for(j = num; j != 0; j = j - 1)
      factorial = factorial * j;
    // 
    initial begin
      for(i = 0; i < 32; i = i + 1)
        bus[i] = addr[i];
      end
#### for循环应该是在begin  end之间
## 块语句
### 块语句是用来将多个语句组织在一起，使得它们在语法上如同一个语句
- 顺序块：语句置于关键字begin和end之间，块中的语句以顺序进行执行
- 并行块：关键字fork和join之间的是并行块语句，块中的语句是并行执行(fork- join语句常用于test bench语句中进行描述，这是因为可以一起给出矢量以及绝对时间，而不必描述所有先前事件的时间)
- 命名块
- 在关键字begin或者fork后面加上:<块名称>对块进行命名
-     module name_blk;
      ……
        begin:seq_blk
      ……
        fork:par_blk
      ……
        join
      ……
        endmodule
- 在命名块中可以声明局部变量
- 可以使用关键字disable禁止一个命名块
- 命名块定义了一个新的范围
- 命名块会降低仿真速度
##### 命名块禁用
- disable语句终结一个命名块或者任务的所有活动，也就是说，在一个命名块或者任务中的所有语句执行完之前就返回
- disable<块名称>
- 当命名块或任务被禁止时，所有因它们调度的事件将从事件队列中清除
- disable是典型的不可综合语句
       module do_arith(out, a, b, c, d, e, clk, en_mult);
         input clk, en_mult;
         input[7:0] a, b, c, d, e;
         output[15:0] out;
         reg[15:0] out;
         always @(posedge clk)
           begin:arith_block
             reg[3:0] tmp1, tmp2;
             …………
            end
          always@(negedge en_mult)begin // 终止计算
            disable arith_block;// 禁止命名块
          end
          // 定义任务和函数
            …………
          endmodule
### 生成块语句：生成语句动态地生成verilog代码，简化程序的编写
#### 关键字为：generate, endgenerate, genvar, localparam
#### 三种块生成方式:
- 循环生成：将一块语句生成确定次数
  -      gemvar <var>
         generate
         for(<var> = 0; <var> < <limit>; <var> = <var> + 1)
         begin:<label>
         <instantiation>
         end
         endgenerate
- 条件生成：条件表达式为真时生成确定块
  -     generate
        if(<condition>)begin:<label_1>
        <code>;end
        else if(<condition>)begin:<labe_2>
        <code>;end
        else begin:<label_3>
        <code>;end
        endgenerate
- case生成：条件表达式为真时生成确定块
  -       generate
          case(<constant_expression>)
          <value>:begin:<label_1>
          <code>
          end
          <value>:begin:<label_2>
          <code>
          end
          default:begin:<label_3>
          <code>
          end
          endcase
          endgenerate
### 重复代码书写：
      // 一个模块需要例化64次
      genvar i;
      generate
      for(i = 1; i < 65; i = i + 1)
        begin:64_point
        single_point U
           (……//input
           ……//output)
        end
        endmodule