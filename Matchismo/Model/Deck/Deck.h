//
//  Deck.h
//  Matchismo
//
//  Created by Javidan Ibrahimov on 28.05.2024.
//

@import Foundation;
#import "Card.h"

@interface Deck : NSObject

- (void)addCard:(Card *)card atTop:(BOOL)atTop;
- (void)addCard:(Card *)card;
- (Card *)drawRandomCard;

@end
