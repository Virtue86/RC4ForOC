//
//  ViewController.m
//  RC4Encrypt
//
//  Created by Virtue on 2018/11/7.
//  Copyright © 2018年 none. All rights reserved.
//

#import "ViewController.h"
#import "EPRc4CryptorManager.h"

@interface ViewController ()

@end

@implementation ViewController

// 获取随机key串
+ (NSString *)getRandomStrData {

    NSString *randomStr = [[NSString alloc]init];
    for (int i = 0; i < 16; i++) {
        int number = arc4random() % 36;
        if (number < 10) {
            int figure = arc4random() % 10;
            NSString *tempString = [NSString stringWithFormat:@"%d", figure];
            randomStr = [randomStr stringByAppendingString:tempString];
        }else {
            int figure = (arc4random() % 26) + 97;
            char character = figure;
            NSString *tempString = [NSString stringWithFormat:@"%c", character];
            randomStr = [randomStr stringByAppendingString:tempString];
        }
    }
    
    return randomStr;
}


- (void)viewDidLoad {
    [super viewDidLoad];

    NSString *rc4Key = [ViewController getRandomStrData];
    // 设置加密key体
    [[EPRc4CryptorManager shareInstance] setEncryptorWithKey:rc4Key];
    
    // 设置解密key体
    [[EPRc4CryptorManager shareInstance] setDecoryptorWithKey:rc4Key];
    
    // 假设一个服务器传输过来的加密体
    NSString *tempStr = @"hello word";
    NSData *tempData = [tempStr dataUsingEncoding:NSUTF8StringEncoding];
    
    // 加密
    NSData *encryptData = [[EPRc4CryptorManager shareInstance] encryptData:tempData];
    
    
    // 解密
    NSData *dencryptData = [[EPRc4CryptorManager shareInstance] dencryptData:encryptData];
    
    NSString *resultStr = [[NSString alloc] initWithData:dencryptData encoding:NSUTF8StringEncoding];
    
    NSLog(@"%@",resultStr);
    
}



@end
