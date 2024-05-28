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
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.deck = [[PlayingCardDeck alloc] init];
}

- (IBAction)tappedButton:(UIButton *)sender {
    PlayingCard *randomCard = (PlayingCard *)[self.deck drawRandomCard];
    NSString *cardTitle = [NSString stringWithFormat:@"%@%@", [PlayingCard rankStrings][randomCard.rank], randomCard.suit];
    [sender setTitle:cardTitle forState:UIControlStateNormal];
}

@end
