#  NSArray

NSArray是OC中集合类型之一，主要用于存取数据，按照队列的方式有序的排列，所以是一个有序集合
NSArray可以存放任意对象类型，如果要存放基本类型，需要使用NSNumber对象进行包装基本类型，再存入

###NSArray中使用了泛型设计，同时也利用了Categroy来对NSArray的方法属性进行划分模块
其本身拥有基础的的属性及方法只提供了count和初始化，下标取值
```
@property (readonly) NSUInteger count;//数组集合内的对象个数
- (ObjectType)objectAtIndex:(NSUInteger)index;//根据下标取出数组内对应的数据，注意下标不能为负并且不能大于数组的个数
- (instancetype)init NS_DESIGNATED_INITIALIZER; //init初始化
- (instancetype)initWithObjects:(const ObjectType _Nonnull [_Nullable])objects count:(NSUInteger)cnt NS_DESIGNATED_INITIALIZER; //这个方法是可以转化一个C类型数组为NSArray类型，因为是C数组，所以需要传递count  
```

NSArray(NSExtendedArray)中提供了许多操作数组的方式

像数组内追加数据， 追加一条数据以及追加一个数组的数据
```
- (NSArray<ObjectType> *)arrayByAddingObject:(ObjectType)anObject;
- (NSArray<ObjectType> *)arrayByAddingObjectsFromArray:(NSArray<ObjectType> *)otherArray;
```

拆分把数组的数据通过字符串分隔符拼成字符串
```
- (NSString *)componentsJoinedByString:(NSString *)separator;
```

判断数组那是否包含该对象
```
- (BOOL)containsObject:(ObjectType)anObject;
```



