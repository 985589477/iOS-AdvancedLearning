/*
 总结一下Foundation框架常用的类
 NSObjCRuntime                           ✅
 NSAutoreleasePool
 NSBundle
 
 NSObject
 NSArray
 NSSet
 NSDictionary
 
 NSString
 NSCharacterSet
 NSCoder
 NSData
 NSDate
 NSCalendar
 NSDateInterval
 NSDateFormatter
 NSDateIntervalFormatter
 NSISO8601DateFormatter
 NSMassFormatter
 NSLengthFormatter
 NSEnergyFormatter
 NSMeasurement
 NSMeasurementFormatter
 NSPersonNameComponents
 NSPersonNameComponentsFormatter
 NSDecimal
 NSDecimalNumber
 NSEnumerator
 NSError
 NSException
 NSFileHandle
 NSFileManager
 NSFormatter
 NSHashTable
 NSHTTPCookie
 NSHTTPCookieStorage
 NSIndexPath
 NSIndexSet
 NSInvocation
 NSJSONSerialization
 NSKeyValueCoding
 NSKeyValueObserving
 NSKeyedArchiver
 NSLocale
 NSLock
 NSMapTable
 NSMethodSignature
 NSNotification
 NSNotificationQueue
 NSNull
 NSNumberFormatter

 NSOperation
 NSOrderedSet
 NSOrthography
 NSPathUtilities
 NSPointerArray
 NSPointerFunctions
 NSPort
 NSProcessInfo
 NSPropertyList
 NSProxy
 NSRange
 NSRegularExpression
 NSRunLoop
 NSScanner
 
 NSSortDescriptor
 NSStream
 NSTextCheckingResult
 NSThread
 NSTimeZone
 NSTimer 
 NSUnit
 NSURL
 NSURLAuthenticationChallenge
 NSURLCache
 NSURLConnection
 NSURLCredential
 NSURLCredentialStorage
 NSURLError
 NSURLProtectionSpace
 NSURLProtocol
 NSURLRequest
 NSURLResponse
 NSUserDefaults
 NSValue
 NSValueTransformer
 NSXMLParser
 NSXPCConnection
 NSZone
 
 NSArchiver
 NSBackgroundActivityScheduler
 NSCalendarDate
 NSConnection
 NSDistantObject
 NSDistributedNotificationCenter
 NSGeometry
 NSPortCoder
 NSPortMessage
 NSPortNameServer
 NSProtocolChecker
 NSTask
 NSXMLDTD
 NSXMLDTDNode
 NSXMLDocument
 NSXMLElement
 NSXMLNode
 NSXMLNodeOptions
 NSURLDownload
 NSURLHandle
 
 NSAffineTransform
 NSAppleEventDescriptor
 NSAppleEventManager
 NSAppleScript
 NSClassDescription
 NSDistributedLock
 NSGarbageCollector
 NSHFSFileTypes
 NSHost
 NSObjectScripting
 NSScriptClassDescription
 NSScriptCoercionHandler
 NSScriptCommand
 NSScriptCommandDescription
 NSScriptExecutionContext
 NSScriptKeyValueCoding
 NSScriptObjectSpecifiers
 NSScriptStandardSuiteCommands
 NSScriptSuiteRegistry
 NSScriptWhoseTests
 NSSpellServer
 NSUserNotification
 NSUserScriptTask
 */

#import "ViewController.h"
#import <Foundation/Foundation.h>


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
NSBundle *bud = [NSBundle bundleForClass:[self class]];
    
    

}

//– (id)findMatchingObject:(id)anObject {
//    id match;
//    while (match == nil) {
//        @autoreleasepool {
//            // Do a search that creates a lot of temporary objects.
//            match = [self expensiveSearchForObject:anObject];
//            if (match != nil) {
//                [match retain]; /* Keep match around. */
//            }
//        }
//    }
//    return [match autorelease]; /* Let match go and return it. */
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
