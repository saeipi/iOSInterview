```
https://www.jianshu.com/p/2c7df41c8fb3

#import <Foundation/Foundation.h>
#import "Person.h"

char char_string[] = "char_text"; //char_string在常量区/全局区

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        char *pointer = "char_text"; //char_text在常量区/全局区
        
        // 下面两个地址相同，因为"char_text"存放在常量区，指针pointer指其向常量区的内存地址
        printf("char_text地址[常量区]: %p\n",&"char_text");
        printf("pointer指针指向地址[常量区]: %p\n",pointer);
        
        // char_string的地址和上面的不同，因为char_string地址就是自己本身的内存地址，内存中存放的是"char_text"这个值。虽然指针pointer所指向的内存地址存放的值也是"char_text"，但是两者具有本质区别
        printf("char_string: %p, char_string&: %p\n",char_string,&char_string);//不加&也一样，因为数组地址等于的第一个元素的地址
        
        char char_str[] = "char_text";
        // char_str存放在栈区，地址值较大，和指针pointer所指向的常量区的内存地址不同
        printf("&char_str[栈区]: %p\n",&char_str);// 可以不加&
        printf("char_str[栈区]: %p\n",char_str);
        printf("*char_str: %c\n",*char_str); // 获取s[]的第一个元素的值
        
        
        int num = 10;// num存放在栈区，10是常量，其值直接存放在栈区内存中
        NSLog(@"栈区num内存地址: %p",&num);
        
        // string存放在栈区，和num一样，其内存中直接存放的是值，也就是后面那一串字符数组
        char string[] = "my name is muyi";
        NSLog(@"栈区string内存地址: %p",string);
        
        // 指针p存放在栈区，字符串存放在常量区，p中存放的是字符串所在的常量区的地址
        char *p = "my name is muyi";
        NSLog(@"指针p所指向的字符串常量区内存地址: %p",p);
        
        Person *obj = [[Person alloc] init];
        
        NSLog(@"栈中的指针obj自身的地址: %p",&obj);
        NSLog(@"obj指针所指向的堆区的内存地址[堆区]: %p",obj);
        
        char *cp = "char pointer"; //char_text在常量区/全局区
        NSLog(@"堆区: “0x101d00ad0”,[常量区]: %p",cp);
    }
    return 0;
}

输出：
char_text地址[常量区]: 0x100001de0
pointer指针指向地址[常量区]: 0x100001de0
char_string: 0x1000024e0, char_string&: 0x1000024e0
&char_str[栈区]: 0x7ffeefbff50e
char_str[栈区]: 0x7ffeefbff50e
*char_str: c
栈区num内存地址: 0x7ffeefbff4d4
栈区string内存地址: 0x7ffeefbff4f0
指针p所指向的字符串常量区内存地址: 0x100001ea0
栈中的指针obj自身的地址: 0x7ffeefbff4c0
obj指针所指向的堆区的内存地址[堆区]: 0x1006018f0
堆区: “0x101d00ad0”,[常量区]: 0x100001eb0

在iOS中可以近似的理解为: 0x1000x的就是全局区，0x10xxx的就是堆区，也就是程序员alloc的对象。很大的比如0x7ffee66aa1ac的就是栈区

C语言中变量的赋值原则：非指针变量，拷贝内存中的表现形式(实际的值)，指针变量，拷贝内存地址。
char array[] = "saeipi"; //"saeipi"存放在栈区的array[]内存上
char *point = "saeipi"; //"saeipi"存放在常量区
char *array_point = array; //栈区的指针变量array_point指向栈区的内存地址

NSLog(@"point[常量区]: %p",point); //0x100001ecd
NSLog(@"array_point[栈区]: %p",array_point); //0x7ffeefbff509

NSMutableString *mstring1 = [NSMutableString stringWithFormat:@"可变非集合对象"];
NSMutableString *mstring2 = [mstring1 copy];
NSMutableString *mstring3 = [mstring1 mutableCopy];
NSLog(@"mstring1[堆区]: %p, mstring2[堆区]:%p ,mstring3[堆区]: %p",mstring1,mstring2,mstring3);
//mstring1[堆区]: 0x102605ec0, mstring2[堆区]:0x102605ef0 ,mstring3[堆区]: 0x102605f20

NSString *str1 = @"saeipi";//@"不可变非集合对象";
NSString *str2 = [str1 copy];
NSString *str3 = [str1 mutableCopy];
NSString *str4 = @"saeipi";
NSLog(@"str1[常量区]: %p, str2[常量区]:%p ,str2[堆区]: %p ,str4[常量区]: %p",str1,str2,str3,str4);
//str1[常量区]: 0x1000020e0, str2[常量区]:0x1000020e0 ,str2[堆区]: 0x102605f90 ,str4[常量区]: 0x1000020e0

NSString *text = @"ksert";
NSLog(@"text[栈区] point: %p, text[常量区]: %p",&text,text);
//text[栈区] point: 0x7ffeefbff4b8, text[常量区]: 0x100002120

int number = 9;
NSLog(@"number point: %d,number&: %p",number,&number);
//number point: 9,number&: 0x7ffeefbff4b4

/*---------------------------------------------------------*/
const NSString *constanct_text = @"saeipi";
static NSString *static_text = @"saeipi";//全局区指针指向常量区
//constanct_text与static_text指向地址一样，只用常量区“saeipi”

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *text_saeipi = @"saeipi";//与constanct_text和static_text指向地址一样
        Person *pe = [[Person alloc] init];//堆区
        NSLog(@"Constanct[常量/字符串常量区]: %p, Clobal[全局]: %p, Heap[堆区]: %p, Stack[栈区]: %p",constanct_text,&static_text,pe,&text_saeipi);
        //Constanct[常量/字符串常量区]: 0x100002068, Clobal[全局]: 0x1000025c8, Heap[堆区]: 0x101e04b40, Stack[栈区]: 0x7ffeefbff508
    }
    return 0;
}
```

