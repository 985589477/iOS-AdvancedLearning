/*
 总结一下Foundation框架常用的类
 NSObjCRuntime                           ✅
 NSAutoreleasePool                       ✅
 NSBundle                                ✅
 NSObject                                ✅
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
    [NSDictionary new];

}

- (NSInteger)sortMethod:(NSNumber *)obj1 obj2:(NSNumber *)obj2 {
    if (obj1.integerValue > obj2.integerValue) {
        return 1;
    } else if (obj1.integerValue < obj2.integerValue) {
        return -1;
    }
    return 0;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
