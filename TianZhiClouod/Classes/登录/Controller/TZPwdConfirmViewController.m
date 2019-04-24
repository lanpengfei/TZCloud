//
//  TZPwdConfirmViewController.m
//  TianZhiClouod
//
//  Created by casic on 2019/4/23.
//  Copyright © 2019 CASICloud. All rights reserved.
//

#import "TZPwdConfirmViewController.h"
#import "TZLoginInputView.h"
#import "TZLoginViewModel.h"

@interface TZPwdConfirmViewController ()

@property (nonatomic, strong) UIView * contentView;
//用户头像
@property (nonatomic, strong) UIImageView * avatarView;
//手机号
@property (nonatomic, strong) TZLoginInputView * accountInputView;

@property (nonatomic, strong) TZLoginViewModel * viewModel;

@end

@implementation TZPwdConfirmViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"输入密码";
    [self lan_setupSubViews];
    [self initCommand];
}
#pragma mark - CLICK

/**
 点击登录按钮
 */
- (void)lan_clickLoginBtn {
    [self.view endEditing:YES];
    [self.viewModel.loginActionCmd execute:nil];
}

/**
 点击返回
 */
- (void)goBack {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Delegate
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}
#pragma mark - RAC
- (void)initCommand {
    self.viewModel = [[TZLoginViewModel alloc]init];
    RAC(self.viewModel, password) = self.accountInputView.textField.rac_textSignal;
    //    [[self.viewModel.loginActionCmd.executing skip:1] subscribeNext:^(NSNumber * _Nullable x) {
    //        if ([x boolValue]) {
    //            MBProgressHUD *HUD = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    //            HUD.label.text = @"正在验证手机号...";
    //        }else{
    //            [MBProgressHUD hideHUDForView:self.view animated:YES];
    //        }
    //    }];
    [[self.viewModel.loginActionCmd.executionSignals switchToLatest]subscribeNext:^(id  _Nullable x) {
        
    }];
}
#pragma mark - UI
- (void)lan_setupSubViews {
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"返回" forState:UIControlStateNormal];
    [button.titleLabel setFont:[UIFont systemFontOfSize:16]];
    [button setTitleColor:UIColorFromRGB(0x3CBAFF) forState:UIControlStateNormal];
    [button setTitleColor:UIColorFromRGB(0xDFEBF2) forState:UIControlStateHighlighted];
    [button setImage:[[UIImage imageNamed:@"nav_btn_back_light_normal"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 15, 0, 0)] forState:UIControlStateNormal];
    [button setImage:[[UIImage imageNamed:@"nav_btn_back_light_highlight"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 15, 0, 0)] forState:UIControlStateHighlighted];
    [button addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
    [button setTitleEdgeInsets:UIEdgeInsetsMake(0, -9, 0, 9)];
    [button setImageEdgeInsets:UIEdgeInsetsMake(0, -11, 0, 11)];
    [button sizeToFit];
    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = leftBarButtonItem;
    
    
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
    self.accountInputView.textField.placeholder = @"请输入密码";
    self.accountInputView.textField.secureTextEntry = YES;
    self.accountInputView.textField.keyboardType = UIKeyboardTypeASCIICapable;
    self.accountInputView.textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    [self.contentView addSubview:self.accountInputView];
    [self.accountInputView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(13);
        make.top.mas_equalTo(self.avatarView.mas_bottom).mas_offset(49);
        make.right.mas_equalTo(-13);
        make.height.mas_equalTo(49);
    }];
    self.accountInputView.leftImageView.image = [UIImage imageNamed:@"pwd"];
    
    UIButton *loginBtn = [[UIButton alloc]init];
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
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
