//
//  MCRemindEditView.m
//  Text
//
//  Created by 常峻玮 on 15/5/6.
//  Copyright (c) 2015年 MingleChang. All rights reserved.
//

#import "MCRemindEditView.h"
#import "MCInputLabel.h"

#define REMIND_HEIGHT 43

@interface MCRemindEditView()

@property(nonatomic,strong)MCInputLabel *remindDateLabel;
@property(nonatomic,strong)MCInputLabel *remindTimeLabel;
@property(nonatomic,strong)MCInputLabel *remindRepeatLabel;
@property(nonatomic,strong)UIButton *remindMeButton;
@property(nonatomic,strong)UIButton *cancelRemindButton;

@end

@implementation MCRemindEditView

-(void)awakeFromNib{
    [super awakeFromNib];
    [self initRemindEditViewAllSubViewAndDate];
}
-(void)initRemindEditViewAllSubViewAndDate{
    [self initRemindEditViewAllSubView];
    [self initRemindEditViewAllDate];
}
-(void)initRemindEditViewAllSubView{
    self.remindDateLabel=[[MCInputLabel alloc]initWithFrame:CGRectZero];
    [self.remindDateLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.remindDateLabel setFont:[UIFont systemFontOfSize:12]];
    [self addSubview:self.remindDateLabel];
    
    self.remindTimeLabel=[[MCInputLabel alloc]initWithFrame:CGRectZero];
    [self.remindTimeLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.remindTimeLabel setFont:[UIFont systemFontOfSize:12]];
    [self addSubview:self.remindTimeLabel];
    
    self.remindRepeatLabel=[[MCInputLabel alloc]initWithFrame:CGRectZero];
    [self.remindRepeatLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.remindRepeatLabel setFont:[UIFont systemFontOfSize:12]];
    [self addSubview:self.remindRepeatLabel];
    
    self.remindMeButton=[UIButton buttonWithType:UIButtonTypeCustom];
    [self.remindMeButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.remindMeButton addTarget:self action:@selector(remindMeButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.remindMeButton];
    
    self.cancelRemindButton=[UIButton buttonWithType:UIButtonTypeCustom];
    [self.cancelRemindButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.cancelRemindButton.backgroundColor=[UIColor grayColor];
    self.cancelRemindButton.layer.cornerRadius=10;
    [self.cancelRemindButton setImage:[UIImage imageNamed:@"close_cha"] forState:UIControlStateNormal];
    [self.cancelRemindButton addTarget:self action:@selector(cancelRemindButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.cancelRemindButton];
    [self setLayoutContraints];
    [self test];
}
-(void)initRemindEditViewAllDate{
    
}

-(void)setLayoutContraints{
    NSLayoutConstraint *lRemindDateLabelLeftContraint=[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.remindDateLabel attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0];
    NSLayoutConstraint *lRemindDateLabelTopContraint=[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.remindDateLabel attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
    [self addConstraints:@[lRemindDateLabelLeftContraint,lRemindDateLabelTopContraint]];
    
    NSLayoutConstraint *lRemindTimeLabelLeftContraint=[NSLayoutConstraint constraintWithItem:self.remindTimeLabel attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.remindDateLabel attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:5];
    NSLayoutConstraint *lRemindTimeLabelTopContraint=[NSLayoutConstraint constraintWithItem:self.remindDateLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.remindTimeLabel attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
    [self addConstraints:@[lRemindTimeLabelLeftContraint,lRemindTimeLabelTopContraint]];
    
    NSLayoutConstraint *lRemindRepeatLabelLeftContraint=[NSLayoutConstraint constraintWithItem:self.remindDateLabel attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.remindRepeatLabel attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0];
    NSLayoutConstraint *lRemindRepeatLabelTopContraint=[NSLayoutConstraint constraintWithItem:self.remindDateLabel attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.remindRepeatLabel attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
    [self addConstraints:@[lRemindRepeatLabelLeftContraint,lRemindRepeatLabelTopContraint]];
    
    
    
    NSLayoutConstraint *lCancelRemindButtonCenterYConstraint=[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.cancelRemindButton attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0];
    NSLayoutConstraint *lCancelRemindButtonRightConstraint=[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.cancelRemindButton attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0];
    [self addConstraints:@[lCancelRemindButtonCenterYConstraint,lCancelRemindButtonRightConstraint]];
    
    NSLayoutConstraint *lCancelRemindButtonWidthConstraint=[NSLayoutConstraint constraintWithItem:self.cancelRemindButton attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:20];
    NSLayoutConstraint *lCancelRemindButtonHeightConstraint=[NSLayoutConstraint constraintWithItem:self.cancelRemindButton attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:20];
    [self.cancelRemindButton addConstraints:@[lCancelRemindButtonWidthConstraint,lCancelRemindButtonHeightConstraint]];
}

#pragma mark - Button Click
-(void)remindMeButtonClick:(UIButton *)sender{
    
}
-(void)cancelRemindButtonClick:(UIButton *)sender{

}

-(void)test{
    self.remindDateLabel.text=@"2016年12月29日";
    self.remindTimeLabel.text=@"23:45";
    self.remindRepeatLabel.text=@"smas";
//    self.remindDateLabel.hidden=YES;
//    self.remindTimeLabel.hidden=YES;
//    self.remindRepeatLabel.hidden=YES;
//    self.cancelRemindButton.hidden=YES;
    UITapGestureRecognizer *lTap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
    [self addGestureRecognizer:lTap];
}
-(void)tap:(UITapGestureRecognizer *)sender{
    self.remindDateLabel.text=[self.remindDateLabel.text stringByAppendingString:@"Good"];
    self.remindTimeLabel.text=[self.remindTimeLabel.text stringByAppendingString:@"Bye"];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
