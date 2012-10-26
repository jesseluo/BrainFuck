BrainFuck
===
###简介
一个简单的在iDevice设备上玩BF的应用

###当前功能
1. 在iphone上编辑，编译运行BF代码
2. 自定义的键盘，更方便，更节约空间

###技术与框架
1. 内存管理采用ARC，交互编写采用Storyboard，so仅支持iOS5以上系统
2. 编译部分采用C++与OC混编
3. 最后一次编译运行成功环境：OS X 10.8 ML + XCode 4.5 + iOS6 SDK

###TODO List
<strike>1. 输入操作（即','操作）的交互与编译</strike>
2. 完善BF代码的特殊情况并加入错误处理
3. sample source选择器
<strike>4. 测试TestFlight</strike>
5. 规避键盘及UI调整
6. Launch image
7. 重构compiler，将C++代码单独抽离
8. 单独开compiler跑，实现与UI线程交互

###学习知识点
1. UITextView及自定义键盘等操作
2. Objective C++混编，C++基本知识复习^ ^
3. Cocoa多线程
4. 多种分辨率适配
5. TestFlight分发测试

###更新日志
2012-10-20 Ver 0.6
基本功能成型，可以编译简单的源码
2012-10-26 Ver 0.61
可以接受输入，有了基本的BF代码错误处理
