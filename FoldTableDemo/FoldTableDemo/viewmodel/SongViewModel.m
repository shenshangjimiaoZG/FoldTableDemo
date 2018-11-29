#import "SongViewModel.h"

@implementation SongViewModel

+ (RACSignal *)getSongs
{
    RACSignal *signal=[RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        
        Song *sugar=[[Song alloc]init];
        sugar.faceImg=@"sugar";
        sugar.singer=@"Maroon 5";
        sugar.songName=@"Sugar";
        sugar.lyric=@"I'm hurting, baby, I'm broken down I need your loving, loving, I need it now When I'm without you I'm something weak You got me begging Begging, I'm on my knees I don't wanna be needing your love I just wanna be deep in your love And it's killing me when you're away Ooh, baby,'Cause I really don't care where you are I just wanna be there where you are And I gotta get one little taste Your sugar Yes, please Won't you come and put it down on me I'm right here, 'cause I need Little love and little sympathy Yeah you show me good loving Make it alright Need a little sweetness in my life Your sugar Yes, please Won't you come and put it down on me My broken pieces You pick them up Don't leave me hanging, hanging Come give me some When I'm without ya I'm so insecure You are the one thing The one thing, I'm living for I don't wanna be needing your love I just wanna be deep in your love And it's killing me when you're away Ooh, baby,'Cause I really don't care where you are I just wanna be there where you are And I gotta get one little taste Your sugar Yes, please Won't you come and put it down on me I'm right here, 'cause I need Little love and little sympathy Yeah you show me good loving Make it alright Need a little sweetness in my life Your Sugar! (Your sugar!) Yes, please (Yes, please) Won't you come and put it down on me Yeah I want that red velvet I want that sugar sweet Don't let nobody touch it Unless that somebody's me I gotta be a man There ain't no other way'Cause girl you're hotter than southern California Bay I don't wanna play no games I don't gotta be afraidDon't give all that shy shit No make up on, that's mySugarYes, please Won't you come and put it down on me (down on me!) Oh, right here (right here),'Cause I need (I need) Little love and little sympathy Yeah you show me good loving Make it alright Need a little sweetness in my life Your sugar! (Sugar!) Yes, please (Yes, please) Won't you come and put it down on me Your sugar Yes, please Won't you come and put it down on me I'm right here, 'cause I need Little love and little sympathy Yeah you show me good loving Make it alright Need a little sweetness in my life Your sugar Yes, please Won't you come and put it down on me (Down on me, down on me)";
        
        Song *see=[[Song alloc]init];
        see.faceImg=@"seeyouagain";
        see.singer=@"Wiz Khalifa,Charlie Puth";
        see.songName=@"See you again";
        see.lyric=@"[Charlie Puth] It's been a long day without you my friend And I'll tell you all about it when I see you again We've come a long way from where we began Oh I'll tell you all about it when I see you again When I see you again [Wiz Khalifa] Damn, who knew all the planes we flew Good things we've been through That I'll be standing right here Talking to you about another path I know we loved to hit the road and laugh But something told me that it wouldn't last Had to switch up look at things different see the bigger picture Those were the days hard work forever pays Now I see you win the better place How could we not talk about family when family's all that we got? Everything I went through you were standing there by my side And now you gonna be with me for the last ride [Charlie Puth] It's been a long day without you my friend And I'll tell you all about it when I see you again We've come a long way from where we began Oh I'll tell you all about it when I see you again When I see you again [Wiz Khalifa] First you both go out your way And the vibe is feeling strong and what's small turn to a friendship Turn into a bond and that bond will never be broken and the love will never get lost And when brotherhood come first then the line Will never be crossed established it on our own When that line had to be drawn and that line is what We reach so remember me when I'm gone How could we not talk about family when family's all that we got Everything I went through you were standing there by my side And now you gonna be with me for the last ride [Charlie Puth] So let the light guide your way Hold every memory as you go And every road you take will always lead you home Hoo~ It's been a long day without you my friend And I'll tell you all about it when I see you again We've come a long way from where we began Oh I'll tell you all about it when I see you again When I see you again When I see you again, see you again When I see you again";
        
        [subscriber sendNext:@[sugar,see]];
        [subscriber sendCompleted];
        
        return [RACDisposable disposableWithBlock:^{
            
        }];
    }];
    return signal;
}

@end
