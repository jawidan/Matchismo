//
//  PlayingCard.h
//  Matchismo
//
//  Created by Javidan Ibrahimov on 28.05.2024.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray<NSString *> *)validSuits;
+ (NSUInteger)maxRank;
+ (NSArray<NSString *> *)rankStrings;

@end
