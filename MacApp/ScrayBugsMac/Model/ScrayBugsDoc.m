//
//  ScrayBugData.m
//  MacApp
//
//  Created by mac on 2019/5/20.
//  Copyright © 2019年 lwb. All rights reserved.
//

#import "ScrayBugsDoc.h"
#import "ScrayBugData.h"

@implementation ScrayBugsDoc

- (instancetype)initWithTitle:(NSString *)title rating:(CGFloat)rating thumbImage:(NSImage *)thumbImage fullImage:(NSImage *)fullImage {
    self = [super init];
    if (self) {
        self.data = [[ScrayBugData alloc] initWithTitle:title rating:rating];
        self.thumbImage = thumbImage;
        self.fullImage = fullImage;
        
    }
    return self;
}

@end
