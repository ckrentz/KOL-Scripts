import <vprops.ash>;
import <vcon.ash>;
import <robordata.ash>;

// Familiar to use for farming.
familiar meat_familiar = define_property( "VMF.MeatFamiliar", "familiar", "Robortender" ).to_familiar();

//**** SCRIPT START ****//
item fam_equip = familiar_equipped_equipment(my_familiar());
if ( fam_equip == $item[none] )
   print( "Your familiar "+my_familiar()+" currently has nothing equipped.", "blue" );
   
if ( item_amount( $item[Amulet Coin] ) < 1 || familiar_equipped_equipment($familiar[Robortender]) != $item[Amulet Coin] )
{
	print( "$$ Harvesting Cornbeefadon for Amulet Coin $$" );
	use_familiar( $familiar[Cornbeefadon] );
	if ( item_amount( $item[box of Familiar Jacks] ) < 1 )
	{
		buy( 1 , $item[box of Familiar Jacks] );
	}
	use( 1, $item[box of Familiar Jacks] );
} else {
	print("$$ Already have Amulet Coin, skipping $$");
}

use_familiar( meat_familiar );
if ( meat_familiar == Robortender ) 
{
	setup_Robortender();
}
equip( $item[Amulet Coin] );

if( get_property( "_mummeryUses" ) < 1)
	cli_execute( "mummery meat" );
	
if( get_property( "boomBoxSong" ) != "Total Eclipse of Your Meat" )
	cli_execute( "boombox meat" );
	
boolean get_property_boolean( string property_name ) {
  return get_property( property_name ).to_boolean();
}

boolean freeExtend = get_property_boolean("_freePillKeeperUsed");

if(!freeExtend) {
	cli_execute("pillkeeper extend");
	
	print("$$ Time to extend Always Be Collecting $$");
	
	if( item_amount( $item[Daily Affirmation: Always be Collecting] ) < 1) {
		buy( 1 , $item[Daily Affirmation: Always be Collecting] );
	}
	
	use( 1 , $item[Daily Affirmation: Always be Collecting] );
} else {
	print("$$ Already used free pill today $$");
}

print("$$ Grabbing carpe $$");
// One per day
if ( !get_property( "_floundryItemCreated" ).to_boolean() ) {
	cli_execute( "create carpe" );
} else {
	print("$$ Already have carpe $$");
}

print("$$ Grabbing wad of used tape $$");
boolean idontcare = cli_execute( "fold wad of used tape" );
