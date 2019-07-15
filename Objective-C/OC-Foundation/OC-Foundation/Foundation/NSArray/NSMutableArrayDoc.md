#  NSMutableArray

NSMutableArray是OC提供的可变数组，继承自NSArray
###为什么要有NSMutableArray？
因为NSArray是一个不可变对象，一旦初始化就无法动态的append或者add，只能重新开辟一段内存取存储append之后的数组，而NSMutableArray则是提供了操作源对象的增删改

```
//添加多个数据到数组中,将otherArray按照顺序追加到当前数组中
- (void)addObjectsFromArray:(NSArray<ObjectType> *)otherArray;
//交互该数组指定两个下标的数据位置
- (void)exchangeObjectAtIndex:(NSUInteger)idx1 withObjectAtIndex:(NSUInteger)idx2;
//移除数组内全部数据
- (void)removeAllObjects;
//如果object在指定的范围内，则移除
- (void)removeObject:(ObjectType)anObject inRange:(NSRange)range;
//移除数组内该条数据
- (void)removeObject:(ObjectType)anObject;
//根据指针移除
- (void)removeObjectIdenticalTo:(ObjectType)anObject inRange:(NSRange)range;
- (void)removeObjectIdenticalTo:(ObjectType)anObject;

//移除该数组内 在otherArray存在的数据
- (void)removeObjectsInArray:(NSArray<ObjectType> *)otherArray;
//移除范围内对象
- (void)removeObjectsInRange:(NSRange)range;
//删除掉指定范围数据，替换一个数组到指定range
- (void)replaceObjectsInRange:(NSRange)range withObjectsFromArray:(NSArray<ObjectType> *)otherArray range:(NSRange)otherRange;
//替换数组到指定位置
- (void)replaceObjectsInRange:(NSRange)range withObjectsFromArray:(NSArray<ObjectType> *)otherArray;
- (void)setArray:(NSArray<ObjectType> *)otherArray;
- (void)sortUsingFunction:(NSInteger (NS_NOESCAPE *)(ObjectType,  ObjectType, void * _Nullable))compare context:(nullable void *)context;
- (void)sortUsingSelector:(SEL)comparator;

//下标插入批量数据
- (void)insertObjects:(NSArray<ObjectType> *)objects atIndexes:(NSIndexSet *)indexes;
//下标移除批量数据
- (void)removeObjectsAtIndexes:(NSIndexSet *)indexes;
//下标替换批量数据
- (void)replaceObjectsAtIndexes:(NSIndexSet *)indexes withObjects:(NSArray<ObjectType> *)objects;

- (void)setObject:(ObjectType)obj atIndexedSubscript:(NSUInteger)idx API_AVAILABLE(macos(10.8), ios(6.0), watchos(2.0), tvos(9.0));

- (void)sortUsingComparator:(NSComparator NS_NOESCAPE)cmptr API_AVAILABLE(macos(10.6), ios(4.0), watchos(2.0), tvos(9.0));
- (void)sortWithOptions:(NSSortOptions)opts usingComparator:(NSComparator NS_NOESCAPE)cmptr API_AVAILABLE(macos(10.6), ios(4.0),
```

