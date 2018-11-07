//
//  EPRc4CryptorManager.h


#import <Foundation/Foundation.h>


/**
 rc4加密管理，加密解密两个对象分开
 */
@interface EPRc4CryptorManager : NSObject
+ (instancetype)shareInstance;

+ (void)releaseInstance;
/**
 设置加密实例

 @param key key
 */
- (void)setEncryptorWithKey:(NSString *)key;
/**
 设置解密实例
 
 @param key key
 */
- (void)setDecoryptorWithKey:(NSString *)key;

/**
 加密data
 @param data 输入
 @return 输出
 */
- (NSData *)encryptData:(NSData *)data;
/**
 解密data
 
 @param data 输入
 @return 输出
 */
- (NSData *)dencryptData:(NSData *)data;
@end
