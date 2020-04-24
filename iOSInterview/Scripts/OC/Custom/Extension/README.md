```
extension被开发者称之为扩展、延展、匿名分类。extension看起来很像一个匿名的category，但是extension和category几乎完全是两个东西。和category不同的是extension不但可以声明方法，还可以声明属性、成员变量。extension一般用于声明私有方法，私有属性，私有成员变量。

extension看起来很像一个匿名的category，但是extension和有名字的category几乎完全是两个东西。 extension在编译期决议，它就是类的一部分，在编译期和头文件里的@interface以及实现文件里的@implement一起形成一个完整的类，它伴随类的产生而产生，亦随之一起消亡。extension一般用来隐藏类的私有信息，你必须有一个类的源码才能为一个类添加extension，所以你无法为系统的类比如NSString添加extension。

Extension与Category区别
* Extension
    * 在编译器决议，是类的一部分，在编译器和头文件的@interface和实现文件里的@implement一起形成了一个完整的类。
    * 伴随着类的产生而产生，也随着类的消失而消失。
    * Extension一般用来隐藏类的私有消息，你必须有一个类的源码才能添加一个类的Extension，所以对于系统一些类，如NSString，就无法添加类扩展
* Category
    * 是运行期决议的
    * 类扩展可以添加实例变量，分类不能添加实例变量（原因：因为在运行期，对象的内存布局已经确定，如果添加实例变量会破坏类的内部布局，这对编译性语言是灾难性的。）
```
