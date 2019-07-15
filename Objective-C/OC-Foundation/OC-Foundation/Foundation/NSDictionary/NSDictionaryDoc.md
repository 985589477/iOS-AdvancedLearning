#  NSDictionary

####NSDictionary是OC提供的一个无序集合，主要以键值对形式存在，每一个key都对应一个value,其中key为唯一标示，value可以重复，如果使用同样key，则会覆盖


```
//获取NSDictionary中有多少个键值对
@property (readonly) NSUInteger count;
//根据key获取对应的value 写法 id value = dictionary[@"key"];
- (nullable ObjectType)objectForKey:(KeyType)aKey;
//把字典内的Key数组转化为NSEnumerator对象
- (NSEnumerator<KeyType> *)keyEnumerator;
//构造函数
- (instancetype)init NS_DESIGNATED_INITIALIZER;
//初始化一个字典，前面是value数组，对应key数组，一共有几个，注意 key与value要对应顺序,value 不能为nil
- (instancetype)initWithObjects:(const ObjectType _Nonnull [_Nullable])objects forKeys:(const KeyType <NSCopying> _Nonnull [_Nullable])keys count:(NSUInteger)cnt NS_DESIGNATED_INITIALIZER;
```

以上是NSDictionary提供的基础属性和方法，具体实用的都写在扩展中
```
//字典对应的key数组
@property (readonly, copy) NSArray<KeyType> *allKeys;
//取出字典内统一对象所对应的所有key， 因为字典中每一个key对应一个对象，一个对象可以被多个key同时存储，所以一个对象可能取出多个key
- (NSArray<KeyType> *)allKeysForObject:(ObjectType)anObject;
//取出字典中所有的value
@property (readonly, copy) NSArray<ObjectType> *allValues;

@property (readonly, copy) NSString *description;
@property (readonly, copy) NSString *descriptionInStringsFileFormat;
- (NSString *)descriptionWithLocale:(nullable id)locale;
- (NSString *)descriptionWithLocale:(nullable id)locale indent:(NSUInteger)level;

//判断两个字典是否一致
- (BOOL)isEqualToDictionary:(NSDictionary<KeyType, ObjectType> *)otherDictionary;
//获得一个由value组成的NSEnumerator数组
- (NSEnumerator<ObjectType> *)objectEnumerator;
//根据key获取value，如果获取不到，则使用 macker对象代替
- (NSArray<ObjectType> *)objectsForKeys:(NSArray<KeyType> *)keys notFoundMarker:(ObjectType)marker;


//对NSDictionary的key排序
- (NSArray<KeyType> *)keysSortedByValueUsingSelector:(SEL)comparator;

//根据key取值
- (nullable ObjectType)objectForKeyedSubscript:(KeyType)key;

//对字典内的对象进行排序，主要实现是对key数组排序
- (void)enumerateKeysAndObjectsUsingBlock:(void (NS_NOESCAPE ^)(KeyType key, ObjectType obj, BOOL *stop))block;
- (void)enumerateKeysAndObjectsWithOptions:(NSEnumerationOptions)opts usingBlock:(void (NS_NOESCAPE ^)(KeyType key, ObjectType obj, BOOL *stop))block API_AVAILABLE(macos(10.6), ios(4.0), watchos(2.0), tvos(9.0));

//有返回值的排序方法，同理
- (NSArray<KeyType> *)keysSortedByValueUsingComparator:(NSComparator NS_NOESCAPE)cmptr API_AVAILABLE(macos(10.6), ios(4.0), watchos(2.0), tvos(9.0));
- (NSArray<KeyType> *)keysSortedByValueWithOptions:(NSSortOptions)opts usingComparator:(NSComparator NS_NOESCAPE)cmptr API_AVAILABLE(macos(10.6), ios(4.0), watchos(2.0), tvos(9.0));

//根据条件对NSDictionary进行筛选并且转化为NSSet类型
- (NSSet<KeyType> *)keysOfEntriesPassingTest:(BOOL (NS_NOESCAPE ^)(KeyType key, ObjectType obj, BOOL *stop))predicate;
- (NSSet<KeyType> *)keysOfEntriesWithOptions:(NSEnumerationOptions)opts passingTest:(BOOL (NS_NOESCAPE ^)(KeyType key, ObjectType obj, BOOL *stop))predicate;
```