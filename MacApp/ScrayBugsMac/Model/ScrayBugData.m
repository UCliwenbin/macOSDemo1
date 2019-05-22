//
//  ScrayBugsMac.m
//  MacApp
//
//  Created by mac on 2019/5/20.
//  Copyright © 2019年 lwb. All rights reserved.
//

#import "ScrayBugData.h"

@implementation ScrayBugData


- (instancetype)initWithTitle:(NSString *)title rating:(CGFloat)rating {
    self = [super init];
    if (self) {
        self.title = title;
        self.rating = rating;
    }
    return self;
}

@end
