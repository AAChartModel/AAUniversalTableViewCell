//
//  AAGeneralTableViewCell.h
//  WYMCloudServerH
//
//  Created by An An on 2017/8/8.
//  Copyright © 2017年 LH. All rights reserved.
//

#import <UIKit/UIKit.h>

// 初始化单元格样式类型
typedef NS_ENUM(NSInteger,AAGeneralTableViewCellStyle) {
    AAGeneralTableViewCellStyleInput = 0,//输入类型(输入框为 textField类型) 注:后续可拓展为  AAGeneralTableViewCellStyleTVInput AAGeneralTableViewCellStyleTFInput
    AAGeneralTableViewCellStylePick,//选择类型
    AAGeneralTableViewCellStyleOutput,//输出类型
};

@interface AAGeneralTableViewCell : UITableViewCell

// 单元格样式类型 Enum
@property (nonatomic, assign) AAGeneralTableViewCellStyle styleType;

// 单元格标题 ImageView
@property (nonatomic, strong) UIImageView *titleImageView;

// 单元格标题 Label
@property (nonatomic, strong) UILabel     *titleLabel;

// 提示必填的红色星号 ImageView
@property (nonatomic, strong) UIImageView *redStarImageView;

// 输入类型的单元格上的内容输入框 TextField
@property (nonatomic, strong) UITextField *inputContentTF;

// 选择类型的单元格上的文本内容 Label
@property (nonatomic, strong) UILabel     *contentTextLabel;

// 右侧箭头 ImageView
@property (nonatomic, strong) UIImageView *arrowImageV;

// 右侧可点击按钮 Button
@property (nonatomic, strong) UIButton    *rightTapEventBtn;

// 右侧顾客头像 ImageView
@property (nonatomic, strong) UIImageView *rightHeadImageView;

// 单元格创建时初始显示的占位内容字符串
@property (nonatomic, strong) NSString    *placeholderStr;

// 是否有标题图像
@property (nonatomic, assign) BOOL haveTitleImage;

// 是否有标题图像
@property (nonatomic, assign) BOOL haveRedStarImage;

// 是否有向右箭头图像
@property (nonatomic, assign) BOOL haveArrowImage;



// 为单元格右侧按钮添加点击事件
- (void)addDidTapEventHandler:(void(^)(id sender))handler;

@end
