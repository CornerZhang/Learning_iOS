//
//  NXViewController.m
//  PlayMp3_demo
//
//  Created by CornerZhang on 14-9-14.
//  Copyright (c) 2014年 NeXtreme.com. All rights reserved.
//

#import "NXViewController.h"
#import <AVFoundation/AVFoundation.h>

#define DEBUG 1

@interface NXViewController () <AVAudioPlayerDelegate>
@property (strong, nonatomic) AVAudioPlayer* player;
@property (strong, nonatomic) IBOutlet UIButton *playerButton;
@property (strong, nonatomic) IBOutlet UIButton *stopButton;
@property (strong, nonatomic) IBOutlet UIProgressView *playProgress;
@property (strong, nonatomic) NSTimer* timer;
@property (assign, nonatomic) NSTimeInterval pauseTime;

@end

@implementation NXViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSURL* fileName = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"Babbling_Brook" ofType:@"mp3"]];
    _player = [[AVAudioPlayer alloc] initWithContentsOfURL:fileName error:nil];
    
    _player.delegate = self;
    
    _player.numberOfLoops = -1;	// 无限播放
    
	[_player prepareToPlay];
//    _player.enableRate = YES;
//    _player.meteringEnabled = YES;
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(playMusicProgress) userInfo:nil repeats:YES];
    _pauseTime = [_timer tolerance];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tapButton:(UIButton *)sender {
	if ([_player isPlaying]) {
        [_player pause];
        [self.playerButton setTitle:@"Play" forState:UIControlStateNormal];
		
        [_timer setTolerance:_pauseTime];
    }else{
	    [_player play];
        [self.playerButton setTitle:@"Pause" forState:UIControlStateNormal];

		[_timer fire];
    }
}

- (IBAction)tapStopButton:(UIButton *)sender {
    [_player stop];
    [self.playerButton setTitle:@"Play" forState:UIControlStateNormal];
    
    _player.currentTime = 0;
    [_player prepareToPlay];
}

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag {
    if (flag) {
        [self.playerButton setTitle:@"Play" forState:UIControlStateNormal];
        [_timer invalidate];
    }
}

- (void)playMusicProgress {
    _playProgress.progress = _player.currentTime/_player.duration;
}

@end
