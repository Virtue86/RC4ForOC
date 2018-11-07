//
//  EPRC4Cryptor.h


#import <Foundation/Foundation.h>

@interface EPRC4Cryptor : NSObject

-(instancetype)initWith:(UInt8 *)key lenght:(int)lenght;

-(void)doFinal:(UInt8 *)cipher input:(UInt8 *)input lenght:(int)lenght;

+ (void)byteArr:(UInt8 *)array forString:(NSString *)string;


@end
