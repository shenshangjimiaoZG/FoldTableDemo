#import "SongTableViewCell.h"
#import "Song.h"
#import <Masonry/Masonry.h>
#import "UITableViewCell+HYBMasonryAutoCellHeight.h"

#define kContent_width 300

@interface SongTableViewCell ()
@property(nonatomic,strong)UILabel *lblDesc;
@end

@implementation SongTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        self.selectionStyle=UITableViewCellSelectionStyleNone;
        self.lblDesc=[UILabel new];
        self.lblDesc.textColor=[UIColor colorWithRed:135.0f/255.0f green:133.0f/255.0f blue:132.0f/255.0f alpha:1];
        self.lblDesc.font=[UIFont systemFontOfSize:16];
        self.lblDesc.numberOfLines=0;
        [self.contentView addSubview:self.lblDesc];
    }
    self.hyb_bottomOffsetToCell=10;
    
    return self;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.lblDesc mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(self.contentView.mas_top).offset(10);
        make.width.equalTo(@(kContent_width));
        make.left.equalTo(self.contentView.mas_left).offset(15);
    }];
}

-(void)configCell:(Song*)info
{
    
    
    // 段落设置与实际显示的 Label 属性一致 采用 NSMutableParagraphStyle 设置Nib 中 Label 的相关属性传入到 NSAttributeString 中计算；
    NSMutableParagraphStyle *style = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    style.lineBreakMode = NSLineBreakByWordWrapping;
    style.alignment = NSTextAlignmentLeft;
    
    NSAttributedString *string = [[NSAttributedString alloc]initWithString:info.lyric attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16], NSParagraphStyleAttributeName:style}];
    
    CGSize size =  [string boundingRectWithSize:CGSizeMake(kContent_width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil].size;
    
    
    // 并不是高度计算不对，我估计是计算出来的数据是 小数，在应用到布局的时候稍微差一点点就不能保证按照计算时那样排列，所以为了确保布局按照我们计算的数据来，就在原来计算的基础上 取ceil值，再加1；
    CGFloat height = ceil(size.height) + 1;
    
    _lblDesc.attributedText=string;
    
    [self.lblDesc mas_updateConstraints:^(MASConstraintMaker *make) {
        
        make.height.equalTo(@(height));
    }];
}

@end
