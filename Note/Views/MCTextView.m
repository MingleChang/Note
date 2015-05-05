//
//  MCTextView.m
//  Text
//
//  Created by 常峻玮 on 15/5/5.
//  Copyright (c) 2015年 MingleChang. All rights reserved.
//

#import "MCTextView.h"
@interface MCTextView()
@property(nonatomic,strong)UILabel *placeholderLabel;
@property(nonatomic,strong)NSLayoutConstraint *lableLeftConstraint;
@property(nonatomic,strong)NSLayoutConstraint *lableTopConstraint;
@property(nonatomic,strong)NSLayoutConstraint *lableWidthConstraint;
@end

@implementation MCTextView
-(instancetype)initWithFrame:(CGRect)frame{
    self= [super initWithFrame:frame];
    if (self) {
        [self initAllSubViewAndData];
    }
    return self;
}
-(instancetype)initWithFrame:(CGRect)frame textContainer:(NSTextContainer *)textContainer{
    self=[super initWithFrame:frame textContainer:textContainer];
    if (self) {
        [self initAllSubViewAndData];
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
    [self initAllSubViewAndData];
}
-(void)initAllSubViewAndData{
    [self initAllSubView];
    [self initAllData];
}
-(void)initAllSubView{
    [self setupPlaceholderLabel];
}
-(void)initAllData{
    
}
-(void)setupPlaceholderLabel{
    self.placeholderLabel=[[UILabel alloc]init];
    [self.placeholderLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.placeholderColor=[UIColor colorWithRed:190.0/255 green:188.0/255 blue:188.0/255 alpha:1.0];
    self.placeholderLabel.font=self.font;
    [self addSubview:self.placeholderLabel];
    
    self.lableLeftConstraint=[NSLayoutConstraint constraintWithItem:self.placeholderLabel attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeading multiplier:1.0 constant:5+self.textContainerInset.left];
    self.lableTopConstraint=[NSLayoutConstraint constraintWithItem:self.placeholderLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:self.textContainerInset.top];
    self.lableWidthConstraint=[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.placeholderLabel attribute:NSLayoutAttributeWidth multiplier:1.0 constant:10+self.textContainerInset.left+self.textContainerInset.right];
    [self addConstraints:@[self.lableLeftConstraint,self.lableTopConstraint,self.lableWidthConstraint]];
}
#pragma mark - Setter And Getter
-(void)setFont:(UIFont *)font{
    [super setFont:font];
    self.placeholderLabel.font=font;
}
-(UIColor *)placeholderColor{
    return self.placeholderLabel.textColor;
}
-(void)setPlaceholderColor:(UIColor *)placeholderColor{
    self.placeholderLabel.textColor=placeholderColor;
}
-(NSString *)placeholderString{
    return self.placeholderLabel.text;
}
-(void)setPlaceholderString:(NSString *)placeholderString{
    self.placeholderLabel.text=placeholderString;
}
-(void)setTextContainerInset:(UIEdgeInsets)textContainerInset{
    [super setTextContainerInset:textContainerInset];
    self.lableLeftConstraint.constant=5+self.textContainerInset.left;
    self.lableTopConstraint.constant=self.textContainerInset.top;
    self.lableWidthConstraint.constant=10+self.textContainerInset.left+self.textContainerInset.right;
}
//-(void)setContentOffset:(CGPoint)contentOffset{
//    contentOffset.y=0;
//    [super setContentOffset:contentOffset];
//}
/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
