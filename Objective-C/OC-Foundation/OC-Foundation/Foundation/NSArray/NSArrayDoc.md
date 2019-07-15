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

调用数组查到与被传入数组包含的第一个对象
```
firstObjectCommonWithArray

For example:
NSArray *array1 = @[@1,@2,@3];
NSArray *array2 = @[@2,@3,@4];
id object = [array1 firstObjectCommonWithArray:array2];
log: 2,   
注意: 顺序只与array1 有关，只要array2中包含即可
```

根据对象取数组内下标 其中range指定范围，identical代表比较指针
```
- (NSUInteger)indexOfObject:(ObjectType)anObject;
- (NSUInteger)indexOfObject:(ObjectType)anObject inRange:(NSRange)range;
- (NSUInteger)indexOfObjectIdenticalTo:(ObjectType)anObject;
- (NSUInteger)indexOfObjectIdenticalTo:(ObjectType)anObject inRange:(NSRange)range;
```

比较数组与数组是否一致: 与顺序有关，与对象类型有关
```
- (BOOL)isEqualToArray:(NSArray<ObjectType> *)otherArray;
```

把数组对象转化成NSEnumerator对象
```
- (NSEnumerator<ObjectType> *)objectEnumerator; //转化为正序对象
- (NSEnumerator<ObjectType> *)reverseObjectEnumerator; //转化为逆序对象

NSEnumeater中 nextObject属性，可以使用
while (id obj = array.objectEnumerator.nextObject) {
  //正序打印
}
while (id obj = array.reverseObjectEnumerator.nextObject) {
  //逆序打印
}
```

数组的排序
####sortedUsingFunction 是自己定义一个C函数 
ForExample:
NSInteger sortMethod(id obj1,id obj2, void *option)
hint参数是为了快速排序使用的，先sortedArrayHint 获取一个hint，然后再进行排序，这样可以更快
```
@property (readonly, copy) NSData *sortedArrayHint;
- (NSArray<ObjectType> *)sortedArrayUsingFunction:(NSInteger (NS_NOESCAPE *)(ObjectType, ObjectType, void * _Nullable))comparator context:(nullable void *)context;
- (NSArray<ObjectType> *)sortedArrayUsingFunction:(NSInteger (NS_NOESCAPE *)(ObjectType, ObjectType, void * _Nullable))comparator context:(nullable void *)context hint:(nullable NSData *)hint;
```

截取数组 return被截取部分
```
- (NSArray<ObjectType> *)subarrayWithRange:(NSRange)range;
```

根据下标取对象    NSIndexSet是一个下标点集合，可以把多个对象取出来
```
- (NSArray<ObjectType> *)objectsAtIndexes:(NSIndexSet *)indexes;
- (ObjectType)objectAtIndexedSubscript:(NSUInteger)idx; //等同于 array[1]
```

数组提供的enumetor方法排序,options可以添加可选，就是数组按正序排列还是反序排列排序
indexes是提供了针对数组某一部分进行排序
```
- (void)enumerateObjectsUsingBlock:(void (NS_NOESCAPE ^)(ObjectType obj, NSUInteger idx, BOOL *stop))block API_AVAILABLE(macos(10.6), ios(4.0), watchos(2.0), tvos(9.0));
- (void)enumerateObjectsWithOptions:(NSEnumerationOptions)opts usingBlock:(void (NS_NOESCAPE ^)(ObjectType obj, NSUInteger idx, BOOL *stop))block API_AVAILABLE(macos(10.6), ios(4.0), watchos(2.0), tvos(9.0));
- (void)enumerateObjectsAtIndexes:(NSIndexSet *)s options:(NSEnumerationOptions)opts usingBlock:(void (NS_NOESCAPE ^)(ObjectType obj, NSUInteger idx, BOOL *stop))block API_AVAILABLE(macos(10.6), ios(4.0), watchos(2.0), tvos(9.0));
```

根据条件排序 *stop 可以停止排序
```
- (NSUInteger)indexOfObjectPassingTest:(BOOL (NS_NOESCAPE ^)(ObjectType obj, NSUInteger idx, BOOL *stop))predicate API_AVAILABLE(macos(10.6), ios(4.0), watchos(2.0), tvos(9.0));
- (NSUInteger)indexOfObjectWithOptions:(NSEnumerationOptions)opts passingTest:(BOOL (NS_NOESCAPE ^)(ObjectType obj, NSUInteger idx, BOOL *stop))predicate API_AVAILABLE(macos(10.6), ios(4.0), watchos(2.0), tvos(9.0));
- (NSUInteger)indexOfObjectAtIndexes:(NSIndexSet *)s options:(NSEnumerationOptions)opts passingTest:(BOOL (NS_NOESCAPE^)(ObjectType obj, NSUInteger idx, BOOL *stop))predicate API_AVAILABLE(macos(10.6), ios(4.0), watchos(2.0), tvos(9.0));
```

OC提供的对数组排序，NSComparator为一个代码块 返回值为NSComparatorResult 枚举类型，作用是自行比较obj1与obj2，返回NSComparatorResult 中的 升序 平序 降序
```
- (NSArray<ObjectType> *)sortedArrayUsingComparator:(NSComparator NS_NOESCAPE)cmptr API_AVAILABLE(macos(10.6), ios(4.0), watchos(2.0), tvos(9.0));
- (NSArray<ObjectType> *)sortedArrayWithOptions:(NSSortOptions)opts usingComparator:(NSComparator NS_NOESCAPE)cmptr API_AVAILABLE(macos(10.6), ios(4.0), watchos(2.0), tvos(9.0));
```


###NSArray中提供了一些便利的构造方法 就不细讲了
```
+ (instancetype)array;
+ (instancetype)arrayWithObject:(ObjectType)anObject;
+ (instancetype)arrayWithObjects:(const ObjectType _Nonnull [_Nonnull])objects count:(NSUInteger)cnt;
+ (instancetype)arrayWithObjects:(ObjectType)firstObj, ... NS_REQUIRES_NIL_TERMINATION;
+ (instancetype)arrayWithArray:(NSArray<ObjectType> *)array;

- (instancetype)initWithObjects:(ObjectType)firstObj, ... NS_REQUIRES_NIL_TERMINATION;
- (instancetype)initWithArray:(NSArray<ObjectType> *)array;
- (instancetype)initWithArray:(NSArray<ObjectType> *)array copyItems:(BOOL)flag;

/* Reads array stored in NSPropertyList format from the specified url. */
- (nullable NSArray<ObjectType> *)initWithContentsOfURL:(NSURL *)url error:(NSError **)error;
/* Reads array stored in NSPropertyList format from the specified url. */
+ (nullable NSArray<ObjectType> *)arrayWithContentsOfURL:(NSURL *)url error:(NSError **)error;
```


根据路径或者路径的url获取一个数组
把数组写入路径或url路径
```
+ (nullable NSArray<ObjectType> *)arrayWithContentsOfFile:(NSString *)path;
+ (nullable NSArray<ObjectType> *)arrayWithContentsOfURL:(NSURL *)url;
- (nullable NSArray<ObjectType> *)initWithContentsOfFile:(NSString *)path;
- (nullable NSArray<ObjectType> *)initWithContentsOfURL:(NSURL *)url;
- (BOOL)writeToFile:(NSString *)path atomically:(BOOL)useAuxiliaryFile;
- (BOOL)writeToURL:(NSURL *)url atomically:(BOOL)atomically;
```













