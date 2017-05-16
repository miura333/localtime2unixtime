//
//  main.m
//  localtime2unixtime
//
//  Created by miura on 2017/04/20.
//  Copyright © 2017年 miura. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        const char *hoge = argv[1];
        if(hoge == NULL) {
            printf("usage yyyy-MM-dd HH:mm:ss\n");
            return 0;
        }
        NSString *dateStr = [NSString stringWithUTF8String:hoge];
        
        NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        [formatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:60*60*9]];
        NSDate *date = [formatter dateFromString:dateStr];
        long unixTime = [date timeIntervalSince1970];
        printf("%ld\n", unixTime);
    }
    return 0;
}
