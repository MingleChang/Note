//
//  MCInputLabel.m
//  Text
//
//  Created by 常峻玮 on 15/5/6.
//  Copyright (c) 2015年 MingleChang. All rights reserved.
//

#import "MCInputLabel.h"
#import "MCTextField.h"
@interface MCInputLabel()

@property(nonatomic,strong)MCTextField *textField;

@end

@implementation MCInputLabel
-(instancetype)init{
    self=[super init];
    if (self) {
        [self initInputLabelAllSubViewAndDate];
    }
    return self;
}
-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        [self initInputLabelAllSubViewAndDate];
    }
    return self;
}
-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    self=[super initWithCoder:aDecoder];
    if (self) {
        
    }
    return self;
}
-(void)awakeFromNib{
    [super awakeFromNib];
    [self initInputLabelAllSubViewAndDate];
}
#pragma mark - Private Motheds
-(void)initInputLabelAllSubViewAndDate{
    [self initInputLabelAllSubView];
    [self initInputLabelAllDate];
}
-(void)initInputLabelAllSubView{
    self.userInteractionEnabled=YES;
    self.textField=[[MCTextField alloc]initWithFrame:CGRectZero];
    [self.textField setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.textField.text=@"";
    [self addSubview:self.textField];
    
    NSLayoutConstraint *lTextFiledTopConstraint=[NSLayoutConstraint constraintWithItem:self.textField attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
    NSLayoutConstraint *lTextFiledBottomConstraint=[NSLayoutConstraint constraintWithItem:self.textField attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
    NSLayoutConstraint *lTextFiledLeftConstraint=[NSLayoutConstraint constraintWithItem:self.textField attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0];
    NSLayoutConstraint *lTextFiledRightConstraint=[NSLayoutConstraint constraintWithItem:self.textField attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0];
    [self addConstraints:@[lTextFiledTopConstraint,lTextFiledBottomConstraint,lTextFiledLeftConstraint,lTextFiledRightConstraint]];
}
-(void)initInputLabelAllDate{
    
}
#pragma mark - 
-(BOOL)isFirstResponder{
    return [self.textField isFirstResponder];
}
-(BOOL)becomeFirstResponder{
    return [self.textField becomeFirstResponder];
}
-(BOOL)resignFirstResponder{
    return [self.textField resignFirstResponder];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
