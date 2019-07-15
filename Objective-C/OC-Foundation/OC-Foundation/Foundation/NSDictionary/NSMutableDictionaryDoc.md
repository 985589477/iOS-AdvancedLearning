# NSMutableDictionary

和数组一样，字典也分为可变与不可变类型

同样 基于同一对象修改与非用一对象修改

NSMutableDictionary可以灵活的对数据做增删改操作

```
//添加一个字典到当前字典中
- (void)addEntriesFromDictionary:(NSDictionary<KeyType, ObjectType> *)otherDictionary;
//移除字典内的全部对象
- (void)removeAllObjects;
//移除掉字典中对应的key value，可以是多个，也可以是一个
- (void)removeObjectsForKeys:(NSArray<KeyType> *)keyArray;
- (void)setDictionary:(NSDictionary<KeyType, ObjectType> *)otherDictionary;
//根据key设置值
- (void)setObject:(nullable ObjectType)obj forKeyedSubscript:(KeyType <NSCopying>)key API_AVAILABLE(macos(10.8), ios(6.0), watchos(2.0), tvos(9.0));
```

从路径或者URL获取字典对象
```
+ (nullable NSMutableDictionary<KeyType, ObjectType> *)dictionaryWithContentsOfFile:(NSString *)path;
+ (nullable NSMutableDictionary<KeyType, ObjectType> *)dictionaryWithContentsOfURL:(NSURL *)url;
- (nullable NSMutableDictionary<KeyType, ObjectType> *)initWithContentsOfFile:(NSString *)path;
- (nullable NSMutableDictionary<KeyType, ObjectType> *)initWithContentsOfURL:(NSURL *)url;
```
