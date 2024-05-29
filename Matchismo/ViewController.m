//
//  ViewController.m
//  Matchismo
//
//  Created by Javidan Ibrahimov on 28.05.2024.
//


#import "ViewController.h"
#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@interface ViewController ()

@property (strong, nonatomic) PlayingCardDeck *deck;

@property (nonatomic) BOOL isShowingBack;

@property (nonatomic) NSInteger flipCount;

@property (weak, nonatomic) IBOutlet UILabel *counterLabel;

@property (weak, nonatomic) IBOutlet UILabel *gameOverLabel;

@property (weak, nonatomic) IBOutlet UIButton *cardButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.deck = [PlayingCardDeck new];
    self.isShowingBack = YES;
    self.flipCount = 0;
}

- (IBAction)buttonTapped:(UIButton *)sender {
    
    if (self.isShowingBack){
        [self showCardFront:sender];
    }
    else {
        [self showCardBack:sender];
    }
    
    self.isShowingBack = !self.isShowingBack;
    self.flipCount += 1;
    
    self.counterLabel.text = [NSString stringWithFormat:@"Number of times you flipped : %lu", self.flipCount];
}

- (void)showCardFront:(UIButton *)button {
    PlayingCard *randomCard = (PlayingCard *)[self.deck drawRandomCard];
    if (randomCard != nil) {
        NSString *cardTitle = [NSString stringWithFormat:@"%@%@", [PlayingCard rankStrings][randomCard.rank], randomCard.suit];
        
        [button setTitle:cardTitle forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:@"cardfront"] forState:UIControlStateNormal];
    }
    else {
        [self endTheGame];
    }
}

- (void)showCardBack:(UIButton *)button {
    [button setTitle:@"" forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:@"cardback"] forState:UIControlStateNormal];
}

- (void)endTheGame {
    self.cardButton.enabled = NO;
    self.cardButton.highlighted = NO;
    self.gameOverLabel.hidden = NO;
}



@end
