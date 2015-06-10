//
//  MCListChooseCell.m
//  Test
//
//  Created by 常峻玮 on 15/6/9.
//  Copyright (c) 2015年 MingleChang. All rights reserved.
//

#import "MCListChooseCell.h"
@interface MCListChooseCell()
@property (weak, nonatomic) IBOutlet UILabel *chooseTitleLabel;
@property (weak, nonatomic) IBOutlet UIView *lineView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lineHeightConstraint;

@end
@implementation MCListChooseCell

- (void)awakeFromNib {
    // Initialization code
    [super awakeFromNib];
    self.lineHeightConstraint.constant=1/[UIScreen mainScreen].scale;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setChooseTitle:(NSString *)titile{
    self.chooseTitleLabel.text=titile;
}
@end
