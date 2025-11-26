//
//  ConstantsObjC.m
//  ExpenseViewer
//
//  Created by Ayesha Fatima on 26/11/25.
//

#import "ConstantsObjC.h"

@implementation ConstantsObjC

+ (NSString *)errorDomain { return @"ExpenseParserObjC"; }
+ (NSInteger)errorNoData { return 100; }
+ (NSInteger)errorInvalidFormat { return 101; }
+ (NSString *)errorMessageNoData { return @"No data"; }
+ (NSString *)errorMessageExpectedArray { return @"Expected array"; }

@end
