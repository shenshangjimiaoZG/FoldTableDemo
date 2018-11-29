#import "SongHeaderView.h"
#import <Masonry/Masonry.h>
#import "Song.h"

@interface SongHeaderView ()
@property(nonatomic,strong)UIImageView *faceImg;
@property(nonatomic,strong)UILabel *lblSongName,*lblSinger;
@end

@implementation SongHeaderView
-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithReuseIdentifier:reuseIdentifier];
    if(self)
    {
        self.faceImg=[UIImageView new];
        [self.contentView addSubview:self.faceImg];
        
        self.lblSinger=[UILabel new];
        self.lblSinger.font=[UIFont systemFontOfSize:13];
        self.lblSinger.textColor=[UIColor colorWithRed:123.0f/255.0f green:121.0f/255.0f blue:122.0f/255.0f alpha:1];
        [self.contentView addSubview:self.lblSinger];
        
        self.lblSongName=[UILabel new];
        self.lblSongName.font=[UIFont systemFontOfSize:15];
        self.lblSongName.textColor=[UIColor colorWithRed:77.0f/255.0f green:76.0f/255.0f blue:75.0f/255.0f alpha:1];
        [self.contentView addSubview:self.lblSongName];
        
    }
    return self;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.faceImg mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(self.contentView.mas_left).offset(12);
        make.size.mas_equalTo(CGSizeMake(50, 50));
    }];
    [self.lblSongName mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.center.equalTo(self.contentView);
        make.height.equalTo(@30);
        
        
    }];
    [self.lblSinger mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(self.contentView);
        make.right.equalTo(self.contentView.mas_right).offset(-10);
        make.height.equalTo(@25);
        make.width.equalTo(@120);
    }];
}
-(void)setSong:(Song *)song
{
    _song=song;
    _faceImg.image=[UIImage imageNamed:song.faceImg];
    _lblSongName.text=song.songName;
    _lblSinger.text=song.singer;
}
@end
