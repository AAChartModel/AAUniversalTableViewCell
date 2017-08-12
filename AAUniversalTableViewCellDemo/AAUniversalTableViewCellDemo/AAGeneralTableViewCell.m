//
//  AAGeneralTableViewCell.m
//  WYMCloudServerH
//
//  Created by An An on 2017/8/8.
//  Copyright © 2017年 LH. All rights reserved.
//

#import "AAGeneralTableViewCell.h"
#import "UIControl+BlocksKit.h"
@implementation AAGeneralTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.accessoryType = UITableViewCellAccessoryNone;
        
        //标题 Label
        [self titleLabel];
    }
    return self;
}

#pragma mark -- setter method
- (void)setStyleType:(AAGeneralTableViewCellStyle)styleType {
    _styleType = styleType;
    switch (styleType) {
        case AAGeneralTableViewCellStyleInput: {
            [self inputContentTF];
//            if (self.contentTextLabel) {
//                [self.contentTextLabel removeFromSuperview];
//                self.contentTextLabel = nil;
//            }
//            if (_arrowImageV) {
//                [_arrowImageV removeFromSuperview];
//                _arrowImageV = nil;
//            }
            
        }
            break;
            
        case AAGeneralTableViewCellStylePick:
        case AAGeneralTableViewCellStyleOutput: {
            [self contentTextLabel];
//            if (_inputContentTF) {
//                [_inputContentTF removeFromSuperview];
//                _inputContentTF = nil;
//            }
            
            if (styleType == AAGeneralTableViewCellStylePick) {
                self.contentTextLabel.textAlignment = NSTextAlignmentRight;
                self.haveArrowImage = YES;//有向右箭头
            } else {
                _contentTextLabel.textAlignment = NSTextAlignmentLeft;
                
            }
            
        }
            
            break;
            
        default:
            break;
    }
}

- (void)setPlaceholderStr:(NSString *)placeholderStr {
    _placeholderStr = placeholderStr;
    if (self.styleType == AAGeneralTableViewCellStyleInput) {
        self.inputContentTF.placeholder = placeholderStr;
    } else {
        self.contentTextLabel.text = placeholderStr;
    }
}

- (void)setHaveTitleImage:(BOOL)haveTitleImage {
    _haveArrowImage = haveTitleImage;

    if (haveTitleImage == YES) {
        [self titleImageView];
        [_titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@40);
            make.centerY.equalTo(self.contentView);
        }];
    }
}

- (void)setHaveRedStarImage:(BOOL)haveRedStarImage {
    _haveRedStarImage = haveRedStarImage;
    [self redStarImageView];
    
//    if (_contentTextLabel) {
//        [_contentTextLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(self.redStarImageView.mas_right).with.offset(10);
//            make.centerY.equalTo(self.contentView);
//
//        }];
//        _contentTextLabel.textAlignment = NSTextAlignmentRight;
//
//    }else if (_inputContentTF) {
//        [_inputContentTF mas_remakeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(self.redStarImageView.mas_right).with.offset(10);
//            make.centerY.equalTo(self.contentView);
//
//        }];
//        _inputContentTF.textAlignment = NSTextAlignmentRight;
//
//    }
    
}

- (void)setHaveArrowImage:(BOOL)haveArrowImage {
    _haveArrowImage = haveArrowImage;
    if (haveArrowImage == YES ) {
        [self arrowImageV];
    } else {
        if (_arrowImageV ) {
            [_arrowImageV removeFromSuperview];
            _arrowImageV =nil;
        }
    }
    
}

- (void)addDidTapEventHandler:(void(^)(id sender))handler {
    [self.rightTapEventBtn bk_addEventHandler:handler forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark --lazy load

// 左侧标题图片 ImageView
- (UIImageView *)titleImageView {
    if (!_titleImageView) {
        _titleImageView = [[UIImageView alloc] init];
        //        _titleImageView.backgroundColor = [UIColor blueColor];
        [self.contentView addSubview:_titleImageView];
        [_titleImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView);
            make.left.equalTo(@15);
        }];
    }
    return _titleImageView;
}

// 左侧标题 Label
- (UILabel *)titleLabel {
    if (!_titleLabel) {
      
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = [HelperTools getColor:@"#646464"];
        _titleLabel.font = [UIFont systemFontOfSize:AppBaseFont];
        [self.contentView addSubview:_titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@15);
            make.centerY.equalTo(self.contentView);
        }];
    }
    return _titleLabel;
}

// 必填星号※标记 ImageView
- (UIImageView *)redStarImageView {
    if (!_redStarImageView) {
        _redStarImageView = [[UIImageView alloc]init];
        _redStarImageView.image = [UIImage imageNamed:@"required_"];
        [self.contentView addSubview:_redStarImageView];
        [_redStarImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_titleLabel.mas_right).equalTo(@5);
            make.centerY.equalTo(self.contentView.mas_centerY);
            make.size.mas_equalTo(CGSizeMake(10, 10));
        }];
    }
    return _redStarImageView;
}

// 文本输入框 TextField
- (UITextField *)inputContentTF {
    if (!_inputContentTF) {
        //输入框 TextField
        _inputContentTF = [[UITextField alloc] init];
        _inputContentTF.font = [UIFont systemFontOfSize:AppBaseFont];
        _inputContentTF.textAlignment = NSTextAlignmentRight;
        [self.contentView addSubview:_inputContentTF];
        [_inputContentTF mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView.mas_centerY);
            make.right.equalTo(@-35);
            NSNumber *width = [NSNumber numberWithFloat:KScreenWidth/2];
            make.width.equalTo(width);
        }];
    }
    return _inputContentTF;
}

// 文本显示框 Label
- (UILabel *)contentTextLabel {
    if (!_contentTextLabel) {
        //单元格详情内容 Label
        _contentTextLabel = [[UILabel alloc]init];
        _contentTextLabel.font = [UIFont systemFontOfSize:AppBaseFont];
        _inputContentTF.textAlignment = NSTextAlignmentRight;
        [self.contentView addSubview:_contentTextLabel];
        [_contentTextLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView.mas_centerY);
            make.right.equalTo(@-35);
            NSNumber *width = [NSNumber numberWithFloat:KScreenWidth/2];
            make.width.equalTo(width);
         }];
    }
    return _contentTextLabel;
}

// 右侧可点击箭头 ImageView
- (UIImageView *)arrowImageV {
    if (!_arrowImageV) {
        //向右箭头
        _arrowImageV = [[UIImageView alloc] init];
        _arrowImageV.image = [UIImage imageNamed:@"arrow"];
        [self.contentView addSubview:_arrowImageV];
        [_arrowImageV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView.mas_centerY);
            make.right.equalTo(@-15);
            make.size.mas_equalTo(CGSizeMake(20, 20));
        }];
    }
    return _arrowImageV;
}

// 右侧可添加点击事件的按钮 Button
- (UIButton *)rightTapEventBtn {
    if (!_rightTapEventBtn) {
       _rightTapEventBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:_rightTapEventBtn];
        [_rightTapEventBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView.mas_centerY);
            make.right.equalTo(@-15);
        }];
    }
    return _rightTapEventBtn;
}

// 右侧头像 ImageView
- (UIImageView *)rightHeadImageView {
    if (!_rightHeadImageView) {
        _rightHeadImageView = [[UIImageView alloc] init];
        _rightHeadImageView.layer.cornerRadius = 10;
        _rightHeadImageView.layer.masksToBounds = YES;
        [self.contentView addSubview:_rightHeadImageView];
        [_rightHeadImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView.mas_centerY);
            make.right.equalTo(_arrowImageV.mas_left).offset(-5);
            make.size.mas_equalTo(CGSizeMake(40, 40));
        }];
        [_rightHeadImageView layoutIfNeeded];
        [_contentTextLabel removeFromSuperview];
    }
    return _rightHeadImageView;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
