//
//  MCRemindEditView.m
//  Text
//
//  Created by 常峻玮 on 15/5/6.
//  Copyright (c) 2015年 MingleChang. All rights reserved.
//

#import "MCRemindEditView.h"
#import "MCInputLabel.h"
#import "MCImageExtension.h"
#import "Common.h"
#define NEED_REMIND_HEIGHT 43
#define NO_REMIND_HEIGHT 22
#define REMIND_COLOR RGB(153,153,153)
@interface MCRemindEditView()<UIPickerViewDataSource,UIPickerViewDelegate>
@property(nonatomic,strong)UIImageView *remindImageView;
@property(nonatomic,strong)MCInputLabel *remindDateLabel;
@property(nonatomic,strong)MCInputLabel *remindTimeLabel;
@property(nonatomic,strong)MCInputLabel *remindRepeatLabel;
@property(nonatomic,strong)UILabel *remindMeLabel;
@property(nonatomic,strong)UIButton *remindMeButton;
@property(nonatomic,strong)UIButton *cancelRemindButton;
@property(nonatomic,strong)UIDatePicker *datePicker;
@property(nonatomic,strong)UIDatePicker *timePicker;
@property(nonatomic,strong)UIPickerView *repeatPicker;

@property(nonatomic,strong)NSLayoutConstraint *contentLeftConstraint;
@property(nonatomic,strong)NSLayoutConstraint *contentRightConstraint;
@property(nonatomic,strong)NSLayoutConstraint *contentTopConstraint;
@property(nonatomic,strong)IBOutlet NSLayoutConstraint *heightConstraint;

@property(nonatomic,copy)NSArray *repeatTitles;
@end

@implementation MCRemindEditView

-(void)awakeFromNib{
    [super awakeFromNib];
    [self initRemindEditViewAllSubViewAndDate];
}
-(void)initRemindEditViewAllSubViewAndDate{
    [self initRemindEditViewAllDate];
    [self initRemindEditViewAllSubView];
}
-(void)initRemindEditViewAllSubView{
    self.contentInsets=UIEdgeInsetsMake(10, 10, 10, 10);
    UIImage *lRemindImage=[[UIImage imageNamed:@"Remind"]resetWithColor:REMIND_COLOR];
    self.remindImageView=[[UIImageView alloc]initWithImage:lRemindImage];
    [self.remindImageView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self addSubview:self.remindImageView];
    
    self.remindDateLabel=[[MCInputLabel alloc]initWithFrame:CGRectZero];
    [self.remindDateLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.remindDateLabel setFont:[UIFont systemFontOfSize:12]];
    [self.remindDateLabel setTextColor:REMIND_COLOR];
    self.remindDateLabel.hidden=YES;
    [self addSubview:self.remindDateLabel];
    
    self.remindTimeLabel=[[MCInputLabel alloc]initWithFrame:CGRectZero];
    [self.remindTimeLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.remindTimeLabel setFont:[UIFont systemFontOfSize:12]];
    [self.remindTimeLabel setTextColor:REMIND_COLOR];
    self.remindTimeLabel.hidden=YES;
    [self addSubview:self.remindTimeLabel];
    
    self.remindRepeatLabel=[[MCInputLabel alloc]initWithFrame:CGRectZero];
    [self.remindRepeatLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.remindRepeatLabel setFont:[UIFont systemFontOfSize:12]];
    [self.remindRepeatLabel setTextColor:REMIND_COLOR];
    self.remindRepeatLabel.text=self.repeatTitles[0];
    self.remindRepeatLabel.hidden=YES;
    [self addSubview:self.remindRepeatLabel];
    
    self.remindMeLabel=[[UILabel alloc]initWithFrame:CGRectZero];
    [self.remindMeLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.remindMeLabel.font=[UIFont italicSystemFontOfSize:13];
    self.remindMeLabel.text=@"提醒我";
    self.remindMeLabel.textColor=REMIND_COLOR;
    [self addSubview:self.remindMeLabel];
    
    self.remindMeButton=[UIButton buttonWithType:UIButtonTypeCustom];
    [self.remindMeButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.remindMeButton addTarget:self action:@selector(remindMeButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.remindMeButton];
    
    self.cancelRemindButton=[UIButton buttonWithType:UIButtonTypeCustom];
    [self.cancelRemindButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.cancelRemindButton.backgroundColor=[UIColor grayColor];
    self.cancelRemindButton.layer.cornerRadius=8;
    [self.cancelRemindButton setImage:[UIImage imageNamed:@"Close"] forState:UIControlStateNormal];
    [self.cancelRemindButton addTarget:self action:@selector(cancelRemindButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.cancelRemindButton];
    
    self.datePicker=[[UIDatePicker alloc]init];
    self.datePicker.datePickerMode=UIDatePickerModeDate;
    [self.datePicker addTarget:self action:@selector(datePickerValueChange:) forControlEvents:UIControlEventValueChanged];
    [self.remindDateLabel setInputView:self.datePicker];
    
    self.timePicker=[[UIDatePicker alloc]init];
    self.timePicker.datePickerMode=UIDatePickerModeTime;
    [self.timePicker addTarget:self action:@selector(timePickerValueChange:) forControlEvents:UIControlEventValueChanged];
    [self.remindTimeLabel setInputView:self.timePicker];
    
    self.repeatPicker=[[UIPickerView alloc]init];
    self.repeatPicker.delegate=self;
    self.repeatPicker.dataSource=self;
    [self.remindRepeatLabel setInputView:self.repeatPicker];
    
    [self setLayoutContraints];
}
-(void)initRemindEditViewAllDate{
    self.repeatTitles=@[@"不重复",@"每日重复",@"每周重复",@"每月重复",@"每年重复"];
}

-(void)setLayoutContraints{
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    if (self.heightConstraint==nil) {
        self.heightConstraint=[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:[self calculateHeight]];
        [self addConstraint:self.heightConstraint];
    }
    self.heightConstraint.constant=[self calculateHeight];
    
    NSLayoutConstraint *lRemindImageViewLeftConstraint=[NSLayoutConstraint constraintWithItem:self.remindImageView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeading multiplier:1.0 constant:self.contentInsets.left];
    NSLayoutConstraint *lRemindImageViewCenterYConstraint=[NSLayoutConstraint constraintWithItem:self.remindImageView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.remindDateLabel attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0];
    [self addConstraints:@[lRemindImageViewLeftConstraint,lRemindImageViewCenterYConstraint]];
    
    self.contentLeftConstraint=lRemindImageViewLeftConstraint;
    
    NSLayoutConstraint *lRemindImageViewWidthConstraint=[NSLayoutConstraint constraintWithItem:self.remindImageView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:12];
    NSLayoutConstraint *lRemindImageViewHeightConstraint=[NSLayoutConstraint constraintWithItem:self.remindImageView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:12];
    [self.remindImageView addConstraints:@[lRemindImageViewWidthConstraint,lRemindImageViewHeightConstraint]];
    
    NSLayoutConstraint *lRemindDateLabelLeftContraint=[NSLayoutConstraint constraintWithItem:self.remindDateLabel attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.remindImageView attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:5];
    NSLayoutConstraint *lRemindDateLabelTopContraint=[NSLayoutConstraint constraintWithItem:self.remindDateLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:self.contentInsets.top];
    [self addConstraints:@[lRemindDateLabelLeftContraint,lRemindDateLabelTopContraint]];
    
    self.contentTopConstraint=lRemindDateLabelTopContraint;
    
    NSLayoutConstraint *lRemindTimeLabelLeftContraint=[NSLayoutConstraint constraintWithItem:self.remindTimeLabel attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.remindDateLabel attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:5];
    NSLayoutConstraint *lRemindTimeLabelTopContraint=[NSLayoutConstraint constraintWithItem:self.remindDateLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.remindTimeLabel attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
    [self addConstraints:@[lRemindTimeLabelLeftContraint,lRemindTimeLabelTopContraint]];
    
    NSLayoutConstraint *lRemindRepeatLabelLeftContraint=[NSLayoutConstraint constraintWithItem:self.remindDateLabel attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.remindRepeatLabel attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0];
    NSLayoutConstraint *lRemindRepeatLabelTopContraint=[NSLayoutConstraint constraintWithItem:self.remindDateLabel attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.remindRepeatLabel attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
    [self addConstraints:@[lRemindRepeatLabelLeftContraint,lRemindRepeatLabelTopContraint]];
    
    NSLayoutConstraint *lRemindMeLabelLeftConstraint=[NSLayoutConstraint constraintWithItem:self.remindMeLabel attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.remindImageView attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:5];
    NSLayoutConstraint *lRemindMeLabelCenterYConstraint=[NSLayoutConstraint constraintWithItem:self.remindImageView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.remindMeLabel attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0];
    [self addConstraints:@[lRemindMeLabelLeftConstraint,lRemindMeLabelCenterYConstraint]];
    
    NSLayoutConstraint *lRemindMeButtonTopConstraint=[NSLayoutConstraint constraintWithItem:self.remindMeButton attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
    NSLayoutConstraint *lRemindMeButtonBottomConstraint=[NSLayoutConstraint constraintWithItem:self.remindMeButton attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
    NSLayoutConstraint *lRemindMeButtonLeftConstraint=[NSLayoutConstraint constraintWithItem:self.remindMeButton attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0];
    NSLayoutConstraint *lRemindMeButtonRightConstraint=[NSLayoutConstraint constraintWithItem:self.remindMeButton attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0];
    [self addConstraints:@[lRemindMeButtonTopConstraint,lRemindMeButtonBottomConstraint,lRemindMeButtonLeftConstraint,lRemindMeButtonRightConstraint]];
    
    NSLayoutConstraint *lCancelRemindButtonCenterYConstraint=[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.cancelRemindButton attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0];
    NSLayoutConstraint *lCancelRemindButtonRightConstraint=[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.cancelRemindButton attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:self.contentInsets.right];
    [self addConstraints:@[lCancelRemindButtonCenterYConstraint,lCancelRemindButtonRightConstraint]];
    
    self.contentRightConstraint=lCancelRemindButtonRightConstraint;
    
    NSLayoutConstraint *lCancelRemindButtonWidthConstraint=[NSLayoutConstraint constraintWithItem:self.cancelRemindButton attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:16];
    NSLayoutConstraint *lCancelRemindButtonHeightConstraint=[NSLayoutConstraint constraintWithItem:self.cancelRemindButton attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:16];
    [self.cancelRemindButton addConstraints:@[lCancelRemindButtonWidthConstraint,lCancelRemindButtonHeightConstraint]];
}
#pragma mark - Private Motheds
-(void)resetNeedRemindView{
    self.remindMeButton.hidden=self.needRemind;
    self.remindMeLabel.hidden=self.needRemind;
    self.remindDateLabel.hidden=!self.needRemind;
    self.remindTimeLabel.hidden=!self.needRemind;
    self.remindRepeatLabel.hidden=!self.needRemind;
    self.cancelRemindButton.hidden=!self.needRemind;
}
-(CGFloat)calculateHeight{
    return self.contentInsets.top+self.contentInsets.bottom+(self.needRemind?NEED_REMIND_HEIGHT:NO_REMIND_HEIGHT);
}
#pragma mark - Setter And Getter
-(void)setNeedRemind:(BOOL)needRemind{
    if (_needRemind==needRemind) {
        return;
    }
    _needRemind=needRemind;
    if (needRemind) {
        if (self.remindDate==nil) {
            self.remindDate=[NSDate date];
        }
    }
    [self resetNeedRemindView];
    self.heightConstraint.constant=[self calculateHeight];
}
-(void)setContentInsets:(UIEdgeInsets)contentInsets{
    if (UIEdgeInsetsEqualToEdgeInsets(_contentInsets, contentInsets)) {
        return;
    }
    _contentInsets=contentInsets;
    if (self.contentLeftConstraint) {
        self.contentLeftConstraint.constant=contentInsets.left;
    }
    if (self.contentRightConstraint) {
        self.contentRightConstraint.constant=contentInsets.right;
    }
    if (self.contentTopConstraint) {
        self.contentTopConstraint.constant=contentInsets.top;
    }
}
-(void)setRemindDate:(NSDate *)remindDate{
    if ([_remindDate isEqualToDate:remindDate]) {
        return;
    }
    _remindDate=remindDate;
    self.datePicker.date=remindDate;
    self.timePicker.date=remindDate;
    self.remindDateLabel.text=[remindDate stringFromFormat:@"yyyy/MM/dd"];
    self.remindTimeLabel.text=[remindDate stringFromFormat:@"HH:mm"];
}
#pragma mark - Button Click
-(void)remindMeButtonClick:(UIButton *)sender{
    NSLog(@"Remind Me");
    self.needRemind=YES;
}
-(void)cancelRemindButtonClick:(UIButton *)sender{
    NSLog(@"Cancel Remind Me");
    self.needRemind=NO;
    [self.remindDateLabel resignFirstResponder];
    [self.remindTimeLabel resignFirstResponder];
    [self.remindRepeatLabel resignFirstResponder];
}
-(void)datePickerValueChange:(UIDatePicker *)sender{
    self.remindDate=sender.date;
}
-(void)timePickerValueChange:(UIDatePicker *)sender{
    self.remindDate=sender.date;
}

#pragma mark - Picker DataSources
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return self.repeatTitles.count;
}
#pragma mark - Picker Delegate
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [self.repeatTitles objectAtIndex:row];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
