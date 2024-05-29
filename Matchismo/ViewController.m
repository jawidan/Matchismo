//
//  ViewController.m
//  Matchismo
//
//  Created by Javidan Ibrahimov on 28.05.2024.
//

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

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.deck = [PlayingCardDeck new];
    self.isShowingBack = YES;
    self.flipCount = 0;
}

- (IBAction)tappedButton:(UIButton *)sender {
    
    if (self.isShowingBack){
        
        PlayingCard *randomCard = (PlayingCard *)[self.deck drawRandomCard];
        if (randomCard != nil) {
            NSString *cardTitle = [NSString stringWithFormat:@"%@%@", [PlayingCard rankStrings][randomCard.rank], randomCard.suit];
            
            [sender setTitle:cardTitle forState:UIControlStateNormal];
            [sender setBackgroundImage:[UIImage imageNamed:@"blank card hi-res"] forState:UIControlStateNormal];
            
        }
        else {
            [self endTheGame:sender];
        }
    }
    else {
        [self showCardBack:sender];
    }
    
    self.isShowingBack = !self.isShowingBack;
    self.flipCount++;
    
    self.counterLabel.text = [NSString stringWithFormat:@"Number of times you flipped : %lu", self.flipCount];
    

}

- (void)showCardBack:(UIButton *)button {
    [button setTitle:@"" forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:@"cardback"] forState:UIControlStateNormal];
}

- (void)endTheGame:(UIButton *)button {
    button.enabled = NO;
    button.highlighted = NO;
    self.gameOverLabel.hidden = NO;
}



@end
