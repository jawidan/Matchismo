//
//  playingCard.m
//  Matchismo
//
//  Created by Javidan Ibrahimov on 28.05.2024.
//

#import <Foundation/Foundation.h>
#import "PlayingCard.h"

@implementation PlayingCard

-(NSString*) contents{
    NSArray *rankStrings = [PlayingCard ranksStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

@synthesize suit = _suit;

+(NSArray*)validSuits
{
    return @[@"♥️",@"♦️",@"♠️",@"♣️"];
}

-(void) setSuit:(NSString *)suit
{
    if ([[PlayingCard validSuits] containsObject: suit]) {
        _suit = suit;
    }
}

-(void)setRank:(NSUInteger)rank
{
    if (rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}

-(NSString*) suit
{
    return _suit ? _suit :@"?";
}

+(NSArray*) ranksStrings
{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

+(NSUInteger)maxRank
{
    return [[self ranksStrings] count] - 1;
}



@end
