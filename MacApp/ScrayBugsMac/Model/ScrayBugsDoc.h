//
//  ScrayBugData.h
//  MacApp
//
//  Created by mac on 2019/5/20.
//  Copyright © 2019年 lwb. All rights reserved.
//

#import <Foundation/Foundation.h>



@class ScrayBugData;

@interface ScrayBugsDoc : NSObject

@property (nonatomic, strong) ScrayBugData *data;
@property (nonatomic, strong) NSImage *thumbImage;   //缩略图
@property (nonatomic, strong) NSImage *fullImage;   //全尺寸图

- (instancetype)initWithTitle:(NSString *)title rating:(CGFloat)rating thumbImage:(NSImage *)thumbImage fullImage:(NSImage *)fullImage;

@end


