# NSSet

NSSet  OC提供的一个无序集合，此集合只能存放不同数据对象，如果存放2个或多个相同对象，只会保留一个，比如@1 @2 @3 
有的人会奇怪 字符串@"1" @"1" 看似相等，但是 @"" 只是一个便利构造的方式一个语法糖，本质还是 NSString，为什么构造了2个@"1"却一致
是因为内存优化中有一个技术叫做'字符串驻留'技术，它允许相同的字符串从一个内存地址上引用，所以相等
NSSet 比较的是内存地址，同NSDictionary一样，同样使用hash表技术，散列算法查找

```
//如果对象在集合中存在，则返回一个与对象相等的对象，否则返回nil
- (nullable ObjectType)member:(ObjectType)object;
//同样的集合那实习了遍历类Enumerator
- (NSEnumerator<ObjectType> *)objectEnumerator;
- (instancetype)init NS_DESIGNATED_INITIALIZER;
//通过C类型初始化一个NSSet对象，需要传入个数
- (instancetype)initWithObjects:(const ObjectType _Nonnull [_Nullable])objects count:(NSUInteger)cnt NS_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder NS_DESIGNATED_INITIALIZER;
```

在NSSet的扩展方法中，提供了一些便利构造方法 这里就不多叙述了
```
+ (instancetype)set;
+ (instancetype)setWithObject:(ObjectType)object;
+ (instancetype)setWithObjects:(const ObjectType _Nonnull [_Nonnull])objects count:(NSUInteger)cnt;
+ (instancetype)setWithObjects:(ObjectType)firstObj, ... NS_REQUIRES_NIL_TERMINATION;
+ (instancetype)setWithSet:(NSSet<ObjectType> *)set;
+ (instancetype)setWithArray:(NSArray<ObjectType> *)array;
```

其中其他的扩展提供了常用的方法属性
```
//从set中返回一个随机值
- (nullable ObjectType)anyObject;
//判断该对象是否存在于Set中
- (BOOL)containsObject:(ObjectType)anObject;
//打印方法
@property (readonly, copy) NSString *description;
- (NSString *)descriptionWithLocale:(nullable id)locale;
//判断两个set是否存在交集
- (BOOL)intersectsSet:(NSSet<ObjectType> *)otherSet;
//判断两个set集合是否相等
- (BOOL)isEqualToSet:(NSSet<ObjectType> *)otherSet;
//判断一个set调用者是否是传入set的子集，可以理解为 set是otherSet的子集为YES
- (BOOL)isSubsetOfSet:(NSSet<ObjectType> *)otherSet;
```

这两个方法在Swift中已经被标记不可用，在OC中可以使用，作用是set调用此方法，向集合那的每一个对象发送一条消息调用某方法，实际用处很小
```
- (void)makeObjectsPerformSelector:(SEL)aSelector NS_SWIFT_UNAVAILABLE("Use enumerateObjectsUsingBlock: or a for loop instead");
- (void)makeObjectsPerformSelector:(SEL)aSelector withObject:(nullable id)argument NS_SWIFT_UNAVAILABLE("Use enumerateObjectsUsingBlock: or a for loop instead");
```

对集合那追加数据，注意NSSet为不可变对象，所以追加后会重新返回一个NSSet对象需要接收
```
- (NSSet<ObjectType> *)setByAddingObject:(ObjectType)anObject;
- (NSSet<ObjectType> *)setByAddingObjectsFromSet:(NSSet<ObjectType> *)other;
- (NSSet<ObjectType> *)setByAddingObjectsFromArray:(NSArray<ObjectType> *)other;
```

对集合那的数据进行遍历
```
- (void)enumerateObjectsUsingBlock:(void (NS_NOESCAPE ^)(ObjectType obj, BOOL *stop))block;
- (void)enumerateObjectsWithOptions:(NSEnumerationOptions)opts usingBlock:(void (NS_NOESCAPE ^)(ObjectType obj, BOOL *stop))block;
```

对集合内的数据进行条件筛选，符合条件的组成新集合
```
- (NSSet<ObjectType> *)objectsPassingTest:(BOOL (NS_NOESCAPE ^)(ObjectType obj, BOOL *stop))predicate;
- (NSSet<ObjectType> *)objectsWithOptions:(NSEnumerationOptions)opts passingTest:(BOOL (NS_NOESCAPE ^)(ObjectType obj, BOOL *stop))predicate;
``












