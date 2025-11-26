//
//  ExpenseParserObjC.m
//  ExpenseViewer
//

#import "ExpenseParserObjC.h"
#import "ConstantsObjC.h"

@implementation ExpenseParserObjC

- (nullable NSArray<NSDictionary *> *)parseData:(NSData *)data
                                          error:(NSError * _Nullable * _Nullable)error {

    if (!data) {
        if (error) {
            *error = [NSError errorWithDomain:ConstantsObjC.errorDomain
                                         code:ConstantsObjC.errorNoData
                                     userInfo:@{
                NSLocalizedDescriptionKey : ConstantsObjC.errorMessageNoData
            }];
        }
        return nil;
    }

    //JSON parsing
    NSError *jsonErr = nil;
    id json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonErr];

    //Invalid JSON or type mismatch
    if (jsonErr || ![json isKindOfClass:[NSArray class]]) {
        if (error) {
            *error = [NSError errorWithDomain:ConstantsObjC.errorDomain
                                         code:ConstantsObjC.errorInvalidFormat
                                     userInfo:@{
                NSLocalizedDescriptionKey : ConstantsObjC.errorMessageExpectedArray
            }];
        }
        return nil;
    }

    return (NSArray *)json;
}

@end
