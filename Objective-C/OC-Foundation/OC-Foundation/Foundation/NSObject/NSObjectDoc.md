# NSObject


### NSObject OC中的基类 也是基协议
在系统中的定义既为Class，也有Protocol
Class中提供了作为一个基类的方法，例如初始化，释放，复制，响应

Class的初始化可以使用如下方式
```
	[NSObject new]
	[[NSObject alloc] init];
```
系统提供了2种基本初始化方式，而我们可以通过自定义去初始化
类方法 ： + 号方法 只能由类名调用 ，类方法也称为静态方法
实例方法： - 号方法 只能由具体的对象调用
通过类初始化方式创建的对象会返回一个本类对象
那么返回值类型系统提供了一个instancetype作为返回值，用来针对子类类型的返回
```
 	For example:
 	+ (NSObject *)object;
 	- (NSObject *)initWithObject;
 	+ (instancetype)object;
 	- (instacnetype)initWithObject;
```
如上两种方式定义都可以完成对象的创建，但instancetype可以指向子类
```
	//定义一个NSObject的子类 MyObject
	//在使用instancetype的情况下我们使用子类接收
	MyObject *obj = [MyObject object];
	//在使用NSObject 作为返回方式的时候只能用NSObject接收
	NSObject *obj = [MyObject object];
```
因为我们给方法返回值固定为NSObject的类型，那么我们只能使用NSObject或者其父类接收(假设有super的情况下)，这种情况涉及到了OC三大特性之一的 多态(我们后面在说)

其次 NSObject类为我们提供了 copy 、 mutableCopy方法
很多人说copy即浅复制 mutableCopy为深复制，当然2019年了，基本没人像2015年那样认为了

接下来说几个可能经常用到的方法
```
//判断该类的实例对象是否能响应此方法
+ (BOOL)instancesRespondToSelector:(SEL)aSelector; 
//判断类是否遵守了某个协议
+ (BOOL)conformsToProtocol:(Protocol *)protocol;
+ //获取方法的IMP
- (IMP)methodForSelector:(SEL)aSelector;
+ (IMP)instanceMethodForSelector:(SEL)aSelector;
//要求所有子类都要重写该方法时可以调用
- (void)doesNotRecognizeSelector:(SEL)aSelector;

//消息转发机制会用到的方法
- (id)forwardingTargetForSelector:(SEL)aSelector;
- (void)forwardInvocation:(NSInvocation *)anInvocation;
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector OBJC_SWIFT_UNAVAILABLE("");
+ (NSMethodSignature *)instanceMethodSignatureForSelector:(SEL)aSelector OBJC_SWIFT_UNAVAILABLE("");
```

###消息转发机制
1.先调用实例方法resolveInstanceMethod
如果作者在这里使用runtime动态添加对应的方法，并且返回yes。就万事大吉。对象找到了处理的方法，
并且将这个新增的方法添加到类的方法缓存列表
2.如果上面的方法返回NO的话，对象会调用forwardingTargetForSelector方法
允许作者选择其他的对象，处理这个消息。
3.如果上面两个方法都没有做处理，那么对象会执行最后一个方法methodSignatureForSelector,提供一个有效的方法签名，若提供了有效的方法签名，程序将会通过forwardInvocation方法执行签名。若没有提供方法签名就会触发doesNotRecognizeSelector方法，触发崩溃。


##NSObject协议
基协议提供了许多常用方法
```
- (instancetype)self;

- (id)performSelector:(SEL)aSelector;
- (id)performSelector:(SEL)aSelector withObject:(id)object;
- (id)performSelector:(SEL)aSelector withObject:(id)object1 withObject:(id)object2;

- (BOOL)isProxy;

- (BOOL)isKindOfClass:(Class)aClass;
- (BOOL)isMemberOfClass:(Class)aClass;
- (BOOL)conformsToProtocol:(Protocol *)aProtocol;

- (BOOL)respondsToSelector:(SEL)aSelector;
```
大家最常用的 self方法  self.xxx 其实就是通过返回的当前类实例去调用属性及方法

还有performSelector方法，就是调用某个SEL，可以通过withObject传递参数

isKindOfClass 判断实例对象是否属于某个类或某个类的子类
isMemberOfClass 判断实例对象是否是某个类的成员
他们两个的区别是作用范围不同，一个判断范围在本类+子类，另一个则是固定某个类

conformsToProtocol 同class里的方法名一致，但是一个是类方法，一个是实例方法

respondsToSelector 判断某个实例对象是否能够响应这个方法，一般情况下，实现了方法就能够响应，不实现则不能







