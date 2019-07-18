# NSMutableSet


NSMutableSet继承自NSSet，是一个可变对象，操作集合数据可以在同一个集合对象上修改
NSMutableSet提供了对不同NSSet实现添加，交集，并集，差集的处理

```
//添加数据  移除数据
- (void)addObject:(ObjectType)object;
- (void)removeObject:(ObjectType)object;

//添加一个数组到集合中
- (void)addObjectsFromArray:(NSArray<ObjectType> *)array;
//交集 将otherSet和本集合那进行比较，数据相同部分保留
- (void)intersectSet:(NSSet<ObjectType> *)otherSet;
//差集 将otherSet那与本set内的数据比较，数据不同的部分保留
- (void)minusSet:(NSSet<ObjectType> *)otherSet;
//移除所有对象
- (void)removeAllObjects;
//并集 将otherSet内与本set那的所有数据保留，相同的部分只保留一个
- (void)unionSet:(NSSet<ObjectType> *)otherSet;
- (void)setSet:(NSSet<ObjectType> *)otherSet;
```