```
iOS会在运⾏期提前并且自动调用这两个⽅法。 
区别:load是只要类所在文件被引⽤就会被调⽤，而initialize是在类或者其⼦类的第⼀个⽅法被调用前调用(runtime对+(void)load的调用并不视为类的第⼀个⽅法)。所以如果类没有被引⽤进 项目，就不会有load调用;但即使类文件被引用，但是没有使用，那么initialize也不会被调用。 相同点在于:⽅法只会被调⽤⼀次。(其实这是相对runtime来说的)。 ⽅法调⽤的顺序:⽗类(Superclass)的⽅法优先于子类(Subclass)的⽅法，类中的⽅法优先于类别 (Category)中的⽅法。
```
