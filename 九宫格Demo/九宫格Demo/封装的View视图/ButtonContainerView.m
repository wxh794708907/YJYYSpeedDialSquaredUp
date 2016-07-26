//
//  ButtonContainerView.m
//  chemuchao
//
//  Created by 遇见远洋 on 16/3/7.
//  Copyright © 2016年 zhaoxiaolu. All rights reserved.
//

#import "ButtonContainerView.h"
#import "UIView+Extension.h"
//状态栏高度
#define kStateHeight 20

//总行数
#define kRows 4

//总列数
#define kCols 4

//九宫格个数
#define kCount 16

//九宫格之间的间隙
#define kMargin 5

//字体大小
#define kFont15 [UIFont systemFontOfSize:15]

@interface ButtonContainerView ()
@property (nonatomic,strong)NSMutableArray * btns;
@property (nonatomic,strong)NSArray * btnTitles;

@end
@implementation ButtonContainerView

- (NSMutableArray *)btns
{
    if (!_btns) {
        _btns = [NSMutableArray array];
    }
    return _btns;
}


- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    for (int i = 0; i < kCount; i++) {
        UIButton * btn = [[UIButton alloc]init];
        [btn setTitle:[NSString stringWithFormat:@"第%d按钮",i]forState:UIControlStateNormal];
        [self addSubview:btn];
        btn.layer.borderWidth = 1;
        btn.layer.borderColor = [UIColor redColor].CGColor;
        
    
            btn.titleLabel.font = [UIFont systemFontOfSize:13];
        [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(spitlotBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.btns addObject:btn];
    }
}

-(void)layoutSubviews {
    [super layoutSubviews];
    [self.btns enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIButton * btn = obj;
        btn.tag = idx;
        //行号
        NSUInteger row = idx/kCols;

        //列号
        NSUInteger col = idx%kCols;
        
        CGFloat btnW = (self.width - kMargin*(kCols + 1))/kCols;
        
        CGFloat btnH = (self.height - kMargin*(kRows + 1))/kRows -10;
        
        CGFloat btnX = kMargin + col*(kMargin + btnW);
        
         CGFloat btnY = kMargin  + row*(kMargin + btnH) + kStateHeight;
        
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
    }];
}

#pragma mark 按钮点击事件
- (void)spitlotBtnClick:(UIButton *)sender {
    NSAssert(self.spitlotBlock != nil, @"传入的block不能为空");
    //执行block
    self.spitlotBlock(sender);
}
@end
