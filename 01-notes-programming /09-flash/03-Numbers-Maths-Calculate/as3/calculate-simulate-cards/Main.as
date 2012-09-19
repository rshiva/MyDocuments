package {

	import flash.display.Sprite;
	import ascb.play.Cards;

	public class Main extends Sprite 
	{
		public function Main(  ) 
		{
			//Cards object creates a standard deck of 52 playing cards
			var cards:Cards = new Cards(  );
			
			//deal the cards from deck to 4 hands. each hand have 4cards
			var hands:Array = cards.deal(4,4);
			var i:uint;
			
			/* trace the cards in each hands
			var i:uint;
			var j:uint;
			for (i = 0; i < hands.length; i++) 
			{
				trace("hand " + i);
				for (j = 0; j < hands[i].length; j++) 
				{
					trace(hands[i].getCardAt(j));
				}
			}
			*/
			showCard();
			//Draw 1 card from the top of the deck
			//hands[0].draw(  );
			//Draw 2 card from the top of the deck
			//hands[0].draw(2);
			// Discard the cards with indices from the CardHand object 
			hands[0].discard(0,2);
			showCard();
			
			function showCard()
			{
				for (i = 0; i < hands[0].length; i++)
				{
					//
					trace(hands[0].getCardAt(i));
				}
				trace("------------------------");
			}
		}
	}
}
