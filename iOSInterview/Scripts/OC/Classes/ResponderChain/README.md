```
当用户点击某一个视图或者按钮的时候会首先响应application中UIWindow一层一层的向下查找，直到找到用户指定的view为止，主要通过以下方法：
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event;   // recursively calls -pointInside:withEvent:. point is in the receiver's coordinate system
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event;   // default returns YES if point is in bounds

Photo/ResponderChain.jpg
在上图中用户点击视图中的ViewD时，UIWindow首先接收到响应，此响应包括用户点击的区域和一个封装好的UIEvent对象，然后UIWindow通过这些信息利用以下方法查找：

1. UIWindow会通过调用pointInside:withEvent:方法返回的YES得知用户点击的范围在ViewA中；

2. ViewA调用hitTest:withEvent:方法，在方法中遍历所有的subView(ViewB、ViewC)调用hitTest:withEvent:方法；

3. 在遍历中发现使用ViewC调用pointInside:withEvent:方法时返回YES，得知用户点击在ViewC范围之内；

4. ViewC调用hitTest:withEvent:方法，在方法中遍历所有的subView(ViewD、ViewE)调用hitTest:withEvent:方法;

5. 在遍历中发现使用ViewD调用pointInside:withEvent:方法时返回YES，得知用户点击在ViewD范围之内;

6. 在ViewD调用hitTest:withEvent:方法之前发现View的subViews的count为0，故确定用户点击在ViewD之上。

UIWindow会用遍历subviews，使用每一个subview调用hitTest:withEvent:方法，如果用户点击在某一个subview上，pointInside:withEvent:方法返回YES，再用这个subview调用hitTest:withEvent:方法，依次类推，直到当前view没有子view或点击的位置没有在其任何子view之上，便确定用户点击在某view上

大致在某一个view中是这样实现的：

事件的链有两条:事件的响应链;Hit-Testing 时事件的传递链。

响应链:由离 户最近的view向系统传递。 initial view –> super view –> .....–> view controller –> window –> Application –> AppDelegate

Hit-Testing 链:由系统向离 户最近的view传递。 UIKit –> active app's event queue –> window –> root view –>......–>lowest view 

----------------------------------------------
iOS事件链有两条：事件的响应链；Hit-Testing事件的传递链
响应链：由离用户最近的view向系统传递。initial view –> super view –> ….. –> view controller –> window –> Application –> AppDelegate
传递链：由系统向离用户最近的view传递。UIKit –> active app's event queue –> window –> root view –> …… –> lowest view

```

