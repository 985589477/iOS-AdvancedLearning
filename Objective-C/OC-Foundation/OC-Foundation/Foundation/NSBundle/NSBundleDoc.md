
# NSBundle
### NSBundle是系统提供使用的一个资源目录控制的类
### 其中包含了图像、声音、代码、nib各种资源的获取方式
### mainBundle则是获取该程序内的主目录路径

```
+ (nullable instancetype)bundleWithPath:(NSString *)path;
- (nullable instancetype)initWithPath:(NSString *)path NS_DESIGNATED_INITIALIZER;

+ (nullable instancetype)bundleWithURL:(NSURL *)url API_AVAILABLE(macos(10.6), ios(4.0), watchos(2.0), tvos(9.0));
- (nullable instancetype)initWithURL:(NSURL *)url API_AVAILABLE(macos(10.6), ios(4.0), watchos(2.0), tvos(9.0));

+ (NSBundle *)bundleForClass:(Class)aClass;
+ (nullable NSBundle *)bundleWithIdentifier:(NSString *)identifier;
```

#### 我们可通过以上方式创建bundle，创建bundle需要一个完整的绝对路径才可以成功，否则为nil
#### 其中 -bundleForClass: 方法可获取对应class的bundle
#### 比如 当前类 [self class] 是 ViewController ，那么获取到的bundle与 mainBundle一致
#### 若你的app内存在其他bundle，则调用对应Framework的类时，可获取对应framework的bundle

其中最常用的以
```
pathForResource
urlForResource
```
开头的方法最常用，经常用来加载本地放置的资源路径

你可以可用通过bundle中的 -classNamed: 方法来获取bundle内的一个Class
principalClass 则是返回bundle内主要的类

- localizations; //获取本地资源数组列表
- preferredLocalizations; //获取本地国际化语言列表