# Dice hacking

Ultimately for all but the rarest games, all you need is a polydice set.

Here's a guide for those rarest of games.

## Dice tier list

Based on how common they are.

1. Coins - Almost everyone will have access to these.
2. d6s - Common enough in non-RPG games that they have their own tier. Also
   easily improvised - just mark up a small cube.
3. Polydice - Most RPG gamers will have a set.
4. Zocchi dice - Rare, but not unheard of.
5. Anything else.

## Methods

Some common methods will help you to get the dice roll you want.

### Reroll method

If you have a die with a greater number of sides than desired, you can roll that
die, rerolling if the value is greater than the number of sides.

For example, to get a d5, roll a d6 and reroll if you get a 6.

### Half method

For a die dN, if you have a die d(2N), you can use this trick. Roll the d2N. If
greater than N, subtract N from the result.

For example, to get a d5, roll a d10. If you get 6 or more, subtract 5.

### Double method

For a die dN, if you have a die d(N/2), you can use this trick. Roll the d(N/2)
and flip a coin; if tails, add N/2 to the result.

For example, you want to roll a d12 but only have a d6 and a coin. Roll the d6
and flip the coin. You roll a 5, and the coin comes up tails, so add 6 - you roll
an 11.

### Pseudo-percentile method

This works for any N divisible by 10, e.g. d20, d30, d40...

Use a d(N/10) for the tens digit, and a d10 for the units digit. If the tens
digit scores N/10, take it as a zero. If both the tens and units digits come up 0,
take it as N.

### Coin method

The last ditch method. This can roll any die dN, provided you have enough coins.

1. Obtain N-1 coins.
2. Flip the coins.
3. Count the number of heads.
4. The value is the number of heads plus 1.

For example, to get a d5, flip four coins. The value is the number of heads you
get plus 1 (producing 1-5 with an even distribution).

## Dice alternative table

Die  | Polydice? | Zocchi? | Alternative
-----|-----------|---------|------------
d2   | No        | No      | a) Flip a coin. Heads is 1, tails is 2. b) Roll a d6. Odds is 1, evens is 2.
d3   | No        | Yes     | a) Roll a d4. 4 is reroll, otherwise face value. b) Roll a d6. If >3, subtract 3.
d4   | Yes       | No      | a) Roll a d6. 5 or 6 is reroll, otherwise face value. b) Roll a d8. If >4, subtract 4.
d5   | No        | Yes     | a) Roll a d6. 6 is reroll, otherwise face value. b) Roll a d10. If >5, subtract 5.
d6   | Yes       | No      | Flip 5 coins. Value is number of heads + 1.
d7   | No        | Yes     | Roll a d8. 8 is reroll, otherwise face value.
d8   | Yes       | No      | Roll a d10. 9 or 10 is reroll, otherwise face value.
d9   | No        | No      | Roll a d10. 10 is reroll, otherwise face value.
d10  | Yes       | No      | Roll a d20. If >10, subtract 10.
d11  | No        | No      | Roll a d12. 12 is reroll, otherwise face value.
d12  | Yes       | No      | Roll a d6 and flip a coin. If tails, add 6.
d13  | No        | No      | d14, reroll on 14.
d14  | No        | Yes     | Roll a d7 and flip a coin. If tails, add 7.
d15  | No        | No      | d16, reroll on 16.
d16  | No        | Yes     | Roll a d8 and flip a coin. If tails, add 8.
d20  | Yes       | No      | Roll a d10 and flip a coin. If heads, take the value of the d10. If tails, add ten to it.
d24  | No        | Yes     | Roll a d12 and flip a coin. If tails, add 12.
d50  | No        | No      | Roll 1d5 (tens) and 1d10 (units) in the same way as percentile d10s (taking 5 on the d5 as 0, and a double 0 as 50)
