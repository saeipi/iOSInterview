https://www.jianshu.com/p/e24bd3ee4ef4

Category又叫分类、类别、类目，能够在不改变原来类内容的基础上，为类增加一些方法。
```
除此之外，apple还推荐了category的另外两个使用场景：

1、将类的实现分开写在几个分类里面。
这样做的优点：
a、可以减少单个文件的体积
b、可以把不同的功能组织到不同的Category里
c、可以由多个开发者共同完成一个类
d、可以按需加载想要的category
2、声明私有的方法。

struct objc_class {
    Class isa  OBJC_ISA_AVAILABILITY;
#if !__OBJC2__
    Class super_class                       OBJC2_UNAVAILABLE;  // 父类
    const char *name                        OBJC2_UNAVAILABLE;  // 类名
    long version                            OBJC2_UNAVAILABLE;  // 类的版本信息，默认为0
    long info                               OBJC2_UNAVAILABLE;  // 类信息，供运行期使用的一些位标识
    long instance_size                      OBJC2_UNAVAILABLE;  // 该类的实例变量大小
    struct objc_ivar_list *ivars            OBJC2_UNAVAILABLE;  // 该类的成员变量链表
    struct objc_method_list **methodLists   OBJC2_UNAVAILABLE;  // 方法定义的链表
    struct objc_cache *cache                OBJC2_UNAVAILABLE;  // 方法缓存
    struct objc_protocol_list *protocols    OBJC2_UNAVAILABLE;  // 协议链表
#endif
} OBJC2_UNAVAILABLE;

typedef struct category_t {
    const char *name;  //类的名字
    classref_t cls;  //类
    struct method_list_t *instanceMethods;  //category中所有给类添加的实例方法的列表
    struct method_list_t *classMethods;  //category中所有添加的类方法的列表
    struct protocol_list_t *protocols;  //category实现的所有协议的列表
    struct property_list_t *instanceProperties;  //category中添加的所有属性
} category_t;

Category通过 关联对象 添加属性

Category实际上允许添加属性的，同样可以使用@property，但是不会生成_变量（带下划线的成员变量），也不会生成添加属性的getter和setter方法，所以，尽管添加了属性，也无法使用点语法调用getter和setter方法。但实际上可以使用Runtime去实现Category为已有的类添加新的属性并生成getter和setter方法

使用注意：
1、分类只能增加方法，不能增加实例变量。（但是可以利用Runtime的关联对象）
2、分类方法实现中可以访问原来类中声明的成员变量。
3、分类可以重新实现原来类中的方法，但是会覆盖掉原来的方法，会导致原来的方法没法再使用（实际上并没有真的替换，而是Category的方法被放到了新方法列表的前面，而原来类的方法被放到了新方法列表的后面，这也就是我们平常所说的Category的方法会“覆盖”掉原来类的同名方法，这是因为运行时在查找方法的时候是顺着方法列表的顺序查找的，它只要一找到对应名字的方法，就会罢休，殊不知后面可能还有一样名字的方法）。
4、当分类、原来类、原来类的父类中有相同方法时，方法调用的优先级：分类(最后参与编译的分类优先) –> 原来类 –>父类，即先去调用分类中的方法，分类中没这个方法再去原来类中找，原来类中没有再去父类中找。
5、如果多个category中存在同名的方法，运行时到底调用哪个方法由编译器决定，最后一个参与编译的方法会被调用。
Category是在runtime时候加载，而不是在编译的时候。


```

