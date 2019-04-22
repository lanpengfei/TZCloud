//
//  TZLoginInputView.m
//  TianZhiClouod
//
//  Created by casic on 2019/4/15.
//  Copyright © 2019 CASICloud. All rights reserved.
//

#import "TZLoginInputView.h"
@interface TZLoginInputView ()


@end

@implementation TZLoginInputView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.backgroundColor = [UIColor clearColor];
        [self addSubview:self.textField];
        [self addSubview:self.lineView];
        
        [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(self);
        }];
        [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.mas_equalTo(self);
            make.height.mas_equalTo(1);
        }];
    }
    return self;
}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [[UIView alloc]init];
        _lineView.backgroundColor = UIColorFromRGB(0xe5e5e5);
    }
    return _lineView;
}
- (UITextField *)textField {
    if (!_textField) {
        _textField = [[JVFloatLabeledTextField alloc]init];
        _textField.font = [UIFont systemFontOfSize:15];
        _textField.borderStyle = UITextBorderStyleNone;
        //保证输入时文字和左边图片在同意水平线上
        _textField.keepBaseline = YES;
        _textField.placeholderYPadding = -13;
    }
    return _textField;
}
- (UIImageView *)leftImageView
{
    if (!_leftImageView)
    {
        _leftImageView = [[UIImageView alloc]init];
        _leftImageView.contentMode = UIViewContentModeCenter;
        [self addSubview:_leftImageView];
        [_leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.bottom.mas_equalTo(0);
            make.width.mas_equalTo(30);
        }];
        [self.textField mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(30);
        }];
    }
    return _leftImageView;
}
- (UIImageView *)rightImageView
{
    if (!_rightImageView)
    {
        _rightImageView = [[UIImageView alloc]init];
        _rightImageView.contentMode = UIViewContentModeCenter;
        [self addSubview:_rightImageView];
        [_rightImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.top.bottom.mas_equalTo(0);
            make.width.mas_equalTo(30);
        }];
        [self.textField mas_updateConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-30);
        }];
    }
    return _rightImageView;
}
@end

