//
//  LogManager.m
//  photoPicker
//
//  Created by Chensh on 15/6/14.
//  Copyright (c) 2015年 Chensh. All rights reserved.
//

#import "LogManager.h"
#import <AdSupport/ASIdentifierManager.h>

#define FilePath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:@"app.log"]

@interface LogManager ()
{
    NSArray *arr;
}
@end

static LogManager *instance = nil;

@implementation LogManager

+ (id)defaultManager
{
    if (instance == nil) {
        instance = [[LogManager alloc]init];
        
        NSString *ad = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
//        openUDID = [OpenUDID value];
//        SecureUDID = [SecureUDID UDIDForDomain:SECUREUDID_DOMAIN usingKey:SECUREUDID_KEY];
        
//        KeychainItemWrapper *keychainItem = [[KeychainItemWrapper alloc]
//                                             2
//                                             initWithIdentifier:@"UUID"
//                                             3
//            http://blog.k-res.net/archives/1081.html                                 accessGroup:@"YOUR_BUNDLE_SEED.com.yourcompany.userinfo"];
//        4
//        NSString *strUUID = [keychainItem objectForKey:(id)kSecValueData];
//        5
//        if ([strUUID isEqualToString:@""])
//            6
//        {
//            7
//            CFUUIDRef uuidRef = CFUUIDCreate(kCFAllocatorDefault);
//            8
//            strUUID = (NSString *)CFUUIDCreateString (kCFAllocatorDefault,uuidRef);
//            9
//            [keychainItem setObject:strUUID forKey:(id)kSecValueData];
//            10
//        }
//        11
//        [FlurryAnalytics setUserID:strUUID];
//        12
//        [keychainItem release];

    }
    return instance;
}

- (void)checkFileExist
{
    
}

- (void)addPage:(NSString*)Page op:(NSString*)op
{
    
    NSDictionary *dict = @{@"page":Page,
                           @"op":op,
                           @"time":@12345678,
                           @"network":@"CMCC",
                           @"mobile":@1900000000,
                           @"uid":@123,
                           @"sid":@12312313435};
    NSDictionary *opDict = @{@"user_operation":dict};
    NSData *data = [NSJSONSerialization dataWithJSONObject:opDict options:0 error:nil];
    NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"str:%@" ,str);
    [self writeToFileWithStr:str];
}

- (void)writeToFileWithStr:(NSString*)str
{
    NSString *newStr = [str stringByAppendingString:@","];

    NSString *filePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:@"app.log"];
    
    NSFileHandle  *outFile;
    
    outFile = [NSFileHandle fileHandleForWritingAtPath:filePath];
    [outFile seekToEndOfFile];
    [outFile writeData:[newStr dataUsingEncoding:NSUTF8StringEncoding]];
}

- (void)uploadFile
{
    NSString *str = [NSString stringWithContentsOfFile:FilePath encoding:NSUTF8StringEncoding error:nil];
    [self clearFile];
    if ([[str substringFromIndex:str.length - 1] isEqualToString:@","]) {
        str = [str substringToIndex:str.length - 1];
    }
    str = [NSString stringWithFormat:@"[%@]", str];
//    NSLog(@"str:\n%@", str);
    //
    NSArray *arr = [NSJSONSerialization JSONObjectWithData:[str dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:nil];
    NSLog(@"arr:\n%@",arr);
}

- (void)clearFile
{
    [@"" writeToFile:FilePath atomically:YES encoding:NSUTF8StringEncoding error:nil];
}




@end
