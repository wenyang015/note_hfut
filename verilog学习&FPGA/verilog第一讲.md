#  VerilogHDL & FPGA Design

##  verilog 简介

-  IC简介：

  - 设计方式演变：手工设计 -> CAD设计 -> EDA设计
    - SSI & MSI
      - 逻辑化简，绘制逻辑线路
      - 选择电路元器件，搭制线路图
      - 绘制版图，以及刻膜等
      - 实测与调试

    - LSI
      - 图形输入、编辑
      - 规则检查、仿真验证
      - 参数提取
      - 绘制版图、掩膜生成

    - VLSI
      - 设计描述：图形到逻辑(HDL)
      - 设计环境：库
      - 可移植性

## 术语定义：
- IDM,Fabless和Foundry:三种芯片行业运作模式
  - IDM：是一种芯片行业的运作模式，指的是公司有自己的设计、制造和封装测试能力，如intel和samsung
  - Fabless:是一种芯片行业运作模式，这类公司专注于设计芯片，将制造工艺外包给其他公司，如amd和nvidia
  - Foundry:这种芯片行业运行模式的公司专注于芯片的制造，工艺生产，如台积电和联发科
- HDL：硬件描述语言 Hardware Description Language, 描述电路硬件和时序的一种编程语言
- 仿真器：读入HDL并进行解释和执行的一种软件
- 抽象级：描述风格的详细程度，如行为级和门级
- ASIC：专用集成电路(Application Specific Integrated Circuit)
- ASIC Vender:芯片制造商，开发并提供单元库
- 自下而上的设计流程：一种先构建底层单元，然后再由底层单元构造更大的系统的设计方法
- 自顶而下的设计流程：一种设计方法，先用高抽象级构建系统，然后再设计下层单元
- RTL级：寄存器传输级(Register Transfer Level),用于设计的可综合的一种抽象级
- 脚本语言：一种编程语言，用来控制软件应用程序，脚本通常以文本(如ASCII)保存，只是被调用时进行解释或者被编译，TCL,Perl,Python等
## HDL简介：
- HDL是硬件描述性语言，而不是硬件设计语言，是一种具有特殊结构能够对硬件逻辑电路的功能进行描述的一种高级编程语言
  - 能够描述电路的连接、功能、时序
  - 能在不同抽象级上描述电路，表达上具有并行性
  - 支持综合和仿真
- 主要有两种：verilog,VHDL
- 优点：
  - 设计在高层次进行，与具体实现无关
  - 设计开发更加容易
  - 早在设计期间就能发现问题
  - 能够自动的将高级描述映射到具体工艺实现
  - 再具体实现时才能做出某些决定
- HDL具有更大的灵活性
  - 可以重用
  - 可以选择工具和生产厂
- HDL可以利用先进的软件
  - 更快地输入
  - 易于管理
- 将设计与工艺分离
## verilog简介
- 历史
- 用途：verilog的主要应用包括：综合和仿真
### verilog与C语言的区别：
- verilog HDL：并行化，有时序内涵
## verilog的基本语法：
### 抽象级：认知层次或认知难度的量化表达方式
### verilog主要在三种抽象级上进行描述：
- 行为级：
  - 在功能块之间的数据流对系统进行描述
  - 在需要时在函数块之间进行调度赋值
- RTL级/功能级
  - 在功能块内部或功能块之间的数据流和控制信号描述系统
  - 基于一个已经定义的时钟的周期来定义系统模型
- 结构级/门级：
  - 用基本单元(primitive)或底层元件(component)的连接来描述系统以得到更高的精确性，特别是时序方面
  - 在综合时采用特定工艺和底层元件将RTL描述映射成门级网表
- verilog还有一定的晶体管级描述功能和算法级描述功能
### 抽象级：
- 行为级：
  - 仅描述电路行为，而非结构
  - 不指定硬件目标
  - 兼顾综合和仿真目标
-     if (input 1)
        for (j = 0, j < 8, j = j + 2)
            # 5 output1 = 1'b0;
      else
        for (j = 1, j < 8, j = j + 2)
            # 5 output1 = 1'b1;
- 结构模型
  - 描述电路的行为和结构
  - 指定硬件目标
  - 主要为综合
- Register Transfer Level(RTL)-典型行为模型，便于综合
  - 硬件可以被简化或者参考
  - 可以综合
- Synthesis(综合)：将HDL转化为电路并优化电路结构
- RTL synthesis-将RTL级硬件模型转换位一个优化的特定的门级实现
-     always @(a or b or c or d or sel)
         begin
             case(sel)
                 2'b00: mux_out = a;
                 2'b01: mux_out = b;
                 2'b10: mux_out = c;
                 2'b11: mux_out = d;
            endcase
### 设计工程师在不同的设计阶段采用不同的抽象级：
- 首先在行为级描述各种功能块，以降低描述的难度，提高仿真的速度
- 在综合之前将各个功能模块进行RTL级描述
- 用于综合的库中的大多数单元采用结构级描述。
### 如何开展设计：
#### 设计描述 vs 系统建模
- 典型的数字信号系统组成(DSP)
  - 存储器、数据路径（运算）和控制路径（管理）
- 使用不同描述建模
  - 数据路径-组合逻辑建模
  - 控制路径-时序逻辑建模
  - 存储器-时序逻辑建模
- 具体实现：
  - 模块化-功能细分
  - 层次化-复杂度分解
### 如何描述一个电路：
- 基本组成：标准的外特性描述
- 支持层次嵌套：
  - 复杂任务/算法/过程分解
  - 降低设计难度
- 支持多种模型层次
  - 混合模型，不同来源
### verilog基本建模的对象：基本单元
#### module(模块)
- module 是层次化设计的基本构件
- 逻辑描述放在module的内部
##### module能够表示：
- 物理块：如IC和ASIC单元
- 逻辑块：如一个CPU的ALU部分
- 整个系统
-     module twonux(out a, b, sel);// 端口相当于硬件的引脚
        input a, b, sel; // 定义输入端口
        output out; // 定义输出端口
        wire nsel, sela, selb; // 定义线型的变量，就相当与端口信号通过内部的门后产生的信号，也就是中间变量
          not u1(nsl, sel); // 定义一个逻辑门非门u1,将求非结果传送给nsl中间变量，也就是sel通过u1非逻辑门取非后结果为nsl
          and #1 u2(sela, a, nsel);
          and #1 u3(sela, b, sel);
          or # 2 u4(out, sela, selb);
      endmodule
- 模块通过端口与外部通信
- 模块功能描述采用例化或者行为建模描述
- 模块内部变量申明
- 模块名称为twomux,端口列表以及说明
#### 如何描述一个测试环境
- 验证设计电路的正确性：
  - 基本组成单元
    - 模块、函数、任务
  - 功能组成：
    - 激励源/激励模块（输入信号产生）模块
    - 响应/观测/校验(输出信号收集)模块
  - 建模层次：
    - 行为、算法
#### verilog用于模块测试：
- 测试平台/测试环境(testbench or testfixture)
  - 组成：激励模块、响应模块
- 激励模块：按规则产生变化的输入信号，测试激励或者向量
- 响应模块：记录被测试模块响应，校验效应的正确性
-     module MUX2_1(out, a, b, sel);
        // Port declaration
        output out;
        input a, b, sel;
        wire out, a, b, sel;
        wire sel_, a1, b1;
        // The netlist
        not (sel_, sel);
        and (a1, a, sel_);
        and (b1, b, sel);
        or (out, a1, b1);
       endmodule
# Test Fixture template(测试模块的模版)
    modeule testfixture;不需要端口，因为testfixture是最顶层的模块，不会被其他的模块实例化，因此不需要有端口
    // Data Declaration数据声明
    // Instantiate modules实例化模块
    MUX2_1 mux(out, a, b, sel);
    模块名称要与引用的模块相同
    实例名称任意
    端口名称：与引用的模块的次序相同
    // Apply stimulus添加激励
    // Display rsults展现结果
    endmodule
### 完整的testfixture
    module testfixture;
    // data declaration
    reg a, b, sel;
    wire out;
    // MUX instance 
    MUX2_1 mux(out, a, b, sel);
    // Apply stimulus
    initial begin
        a = 0; b = 1; sel = 0;
        # 5 b = 0; 
        # 5 b = 1;sel = 1;
        # 5 a = 1;
        # 5 $finish;
    end
    // Display results
    initial
        $monitor($time,,"out = %b,a = %b, c = %b", out, a, b, sel);
    endmodule
