# 模块的结构、数据类型、变量、编译控制
## 模块的结构
- 模块(module)
-     module module_name(port_list);
        port declarations;
        data type declarations;
        circuit functionality;
        timing specifications
      endmodule
- 注意要点：
  - 大小写敏感
  - 关键字小写
  - 空白增加可读性
  - 分号表示语句结束
  - 单行注释：//
  - 多行注释：/* */
  - 指定仿真时间参数
- port: input, output, inout
- data type:Net, Register, Parameter
- circuit: assing;intital block; always block
- subprogram: function, system task, complier directives
### 模块(module)的组成-端口：
- 端口列表：
  - 枚举全部端口名
  - module twomux(out, a, b, sel);
- 端口方向：
  - input:输入端口
  - output:输出端口
  - inout:双向端口
- 端口申明：
  - <port_type> <port_name>
  - for example:
  -     input [7:0] ina, inb;
        output     clk;
        inout      c;
- 模块(module)
  -     module twomux(out a, b, sel); // 端口列表相当于引脚(pin)
          input a, b, sel; // 输入端口声明
          outpue out; // 输出端口声明
          wire nsel, sela, selb;
          not u1(nsel, sel);
          and # 1 u2(sela, a, nsel);
          and # 1 u3(selb, b, sel);
          or # 2 u4(out, sela, selb);
        endmodule
- 模块名称为twomux，端口列表和说明
- 模块通过端口与外部进行通信
- 模块内部变量申明
- 模块功能描述采用例化或者行为级建模描述
#### 端口声明的两种方式：
- 方式一：在模块一开始之后进行声明
-     input [MSB - 1 : 0] iport1;
      input [MSB - 1 : 0] iport2;
      ……
      input [MSB - 1 : 0] iportn;
- 方式二：在模块一开始就进行声明
-     module module_name(input iport1, iport2, iportn,
                       output oport1, oport2, oportn
                       inout ioport1, ioport2, ioportn)
#### 模块的组成-数据类型
- 线网型：两个过程间存在的物理连接
  - 比如连个逻辑门之间的链接就是线网型
  -     如 wire nsel, sela, selb;
  -     reg [width - 1 : 0] var1;
        wire [width - 1 : 0] var2;
        wire [width - 1 : 0] varn;
- 寄存器型：暂存数据的变量
  - 未必是一个物理寄存器                
### 功能描述：
    not u1(nsel, sel);
    and #1 u2(sela, a, nsel);
    and #1 u3(selb, b, nsel);
    or #2 u4(out, sela, selb);
- 例化了一个反相器、一个或门和两个与门，给出了它们的输入输出关系或行为建模
-     or #2 u4(.out(out), .a(sela), .b(selb));// 这种方法有更好的可读性和可移植性
- 每一次例化都会形成一个对应物理存在的电路，端口引用产生物理存在的互连线的关系
- 引用和例化是实现层次化、控制单个文件的复杂度，TOP_DOWN设计的有效思路
#### 结构描述(实例元件)
    module twomux(a, b, sel, out);
      input a, b, sel;
      output out;
      wire nsel, sela, selb;
      not u1(nsel, sel);
      and #1 u2(sela, a, nsel);
      and #1 u3(selb, b, sel);
      or #2 u4(out, sela, selb);
    endmodule
#### 数据流描述
    module twomux(out, a, b, sel);
      input a, b, sel;
      output out;
      wire out;
      assign out = !sel ? a : b;
    endmodule
#### 过程块描述
    module twomux(out, a, b, sel);
      input a, b, sel;
      output out;
      reg out;
      always @(sel or a or b)
        if (!sel) out = a; // =是阻塞赋值
        else out = b;
    endmodule
#### 不同抽象层次的建模示例：mus的行为可以描述为信号a或b或sel发生变化后,mux代码就会被执行，如果sel为0则选择a输出，否则就选择b输出
##### 过程块描述
    module towmux(out, a, b, sel);
     input a, b, sel;
     output out;
     reg out;
     always @(sel or a or b)
       if (!sel) out  = a;
       else out = b;
    endmodule
#### 结构级verilog适合开发小规模的元件，如ASIC和FPGA单元
- verilog内部带有描述基本逻辑功能的基本单元(primitive),如and门
- 用户可以定义自己的基本单元UDP(User Defined Primitives)
- 综合的结果-网表通常是结构级的，用户可以用结构级描述glue逻辑
- mux结构级描述采用verilog基本单元门描述时，带有传输延时
#### 不同抽象层次建模的演化 -- 综合：
- 高抽象层次向着低抽象层转变过程
- 如过程块描述转化为结构化描述
## verilgo的命名约定、标识、数据类型以及常量类型和变量
    module MUX2_1(out, a, b, sel);
      // Port declarations端口声明，单行注释
      input a, b, sel; 
      output out;
      wire nsel, sela, selb;
      not u1(nsel, sel);
      and #1 u2(sela, a, nsel);
      and #1 u3(selb, b, sel);
      // 或者可以写成 and (sela, a, nsel),(selb, b, sel);
      or #2 u4(out, sela, selb);
    endmodule
## 标识符(identifiers)：
- 标识符是用户在描述时给verilog对象起的名字
- 标识符必须以字母(a-z)(A-Z)或者(_)开头，后面可以跟上数字、字母、($)或者(_)。
- 最长可以是1023字符
- 标识符区分大小写，sel 和 SEL是两个不同的标识符
- 模块名称、端口名称、实例名称都是标识符
## 数据类型：
- verilog HDL有19中数据类型
  - **wire**,**integer**,**reg**,large,medium,scalared,time,small,tri,trio,tril,**parameter**,triand,trior,vectored,wand,wor
- 常量:程序运行期间不能改变的量
  - 整形：integer
  - 实型：real
  - 字符型：character
- 变量：程序运行期间值能改变的量
  - 物理变量：
    - 线网变量：net type
    - 寄存器变量：register type
  - 抽象变量：inerger real time realtime
### verilog采用的四值逻辑系统：
- 0：表示低电平，通常对应电路中的gnd或者逻辑假
- 1：表示高电平，通常对应电路中的vcc或者逻辑真
- X：表示信号的值不能确定，可能是由于信号冲突，未初始化，或者仿真过程的延迟导致的不确定性
- Z：表示信号处于高阻抗状态，不驱动任何负载，通常出现在三态门或者总线仲裁逻辑中
### 整形常量和实数常量
- verilog中常量可以是整数也可以是实数，整数的大小可以定义也可以不定义
-     <size>' <base><value>
- size:大小，有十进制数来进行表示的位数(bit)表示。缺省为32位
- base:数基，可为2(b),8(o),10(d),16(h)进制，缺省为10进制
- value:是所选数基内任意有效数字，包括X,Z
- 实数常量可以用十进制或者科学技术表示法来进行表示
#### 举例：
    12 // 十进制，32位
    'H83a // 十六进制， 32位
    64'hff01 // 十六进制，64位
    9'O17 // 八进制，9位
    32'bz01x // 二进制，32位
    3'b1010_1101 // 二进制，三位，虽然看起来是是八位，但是等价于 3'b101
    6.3 // 实数常量
    32e-4 // 科学计数法中的实数常量
    4.1E3 // 科学计数法
    8'b_0011_1010 // 格式化,二进制，八位      
    
### 整数常量和实数常量
- 整数的大小可以定义也可以不定义，整数表示为：
  - 数字中(_)忽略，便于查看
  - 没有定义大小(size)整数缺省为32位
  - 缺省数基为十进制
  - 数基(base)和数字(16进制)中的字母无大小写之分
  - 当数值value大于指定的大小时，**截去高位**，如2'b1101表示的是2'b01
- 实数常量
  - 实数可用科学计数法或者十进制表示
  - 科学计数法表示方法：
  -     <尾数><e或E><指数>，表示：尾数 * 10^指数
### verilog主要有三类(class)数据类型
- net(线网)：表示器件之间的物理连接
- register(寄存器)：表示抽象存储元件
- parameters(参数)：运行时的参数(run-time constants)
#### net(线网)
- net 需要被持续的驱动，驱动它的可以是门或者模块
- 当net驱动器的值发生变化事，verilog自动的将新的值传给net上，线网out由or门驱动，当or门的输入信号置位时将传输到线网net上
- 有多种net类型用于设计建模和工艺建模
  - wire,tri:标准内部连接线(缺省是默认)
  - supply1,supply0:电源和地
  - wor,trior:多驱动源线或
  - wand,triand:多驱动源线与
  - trireg:能保存电荷的net
  - tri1,tri0:无驱动时上拉/下拉
  - **没有声明的net的缺省类型就是一位标量wire类型，但是这个缺省类型可以由以下的编译指导改变：
  -     'default_nettype <nettype>
- 过程块中的寄存器类型：
  - 若同步块中使用一个reg,则：
    - 如果在一个时钟周期中赋值并在另一个周期中被采样，则只能以硬件寄存器来进行实现
    - 如果reg还是一个基本输出，它还会出现在综合网表中，但不一定是一个硬件寄存器
    - 若两者都不是，该信号就有可能被优化掉
  - 若组合块中使用一个reg,则：
    - 如果reg值随着块的任何一个输入的变化而变化，则在综合时不会产生硬件寄存器
    - 如果reg值并不总是随着块的输入变化而变化，则在综合时会产生一个锁存器
- 寄存器类（register）
- 寄存器类型在被赋给新的值之前会保持原来的值
- 寄存器类型大量应用于**行为模型描述**以及**激励描述**
- 用行为描述结构给寄存器类型赋值，给reg类型赋值是在过程块中
- 寄存器中的常见的四种类型：
  - reg:可定义的无符号整数变量，可以是标量(1位)或者矢量，是最常用的寄存器类型
  - integer:32位有符号整数变量，算数操作产生二进制补码形式的结果，通常用作不会由硬件实现的数据处理
  - real 双精度的带符号浮点变量，用于仿真时间的保存和处理
  - realtime 与real的内容一致，但可以用作实数仿真时间的保存与处理
#### verilog中的net和register声明变量：
- net声明：
  - <net_type>[range][delay]<net_name>[,net_name];
  - <net_type>:net类型
  - range:矢量范围，以[MSB:LSB]格式
  - delay:定义与net相关的延时
  - net_name:net名称，一次可以定义多个net,用逗号来隔开
- 寄存器声明：
  - <reg_type>[range]<reg_name>[,reg_name]
  - reg_type:寄存器类型
  - range:矢量范围 以[MSB:LSB]格式，只对reg类型有效
  - reg_name:寄存器名称，一次可以定义多个寄存器，用逗号隔开
- 举例
-     reg a; // 一个标量寄存器
-     wand w; // 一个标量类型net
-     reg[3:0] v; // 从MSB到LSB的四位寄存器向量
-     reg[7:0] m, n; // 两个8位的寄存器标量
-     tri[15:0] busa; // 16位三态总线
-     wire[0:31] w1, w1; // 两个32位wire,MSB为bit0
### 输入端口可以由net/register驱动，但是输入端口只能是net
### 输出端口可以是net/register类型，但是输出端口只能驱动net
### 双向端口inout只能是net类型
    module top;
    wire y;
    reg a, b;
        DUT u1(y, a, b); // 输入端口可以由net/register驱动
        initial begin
            a = 0;
            b = 0; // 过程快中只能给register类型赋值
            # 5 a = 1;
        end
    endmodule
    ##################
    module DUT(Y, A, B);
    output Y;
    input A, B;
    wire A, B; // 输入端口的变量类型必须是net类型
        and(Y, A, B);
    endmodule
### 选择数据类型要注意的问题：
- 信号类型确定方法：
  - 信号可以分为端口信号和内部信号，出现在端口列表中的信号是端口信号，其他的信号为内部信号
  - 对于端口信号，输入端口只能是net类型，输出端口可以是net也可以是register类型。**若输出端口在过程快中赋值则为register类型；（如initial语句）；若在过程快外赋值（包括实例化语句），则为net类型**
  - 内部信号类型与输出端口相同，可以是net或者register类型，输出端口判断方法也与外部输出端口相同。若在过程块赋值就是register类型，若在过程块外部赋值，就是net类型
  - 若信号既需要在过程块中赋值，又需要在过程快外赋值，这种情况是可能出现的，此时就需要一个中间信号进行转换。
- example
-      worror
-      module example(o1, o2, a, b, c, d);
         input a, b, c, d;
         output o1, o2;
         reg c, d; // 错误，输入端口应该是net类型变量
         reg o2; // 错误，o2是输出端口，不在过程块中赋值，所以应该是net类型
         and u1(o2, c, d);
         always @(a or b)
          if (a) o1 = b; else o1 = 0;
        endmodule
    ########################################
    right
    module example(o1, o2, a, b, c, d);
      input a, b, c, d;
      reg o1;
      and u1(o2, a, b);
      always @(a or b)
        if (a) o1 =b; else o1 = 0;
    endmodule
## 参数(parameters)
- 用参数声明一个可变的常量，常用于定义延时及宽度变量
- 参数定义的语法:parameter <list_of_assignment>
- 可以一次定义多个参数，用逗号分开
- 在使用文字(literal)的地方都可以使用参数
- 参数的定义是局部的，只在当前模块中是有效的
- 参数定义可以使用以前定义的整数和实数参数
### example:
    module mod1(out, in1, in2);
    output out;
    input in1, int2;
    parameter cycle = 20, prop_del = 3,
              setup = cycle/2 - prop_del,
              p1 = 8,
              x_word = 16'bx,// 十六位不确定二进制数
              file = "/user1/jdough/design/mem_file.dat";
    ……
    wire[p1:0] w1; // 通过使用参数来声明一个net型中的wire型变量
    ……
    endmodule
- 参数file不是string类型，而是一个整数，其值是所有字母的ASCII码，若file = "AB",则file的值是8'h4142
- 用法是 
-     $fopen(file);
-     $display("%s", file);
### 参数重载(overloading)：
- defparam语句（综合工具还不支持这种方式）：
  - 可用defparam语句在编译时重载参数值
  - defparam语句引用参数的层次化名称
  - 使用defparam语句可以单独重载任何参数值
-     module test;
       ……
      mod1 I1(out, in1, in2);// 实例化mod1
      defparam
        I1.pq = 6,
        I1.file = "..my/my_mem.dat";
        ……
      endmodule
      module mod1(out, in1, in2);
      ……
      parameter p1 = 8,
                real_constant = 2.039,
                x_word = 16'bx, // 定义为16位的二进制x(x是未知位)
      ……
      endmodule
### 参数重载
- 模块实例化时会发生参数重载：
-     module mod1(out, in1, in2);
      ……
      parameter p1 = 8, 
                x_word = 16'bx,
                file = "user/jdough/design/mem_file.dat";
      ……
      mod1 #(5, 3.0, 16'bx, "../my_mem.dat")I1(out, in1, in2);
      ……
      endmodule
#### 注意：不需要给所有参数赋新值时，但是不能够跳跃赋值，可以采用一下方法来进行赋值操作
-     MOD u1 #(a, b)(……);
-     MOD u1 #(a)(……);
-     MOD u1 #(a,,c)(……);
-     MOD u1 #(,,c)(……);
#### 注意：#说明延时功能的时候只能用于gate或者过程语句，不能由于模块实例，所以编译器并不会讲这里的#符号看成延时符号
### 寄存器数组：
- 在verilog中可以说明一个寄存器数组
-     如：integer NUMS[7:0];// 包括八个整形数据的数组变量
-     time t_values[3:0]; // 包含着三个时间数组的变量
#### reg类型的数组通常用于描述储存器
- 语法表现形式：
-     reg[MSB:LSB]<memory_name>[first_addr:last_addr]
- [MSB:LSB]定义存储器中的字的位数
- [firstadder:lastadder]定义存储器的深度
- 实例：
-     reg[15:0]MEM[0:1023];// 1K*16存储器，深度为1k，字的位数为8位
-     reg[7:0]PREP[hFFFE:hFFFF];// 表示的是2*8的存储器
- 描述存储器时可以使用任意参数或者合法的表达式
### 存储器寻址：
- 存储器元素通过存储器索引(index)寻址，也就是给出元素所在存储器的位置来进行寻址
- mem_name[addr_expr]
- verilog不支持多维数组，也就是说只能对存储器字进行寻址，而不能对存储器中的一个字的位进行寻址，这是因为在verilog中，存储器变量数组相当于是一个二维数组，但由于只能进行一维数组的寻址方式，所以就只能找到一个字的地址来作为地址
- 通过间接的方法来查看存储器中数据的特定的位数据
-     module mems;
      reg[8:1]mema[0:255]; // 声明存储器变量称为mema
      reg[8:1]mem_word; // 定义临时寄存器变量
      ……
      initial
        begin
          $displayb(mema[5]); // 显示存储器字的某些位存取，只能通过临时寄存器来进行传递，显示存储其中第六个字的内容
          mem_word = mema[5];
          $displayb(mem_word[8]); // 显示第六个字的最高有效位
        end
      endmodule
## 系统任务与编译控制
- 语言专用标记(tokens)
- $<indentifier>
  - $符号指示这是系统任务和函数
  - 系统函数有很多种，如：
    - 返回当前的仿真时间：$time
    - 显示/监视信号值:$display $monitor
    - 停止仿真 $stop
    - 结束仿真 $finish
    -     $monitor($time, "a = %b,b = %h", a, b);// 当信号a或者信号b发生变化时，系统任务$monitor显示当前的仿真时间，信号a的值(二进制形式),信号b的值(十六进制形式)
- 文件操作：
-       integer MCD1; // 文件指针
        MCD1 = $fopen("<name_of_file>"); // 打开文件
        if (!MCD1) // 提高代码的健壮性，使其符合代码的规范
          begin
            $display("Could not open the file");
            $finish;
          end
        $fdisplay(MCD1, P1, P2, ……, Pn); // 读文件
        $fwrite(MCD2, P1, P2, ……, Pn);  // 写文件
        $fstrobe(MCD1, P1, P2, ……, Pn); // 监控文件
        $fmonitor(MCD1, P1, P2, ……, Pn); // 监控文件
        $fclose(MCD1); // 关闭文件
- $fopen打开一个文件并返回一个多通道的描述付(MCD)
  - MCD是与文件唯一对应的32为无符号整数
  - 如果文件不能打开并进行写操作，MCD将等于0
  - 如果文件能够被成功打开，MCD中的一位将会被置位
- 以$f开始的显示系统任务将输出写入与MCD相对应的文件中
#### example ：系统任务，文件的输入输出
    ……
    integer messages, broadcast, cpu_chann, alu_chann;
    initial
      begin
        cpu_chann = $fopen("cpu.dat"); if(!cpu_chann) $finish;
        alu_chann = $fopen("alu.dat"); if(!alu_chann) $finish;
        messages = cpu_chann | alu_chann;
        broadcast = 1|messages;
      end
    always@(posedge clock) // 将alu中的数据打印出来
      $fdisplay(alu_chann, "acc = %h f = %h a = %h b = %h,",acc, f, a, b);
    always@(negedge rest)
      $display(broadcast, "System rest at time %d", $time);
- $readmemb 和 $readmemh
  - 文本文件中的数据读到存储器阵列中，一堆存储器变量进行初始化处理
  - 文本文件的内容是二进制格式(用$readmemb)或者十六进制(用 $readmemh)
- $readmemb
  - $readmemb("file_name", <memory_name>);
  - $readmemb("file_name", <memory_name>, <start_addr>);
  - $readmemb("file_naem", <memory_name>, <start_addr>, <finish_addr>);
- $readmemh
  - $readmemh("file_name", <memory_name>);
  - $readmemh("file_name", <memory_name>,<start_addr>);
  - $readmemh("file_name", <memory_name>, <start_addr>, <finish_addr>);
- 组成定义：
  - filename指定要调入的文件
  - mem_name指定存储器名称
  - start和finish决定存储器将被装载的地址。start是开始的地址，finish是结束的地址,$readmem按照从低端开始读入数据，与说明顺序无关
- 文件操作：
  - $readmemb("mem_file.txt", mema);
  - $readmemh("mem_file.txt", memb);
- 可以在后面的值设定一个特定的地址，格式为:
-     @(hex_address)
- 十六进制地址的大小写不敏感
- 在@和数字之间不允许有空格存在
## 语言专用标记：
### 延时说明：
- #用于说明过程语句和门的实例的延时，但不能由于模块的实例化
-     module MUX2_1(out, a, b, sel);
      output out;
      input a, b, sel;
         not #1 u1(nsel, sel);
         and #2 u2(sela, a, nsel);
         and #2 u3(selb, b, sel);
         or #1 u4(out, sela, selb);
       endmodule    
### 编译指导
- '符号说明一个编译指导
- 这些编译指导使仿真编译器进行一些特殊的操作
- 编译指导一直保持有效指导被覆盖或者被解除
- 'restall复位所有的编译指导为缺省值，应该在其他编译指导之前使用
### 文本替换
- 'define <macro_name> <macro_text>
- 'define not_delay #1
- 'define and_delay #2
- 'deine or_delay #1
- not 'not_delay u1(nsel, sel);
- 解除定义的宏，使用'undef marco_name
- 可以将'define放在一个文件中，与其他文件一起编译
### 文本包含
- 'include 
- 格式：'include "<file_name>"
### 时间精度：
- 'timescale <time_unit>/ <time_precision>
- 如
-     timescale 1ns/100ps
- time_unit：延时或者时间的测量单位
- time_precision:延时值超出精度要先舍入后使用
- 'timescale 必须要在模块之前出现
- time_precision不能大于time_unit
- 表示方法：integer unit_string
- integer:整数
- unit_string:可以是s,ms,us,ns,ps,fs
- precision的时间单位应该尽量与设计的实际精度相同
  - precisioin是仿真器的仿真时间步
  - 若time_unit和precision_unit差别很大机会极大影响仿真的速度
  - 如果说明一个'timescale 1s/1ps，则仿真器在1s内就要扫描其事件10^12,而'timescale 1s/1ms则只需要扫描10^3次
  - 如果没有'timescale说明就会使用缺省值，一般是ns
  - 所有timescale中的最小值决定仿真时的最小时间单位，这是因为仿真器必须对整个设计进行精确的仿真
-     'timescale 1ns/1ns
      module testfixture;
      reg a, b, sel;
      wire out;
      MUX2_1 mux(out, a, b, sel);
      initial begin
        a = 0;
        b = 1;
        sel = 0;
        #5.7 b = 0;
        #5 b = 1; 
           sel = 1;
        #5 a = 1;
        #5 $finish;
      end
      initial 
        $monitor($time,,"out = %b, a = %b, b = %b sel = %b", out, a, b, sel);
      endmodule