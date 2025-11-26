//
//  ConstantsObjC.h
//  ExpenseViewer
//
//  Created by Ayesha Fatima on 26/11/25.
//

#import <Foundation/Foundation.h>

@interface ConstantsObjC : NSObject

@property (class, nonatomic, readonly) NSString *errorDomain;
@property (class, nonatomic, readonly) NSInteger errorNoData;
@property (class, nonatomic, readonly) NSInteger errorInvalidFormat;
@property (class, nonatomic, readonly) NSString *errorMessageNoData;
@property (class, nonatomic, readonly) NSString *errorMessageExpectedArray;

@end
