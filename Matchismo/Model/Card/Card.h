//
//  Card.h
//  Matchismo
//
//  Created by Javidan Ibrahimov on 28.05.2024.
//

@import Foundation;

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;
@property (nonatomic, getter=isChosen) BOOL chosen;
@property (nonatomic, getter=isMatched) BOOL matched;

- (NSInteger)match:(NSArray<Card *> *)otherCards;

@end
