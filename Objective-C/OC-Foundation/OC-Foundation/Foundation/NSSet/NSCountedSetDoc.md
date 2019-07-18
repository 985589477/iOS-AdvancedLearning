#  NSCountedSet

NSCountedSet主要是用来计数使用，基本很少使用，他和NSSet NSMutableSet一样，不能存储重复数据，只会对其计数

```
- (instancetype)initWithCapacity:(NSUInteger)numItems NS_DESIGNATED_INITIALIZER;

//构造方法
- (instancetype)initWithArray:(NSArray<ObjectType> *)array;
- (instancetype)initWithSet:(NSSet<ObjectType> *)set;

//计算该对象在集合那存在过几次，比如 @"1" @"2" @"3" @"1" ，其中 @"1" 的返回个数为2
- (NSUInteger)countForObject:(ObjectType)object;

以下属性在其他Set中有过
- (NSEnumerator<ObjectType> *)objectEnumerator;
- (void)addObject:(ObjectType)object;
- (void)removeObject:(ObjectType)object;
```
