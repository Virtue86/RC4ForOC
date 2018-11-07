//
//  EPRc4CryptorManager.m

#import "EPRc4CryptorManager.h"
#import "EPRC4Cryptor.h"


@implementation EPRc4CryptorManager {
    EPRC4Cryptor *_RC4Encryptor; // 加密
    EPRC4Cryptor *_RC4Dencryptor; // 解密
    
}
static EPRc4CryptorManager *manager = nil;
+ (instancetype)shareInstance {
    @synchronized(self)
    {
        if (!manager) {
            manager = [[super allocWithZone:NULL] init];
        }
    }
    
    return manager;
}

+ (void)releaseInstance
{
    @synchronized (self)
    {
        if (manager != nil)
        {
            manager = nil;
            
        }
    }
}

- (void)dealloc {
    
    _RC4Encryptor =nil;
    _RC4Dencryptor = nil;
}

- (void)setEncryptorWithKey:(NSString *)key {
    UInt8 *keyByte = malloc(key.length);
    [EPRC4Cryptor byteArr:(UInt8*)keyByte forString:key];
    
    _RC4Encryptor = [[EPRC4Cryptor alloc] initWith:keyByte lenght:(int)key.length];
}

- (void)setDecoryptorWithKey:(NSString *)key {
    UInt8 *keyByte = malloc(key.length);
    [EPRC4Cryptor byteArr:(UInt8*)keyByte forString:key];
    _RC4Dencryptor = [[EPRC4Cryptor alloc] initWith:keyByte lenght:(int)key.length];
}

- (NSData *)encryptData:(NSData *)data {
    if (!_RC4Encryptor) {
        NSLog( @"encryptData but _RC4encryptor 为 nil");

        return nil;
    }

    int length = (int)data.length;
    UInt8 *input = (UInt8*)[data bytes];

    UInt8* tempTemp = (UInt8*)malloc(length);
    [_RC4Encryptor doFinal:tempTemp input:input lenght:length];

    return [NSData dataWithBytes:tempTemp length:length];
}

- (NSData *)dencryptData:(NSData *)data {
    if (!_RC4Dencryptor) {
        NSLog(@"dencryptData but _RC4Dencryptor 为 nil");
        return nil;
    }
    int length = (int)data.length;
    UInt8* tempTemp = (UInt8*)malloc(length);
    [_RC4Dencryptor doFinal:tempTemp input:(UInt8*)[data bytes] lenght:length];
    return [NSData dataWithBytes:tempTemp length:length];
}
@end
