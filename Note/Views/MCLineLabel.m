//
//  MCLineLabel.m
//  Text
//
//  Created by 常峻玮 on 15/5/6.
//  Copyright (c) 2015年 MingleChang. All rights reserved.
//

#import "MCLineLabel.h"
#import "Common.h"
@interface MCLineLabel()
@property(nonatomic,strong)UIView *lineView;
@end

@implementation MCLineLabel
-(instancetype)init{
    self=[super init];
    if (self) {
        [self initLineLabelAllSubViewAndDate];
    }
    return self;
}
-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        [self initLineLabelAllSubViewAndDate];
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
    [self initLineLabelAllSubViewAndDate];
}
#pragma mark - Private Motheds
-(void)initLineLabelAllSubViewAndDate{
    [self initLineLabelAllSubView];
    [self initLineLabelAllDate];
}
-(void)initLineLabelAllSubView{
    self.textAlignment=NSTextAlignmentCenter;
    self.lineView=[[UIView alloc]initWithFrame:CGRectZero];
    [self.lineView setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.lineView.backgroundColor=self.textColor;
    [self addSubview:self.lineView];
    
    NSLayoutConstraint *lLineLeftConstraint=[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.lineView attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0];
    NSLayoutConstraint *lLineRightConstraint=[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.lineView attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0];
    NSLayoutConstraint *lLineBottomConstraint=[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.lineView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
    [self addConstraints:@[lLineLeftConstraint,lLineRightConstraint,lLineBottomConstraint]];
    
    NSLayoutConstraint *lLineHeightConstraint=[NSLayoutConstraint constraintWithItem:self.lineView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:ONE_PIXELS];
    [self.lineView addConstraint:lLineHeightConstraint];
}
-(void)initLineLabelAllDate{
    
}
#pragma mark - Setter And Getter
-(void)setTextColor:(UIColor *)textColor{
    [super setTextColor:textColor];
    self.lineView.backgroundColor=textColor;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
