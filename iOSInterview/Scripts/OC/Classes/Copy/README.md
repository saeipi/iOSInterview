```
[NSArray array]/[NSDictionary dictionary]创建的对象，在栈区。且即便多次创建，指针地址是不会变的。

@property (nonatomic, copy)中copy
1、 _copy属性：下划线copy属性赋值，不会进行copy操作
2、self.copy属性：self.copy属性赋值，会进行copy操作

```
