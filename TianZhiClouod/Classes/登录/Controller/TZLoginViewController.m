//
//  TZLoginViewController.m
//  TianZhiClouod
//
//  Created by casic on 2018/11/1.
//  Copyright © 2018年 CASICloud. All rights reserved.
//

#import "TZLoginViewController.h"
#import "TZLoginInputView.h"
#import "LoginViewModel.h"

@interface TZLoginViewController ()

@property (nonatomic, strong) UIView * contentView;
//用户头像
@property (nonatomic, strong) UIImageView * avatarView;
//手机号
@property (nonatomic, strong) TZLoginInputView * accountInputView;

@property (nonatomic, strong) LoginViewModel * viewModel;

@end

@implementation TZLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self lan_setupSubViews];
    [self initCommand];
    self.title = @"登录";
}
#pragma mark - CLICK
- (void)lan_clickLoginBtn {
    [self.view endEditing:YES];
    [self.viewModel.loginActionCmd execute:nil];
}


#pragma mark - Delegate
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}
#pragma mark - RAC
- (void)initCommand {
    self.viewModel = [[LoginViewModel alloc]init];
    RAC(self.viewModel, mobile) = self.accountInputView.textField.rac_textSignal;
    [[self.viewModel.loginActionCmd.executing skip:1] subscribeNext:^(NSNumber * _Nullable x) {
        if ([x boolValue]) {
            MBProgressHUD *HUD = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
            HUD.label.text = @"正在验证手机号...";
        }else{
            [MBProgressHUD hideHUDForView:self.view animated:YES];
        }
    }];
    [[self.viewModel.loginActionCmd.executionSignals switchToLatest]subscribeNext:^(id  _Nullable x) {
        NSLog(@"返回数据：%@",x);
    }];
}
#pragma mark - UI
- (void)lan_setupSubViews {
    UIImageView *bgImageView = [[UIImageView alloc]initWithFrame:self.view.bounds];
    bgImageView.image = [UIImage imageNamed:@"login_background"];
    [self.view addSubview:bgImageView];
    bgImageView.userInteractionEnabled = YES;
    
    self.contentView = [[UIView alloc]initWithFrame:self.view.bounds];
    self.contentView.backgroundColor = [UIColor clearColor];
    [bgImageView addSubview:self.contentView];
    
    CGFloat offsetY = 42.0f;
    if([UIScreen mainScreen].bounds.size.height > 480) {
        offsetY = 100.0f;
    }
    //用户头像
    self.avatarView = [[UIImageView alloc]init];
    self.avatarView.layer.cornerRadius = 5;
    self.avatarView.layer.masksToBounds = YES;
    [self.contentView addSubview:self.avatarView];
    [self.avatarView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(offsetY);
        make.width.height.mas_equalTo(80);
        make.centerX.mas_equalTo(self.view);
    }];
    [self.avatarView sd_setImageWithURL:nil placeholderImage:[UIImage imageNamed:@"login_tip_logo"]];
    
    self.accountInputView = [[TZLoginInputView alloc]init];
    self.accountInputView.textField.placeholder = @"账号";
    self.accountInputView.textField.keyboardType = UIKeyboardTypeNumberPad;
    [self.contentView addSubview:self.accountInputView];
    [self.accountInputView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(13);
        make.top.mas_equalTo(self.avatarView.mas_bottom).mas_offset(49);
        make.right.mas_equalTo(-13);
        make.height.mas_equalTo(49);
    }];
    self.accountInputView.leftImageView.image = [UIImage imageNamed:@"phone"];
    self.accountInputView.rightImageView.image = [UIImage imageNamed:@"login_input_drop_down_v6"];
    
    UIButton *loginBtn = [[UIButton alloc]init];
    [loginBtn setTitle:@"下一步" forState:UIControlStateNormal];
    [loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [loginBtn addTarget:self action:@selector(lan_clickLoginBtn) forControlEvents:UIControlEventTouchUpInside];
    [loginBtn setBackgroundImage:[UIImage imageWithColor:UIColorFromRGB(0x2e9be6)] forState:UIControlStateNormal];
    [loginBtn setBackgroundImage:[UIImage imageWithColor:UIColorFromRGB(0x70b6ec)] forState:UIControlStateHighlighted];
    loginBtn.titleLabel.font = SYS_FONT(18);
    loginBtn.layer.cornerRadius = 4.0f;
    loginBtn.layer.masksToBounds = YES;
    [self.contentView addSubview:loginBtn];
    [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.accountInputView);
        make.right.mas_equalTo(self.accountInputView);
        make.top.mas_equalTo(self.accountInputView.mas_bottom).offset(30);
        make.height.mas_equalTo(self.accountInputView);
    }];
}
@end
