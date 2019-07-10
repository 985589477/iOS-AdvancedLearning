
# NSObjCRuntime

### OC中一些宏定义


定义方法或者属性等在某一个mac版本或iOS版本可以使用
```
NS_AVAILABLE(_mac, _ios)  //iOS Mac公用方法定义对应的系统版本
NS_AVAILABLE_MAC(_mac)
NS_AVAILABLE_IOS(_ios)

For Example:

NS_AVAILABLE(10_8, 6_0)
```
### Description
这个宏告诉我们这方法分别随Mac OS 10.8和iOS 6.0被引入。其中 _ 代表 . 或者直接用. 也可以


定义方法或属性在某个版本被弃用
```
#define NS_DEPRECATED(_macIntro, _macDep, _iosIntro, _iosDep, ...)
#define NS_DEPRECATED_MAC(_macIntro, _macDep, ...)
#define NS_DEPRECATED_IOS(_iosIntro, _iosDep, ...)

For Example:

    NS_DEPRECATED(8_0, 11_0)
```
### Description
这个宏代表该方法或属性 在 8.0被加入到系统中，在11.0在系统中被废弃
其中 Intro代表引入 Dep代表废弃  也就是说表明在哪个版本后可以使用，在哪个版本后被废弃


有了上面的例子，枚举就不需要说了，分别对应枚举的可用与废弃标示
```
NS_ENUM_AVAILABLE(_mac, _ios)
NS_ENUM_AVAILABLE_MAC(_mac)
NS_ENUM_AVAILABLE_IOS(_ios)
NS_ENUM_DEPRECATED
NS_ENUM_DEPRECATED_MAC(_macIntro, _macDep, ...)
NS_ENUM_DEPRECATED_IOS(_iosIntro, _iosDep, ...)

/* 针对iPhone进行设置，代表iPhone使用 */
NS_AVAILABLE_IPHONE(_ios)
NS_DEPRECATED_IPHONE(_iosIntro, _iosDep)
```

## 定义枚举  
NS_ENUM
NS_OPTIONS

### 常规枚举的定义方法
```
enum {                                
    A,                          
    B                                     
};    
enum: NSUInteger {
    A,
    B,
};

typedef enum {                                    
    MyEnumTypeA,                                     
    MyEnumTypeB                                                        
} MyEnumType;                                                   

typedef enum: NSUInteger { 
    MyEnumTypeA, 
    MyEnumTypeB
} MyEnumType;

typedef enum MyEnumType: NSUInteger {
    MyEnumTypeA,
    MyEnumTypeB
} MyEnumType;

```

### 位移枚举
```
typedef enum: NSUIneteger {
    NONE = 0,
    A = 1, //0000 0001
    B = 2, //0000 0010
    C = 4  //0000 0100
} BitEN;
BitEN bitType = A | B;

typedef enum: NSUInteger {
    None    = 0,       // 000000      0
    A  = 1 << 0,       // 000001      1
    B  = 1 << 1,       // 000010      2
    C  = 1 << 2,       // 000100      4
    D  = 1 << 3        // 001000      8
} BitEN;
```

首先说说为什么系统定义代码块 enumdef
我所理解的 使用传统 enum定义的枚举无法作为一个类型声明
比如 enum {A,B}  在OC中如果我们使用一个属性去代表他 则不是很好理解，因为你可以用NSUInteger去接收，但是可读性很差
反之使用 typedef 去定义，就可以 使用 MyEnumType 定义一个属性 例如 MyEnumType type = MyEnumTypeA;


系统推荐使用 NSEnum 定义枚举 以及 NS_OPTIONS 定义位移枚举 好处是定义简洁，并且可桥接Swift转化类型
```
typedef NS_ENUM(NSInteger, UIViewAnimationTransition) {
    UIViewAnimationTransitionNone,
    UIViewAnimationTransitionFlipFromLeft,
    UIViewAnimationTransitionFlipFromRight,
    UIViewAnimationTransitionCurlUp,
    UIViewAnimationTransitionCurlDown,
};

typedef NS_OPTIONS(NSUInteger, UIViewAutoresizing) {
    UIViewAutoresizingNone                 = 0,
    UIViewAutoresizingFlexibleLeftMargin   = 1 << 0,
    UIViewAutoresizingFlexibleWidth        = 1 << 1,
    UIViewAutoresizingFlexibleRightMargin  = 1 << 2,
    UIViewAutoresizingFlexibleTopMargin    = 1 << 3,
    UIViewAutoresizingFlexibleHeight       = 1 << 4,
    UIViewAutoresizingFlexibleBottomMargin = 1 << 5
};
```


不理解枚举的推荐学习url: https://www.jianshu.com/p/dc26d719cc03 写的很详细


### NS_STRING_ENUM  //字符串枚举
 
 ```
For example:

typedef NSString *kStatusCode NS_STRING_ENUM;

static const kStatusCode kStatusCodeSuccess = @"成功";
static const kStatusCode kStatusCodeFailure = @"失败";

```


### NS_ERROR_ENUM //错误类型枚举，NSErrorDomain

```
For example:

NSErrorDomain const kErrorDomain;
typedef NS_ERROR_ENUM(kErrorDomain, kErrorDomainCode) {
kErrorDomainCodeUnkown,
kErrorDomainCodeSuccess,
kErrorDomainCodeFailure
};
kErrorDomainCode code = kErrorDomainCodeUnkown;
```


### 其次就是一些反射方法
```
NSStringFromSelector
NSSelectorFromString
NSStringFromClass
NSClassFromString
NSStringFromProtocol
NSProtocolFromString
NSGetSizeAndAlignment
NSLog(NSString *format, ...)
```

定义 ``` YES OR NO ```
就是 BOOL 1  OR  BOOL 0

同时还有 MAX（求大值） MIN(求小值)  ABS(求绝对值) 函数宏定义











