//
//  LogManager.h
//  photoPicker
//
//  Created by Chensh on 15/6/14.
//  Copyright (c) 2015年 Chensh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LogManager : NSObject


+ (id)defaultManager;
- (void)addPage:(NSString*)Page op:(NSString*)op;
- (void)uploadFile;
@end
