//
//  ExpenseParserObjC.h
//  ExpenseViewer
//
//  Created by Ayesha Fatima on 25/11/25.
//

#import <Foundation/Foundation.h>

@interface ExpenseParserObjC : NSObject

- (nullable NSArray<NSDictionary *> *)parseData:(NSData *_Nullable)data
                                          error:(NSError * _Nullable * _Nullable)error
    NS_SWIFT_NAME(parse(data:));

@end

