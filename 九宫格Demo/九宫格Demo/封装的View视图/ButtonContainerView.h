//
//  ButtonContainerView.h
//  chemuchao
//
//  Created by 遇见远洋 on 16/3/7.
//  Copyright © 2016年 zhaoxiaolu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^spitlotBtnClick)(UIButton * btn);
@interface ButtonContainerView : UIView
@property (nonatomic,copy)spitlotBtnClick spitlotBlock;
@property (strong,nonatomic) UITableView * voiceTableView;/**<这是一个属性的说明*/

@end
