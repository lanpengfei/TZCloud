//
//  TZLoginInputView.h
//  TianZhiClouod
//
//  Created by casic on 2019/4/15.
//  Copyright © 2019 CASICloud. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JVFloatLabeledTextField.h"

NS_ASSUME_NONNULL_BEGIN

@interface TZLoginInputView : UIView

@property (nonatomic,strong) JVFloatLabeledTextField * textField;

@property (nonatomic,strong) UIImageView * leftImageView;

@property (nonatomic,strong) UIImageView * rightImageView;

@property (nonatomic,strong) UIView * lineView;

@end

NS_ASSUME_NONNULL_END
