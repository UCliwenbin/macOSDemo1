//
//  ScrayBugsMac.h
//  MacApp
//
//  Created by mac on 2019/5/20.
//  Copyright © 2019年 lwb. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ScrayBugData : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) CGFloat rating;

- (instancetype)initWithTitle:(NSString *)title rating:(CGFloat)rating;

@end

NS_ASSUME_NONNULL_END
