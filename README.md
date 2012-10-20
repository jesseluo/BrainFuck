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
1. 输入操作（即','操作）的交互与编译
2. 考虑BF代码的特殊情况并加入防护
3. sample source选择器
<strike>4. 测试TestFlight</strike>

###学习知识点
1. UITextView及自定义键盘等操作
2. Objective C++混编，C++基本知识复习^ ^
3. 分辨率适配
4. TestFlight分发测试

###更新日志
2012-10-20 Ver 0.6
基本功能成型，可以编译简单的源码